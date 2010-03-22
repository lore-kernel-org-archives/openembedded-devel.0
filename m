Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@dominion.thruhere.net>) id 1NtfnZ-0005X2-Gu
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:27:58 +0100
Received: by mail-ew0-f225.google.com with SMTP id 25so1316554ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 04:24:52 -0700 (PDT)
Received: by 10.213.42.15 with SMTP id q15mr3434007ebe.35.1269257091960;
	Mon, 22 Mar 2010 04:24:51 -0700 (PDT)
Received: from [172.20.0.255] (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 13sm2068840ewy.13.2010.03.22.04.24.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Mar 2010 04:24:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1077)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1269256016-13155-11-git-send-email-marcin@juszkiewicz.com.pl>
Date: Mon, 22 Mar 2010 12:24:50 +0100
Message-Id: <48FBB4C5-C4C9-463C-A169-7570DE2A01AC@student.utwente.nl>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269256016-13155-11-git-send-email-marcin@juszkiewicz.com.pl>
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: koen@dominion.thruhere.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][STABLE] shadow: use u-a on binaries that conflict with util-linux-ng
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
X-List-Received-Date: Mon, 22 Mar 2010 11:27:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Acked-by: <koen@openembedded.org>

Op 22 mrt 2010, om 12:06 heeft Marcin Juszkiewicz het volgende =
geschreven:

> From: Koen Kooi <koen@openembedded.org>
>=20
> ---
> recipes/shadow/shadow.inc |   27 +++++++++++++++++++++------
> 1 files changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index 5e3d2f2..30bd92f 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -11,7 +11,7 @@ LICENSE =3D "BSD"
> SECTION =3D "base"
> DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', =
d)}"
>=20
> -INC_PR =3D "r10"
> +INC_PR =3D "r13"
>=20
> # Additional Policy files for PAM
> PAM_SRC_URI =3D " \
> @@ -79,16 +79,30 @@ do_install_append() {
>   sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
>   sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
>=20
> -  mv ${D}${bindir}/passwd ${D}${bindir}/passwd.${PN}
> +  install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir}=20
> +  for i in passwd chfn newgrp chsh ; do
> +    mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}
> +  done
> +
>   mv ${D}${sbindir}/chpasswd ${D}${sbindir}/chpasswd.${PN}
> +  mv ${D}${sbindir}/vigr ${D}${base_sbindir}/vigr.${PN}
> +  mv ${D}${sbindir}/vipw ${D}${base_sbindir}/vipw.${PN}
> +  mv ${D}${bindir}/login ${D}${base_bindir}/login.${PN}
>=20
>   # Ensure we add a suitable securetty file to the package that has =
most common embedded TTYs defined.
>   install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty=20
> +
> }
>=20
> pkg_postinst_${PN} () {
> -    update-alternatives --install ${bindir}/passwd passwd =
passwd.${PN} 100
> -    update-alternatives --install ${sbindir}/chpasswd chpasswd =
chpasswd.${PN} 100
> +    update-alternatives --install ${bindir}/passwd passwd =
passwd.${PN} 200
> +    update-alternatives --install ${sbindir}/chpasswd chpasswd =
chpasswd.${PN} 200
> +    update-alternatives --install ${bindir}/chfn chfn chfn.${PN} 200
> +    update-alternatives --install ${bindir}/newgrp newgrp =
newgrp.${PN} 200
> +    update-alternatives --install ${bindir}/chsh chsh chsh.${PN} 200
> +    update-alternatives --install ${base_bindir}/login login =
login.${PN} 200
> +    update-alternatives --install ${base_sbindir}/vipw vipw =
vipw.${PN} 200
> +    update-alternatives --install ${base_sbindir}/vigr vigr =
vigr.${PN} 200
>     if [ "x$D" !=3D "x" ]; then
>         exit 1
>     fi =20
> @@ -97,6 +111,7 @@ pkg_postinst_${PN} () {
> }
>=20
> pkg_prerm_${PN} () {
> -    update-alternatives --remove passwd passwd.${PN}
> -    update-alternatives --remove chpasswd chpasswd.${PN}
> +    for i in passwd chpasswd chfn newgrp chsh login vipw vigr ; do
> +        update-alternatives --remove $i $i.${PN}
> +    done
> }
> --=20
> 1.7.0.2
>=20
>=20
>=20
>=20



