Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@dominion.thruhere.net>) id 1NtfnT-0005X2-3y
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:27:51 +0100
Received: by ewy25 with SMTP id 25so1316554ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 04:24:43 -0700 (PDT)
Received: by 10.213.70.10 with SMTP id b10mr531836ebj.27.1269257083195;
	Mon, 22 Mar 2010 04:24:43 -0700 (PDT)
Received: from [172.20.0.255] (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 13sm2068840ewy.13.2010.03.22.04.24.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Mar 2010 04:24:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1077)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1269256016-13155-10-git-send-email-marcin@juszkiewicz.com.pl>
Date: Mon, 22 Mar 2010 12:24:40 +0100
Message-Id: <9D2BD33C-3702-40C9-9BB9-195FB5DD37C8@student.utwente.nl>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269256016-13155-10-git-send-email-marcin@juszkiewicz.com.pl>
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
Subject: Re: [PATCH][STABLE] shadow: run pwconv and grpconv in postinst
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
X-List-Received-Date: Mon, 22 Mar 2010 11:27:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Acked-by: <koen@openembedded.org>

Op 22 mrt 2010, om 12:06 heeft Marcin Juszkiewicz het volgende =
geschreven:

> From: Koen Kooi <koen@openembedded.org>
>=20
> * this converts oldstyle formats to the proper one
> ---
> recipes/shadow/shadow.inc |    7 ++++++-
> 1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index 9da5845..5e3d2f2 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -11,7 +11,7 @@ LICENSE =3D "BSD"
> SECTION =3D "base"
> DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', =
d)}"
>=20
> -INC_PR =3D "r9"
> +INC_PR =3D "r10"
>=20
> # Additional Policy files for PAM
> PAM_SRC_URI =3D " \
> @@ -89,6 +89,11 @@ do_install_append() {
> pkg_postinst_${PN} () {
>     update-alternatives --install ${bindir}/passwd passwd passwd.${PN} =
100
>     update-alternatives --install ${sbindir}/chpasswd chpasswd =
chpasswd.${PN} 100
> +    if [ "x$D" !=3D "x" ]; then
> +        exit 1
> +    fi =20
> +	pwconv
> +	grpconv
> }
>=20
> pkg_prerm_${PN} () {
> --=20
> 1.7.0.2
>=20
>=20
>=20
>=20



