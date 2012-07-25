Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SuATd-0001ns-Ix
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jul 2012 00:54:45 +0200
Received: from mail100-co1-R.bigfish.com (10.243.78.225) by
	CO1EHSOBE005.bigfish.com (10.243.66.68) with Microsoft SMTP Server id
	14.1.225.23; Wed, 25 Jul 2012 22:13:00 +0000
Received: from mail100-co1 (localhost [127.0.0.1])	by
	mail100-co1-R.bigfish.com (Postfix) with ESMTP id AF6675003F9;
	Wed, 25 Jul 2012 22:13:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail100-co1 (localhost.localdomain [127.0.0.1]) by mail100-co1
	(MessageSwitch) id 1343254379850002_9080;
	Wed, 25 Jul 2012 22:12:59 +0000 (UTC)
Received: from CO1EHSMHS030.bigfish.com (unknown [10.243.78.230])	by
	mail100-co1.bigfish.com (Postfix) with ESMTP id C3AE5680044;
	Wed, 25 Jul 2012 22:12:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS030.bigfish.com
	(10.243.66.40) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 25 Jul 2012 22:13:00 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Wed, 25 Jul 2012 17:12:55 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] sstate: Add a two character subdirectory to the
	sstate directory layout
Thread-Index: AQHNarKjDzwhB/88xkmYfAEqHGW5HA==
Date: Wed, 25 Jul 2012 22:12:55 +0000
Message-ID: <CAEsOVNd7aS5R3X2qqXbu3YNDxufzGYxuuhovuOoAMFJnpbaZEw@mail.gmail.com>
References: <1343250562.29991.0.camel@ted>
In-Reply-To: <1343250562.29991.0.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [PATCH] sstate: Add a two character subdirectory to the sstate directory layout
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
X-List-Received-Date: Wed, 25 Jul 2012 22:54:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C7AFAAF2F94F734C8BEA144537157BEF@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 25, 2012 at 4:09 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Currently all sstate files are placed into one directory. This does not s=
cale and
> causes a variety of filesystem issues. This patch adds a two character su=
bdirectory
> to the layout (based on the first two characters of the hash) so that fil=
es
> can be split into several directories.
>
> This should help performance of sstate in most cases by avoding creating =
directories with
> huge numbers of files.
>
> The SSTATE_MIRRORS syntax needs updating to account for the extra path el=
ement by
> the addition of a PATH item, for example:
>
> SSTATE_MIRRORS =3D "file://.* file:///some/path/to/sstate-cache/PATH"
> SSTATE_MIRRORS =3D "file://.* http://192.168.1.23/sstate-cache/PATH"
>
> This change also sets the scene for using things like lsb-release in
> the
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

What about backwards compatibility?

-M

> ---
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 570b371..d00779a 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -4,16 +4,21 @@ SSTATE_MANIFESTS ?=3D "${TMPDIR}/sstate-control"
>  SSTATE_MANFILEBASE =3D "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-"
>  SSTATE_MANFILEPREFIX =3D "${SSTATE_MANFILEBASE}${PN}"
>
> +def generate_sstatefn(spec, hash, d):
> +    if not hash:
> +        hash =3D "INVALID"
> +    return hash[:2] + "/" + spec + hash
>
>  SSTATE_PKGARCH    =3D "${PACKAGE_ARCH}"
>  SSTATE_PKGSPEC    =3D "sstate-${PN}-${PACKAGE_ARCH}${TARGET_VENDOR}-${TA=
RGET_OS}-${PV}-${PR}-${SSTATE_PKGARCH}-${SSTATE_VERSION}-"
> -SSTATE_PKGNAME    =3D "${SSTATE_PKGSPEC}${BB_TASKHASH}"
> +SSTATE_PKGNAME    =3D "${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC', T=
rue), d.getVar('BB_TASKHASH', True), d)}"
>  SSTATE_PKG        =3D "${SSTATE_DIR}/${SSTATE_PKGNAME}"
> +SSTATE_PATHSPEC   =3D "${SSTATE_DIR}/*/${SSTATE_PKGSPEC}"
>
>  SSTATE_SCAN_FILES ?=3D "*.la *-config *_config"
>  SSTATE_SCAN_CMD ?=3D 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name =
\"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
>
> -BB_HASHFILENAME =3D "${SSTATE_PKGNAME}"
> +BB_HASHFILENAME =3D "${SSTATE_PKGSPEC}"
>
>  SSTATE_MANMACH ?=3D "${SSTATE_PKGARCH}"
>
> @@ -158,10 +163,11 @@ def sstate_installpkg(ss, d):
>          oe.path.remove(dir)
>
>      sstateinst =3D d.expand("${WORKDIR}/sstate-install-%s/" % ss['name']=
)
> +    sstatefetch =3D d.getVar('SSTATE_PKGNAME', True) + '_' + ss['name'] =
+ ".tgz"
>      sstatepkg =3D d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + ".tg=
z"
>
>      if not os.path.exists(sstatepkg):
> -       pstaging_fetch(sstatepkg, d)
> +       pstaging_fetch(sstatefetch, sstatepkg, d)
>
>      if not os.path.isfile(sstatepkg):
>          bb.note("Staging package %s does not exist" % sstatepkg)
> @@ -223,8 +229,7 @@ def sstate_installpkg(ss, d):
>  def sstate_clean_cachefile(ss, d):
>      import oe.path
>
> -    sstatepkgdir =3D d.getVar('SSTATE_DIR', True)
> -    sstatepkgfile =3D sstatepkgdir + '/' + d.getVar('SSTATE_PKGSPEC', Tr=
ue) + "*_" + ss['name'] + ".tgz*"
> +    sstatepkgfile =3D d.getVar('SSTATE_PATHSPEC', True) + "*_" + ss['nam=
e'] + ".tgz*"
>      bb.note("Removing %s" % sstatepkgfile)
>      oe.path.remove(sstatepkgfile)
>
> @@ -417,7 +422,7 @@ def sstate_package(ss, d):
>
>      return
>
> -def pstaging_fetch(sstatepkg, d):
> +def pstaging_fetch(sstatefetch, sstatepkg, d):
>      import bb.fetch2
>
>      # Only try and fetch if the user has configured a mirror
> @@ -430,7 +435,7 @@ def pstaging_fetch(sstatepkg, d):
>      bb.data.update_data(localdata)
>
>      dldir =3D localdata.expand("${SSTATE_DIR}")
> -    srcuri =3D "file://" + os.path.basename(sstatepkg)
> +    srcuri =3D "file://" + sstatefetch
>
>      bb.mkdirhier(dldir)
>
> @@ -519,8 +524,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_ha=
shfn, d):
>      }
>
>      for task in range(len(sq_fn)):
> -        sstatefile =3D d.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_"=
 + mapping[sq_task[task]] + ".tgz")
> -        sstatefile =3D sstatefile.replace("${BB_TASKHASH}", sq_hash[task=
])
> +        sstatefile =3D d.expand("${SSTATE_DIR}/" + generate_sstatefn(sq_=
hashfn[task], sq_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
>          if os.path.exists(sstatefile):
>              bb.debug(2, "SState: Found valid sstate file %s" % sstatefil=
e)
>              ret.append(task)
> @@ -544,10 +548,9 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_h=
ashfn, d):
>              if task in ret:
>                  continue
>
> -            sstatefile =3D d.expand("${SSTATE_DIR}/" + sq_hashfn[task] +=
 "_" + mapping[sq_task[task]] + ".tgz")
> -            sstatefile =3D sstatefile.replace("${BB_TASKHASH}", sq_hash[=
task])
> +            sstatefile =3D d.expand(generate_sstatefn(sq_hashfn[task], s=
q_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
>
> -            srcuri =3D "file://" + os.path.basename(sstatefile)
> +            srcuri =3D "file://" + sstatefile
>              localdata.setVar('SRC_URI', srcuri)
>              bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



