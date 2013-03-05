Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UD0SW-0005Ed-6T
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Mar 2013 23:35:44 +0100
Received: by mail-pb0-f52.google.com with SMTP id ma3so5084294pbc.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2013 14:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ReCmTYN52hAwz1CZU021RkA2zhZUwOwSzHvIx4Qos7g=;
	b=pSKLQedXzjr1LME9ntJQz8/0irfVpcUP5G9nb2rvGSLxIhAAxHe1s1SB/OPO2+z/YR
	J7OoPWz0s1CXKqa3BkMIUsX9iTtP6ZJzZv7aVAHTaHWdYqLW2xCQ97n/jz0c7kEW0aR1
	GkV8yXm4LIt5k77Wh7RByEr81oGiVU72gPGMCVMQk3YMviouD2SWUo9SYDmeWsrL0fRr
	3ZyV9xxVg1IdhXtpHKaAtkpvQlD6+OUNHWttE0EdhYMwlyy9S/wKXz+tuAlpp/zhorLc
	o3ynFjmkotzlFKeR0LEgwOnayPK2S+2sz254/MlfS62BTNnYSflkcmxiEZCVKesCFjhN
	Pt8A==
X-Received: by 10.68.49.167 with SMTP id v7mr40016748pbn.131.1362521953450;
	Tue, 05 Mar 2013 14:19:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 1sm28380117pba.32.2013.03.05.14.19.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Mar 2013 14:19:12 -0800 (PST)
Date: Tue, 5 Mar 2013 23:18:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130305221857.GA14869@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH 1/2] Delete systemd class.
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
X-List-Received-Date: Tue, 05 Mar 2013 22:35:45 -0000
X-Groupsio-MsgNum: 43391
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 13, 2013 at 09:25:34AM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

good old meta-systemd should now parse again, I wont apply this 2 commits
until systemd discussion in oe-core is finished and future of
meta-systemd decided.

> ---
>  meta-systemd/classes/systemd.bbclass |  225 ----------------------------=
------
>  1 file changed, 225 deletions(-)
>  delete mode 100644 meta-systemd/classes/systemd.bbclass
>=20
> diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/=
systemd.bbclass
> deleted file mode 100644
> index f2a0363..0000000
> --- a/meta-systemd/classes/systemd.bbclass
> +++ /dev/null
> @@ -1,225 +0,0 @@
> -DEPENDS_append =3D " systemd-systemctl-native"
> -
> -SYSTEMD_AUTO_ENABLE ??=3D "enable"
> -
> -SYSTEMD_AUTO_RRECOMMENDS ??=3D "enable"
> -
> -systemd_postinst() {
> -OPTS=3D""
> -
> -if [ -n "$D" ]; then
> -    OPTS=3D"--root=3D$D"
> -fi
> -
> -systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
> -
> -if [ -z "$D" -a ${SYSTEMD_AUTO_ENABLE} =3D "enable" ]; then
> -    systemctl start ${SYSTEMD_SERVICE}
> -fi
> -}
> -
> -systemd_prerm() {
> -if [ -z "$D" ]; then
> -    systemctl stop ${SYSTEMD_SERVICE}
> -fi
> -
> -systemctl disable ${SYSTEMD_SERVICE}
> -}
> -
> -def get_package_var(d, var, pkg):
> -    val =3D (d.getVar('%s_%s' % (var, pkg), 1) or "").strip()
> -    if val =3D=3D "":
> -        val =3D (d.getVar(var, 1) or "").strip()
> -    return val
> -
> -def systemd_after_parse(d):
> -    def systemd_check_vars():
> -        if d.getVar('BB_WORKERCONTEXT', True) is not None:
> -            return
> -
> -        bb_filename =3D d.getVar('FILE')
> -        packages =3D d.getVar('PACKAGES', 1)
> -
> -        # check SYSTEMD_PACKAGES
> -        systemd_pkgs =3D d.getVar('SYSTEMD_PACKAGES', 1) or ""
> -        if systemd_pkgs =3D=3D "":
> -            raise bb.build.FuncFailed, "\n\n%s inherits systemd but does=
n't set SYSTEMD_PACKAGES" % bb_filename
> -        for pkg_systemd in systemd_pkgs.split():
> -            if pkg_systemd.find("-systemd") =3D=3D -1:
> -                if pkg_systemd !=3D d.getVar('PN', 1):
> -                    raise bb.build.FuncFailed, \
> -                        "\n\n%s: %s in SYSTEMD_PACKAGES does not match <=
existing-package>-systemd or ${PN}" % \
> -                        (bb_filename, pkg_systemd)
> -            else:
> -                pkg_systemd_base =3D pkg_systemd
> -                if pkg_systemd_base.endswith('-systemd'):
> -                    pkg_systemd_base =3D pkg_systemd[:-8]
> -                if pkg_systemd_base not in packages:
> -                    raise bb.build.FuncFailed, \
> -                        "\n\n%s: %s in SYSTEMD_PACKAGES does not match <=
existing-package>-systemd or ${PN}" % \
> -                        ( bb_filename, pkg_systemd)
> -
> -    # prepend systemd-packages not already included
> -    def systemd_create_package(pkg_systemd):
> -        packages =3D d.getVar('PACKAGES', 1)
> -        if not pkg_systemd in packages:
> -            packages =3D "%s %s" % (pkg_systemd, packages)
> -            d.setVar('PACKAGES', packages)
> -
> -
> -    bpn =3D d.getVar('BPN', 1)
> -    ml =3D d.getVar('MLPREFIX', 1) or ""
> -    if bpn + "-native" !=3D d.getVar('PN', 1) and \
> -            bpn + "-cross" !=3D d.getVar('PN', 1) and \
> -            ml + bpn =3D=3D d.getVar('PN', 1) and \
> -            "nativesdk-" + bpn !=3D d.getVar('PN', 1):
> -        systemd_check_vars()
> -        for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
> -            systemd_create_package(pkg_systemd)
> -
> -
> -python __anonymous() {
> -    systemd_after_parse(d)
> -}
> -
> -# automatically install all *.service and *.socket supplied in recipe's =
SRC_URI
> -do_install_append() {
> -    for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o -na=
me '*.socket'` ; do
> -    # ensure installing systemd-files only (e.g not avahi *.service)
> -    if grep -q '\[Unit\]' $service ; then
> -        install -d ${D}${systemd_unitdir}/system
> -        install -m 644 $service ${D}${systemd_unitdir}/system
> -    fi
> -    done
> -}
> -
> -python populate_packages_prepend () {
> -    def systemd_generate_package_scripts(pkg):
> -        bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % p=
kg)
> -        localdata =3D d.createCopy()
> -        overrides =3D localdata.getVar("OVERRIDES", 1)
> -        localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
> -        bb.data.update_data(localdata)
> -
> -        """
> -        systemd postinst is appended here because pkg_postinst may requi=
re to
> -        execute on the target. Not doing so may cause systemd postinst i=
nvoked
> -        twice to cause unwanted warnings.
> -        """=20
> -        postinst =3D localdata.getVar('pkg_postinst', 1)
> -        if not postinst:
> -            postinst =3D '#!/bin/sh\n'
> -        postinst +=3D localdata.getVar('systemd_postinst', 1)
> -        d.setVar('pkg_postinst_%s' % pkg, postinst)
> -
> -        prerm =3D localdata.getVar('pkg_prerm', 1)
> -        if not prerm:
> -            prerm =3D '#!/bin/sh\n'
> -        prerm +=3D localdata.getVar('systemd_prerm', 1)
> -        d.setVar('pkg_prerm_%s' % pkg, prerm)
> -
> -    # add files to FILES_*-systemd if existent and not already done
> -    def systemd_append_file(pkg_systemd, file_append):
> -        appended =3D False
> -        if os.path.exists('${D}' + file_append):
> -            var_name =3D "FILES_" + pkg_systemd
> -            files =3D d.getVar(var_name, 0) or ""
> -            if file_append not in files.split():
> -                d.setVar(var_name, "%s %s" % (files, file_append))
> -                appended =3D True
> -        return appended
> -
> -    # add systemd files to FILES_*-systemd, parse for Also=3D and follow=
 recursive
> -    def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
> -        # avoid infinite recursion
> -        if systemd_append_file(pkg_systemd, path + service):
> -            fullpath =3D '${D}' + path + service
> -            if service.find('.socket') !=3D -1:
> -                # for *.socket add *.service and *@.service
> -                service_base =3D service.replace('.socket', '')
> -                systemd_add_files_and_parse(pkg_systemd, path, service_b=
ase + '.service', keys)
> -                systemd_add_files_and_parse(pkg_systemd, path, service_b=
ase + '@.service', keys)
> -            for key in keys.split():
> -                # recurse all dependencies found in keys ('Also';'Confli=
cts';..) and add to files
> -                cmd =3D "grep %s %s | sed 's,%s=3D,,g' | tr ',' '\\n'" %=
 (key, fullpath, key)
> -                pipe =3D os.popen(cmd, 'r')
> -                line =3D pipe.readline()
> -                while line:
> -                    line =3D line.replace('\n', '')
> -                    systemd_add_files_and_parse(pkg_systemd, path, line,=
 keys)
> -                    line =3D pipe.readline()
> -                pipe.close()
> -
> -    # check service-files and call systemd_add_files_and_parse for each =
entry
> -    def systemd_check_services():
> -        base_libdir =3D d.getVar('base_libdir', 1)
> -        searchpaths =3D '/etc/systemd/system/' + ' '
> -        searchpaths +=3D '/lib/systemd/system/' + ' '
> -        searchpaths +=3D '/usr/lib/systemd/system/' + ' '
> -        systemd_packages =3D d.getVar('SYSTEMD_PACKAGES', 1)
> -        has_exactly_one_service =3D len(systemd_packages.split()) =3D=3D=
 1
> -        if has_exactly_one_service:
> -            has_exactly_one_service =3D len(get_package_var(d, 'SYSTEMD_=
SERVICE', systemd_packages).split()) =3D=3D 1
> -
> -        keys =3D 'Also' # Conflicts??
> -        if has_exactly_one_service:
> -            # single service gets also the /dev/null dummies
> -            keys =3D 'Also Conflicts'
> -        # scan for all in SYSTEMD_SERVICE[]
> -        for pkg_systemd in systemd_packages.split():
> -            for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_sys=
temd).split():
> -                path_found =3D ''
> -                for path in searchpaths.split():
> -                    if os.path.exists('${D}' + path + service):
> -                        path_found =3D path
> -                if path_found !=3D '':
> -                    systemd_add_files_and_parse(pkg_systemd, path_found,=
 service, keys)
> -                else:
> -                    raise bb.build.FuncFailed, "\n\nFor package %s SYSTE=
MD_SERVICE-entry %s does not exist" % \
> -                        (pkg_systemd, service)
> -
> -    """     Setup rdepends / rrecommmends as:
> -
> -                -----------------------------
> -                |  pkg_systemd_base: 'foo'  |
> -                -----------------------------
> -                           |    ^
> -                           |    |                 --------------
> -               rrecommends |    | rdepends        | 'systemd'  |
> -                           |    |               ->--------------
> -                           V    |              / rdepends
> -                ------------------------------/
> -                | pkg_systemd: 'foo-systemd' |
> -                ------------------------------
> -    """
> -    def systemd_add_rdepends_rrecommends(pkg_systemd):
> -        # RDEPENDS_${pkg_systemd} +=3D pkg_systemd_base systemd
> -        rdepends =3D d.getVar('RDEPENDS_' + pkg_systemd, 1) or ""
> -        rdepends_arr =3D rdepends.split()
> -        if not 'systemd' in rdepends_arr:
> -            rdepends =3D '%s %s' % (rdepends, 'systemd')
> -        pkg_systemd_base =3D pkg_systemd.replace('-systemd', '')
> -        # no automatism for:
> -        # recipes setting rdepends themselves AND
> -        # not rdepending myself AND
> -        # avoid double entries
> -        if len(rdepends_arr) =3D=3D 0 and pkg_systemd !=3D '${PN}' and n=
ot pkg_systemd_base in rdepends:
> -            rdepends =3D '%s %s' % (rdepends, pkg_systemd_base)
> -        d.setVar('RDEPENDS_' + pkg_systemd, rdepends)
> -        auto_rrecommends =3D d.getVar('SYSTEMD_AUTO_RRECOMMENDS', 1) or =
'enable'
> -        if auto_rrecommends =3D=3D 'enable':
> -            # RRECOMMENDS_${pkg_systemd_base} +=3D pkg_systemd systemd
> -            rrecommends =3D d.getVar('RRECOMMENDS_' + pkg_systemd_base, =
1) or ""
> -            # not rrecommending myself AND avoid double entries
> -            if pkg_systemd !=3D pkg_systemd_base and not pkg_systemd in =
rrecommends.split():
> -                rrecommends =3D '%s %s' % (rrecommends, pkg_systemd)
> -            d.setVar('RRECOMMENDS_' + pkg_systemd_base, rrecommends)
> -
> -    # run all modifications once when creating package
> -    if os.path.exists('${D}'):
> -        for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
> -            if get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd) !=3D "=
":
> -                systemd_generate_package_scripts(pkg_systemd)
> -                systemd_add_rdepends_rrecommends(pkg_systemd)
> -        systemd_check_services()
> -}
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE2b1EACgkQN1Ujt2V2gBwvQwCfQ0+Vr7qWfuupq/UsbH9JKm7C
1z0An1Tv1UbfsfBube5+QT+4ndX0izuy
=hy74
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
