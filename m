Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nkim5-0001T2-3v
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 19:49:26 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NkijN-0004Lg-Vx from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 10:46:38 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 25 Feb 2010 10:46:37 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 25 Feb 2010 18:46:36 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	25 Feb 2010 11:46:34 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263931241-18389-1-git-send-email-clarson@mvista.com>
References: <1263931241-18389-1-git-send-email-clarson@mvista.com>
Organization: Mentor Graphics Corporation
Date: Thu, 25 Feb 2010 11:46:34 -0700
Message-ID: <1267123594.18176.538.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 25 Feb 2010 18:46:37.0817 (UTC)
	FILETIME=[DC968E90:01CAB64A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: base.bbclass: add popen/system convenience functions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2010 18:49:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-01-19 at 10:00 +0000, Christopher Larson wrote:
> Provides oe_popen, which is a subprocess.Popen wrapper that automatically
> provides our exported variables in the environment, including the PATH, a=
nd
> oe_system, which is just a wrapper that acts like system.
>=20
> Signed-off-by: Chris Larson <clarson@mvista.com>

Acked-by: Tom Rini <tom_rini@mentor.com>


> ---
> classes/base.bbclass |   37 +++++++++++++++++++++++++++++++------
>  1 files changed, 31 insertions(+), 6 deletions(-)
>=20
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index f67773a..edda75b 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -1,5 +1,36 @@
>  BB_DEFAULT_TASK ?=3D "build"
> =20
> +python () {
> +    env =3D {}
> +    for v in d.keys():
> +        if d.getVarFlag(v, "export"):
> +            env[v] =3D d.getVar(v, True) or ""
> +    d.setVar("__oe_popen_env", env)
> +}
> +
> +def subprocess_setup():
> +   import signal
> +   # Python installs a SIGPIPE handler by default. This is usually not w=
hat
> +   # non-Python subprocesses expect.
> +   signal.signal(signal.SIGPIPE, signal.SIG_DFL)
> +
> +def oe_popen(d, cmd, **kwargs):
> +    """ Convenience function to call out processes with our exported
> +    variables in the environment.
> +    """
> +    from subprocess import Popen
> +
> +    if kwargs.get("env") is None:
> +        kwargs["env"] =3D d.getVar("__oe_popen_env", 0)
> +
> +    kwargs["preexec_fn"] =3D subprocess_setup
> +
> +    return Popen(cmd, **kwargs)
> +
> +def oe_system(d, cmd):
> +    """ Popen based version of os.system. """
> +    return oe_popen(d, cmd, shell=3DTrue).wait()
> +
>  # like os.path.join but doesn't treat absolute RHS specially
>  def base_path_join(a, *p):
>      path =3D a
> @@ -750,12 +781,6 @@ base_do_buildall() {
>  	:
>  }
> =20
> -def subprocess_setup():
> -	import signal
> -	# Python installs a SIGPIPE handler by default. This is usually not wha=
t
> -	# non-Python subprocesses expect.
> -	signal.signal(signal.SIGPIPE, signal.SIG_DFL)
> -
>  def oe_unpack_file(file, data, url =3D None):
>  	import subprocess
>  	if not url:


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


