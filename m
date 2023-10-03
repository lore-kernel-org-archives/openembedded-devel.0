Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99472E75452
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 12:15:39 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web10.104592.1696325354316575473
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Oct 2023 02:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=c6DUjtm+;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AE2075A;
	Tue,  3 Oct 2023 11:27:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1696325246;
	bh=zepHO2orxfOPMHo4xarHNfwK89KW8HKArzImBXjaWnQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=c6DUjtm+EMykfUjCORVFEcoWYmuB7T9c2uYZntSR4EbqxXQZ/jvjyh0k33CpA+kUd
	 5klB9uhsfYW7n6XAaUwubKVuhOwEDaKj/Kon7HXwP6/JWzdYEu46EZ7brmCFfSZ231
	 SuBELCA6Fp8eg6V+5AwfQs43pmk0kz1dxUlRcT8M=
MIME-Version: 1.0
In-Reply-To: <20231002173644.3284604-1-tom.hochstein@nxp.com>
References: <20231002173644.3284604-1-tom.hochstein@nxp.com>
Subject: Re: [meta-multimedia][PATCH] libcamera: Avoid build break in signature recalculation
From: "Kieran Bingham" <kieran.bingham@ideasonboard.com>
Cc: Tom Hochstein <tom.hochstein@nxp.com>
To: Tom Hochstein <tom.hochstein@nxp.com>, openembedded-devel@lists.openembedded.org
Date: Tue, 03 Oct 2023 10:29:08 +0100
Message-ID: <169632534898.277971.10586575068039243782@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 12:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105320

Quoting Tom Hochstein (2023-10-02 18:36:44)
> The signature recalculation task can fail:
> ```
> /.../build/tmp/work/armv8a-poky-linux/libcamera/1_0.0.4-r0/temp/run.do_re=
calculate_ipa_signatures_package.937421: line 154: /.../build/tmp/work/armv=
8a-poky-linux/libcamera/1_0.0.4-r0/git/src/ipa/ipa-sign-install.sh: No such=
 file or directory
> ```
>=20
> This happens whenever ${S} is removed and packages are retrieved from
> sstate cache.
>=20
> Instead of trying to fix the task, avoid the issue altogether by
> performing the signature recalculation directly in do_package.

Will this still happen after any calls to strip? (i.e. the binaries will
not be modified after this step?)

--
Kieran


>=20
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  .../recipes-multimedia/libcamera/libcamera_0.1.0.bb        | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> index ece1be6f3..2a3c6473e 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> @@ -50,8 +50,11 @@ do_install:append() {
>      chrpath -d ${D}${libexecdir}/libcamera/v4l2-compat.so
>  }
> =20
> -addtask do_recalculate_ipa_signatures_package after do_package before do=
_packagedata
> -do_recalculate_ipa_signatures_package() {
> +do_package:append() {
> +    bb.build.exec_func("do_package_recalculate_ipa_signatures", d)
> +}
> +
> +do_package_recalculate_ipa_signatures() {
>      local modules
>      for module in $(find ${PKGD}/usr/lib/libcamera -name "*.so.sign"); do
>          module=3D"${module%.sign}"
> --=20
> 2.25.1
>=20
>

