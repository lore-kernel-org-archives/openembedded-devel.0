Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 817C977EBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 14:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B91E82E132;
	Fri, 28 Apr 2017 16:28:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id epbK1XVR-dwJ; Fri, 28 Apr 2017 16:28:34 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id CF5BC11A8F5;
	Fri, 28 Apr 2017 16:28:34 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC4911E099;
	Fri, 28 Apr 2017 16:28:34 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0D8F1E097;
	Fri, 28 Apr 2017 16:28:34 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 28 Apr 2017 16:28:34 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id A4A6221F6;
	Fri, 28 Apr 2017 16:28:34 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 28 Apr 2017 16:28:33 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 28 Apr 2017 16:28:33 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe] [PATCH] meta_oe_security_flags.inc: Disable PIE
	for	libdevmapper
Thread-Index: AQHSv9vXpJ2Atnsjskq3jncgP7wwz6Ha1yBQ
Date: Fri, 28 Apr 2017 14:28:33 +0000
Message-ID: <05cbcf2102b4415b88b7f2fcdc3f0cdf@XBOX02.axis.com>
References: <1493355346-33822-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1493355346-33822-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe] [PATCH] meta_oe_security_flags.inc: Disable PIE for	libdevmapper
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Apr 2017 14:28:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Huang Qiyu
> Sent: den 28 april 2017 06:56
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe] [PATCH] meta_oe_security_flags.inc: Disable PIE
> for libdevmapper
>=20
> Modify meta_oe_security_flags.inc to fix error:
> /
> | collect2: error: ld returned 1 exit status
> | ../make.tmpl:426: recipe for target 'ioctl/libdevmapper.so.1.02'
> failed
> | make[1]: *** [ioctl/libdevmapper.so.1.02] Error 1
> \
>=20
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-oe/conf/distro/include/meta_oe_security_flags.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
> b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
> index 815fb16..2a1a1dd 100644
> --- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
> +++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
> @@ -25,3 +25,4 @@ SECURITY_CFLAGS_pn-libvdpau =3D
> "${SECURITY_NO_PIE_CFLAGS}"
>  #| make[1]: *** [Makefile:675: libluajit.so] Error 1
>  SECURITY_CFLAGS_pn-luajit =3D "${SECURITY_NO_PIE_CFLAGS}"
>=20
> +SECURITY_CFLAGS_pn-libdevmapper =3D "${SECURITY_NO_PIE_CFLAGS}"
> --
> 2.7.4

I had not seen this mail and just sent a similar patch to solve the same=20
problem. Though I think my patch puts the added line in a more logical=20
location (i.e., together with the line for lvm2)...

//Peter


