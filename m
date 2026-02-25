Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D824F55459
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 05:02:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39202.1771995752838234613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 21:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=iJNpkxWb;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Y640I9yI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P2PG2l2334758
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 05:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTlJenCh7BI9bVSPgKJ0H2E7Ad43YlbzhuJpXTjyt0w=; b=iJNpkxWbeJ2fERCR
	u8Xxi01ZUs83rDRW5mfxLMMAwervLkKxINKFxSnJki/eLShR+rN5XyDC+7DP212R
	7L+mDMFYDBfQ/6Zt+Nc8AnbAnBoPLZv3bCfi7txBKb3asBzsMd2QMSxnFG7Tcu7Y
	dUBnuox6Hsu40zoZK4bsm6kRn0E3KdeZAB1OG/76Jl6vQhmf9QbACrDRazgzi377
	LaUX0Q92lgaQuAaKXtnNtO/lfMfl0naVH8Zs2ZYTw/5JvOjc8+s75SeY6Ry+BjDG
	KR2ZcUqKxgwv/C3Z9qopEufyiuFPMSBUKttmrXEMmlIQYEAfxhToYHwaR533oMKG
	g+9SAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37sytf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 05:02:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso1454753485a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 21:02:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771995751; cv=none;
        d=google.com; s=arc-20240605;
        b=EemnqiKupw9v2lKvA6OaUUtkVRM/oHa8PJEryqtusJbfMkTHPtFzaSBR6jgfI5IfOe
         ajK1X2lK6xjnNoiQtAqaiE1OIGXYnWdIJK6qaQpiQaDVtpu9Dnq1E9k+R47sy3JbxRuP
         QcH9esuxwD1azgpzcOR80hqRgcMksfvHwpZ0DE0E9CZKRHMUPI6hD/2fMTi4Wp18L6qD
         6gynMjUjWiVtv47Kagi7rv3ryoss40nTkZ9RBezEfsBOkr9ZL/DmuWmTOgku/TFVn5YT
         fH85PjU8UtOBtTEJiNTqH8NtSiCFheBUld2VN32vMfYHNTF0C+j6H9RdnEkvwh2juz5v
         +Z0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RTlJenCh7BI9bVSPgKJ0H2E7Ad43YlbzhuJpXTjyt0w=;
        fh=zDV/DJKlvtgdBhH596m+CAdizR6eZ4xdrOYuUQ4WjP4=;
        b=diFfDfyb6zv4qC2lkKYBtVakxM3aFqMTqfV8t/B5+SYIioNiI3qhEt8PjMbpdjOtRY
         vfEZVjksFivZEMlc9qX2A2aM7a4gYd2x088exS79V1ivSGyQtvm5VANVTjJNpQWMDUaY
         QZ81ddsuKgmeOL5V8JdxS7R6RpcYCR3Fd1mCGPYbA8SvdCNGpKsIIrnbx+qYAvAezKH9
         ITcWWMMsu6fJ3VWVBvwGBy78N/zzPWJFoO3mOyX2jmGpXX2S19vb7z0GyuC0cRRyGLVW
         EL25dVQ7Z1MVhidGkBMAigV3v0ryuBitu8/gyAqjynjgJ2xhbatduX3pcTF76EgTiBJ7
         MdMQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771995751; x=1772600551; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTlJenCh7BI9bVSPgKJ0H2E7Ad43YlbzhuJpXTjyt0w=;
        b=Y640I9yIA0r6z4lVTemBVe2ncTqeuRTYEusyA0UNEXywIaDkQJpyJm31Gdlay/9NAJ
         sXIo1YDAcTeAJPDe1TYFzWRc2EPa6sIWuHl7ZHW3YfEtn4M7LJy5QI+omIRdCOPPc9sJ
         2fRtjb4wSNV4jWsf8HfxUU+ir/gJsps1pdm/titx94Li16NI1KSZ7dUs1N4DxxEVkx4l
         WCb5xBwqECfBHIJ6XtsmY23vjfAf/IwNhHYFJSnr5v9fUaG62kG9lcIMTqAtA/+9ye/q
         kXHbm2TgEewm9zlldT9phkifkPHBe8ufTYV9JdQ+5c60vCRHw3MTU5DUkiAE+VP4sp5K
         7mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771995751; x=1772600551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTlJenCh7BI9bVSPgKJ0H2E7Ad43YlbzhuJpXTjyt0w=;
        b=qjHXn4NOexxvNKMee2F5I+vOLeis8uTSFQmwWkmJoHhIGHLqam5A3umBZmqRD4OBRf
         MT03BVhv/O/CrthMOmhjjhn/M09v7MP97uyLD8L6bV7MMpeP9TsqvSrEX3H2hP6q+2rb
         Dd230PdtoRGXqm1joyNkFFiY1LvJDBG4UKDi4gZm+aZqE+mUZGCfEVVYaX51J8ccehx1
         aCMaqTV2rWAE53lFMsopNov/zAZyPcfdaST+vzDapP21+vxMx8iRiRac6K409SW0EKJD
         vEw0sq7iAUY4xlexIZvRAYLaPL99RKie6jjhkmsVp/L4TtQls1T3jwMuXfBtTcrzdRuv
         Bf4Q==
X-Gm-Message-State: AOJu0YwKF3ESPQywTmp2SZFtcgSrzyRAMjCgKtgmXUBNKDThMI7zHBUp
	UNQHCMYeD3ARCAinOIdWswO4Z8yfeOEf/iSfzvxJM1KAek4Wk1DJXUXBod9O3aWHrj9UUdH5yN8
	LcuW2ErqxYACzGJ/+2qIHnQDL80f0+Ft0f6CB/dGXWP1l7/jXVXrSt6DxraAxOV19RBtqvAgJUP
	16Bo/pf1gPUJ0HDyHj8SlMz4wqjmNoZI1w6pt1kHSFA6dKzYSdhGBwbhyOlzM=
X-Gm-Gg: ATEYQzwD/wqD3Qm9MaWtyn2ntBlbtF6MJATlOGRUyPuwsL9LzpjPe9I93oT0U15V9OJ
	Jy2QWovE3T+GWXPM6iUxcga38Mtw/NuzODeP1d+PJ3l3777eE5nLjKQ21Gu0j1GA1wjKY4BbF+X
	B1S7gWpQ4gyMJsldUKMdY6FPHDRiEBLEIsIO+nDWvIMOOKAkFbRT2AnZlV5P9W1bZfDlrjGXuGq
	/4V
X-Received: by 2002:a05:620a:4153:b0:8c6:b14b:8a71 with SMTP id af79cd13be357-8cbb57c19ecmr145954085a.14.1771995750519;
        Tue, 24 Feb 2026 21:02:30 -0800 (PST)
X-Received: by 2002:a05:620a:4153:b0:8c6:b14b:8a71 with SMTP id
 af79cd13be357-8cbb57c19ecmr145948385a.14.1771995749551; Tue, 24 Feb 2026
 21:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20260221041340.1212324-1-schonm@gmail.com>
In-Reply-To: <20260221041340.1212324-1-schonm@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:02:18 +0800
X-Gm-Features: AaiRm52ZvzL6nXjiPcDRovbrNb8e70VAWKDzY3n8cIMjVXwLLNvkg2G9diy6CLk
Message-ID: <CA+s=J=y+KdF9+FT8hnrZqT4Kv=+fzcu=rdGqGOtjEiuCApqTHA@mail.gmail.com>
Subject: Re: [oe] [meta-perl][scarthgap][PATCH] In meta-perl, drop the
 SRC_URI[md5sum] where a SRC_URI[sha256sum] is already available.
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699e8268 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=danhDmx_AAAA:8 a=eNcD7ojaAAAA:8 a=wyjpycHzAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dD0DA5GOL8LAV_XsDvUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=rRYMMicksRHQPzyJ67jW:22
 a=ROKTiUA5NBresHysc1Cf:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA0NiBTYWx0ZWRfX6rEvZSHwAbz0
 M7XdxVHO/grTFXUDgNTNUK4tTeppHeDtDIIFUU00O0fZ0wZAHiOTjJoZ84XF2witU07mnj1slqx
 jKeoO/15nUIi2q+QnC9+RrFvxQO8QVoEcAEk3juY5oeMPz1BVY7LLjElS9soS6ifTDZJeUlMie+
 BpN745V/uSxPuf+4ULMP2ka25Ao9PTl3jvBaJvbI0gvHIJcibcXqPU6Q682G52ZY+FDbXmJ/pfd
 rk3sGDZbTW8VeGKmDEQ5pD6aF1nTsVJeopEKV62EL+6CSM6vng456Bd/g/7dXOoSKD10uDdNS+c
 jCDRU9tDYTK0FqrXqwmJ3zOV3/EwVILlH50P0+dGN6h/rEA2lCgU2CXrrSH08d/0CQw/Yu5kJ9z
 w/dBuDeiQuKmCeIfpTkeE/rzyx28yn51+XAIiKsO3gn3rZNMsep98+2lX/MInWVRDluzpGmSATj
 6qCGfqIJkZ7g0efzLZQ==
X-Proofpoint-ORIG-GUID: yJkP_oaQrVEiQKW17dFmmLEKGvdS4C6I
X-Proofpoint-GUID: yJkP_oaQrVEiQKW17dFmmLEKGvdS4C6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 05:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124606

While this is functionally correct, why should this be done for a
stable branch? Is there a problem that is being fixed?

Thanks,

Anuj

On Sat, Feb 21, 2026 at 12:13=E2=80=AFPM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> This patch was generated from master
>
> git cherry-pick cb4a67ad2c66e6df997e3c07308819ce657229ac~..94b51dc5761b03=
fa66d6f56295c7cad55e154c15
>
> That showed 46 patches which were then squashed with
>
> git reset --soft HEAD~46
> git commit -s
>
> This set is changing files only in meta-perl
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb | 1 -
>  meta-perl/recipes-perl/adduser/adduser_3.118.bb                  | 1 -
>  .../recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb     | 1 -
>  meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb   | 1 -
>  meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb     | 1 -
>  meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb   | 1 -
>  .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb      | 1 -
>  meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb      | 1 -
>  .../libdevel/libdevel-globaldestruction-perl_0.14.bb             | 1 -
>  meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb     | 1 -
>  meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb     | 1 -
>  meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb                | 1 -
>  meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb         | 1 -
>  .../recipes-perl/libextutils/libextutils-config-perl_0.008.bb    | 1 -
>  .../libextutils/libextutils-installpaths-perl_0.012.bb           | 1 -
>  .../recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb    | 1 -
>  meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb     | 1 -
>  meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb       | 1 -
>  meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb       | 1 -
>  meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb         | 1 -
>  meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb | 1 -
>  meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb         | 1 -
>  meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb         | 1 -
>  meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb  | 1 -
>  meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb | 1 -
>  meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb | 1 -
>  meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb        | 1 -
>  meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb           | 1 -
>  meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb         | 1 -
>  meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb         | 1 -
>  meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb         | 1 -
>  meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb     | 1 -
>  meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb     | 1 -
>  meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb     | 1 -
>  .../recipes-perl/libstrictures/libstrictures-perl_2.000006.bb    | 1 -
>  .../libsub/libsub-exporter-progressive-perl_0.001013.bb          | 1 -
>  meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb      | 1 -
>  meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb      | 1 -
>  meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb   | 1 -
>  meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb    | 1 -
>  meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb         | 1 -
>  meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb         | 1 -
>  meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb     | 1 -
>  .../libunicode/libunicode-linebreak-perl_2019.001.bb             | 1 -
>  .../recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb    | 1 -
>  meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb     | 1 -
>  46 files changed, 46 deletions(-)
>
> diff --git a/meta-perl/recipes-extended/mime-construct/mime-construct_1.1=
1.bb b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
> index a5d28265d7..9da2b1adf9 100644
> --- a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
> +++ b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/mime-=
construct-${PV}.tar.gz \
>      file://fix-mime-construct-help-return-value.patch \
>  "
>
> -SRC_URI[md5sum] =3D "73834ea780fbea81b89dbd9b2fb54f58"
>  SRC_URI[sha256sum] =3D "4cd7bb61b51d41192d1498c1051aa6a4ccd75aeb09b71d2e=
c706a7084a4a9303"
>
>  inherit cpan
> diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-perl/=
recipes-perl/adduser/adduser_3.118.bb
> index 3ac2211aa6..431b41a2dd 100644
> --- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
> +++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "https://launchpad.net/debian/+archive/prim=
ary/+sourcefiles/adduser/${
>             file://0001-adduser-set-default-shell-with-sbin-nologin.patch=
 \
>  "
>
> -SRC_URI[md5sum] =3D "44ba2475ebdaafc9613236bdda321c97"
>  SRC_URI[sha256sum] =3D "3e9eea661c9aac6b2c791bfcc1de3a9c6a422d45c8f3d38e=
d417737ed3166ffc"
>
>  S =3D "${WORKDIR}/${BPN}"
> diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1=
.15.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
> index d87df0974b..1fc6048c6d 100644
> --- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
> +++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
> @@ -13,7 +13,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://lib/Algorithm/Diff.pm;beginline=3D406;endli=
ne=3D409;md5=3Dd393b8ad3b8994b9d0ae9299b8a8a1ee"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/N/NE/NEDKONZ/Algorithm-Diff-${PV}=
.tar.gz"
> -SRC_URI[md5sum] =3D "457cd497a0411a88b47d3741eb176071"
>  SRC_URI[sha256sum] =3D "aa848b75ad3ecc32d31e8651909551e851cceef74a32822c=
7a3cb35c259f5190"
>
>  S =3D "${WORKDIR}/Algorithm-Diff-${PV}"
> diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.=
bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> index ee7c4d7502..4a7b576a2c 100644
> --- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> +++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/M=
A/MANOWAR/RadiusPerl-${PV}.
>             file://test.pl-adjust-for-ptest.patch \
>             file://run-ptest \
>  "
> -SRC_URI[md5sum] =3D "d1fe2d6ecf7ea99299e4e3a8f945aad8"
>  SRC_URI[sha256sum] =3D "3b276506986ccaa4949d92b13ce053a0017ad11562a991cc=
753364923fe81ca7"
>
>  S =3D "${WORKDIR}/Authen-Radius-${PV}"
> diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb=
 b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> index a9eec69502..531bc61cfb 100644
> --- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> +++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> @@ -14,7 +14,6 @@ RDEPENDS:${PN} =3D "libdigest-hmac-perl"
>  SRC_URI =3D "http://www.cpan.org/authors/id/G/GB/GBARR/Authen-SASL-${PV}=
.tar.gz \
>             file://run-ptest \
>            "
> -SRC_URI[md5sum] =3D "7c03a689d4c689e5a9e2f18a1c586b2f"
>  SRC_URI[sha256sum] =3D "6614fa7518f094f853741b63c73f3627168c5d3aca89b1d0=
2b1016dc32854e09"
>
>  S =3D "${WORKDIR}/Authen-SASL-${PV}"
> diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.=
bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
> index a51d327a31..43d6b03f40 100644
> --- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
> +++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
> @@ -15,7 +15,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37a4918a30ac=
e24395020e5b8c03b83f"
>
>  SRCNAME =3D "Capture-Tiny"
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/D/DA/DAGOLDEN/${SRCNAME}-${PV}.ta=
r.gz"
> -SRC_URI[md5sum] =3D "f5d24083ad270f8326dd659dd83eeb54"
>  SRC_URI[sha256sum] =3D "6c23113e87bad393308c90a207013e505f659274736638d8=
c79bac9c67cc3e19"
>
>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.3=
19.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
> index 5c3701f16b..f4c1e5673a 100644
> --- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
> +++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
> @@ -16,7 +16,6 @@ file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=3D30c=
0b8a5048cc2f4be5ff15ef0d8cf
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV=
}.tar.gz"
>
> -SRC_URI[md5sum] =3D "eeeab8cc93eef7dd2e2c343ecdf247b7"
>  SRC_URI[sha256sum] =3D "304f66cc2653264c0fe127d21669e86d3d18cd72f2574d8f=
5131beec31a0a33e"
>  RDEPENDS:${PN} +=3D "libcapture-tiny-perl"
>  RDEPENDS:${PN} +=3D "perl-module-base"
> diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb =
b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> index 4493a7e5e5..66369df641 100644
> --- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> +++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> @@ -18,7 +18,6 @@ DEPENDS =3D "perl"
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/F/FT/FTASSIN/Data-He=
xDump-${PV}.tar.gz \
>             file://run-ptest \
>  "
> -SRC_URI[md5sum] =3D "467b7183d1062ab4a502b50c34e7d67f"
>  SRC_URI[sha256sum] =3D "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb17=
454d03535cd9be70"
>
>  S =3D "${WORKDIR}/Data-HexDump-${PV}"
> diff --git a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-p=
erl_0.14.bb b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-pe=
rl_0.14.bb
> index 1dcecd0dcf..e8450c7ac8 100644
> --- a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.1=
4.bb
> +++ b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.1=
4.bb
> @@ -10,7 +10,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D53;endline=3D55;md5=3D93=
5dadb9423774f53548e5cd5055d41a"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Devel-GlobalDestructio=
n-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "24221ba322cf2dc46a1fc99b53e2380b"
>  SRC_URI[sha256sum] =3D "34b8a5f29991311468fe6913cadaba75fd5d2b0b3ee3bb41=
fe5b53efab9154ab"
>
>  S =3D "${WORKDIR}/Devel-GlobalDestruction-${PV}"
> diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb=
 b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> index 43b7f4d5a9..41b4e78c5c 100644
> --- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> +++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> @@ -11,7 +11,6 @@ RDEPENDS:${PN} =3D "libdigest-sha1-perl perl-module-ext=
utils-makemaker perl-module
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-HMA=
C-${PV}.tar.gz \
>             file://run-ptest \
>            "
> -SRC_URI[md5sum] =3D "e6a5d6f552da16eacb5157ea4369ff9d"
>  SRC_URI[sha256sum] =3D "3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631ec=
fb8985ba96da4a59"
>
>  S =3D "${WORKDIR}/Digest-HMAC-${PV}"
> diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb=
 b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> index df89c9bcdb..4aa37243a7 100644
> --- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> +++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D10;endlin=
e=3D14;md5=3Dff5867ebb4bc1103a7
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-SHA=
1-${PV}.tar.gz \
>             file://run-ptest \
>            "
> -SRC_URI[md5sum] =3D "bd22388f268434f2b24f64e28bf1aa35"
>  SRC_URI[sha256sum] =3D "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ede=
df5b90296fb943cc"
>
>  S =3D "${WORKDIR}/Digest-SHA1-${PV}"
> diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-per=
l/recipes-perl/libenv/libenv-perl_1.04.bb
> index 79fff9d520..fd34c6d123 100644
> --- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
> +++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D76c1cbf18db5=
6b3340d91cb947943bd3"
>
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Env-${PV}=
.tar.gz"
>
> -SRC_URI[md5sum] =3D "fdba5c0690e66972c96fee112cf5f25c"
>  SRC_URI[sha256sum] =3D "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7b7=
014ce1200251ebb0"
>
>  S =3D "${WORKDIR}/Env-${PV}"
> diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb b/m=
eta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
> index e54bb11ccd..15e0ef85c0 100644
> --- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
> +++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
> @@ -33,7 +33,6 @@ RDEPENDS:${PN}-ptest +=3D " \
>
>  SRC_URI =3D "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV=
}.tar.gz"
>
> -SRC_URI[md5sum] =3D "6732b1c6207e4a9a3e2987c88368039a"
>  SRC_URI[sha256sum] =3D "1a23f7913032aed6d4b68321373a3899ca66590f4727391a=
091ec19c95bf7adc"
>
>  S =3D "${WORKDIR}/Error-${PV}"
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0=
.008.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.=
bb
> index a58d96582e..0f43c537c0 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
> @@ -8,7 +8,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1932ab4d8b84c25fd7967aa18088e=
57e"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.=
tar.gz"
> -SRC_URI[md5sum] =3D "565a7b09c7cac5907a25bbe2c959a717"
>  SRC_URI[sha256sum] =3D "ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfd=
aa3ee749e62f1a8c"
>
>  S =3D "${WORKDIR}/ExtUtils-Config-${PV}"
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-=
perl_0.012.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths=
-perl_0.012.bb
> index 07dab4e161..f4db4ccff6 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.=
012.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.=
012.bb
> @@ -9,7 +9,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db6fa54d873ce6bcf4809ea88bdf97=
769"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-=
${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "9a8d66aab1ffec98ea260faf03ac612b"
>  SRC_URI[sha256sum] =3D "84735e3037bab1fdffa3c2508567ad412a785c91599db3c1=
2593a50a1dd434ed"
>
>  S =3D "${WORKDIR}/ExtUtils-InstallPaths-${PV}"
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_=
3.35.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.=
bb
> index 43b5b60ef6..56617fcdac 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D120;end=
line=3D129;md5=3Deb858f0e3b1b0bee
>
>  SRCNAME =3D "ExtUtils-ParseXS"
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/S/SM/SMUELLER/${SRCNAME}-${PV}.ta=
r.gz"
> -SRC_URI[md5sum] =3D "2ae41036d85e98e1369645724962dd16"
>  SRC_URI[sha256sum] =3D "41def0511278a2a8ba9afa25ccab45b0453f75e7fd774e86=
44b5f9a57cc4ee1c"
>
>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb=
 b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
> index 1012ae952e..3f138baa41 100644
> --- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
> +++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
> @@ -13,7 +13,6 @@ S =3D "${WORKDIR}/File-Slurp-${PV}"
>
>  inherit cpan
>
> -SRC_URI[md5sum] =3D "7d584cd15c4f8b9547765eff8c4ef078"
>  SRC_URI[sha256sum] =3D "ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a5=
6980747ea3253643"
>
>  BBCLASSEXTEND=3D"native"
> diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b=
/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
> index 216d7c4136..4dbcc107bc 100644
> --- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
> +++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
> @@ -9,7 +9,6 @@ DEPENDS +=3D "perl"
>
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/HTML-Parse=
r-${PV}.tar.gz"
>
> -SRC_URI[md5sum] =3D "eb7505e5f626913350df9dd4a03d54a8"
>  SRC_URI[sha256sum] =3D "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02=
a3296a4bb92f608b"
>
>  S =3D "${WORKDIR}/HTML-Parser-${PV}"
> diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb b=
/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> index c871b97c39..a0ce7c0b2e 100644
> --- a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> +++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> @@ -8,7 +8,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D62;endline=3D66;md5=3Daa=
91eed6adfe182d2af676954f06a7c9"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/P/PE/PETDANCE/HTML-Tagset-${PV}.t=
ar.gz"
> -SRC_URI[md5sum] =3D "d2bfa18fe1904df7f683e96611e87437"
>  SRC_URI[sha256sum] =3D "adb17dac9e36cd011f5243881c9739417fd102fce760f8de=
4e9be4c7131108e2"
>
>  S =3D "${WORKDIR}/HTML-Tagset-${PV}"
> diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/m=
eta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
> index 227fa83fc0..b9099fc576 100644
> --- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
> +++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3eb57a8958ca=
e73cb65e7d0c26339242"
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tree-${PV}.tar.gz \
>             file://bin-htmltree-fix-shebang.patch \
>  "
> -SRC_URI[md5sum] =3D "d9271d60b872ed6fbe68b2d0fe8c450e"
>  SRC_URI[sha256sum] =3D "7d6d73fca622aa74855a8b088faa39454a0f91b7af83c9ec=
0387f01eefc2148f"
>
>  S =3D "${WORKDIR}/HTML-Tree-${PV}"
> diff --git a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.00200=
4.bb b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
> index e88d60d13a..690bbe92eb 100644
> --- a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
> +++ b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
> @@ -17,7 +17,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D209;endline=3D223;md5=3D=
3cf363f1e405dea6db2c6cd0ef23680c"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Import-Into-${PV}.tar.=
gz"
> -SRC_URI[md5sum] =3D "70f2f3b08a5b706ee382a8448c346cb1"
>  SRC_URI[sha256sum] =3D "decb259bc2ff015fe3dac85e4a287d4128e9b0506a0b2c5f=
a7244836a68b1084"
>
>  S =3D "${WORKDIR}/Import-Into-${PV}"
> diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/m=
eta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> index b745939234..5c5ccf7db2 100644
> --- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> +++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> @@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D01406e4ff2e6=
0d88d42ef1caebdd0011"
>
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/D/DS/DSKOLL/IO-stringy-${PV}.tar.=
gz"
> -SRC_URI[md5sum] =3D "e91acf0a800b190d13585a47de775bdd"
>  SRC_URI[sha256sum] =3D "8c67fd6608c3c4e74f7324f1404a856c331dbf48d9deda6a=
aa8296ea41bf199d"
>
>  S =3D "${WORKDIR}/IO-stringy-${PV}"
> diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/m=
eta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> index 203db7b10c..6172933f13 100644
> --- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> +++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> @@ -12,7 +12,6 @@ S =3D "${WORKDIR}/IPC-Signal-${PV}"
>
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/IPC-Signa=
l-${PV}.tar.gz"
>
> -SRC_URI[md5sum] =3D "4cebf17fdf1785eaf8c151bf2e8c360a"
>  SRC_URI[sha256sum] =3D "7c21f9c8c2d0c0f0f0f46e77de7c3d879dd562668ddf0525=
875c38cef2076fd0"
>
>  inherit cpan
> diff --git a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07=
.bb b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> index 1e4b563532..654fd2eedd 100644
> --- a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> +++ b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3Dd028249c2d08d=
ca6ca6c5bb43b56d926"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/P/PV/PVANDRY/Locale-gettext-${PV}=
.tar.gz"
>
> -SRC_URI[md5sum] =3D "bc652758af65c24500f1d06a77415019"
>  SRC_URI[sha256sum] =3D "909d47954697e7c04218f972915b787bd1244d75e3bd0162=
0bc167d5bbc49c15"
>
>  S =3D "${WORKDIR}/Locale-gettext-${PV}"
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.=
2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> index 538fa30d3f..fac74ba97e 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> @@ -17,7 +17,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D322;end=
line=3D325;md5=3D086450ce010f6fda
>
>  SRCNAME =3D "Module-Pluggable"
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.=
gz"
> -SRC_URI[md5sum] =3D "87ce2971662efd0b69a81bb4dc9ea76c"
>  SRC_URI[sha256sum] =3D "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56dc6=
4e86b9fa75c5a6df"
>
>
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.01=
6.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> index 205df68029..9c4370e965 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> @@ -21,7 +21,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D36;endl=
ine=3D44;md5=3D9416434672a57853d6
>
>  SRCNAME =3D "Module-Runtime"
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/Z/ZE/ZEFRAM/${SRCNAME}-${PV}.tar.=
gz"
> -SRC_URI[md5sum] =3D "d3d47222fa2e3dfcb4526f6cc8437b20"
>  SRC_URI[sha256sum] =3D "68302ec646833547d410be28e09676db75006f4aa58a11f3=
bdb44ffe99f0f024"
>
>  UPSTREAM_CHECK_REGEX =3D "Module\-Runtime\-(?P<pver>(\d+\.\d+)).tar"
> diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb b/=
meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
> index fe7bb3326e..37b5d61f7a 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
> @@ -6,7 +6,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D165;endline=3D192;md5=3D=
6ef523fa09e8c272675839e21de16bde"
>
>  SRC_URI =3D "https://cpan.metacpan.org/authors/id/W/WI/WILLEM/Net-DNS-SE=
C-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "ffa55a9898192c9d4c623cb1357eba9b"
>  SRC_URI[sha256sum] =3D "37a47d4def72d7338f3cc7cd807ec19bd9e2ae638ae656fa=
536cf0314801989e"
>
>  DEPENDS +=3D "openssl"
> diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/met=
a-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
> index a77381dce8..a7793200a5 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D3;endli=
ne=3D5;md5=3D4d6588c2fa0d38ae162f
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar=
.gz"
>
> -SRC_URI[md5sum] =3D "d091ed00302f0276069bca9df9478744"
>  SRC_URI[sha256sum] =3D "e2f389fe3e7a9e4b61488692919ad723b98f3b479b5288f6=
10daa8c27995b351"
>
>  S =3D "${WORKDIR}/perl-ldap-${PV}"
> diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/m=
eta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> index 4c4faab4db..a22b63809c 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> @@ -13,7 +13,6 @@ DEPENDS +=3D "libidn"
>  RDEPENDS:${PN}:append:libc-glibc =3D " glibc-gconvs"
>
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TH/THOR/Net-LibIDN=
-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "c3e4de2065009d67bcb1df0afb473e12"
>  SRC_URI[sha256sum] =3D "2f8acc9442b3866ec7dc63cd449fc693ae3e930d5d3e5e94=
30fbb6f393bdbb17"
>
>  SRC_URI +=3D "file://libidn-wr-cross-compile.patch"
> diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/m=
eta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> index 5d0eccd84a..a91bb6cbe1 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> @@ -27,7 +27,6 @@ SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/M=
I/MIKEM/Net-SSLeay-${PV}.ta
>             file://no-exec-on-configure.patch \
>             file://run-ptest \
>            "
> -SRC_URI[md5sum] =3D "d602bdce4e0531c6efc276e3e429ca69"
>  SRC_URI[sha256sum] =3D "9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f=
1a6814549927b0c8"
>
>  S =3D "${WORKDIR}/Net-SSLeay-${PV}"
> diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/m=
eta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> index d1365f269c..d90b47d218 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> @@ -15,7 +15,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D4;endline=3D7;md5=3De94a=
b3b72335e3cdadd6c1ff736dd714"
>
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JR/JROGERS/Net-Tel=
net-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "c8573c57a2d9469f038c40ac284b1e5f"
>  SRC_URI[sha256sum] =3D "677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c91d=
923bd6283796a743"
>
>  S =3D "${WORKDIR}/Net-Telnet-${PV}"
> diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb=
 b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> index 643a704a1d..5e4c71b704 100644
> --- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> +++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> @@ -14,7 +14,6 @@ S =3D "${WORKDIR}/Proc-WaitStat-${PV}"
>
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/Proc-Wait=
Stat-${PV}.tar.gz"
>
> -SRC_URI[md5sum] =3D "b911bd579b6b142391b21de1efa30c95"
>  SRC_URI[sha256sum] =3D "d07563f5e787909d16e7390241e877f49ab739b1de9d0e2e=
a1a41bd0bf4474bc"
>
>  inherit cpan
> diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb=
 b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
> index c5efc15358..8ccd269e6d 100644
> --- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
> +++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
> @@ -9,7 +9,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D197;endline=3D234;md5=3D=
26df7e7c20551fb1906e2286624f0b71"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz=
"
> -SRC_URI[md5sum] =3D "9ee45591befa3d0b1094ac75d282b6ba"
>  SRC_URI[sha256sum] =3D "d7bdee9e138a4f83aa52d0a981625644bda87ff16642dfa8=
45dcb44d9a242b45"
>
>  S =3D "${WORKDIR}/Role-Tiny-${PV}"
> diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb=
 b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
> index cf290d9908..6b1c4e8c0f 100644
> --- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
> +++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
> @@ -28,7 +28,6 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Arti=
stic-1.0;md5=3Dcda03bbdc3c195
>      file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=3D2a4f4fd2128ea2f=
65047ee63fbca9f68 \
>  "
>
> -SRC_URI[md5sum] =3D "a6bc06b3f7749f7d77a2b1bd13402821"
>  SRC_URI[sha256sum] =3D "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b8=
37745f3ea61d6afa"
>
>  S =3D "${WORKDIR}/Unix-Statgrab-${PV}"
> diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.00=
0006.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.=
bb
> index 80c21b2b14..5a779a6733 100644
> --- a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
> +++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
> @@ -29,7 +29,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D246;endline=3D262;md5=3D=
43be558cf4f19823cdd6af22135cf5f8"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar.g=
z"
> -SRC_URI[md5sum] =3D "35c14fd25320f32ff40e977feae95d0d"
>  SRC_URI[sha256sum] =3D "09d57974a6d1b2380c802870fed471108f51170da81458e2=
751859f2714f8d57"
>
>  S =3D "${WORKDIR}/strictures-${PV}"
> diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-pe=
rl_0.001013.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-=
perl_0.001013.bb
> index d51ab21715..10f0fa2044 100644
> --- a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.00=
1013.bb
> +++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.00=
1013.bb
> @@ -14,7 +14,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D003fa970662359a43ac2c2961108b=
0f1"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressiv=
e-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "72cf6acdd2a0a8b105821a4db98e4ebe"
>  SRC_URI[sha256sum] =3D "d535b7954d64da1ac1305b1fadf98202769e3599376854b2=
ced90c382beac056"
>
>  S =3D "${WORKDIR}/Sub-Exporter-Progressive-${PV}"
> diff --git a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb =
b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
> index 3a0de9757b..1981ae4a94 100644
> --- a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
> +++ b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
> @@ -17,7 +17,6 @@ CPAN_AUTHOR =3D "DAGOLDEN"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/D/DA/${CPAN_AUTHOR}/${CPAN_PACKAG=
E}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] =3D "6c6a174861fd160e8d5871a86df00baf"
>  SRC_URI[sha256sum] =3D "b4f3f63b80f680a421332d8851ddbe5a8e72fcaa74d5d1d9=
8f3c8cc4a3ece293"
>
>  S =3D "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
> diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb =
b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> index f4ce3131de..831ea1a8f6 100644
> --- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> +++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3Dc275db663c848=
9a5709ebb22b185add5"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.tar=
.gz"
>
> -SRC_URI[md5sum] =3D "b2b4aab7a0e6bddb7ac3b21ba637482c"
>  SRC_URI[sha256sum] =3D "5a645878dc570ac33661581fbb090ff24ebce17d43ea53fd=
22e105a856a47290"
>
>  S =3D "${WORKDIR}/TermReadKey-${PV}"
> diff --git a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.=
bb b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
> index d74a347293..aea0e7e0f2 100644
> --- a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
> +++ b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
> @@ -25,7 +25,6 @@ CPAN_AUTHOR =3D "ADAMK"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/A/AD/${CPAN_AUTHOR}/${CPAN_PACKAG=
E}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] =3D "682ed043f7d3e38f3dfd8745fd21c49a"
>  SRC_URI[sha256sum] =3D "638a57658cb119af1fe5b15e73d47c2544dcfef84af0c6b1=
b2e97f08202b686c"
>
>  RDEPENDS:${PN} +=3D "perl-module-test-builder perl-module-test-more perl=
-module-test-tester"
> diff --git a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.b=
b b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> index 29118129ad..e9a2bd474b 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> @@ -17,7 +17,6 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3Dd8d54c8c500cb=
dd57a4c15911d9d96db"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-CharWidth-${PV}.=
tar.gz"
>
> -SRC_URI[md5sum] =3D "37a723df0580c0758c0ee67b37336c15"
>  SRC_URI[sha256sum] =3D "abded5f4fdd9338e89fd2f1d8271c44989dae5bf50aece41=
b6179d8e230704f8"
>
>  S =3D "${WORKDIR}/Text-CharWidth-${PV}"
> diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/m=
eta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> index 9dfadde8e5..2e89b759bf 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D385c55653886=
acac3821999a3ccd17b3"
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz =
\
>             file://run-ptest \
>            "
> -SRC_URI[md5sum] =3D "30d56e6dd5551ca16b8e16cc7299dc21"
>  SRC_URI[sha256sum] =3D "a67f50a48e313c1680cc662109ce5f913ea71454db355d0c=
f4db87ac89d2d2fa"
>
>  S =3D "${WORKDIR}/Text-Diff-${PV}"
> diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/m=
eta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
> index 1e8405cab9..88125845b1 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
> @@ -14,7 +14,6 @@ RRECOMMENDS:${PN}:append:libc-glibc =3D " glibc-gconvs"
>
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MP/MPIOTR/Text-Ico=
nv-${PV}.tar.gz"
>
> -SRC_URI[md5sum] =3D "81b26e069eaebb084e91ea3c009b67ae"
>  SRC_URI[sha256sum] =3D "5b80b7d5e709d34393bcba88971864a17b44a5bf0f9e4bce=
e383d029e7d2d5c3"
>
>  S =3D "${WORKDIR}/Text-Iconv-${PV}"
> diff --git a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb=
 b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> index 017e951d3a..0949dbb7a0 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> @@ -18,7 +18,6 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3D080862e1e40cd=
cddef4393e137285858"
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-WrapI18N-${PV}.t=
ar.gz"
>
> -SRC_URI[md5sum] =3D "0799c16a00926e6c18d400c2e2861d5f"
>  SRC_URI[sha256sum] =3D "4bd29a17f0c2c792d12c1005b3c276f2ab0fae39c00859ae=
1741d7941846a488"
>
>  S =3D "${WORKDIR}/Text-WrapI18N-${PV}"
> diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_=
2019.001.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2=
019.001.bb
> index a7a998c358..ae922d9dda 100644
> --- a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.00=
1.bb
> +++ b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.00=
1.bb
> @@ -12,7 +12,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D5;endli=
ne=3D9;md5=3Db5e8b1099b86b86fbc31
>
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/Unicode-LineBreak-${P=
V}.tar.gz"
>
> -SRC_URI[md5sum] =3D "003d6da7a13700e069afed9238c864b9"
>  SRC_URI[sha256sum] =3D "486762e4cacddcc77b13989f979a029f84630b8175e7fef1=
7989e157d4b6318a"
>
>  S =3D "${WORKDIR}/Unicode-LineBreak-${PV}"
> diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_=
1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.=
bb
> index 7962d22c9d..2261dafbb0 100644
> --- a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> +++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> @@ -13,7 +13,6 @@ DEPENDS +=3D "libxml-sax-perl-native"
>  RDEPENDS:${PN} +=3D "libxml-sax-perl"
>
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RB/RBERJON/XML-Fil=
ter-BufferText-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "2992c0387632583b966ab9c965b25512"
>  SRC_URI[sha256sum] =3D "8fd2126d3beec554df852919f4739e689202cbba6a17506e=
9b66ea165841a75c"
>
>  LIC_FILES_CHKSUM =3D "file://BufferText.pm;beginline=3D88;endline=3D90;m=
d5=3D497aa6d79cc84c3d769a2a0016bee928"
> diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb=
 b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> index 487a5c22cd..c3dee2bcbb 100644
> --- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> +++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> @@ -13,7 +13,6 @@ DEPENDS +=3D "libxml-filter-buffertext-perl-native"
>  RDEPENDS:${PN} +=3D "libxml-filter-buffertext-perl"
>
>  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-SA=
X-Writer-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "3e3023c648e3003c04de2fb04435f8bd"
>  SRC_URI[sha256sum] =3D "3d61d07ef43b0126f5b4de4f415a256fa859fa88dc4fdaba=
ad70b7be7c682cf0"
>
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D45;endline=3D46;md5=3Dd4=
1d8cd98f00b204e9800998ecf8427e"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124528): https://lists.openembedded.org/g/openembedde=
d-devel/message/124528
> Mute This Topic: https://lists.openembedded.org/mt/117922197/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

