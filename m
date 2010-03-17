Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NrwkM-0006U0-QO
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 18:09:32 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NrwhK-0007iD-Hw from Tom_Rini@mentor.com ;
	Wed, 17 Mar 2010 10:06:22 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 17 Mar 2010 10:06:22 -0700
Received: from 172.30.80.111 ([172.30.80.111]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 17 Mar 2010 17:05:38 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	17 Mar 2010 10:05:36 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Organization: Mentor Graphics Corporation
Date: Wed, 17 Mar 2010 10:05:36 -0700
Message-ID: <1268845536.29482.4.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 17 Mar 2010 17:06:22.0108 (UTC)
	FILETIME=[2B3535C0:01CAC5F4]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] packaged-staging.bbclass: use 'os.unlink()' instead of spawning 'rm'
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
X-List-Received-Date: Wed, 17 Mar 2010 17:09:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-16 at 13:23 +0100, Enrico Scholz wrote:
> Doing a '-c clean' operation on a staged package with very much files
> (e.g. glibc) took several minutes because
>=20
> * every removed file was reported
> * an 'rm' instance was spawned for every file
>=20
> This patch uses the native 'os.unlink()' method for removing files and
> reports only the removed root directory instead of the single files.
>=20
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  classes/packaged-staging.bbclass |   21 ++++++++++++++++-----
>  1 files changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.=
bbclass
> index 1ede25c..5ab9eb5 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
> @@ -26,6 +26,14 @@ PSTAGE_NATIVEDEPENDS =3D "\
> =20
>  BB_STAMP_WHITELIST =3D "${PSTAGE_NATIVEDEPENDS}"
> =20
> +def _package_unlink (f):
> +    import os
> +    try:
> +	os.unlink(f)
> +	return True
> +    except:
> +	return False
> +
>  python () {
>      pstage_allowed =3D True
> =20
> @@ -87,10 +95,10 @@ def pstage_manualclean(srcname, destvarname, d):
>  	dest =3D bb.data.getVar(destvarname, d, True)
> =20
>  	for walkroot, dirs, files in os.walk(src):
> +		bb.note("rm %s" % walkroot)
>  		for file in files:
>  			filepath =3D os.path.join(walkroot, file).replace(src, dest)
> -			bb.note("rm %s" % filepath)
> -			os.system("rm %s" % filepath)
> +			_package_unlink(filepath)
> =20
>  def pstage_set_pkgmanager(d):
>      path =3D bb.data.getVar("PATH", d, 1)
> @@ -162,6 +170,7 @@ PSTAGE_TASKS_COVERED =3D "fetch unpack munge patch co=
nfigure qa_configure rig_loca
>  SCENEFUNCS +=3D "packagestage_scenefunc"
> =20
>  python packagestage_scenefunc () {
> +    import glob
>      if bb.data.getVar("PSTAGING_ACTIVE", d, 1) =3D=3D "0":
>          return
> =20
> @@ -217,7 +226,9 @@ python packagestage_scenefunc () {
> =20
>          # Remove the stamps and files we added above
>          # FIXME - we should really only remove the stamps we added
> -        os.system('rm -f ' + stamp + '.*')
> +	for fname in glob.glob(stamp + '.*'):
> +	    _package_unlink(fname)
> +
>          os.system(bb.data.expand("rm -rf ${WORKDIR}/tstage", d))
> =20
>          if stageok:
> @@ -251,8 +262,8 @@ python packagedstage_stampfixing_eventhandler() {
>                      # so we need to remove the autogenerated stamps.
>                      for task in taskscovered:
>                          dir =3D "%s.do_%s" % (e.stampPrefix[fn], task)
> -                        os.system('rm -f ' + dir)
> -                    os.system('rm -f ' + stamp)
> +			_package_unlink(dir)
> +		    _package_unlink(stamp)
> =20
>      return NotHandled
>  }


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


