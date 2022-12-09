Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946B2C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 00:07:35 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.17.1670544454105946986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Dec 2022 16:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=VmjAe6HK;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670544454;
  x=1702080454;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9KqL9bPYNgvJHlOx3GonVvRZynZVo9871wiC1GuyElU=;
  b=VmjAe6HKuXHKbtJ90Q7QcLFsKilBWuVMKlb8KkzuWHi0ChtsOgVvsmTO
   +QFhxQZamFTqWSzKQLLo4Txr4B2NmUTVh0CJnLrAv/59H2pRBlHuN9WbI
   g73z+8DJcRxSPyy+PJqi9gaKdV30DVnKAc29cumuP974fa3/p+hsl/+ch
   Ww7XiJejzwEVu2v8UAoui1k8NKPftrWwDrDCphMsar9lAzZ+AchTGGgSS
   V5US568M8VOmh3Xq51wtdYu/fJJ0O99y82dlBuaKgqMmhDUmC2uFpLxFq
   J9O2FdwurAI/JDviq76D8J6ggbmuGyCUqE3fH2rTi1Vvr4Yazs+uRuedn
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: leimaohui <leimaohui@fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] polkit: Recover ${nonarch_libdir}/${BPN}-1
 into FILES:${PN} to fix install do_package error when enable multilib.
Thread-Topic: [oe] [meta-oe][PATCH] polkit: Recover ${nonarch_libdir}/${BPN}-1
 into FILES:${PN} to fix install do_package error when enable multilib.
Thread-Index: AQHZCen+FFCHUosRNES8KXfLP1+zPa5krvYA
Date: Fri, 9 Dec 2022 00:07:25 +0000
Message-ID: <4e86afd7f45d47c29c714e5a4c030c0d@axis.com>
References: <1670382817-3426-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1670382817-3426-1-git-send-email-leimaohui@fujitsu.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Dec 2022 00:07:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100000

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of leimaohui
> Sent: den 7 december 2022 04:14
> To: openembedded-devel@lists.openembedded.org
> Cc: Lei Maohui <leimaohui@fujitsu.com>
> Subject: [oe] [meta-oe][PATCH] polkit: Recover ${nonarch_libdir}/${BPN}-1=
 into FILES:${PN} to fix install do_package error when enable multilib.

That is a very long subject, way longer than the recommendations.
I suggest you change it to something shorter, e.g.:=20

  polkit: Make it build with multilib

>=20
> ERROR: polkit-122-r0 do_package: QA Issue: polkit: Files/directories were=
 installed but not shipped in any package:
>   /usr/lib/polkit-1/polkit-agent-helper-1
>   /usr/lib/polkit-1/polkitd
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> polkit: 2 installed and not shipped files. [installed-vs-shipped]
>=20
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta-oe/recipes-extended/polkit/polkit_122.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-extended/polkit/polkit_122.bb b/meta-oe/reci=
pes-extended/polkit/polkit_122.bb
> index dfa6c14a4..a7cfbdd62 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_122.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_122.bb
> @@ -46,4 +46,6 @@ do_install:append() {
>  	chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
>  }
>=20
> -FILES:${PN} +=3D "${libdir}/polkit-1 ${datadir}"
> +FILES:${PN} +=3D "${libdir}/polkit-1 ${datadir} \
> +                ${nonarch_libdir}/${BPN}-1 \
> +               "

It would be more obvious what's going on if you change the above to:

FILES:${PN} +=3D "${libdir}/polkit-1 ${nonarch_libdir}/polkit-1 ${datadir}"

> --
> 2.25.1

//Peter


