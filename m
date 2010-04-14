Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O240Y-0008KA-CJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 16:56:03 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O23xA-0006Tq-Ef from Tom_Rini@mentor.com ;
	Wed, 14 Apr 2010 07:52:32 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 14 Apr 2010 07:52:32 -0700
Received: from 172.30.80.237 ([172.30.80.237]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 14 Apr 2010 14:52:31 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	14 Apr 2010 07:52:30 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1271238939-7065-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1271238939-7065-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Organization: Mentor Graphics Corporation
Date: Wed, 14 Apr 2010 07:52:30 -0700
Message-ID: <1271256750.20987.7.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 14 Apr 2010 14:52:32.0200 (UTC)
	FILETIME=[1C937C80:01CADBE2]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v2] packaged-staging.bbclass: use 'os.unlink()' instead of spawning 'rm'
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
X-List-Received-Date: Wed, 14 Apr 2010 14:56:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-04-14 at 11:55 +0200, Enrico Scholz wrote:
> Doing a '-c clean' operation on a staged package with very much files
> (e.g. glibc) took several minutes because
>=20
> * every removed file was reported
> * an 'rm' instance was spawned for every file
>=20
> This patch uses the native 'os.unlink()' method for removing files and
> reports only the removed root directory instead of the single files.
>=20
> Based upon maillist discussion, reporting happens with 'debug' level
> instead of 'note' one, and only error conditions due to non-existing
> files will be ignored.  Other (e.g. permission denied) errors will now
> abort the build while they were silently ignored previously.
>=20
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Acked-by: Tom Rini <tom_rini@mentor.com>

(Aside: Do you have write access?  If not, shoot me a msg off list and
I'll put this in).

> ---
>  classes/packaged-staging.bbclass |   23 ++++++++++++++++++-----
>  1 files changed, 18 insertions(+), 5 deletions(-)
>=20
> diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.=
bbclass
> index 9c72d11..f3648d2 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
> @@ -26,6 +26,16 @@ PSTAGE_NATIVEDEPENDS =3D "\
> =20
>  BB_STAMP_WHITELIST =3D "${PSTAGE_NATIVEDEPENDS}"
> =20
> +def _package_unlink (f):
> +    import os, errno
> +    try:
> +	os.unlink(f)
> +	return True
> +    except OSError, e:
> +	if e.errno =3D=3D errno.ENOENT:
> +	    return False
> +	raise
> +
>  python () {
>      pstage_allowed =3D True
> =20
> @@ -87,10 +97,10 @@ def pstage_manualclean(srcname, destvarname, d):
>  	dest =3D bb.data.getVar(destvarname, d, True)
> =20
>  	for walkroot, dirs, files in os.walk(src):
> +		bb.debug("rm %s" % walkroot)
>  		for file in files:
>  			filepath =3D os.path.join(walkroot, file).replace(src, dest)
> -			bb.note("rm %s" % filepath)
> -			os.system("rm %s" % filepath)
> +			_package_unlink(filepath)
> =20
>  def pstage_set_pkgmanager(d):
>      path =3D bb.data.getVar("PATH", d, 1)
> @@ -162,6 +172,7 @@ PSTAGE_TASKS_COVERED =3D "fetch unpack munge patch co=
nfigure qa_configure rig_loca
>  SCENEFUNCS +=3D "packagestage_scenefunc"
> =20
>  python packagestage_scenefunc () {
> +    import glob
>      if bb.data.getVar("PSTAGING_ACTIVE", d, 1) =3D=3D "0":
>          return
> =20
> @@ -227,7 +238,9 @@ python packagestage_scenefunc () {
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
> @@ -260,8 +273,8 @@ python packagedstage_stampfixing_eventhandler() {
>                      # so we need to remove the autogenerated stamps.
>                      for task in taskscovered:
>                          dir =3D "%s.do_%s" % (e.stampPrefix[fn], task)
> -                        os.system('rm -f ' + dir)
> -                    os.system('rm -f ' + stamp)
> +			_package_unlink(dir)
> +		    _package_unlink(stamp)
>  }
> =20
>  populate_staging_preamble () {


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


