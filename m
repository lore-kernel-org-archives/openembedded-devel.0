Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F765CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 03:44:49 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4112.1778643881247661683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 20:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=o5BtMST2;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CUxdNBo3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D08oDN2524968
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5PSoOdgYvwW+C1ts9OFMTi41RSfW0bBca808k4dprCs=; b=o5BtMST2gg8SBZBu
	CQtdqzx4nlh+OnG5sF0AD5kZt6C7D+xRKpxNy0uebfD65RGYGkQGDTL53Lnrk/zV
	/pmkke1ghaD21tLSGNGhd8QIkcRggl9FOphq5CtX1x8qGczI/iSNDEPVB+dj5siK
	Pt1YhMNsWI8bOnRPtnFGp8oAjRdZMASpX42j5AZo1+natXlC9zx+fkJN5FDylQtL
	lvJCahHuvsHHOA8AdwycjoduNKXU3t6QBugT7lZmL9jmRYkLd+OKAy8i9ggNQsG7
	Tml80MWmlAD5m/a1f3XMT1Xk5G1CbqfP27UgfKpjplfMy++nnZGPqbHTnL132R6A
	X6jFGw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhujqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:44:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca14d1faaso179767116d6.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 20:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778643879; cv=none;
        d=google.com; s=arc-20240605;
        b=b5riVDxJT265KnQQ5ci4I7nVRAqCtUSsgcCJe8Bp67so7UsUH3GoN0/gX3CAjjy2OB
         u2boWyKNI6MQgncHjr0M4ywRJUEBUo2knsOFUZfBLica1j10D2Q+Bge5yqMhOOarYC0p
         hsYG2bVg1C+FdqHLVhqz9pHkd4IuzsTJeOd+YBcQeKwhSaURRFtCPViY2TsGuFnlAKX+
         cpA4gjCiTwHDy8+sI5luY6f1X2R3EEoqafeD0E+UbpLIAm8x7CNpThNSUwq2MYnKlzSi
         JPwFZfaz320GyX6XYCnQjJnUtsllLovYGlRhv6AlDYnatdyZFYGXUFrM0J1H5MFOMEFB
         dOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5PSoOdgYvwW+C1ts9OFMTi41RSfW0bBca808k4dprCs=;
        fh=JFgsD62HJp+U+o4ld1dmcY79m7cwH1oC/As5+aBqpG8=;
        b=dM0dIdmAPnHcG2HK1jxGLiRomstBNrL83AIssNo7JEvZPrMdH3HvbT5gNsVRFNp2nV
         59nGSdTC/3TkrzFHpsuNk7vKwJcpCrKBnh23oP+rqjJp2+JbQNTYQ63N9jmc3HEiO3G0
         HL93WB1FOBpvpwQOk4g19NVyF2q6OdfiK2AO5hCfRvv7A5ZTaLEhBx+X7hwTNjvtUQQb
         1k+xRh5rRytlYCmLACjbYodKFQ9aMlDSpNJtOO1KSnWsc/phKXnBl/03QslrKCHWuaXT
         uikIJEjkCbd47oVBTRVflYkam/iYViJBGYpQFQj7W3R6UEGxgzRMmXEybEAd30XQUGP2
         9jAQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778643879; x=1779248679; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PSoOdgYvwW+C1ts9OFMTi41RSfW0bBca808k4dprCs=;
        b=CUxdNBo3aOSQ9XL1Yx5vkklTKYfz93ahG1ap4sUhvRx/hodIxmCWx9lBm7O9K72Gl2
         0CE1JKH/vFgwMSqpN1SPfi9Yjs1LElAt5+dYMDWjUcbKaBCztfFxKVaemzG8uONZLqBC
         t8aeTaj6XetmwuWWMeppUzjErLsxCsJ5W2IFJTqPo1nqO6PlHEZ3ZEJZqxEb4TCT+b2w
         HwiGmw0h9qdYefd7w6nVLd2hEXP6Bcu6VKlKcxsipCQU2SmLrCu6LB1quxYYmef4OEcf
         6ODGobjI4CfMnZ9QVLifatq9MGgIwUL9/TsWSIGuZpzJHjdwd2GsO5g52zeL8XMoyxGF
         CXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778643879; x=1779248679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5PSoOdgYvwW+C1ts9OFMTi41RSfW0bBca808k4dprCs=;
        b=LNfV/n/aPovrz4FXJRrIGpoJ/SNwBQ55kKNuHzfZEkPtq0A0IL3zWzHYRi3mQPqpYh
         OI63GNxMCquEQk+Gbau9y4dXHxDEWqtLJDt3FBpvgXF/DXLUEUnKOFZabL7uY/+Fjd9r
         O5XUS6VM/5v/nGDdA9+uZoFcxAPZJXmyFre9NpqA8eHG1bqriiNT0s+eh7Wq/saKrK7v
         Y/URgRY4ZgmevzPf7SqLkAe1SZmba/mhfTVOhtZDxN2IwG5YTRYC8DstmXBQwvSHDm8r
         xEQOAEkGQ/wzonsAc2dQZ+gMGbk6c6iNYJ89MDOh7bkP7qa0UV3BUcFdf6nod6XEhRwY
         GD8Q==
X-Gm-Message-State: AOJu0YyeyRUr2n/c/ZbhjuY+uiKUJaqP84iAVVFzj6h0wy4Ny9FWTUyO
	OxH62A6STTqhvYEf50/aC5q/oD/zbw3m1Cm+KKJMY+ENCV9vw9gKe/iW+vHXDHn+XyHqae9pTmk
	mVQsFZ3knJeSlBMSUjtz0ej/M0cd8k+AXq0E5qGDX5I8JdQW2QKYNSRiLL+4hrZHf5BuHBSwgyP
	xy3O00ltH9E5xk6PWd1UaUizTt8VMip1hWtop5JCJZEu0xXwBzzBiLhK/W0C0=
X-Gm-Gg: Acq92OHuhyjnK5MvOPoHw5yOORSzWoIX9NFczcvGplbkWfMx1JSU0wEr0tK9SJIh5JK
	MW5hOvsThtcrJf0amt0aB2oUSOt9Odq6qc+TABVQMOLZvuaMqMqv2yqCMHQo0B0AIZuk0N9Ps8C
	Ni1hZW0f3vAQfpeGOlwmmzdbGl24rqV1/432RkzoKvIYyzqKd53JngpKMBnm8py3JNVRO27AvJ9
	537
X-Received: by 2002:ad4:5de2:0:b0:8a4:58ff:f0f8 with SMTP id 6a1803df08f44-8c7bc91aee7mr31003036d6.29.1778643879239;
        Tue, 12 May 2026 20:44:39 -0700 (PDT)
X-Received: by 2002:ad4:5de2:0:b0:8a4:58ff:f0f8 with SMTP id
 6a1803df08f44-8c7bc91aee7mr31002696d6.29.1778643878660; Tue, 12 May 2026
 20:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <18AF0166CB71E13F.3218295@lists.openembedded.org> <dc0b8b7c-52af-461d-aa69-685c0dbed320@windriver.com>
In-Reply-To: <dc0b8b7c-52af-461d-aa69-685c0dbed320@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 13 May 2026 11:44:27 +0800
X-Gm-Features: AVHnY4IQ9-gRVCVTdy4kgySf1_AywjBhfhYxCGKal91NOU2NLxoVibKp5lxdAV4
Message-ID: <CA+s=J=y=pbLNpHk+n8gP4AZ5PUKr3QWRkUHifNz-Hsnv8=BAOA@mail.gmail.com>
Subject: Re: [oe] [wrynose][master][PATCH V2] postfix: upgrade 3.10.8 -> 3.11.2
To: changqing.li@windriver.com
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAzMyBTYWx0ZWRfX+TrhxrGMP0oZ
 wWoFigKR983ghhoCrGfZsYXctsG1NMBB8YeIw74MfmuYUCF3FwV2fnAR13a1vQW4w8BtvjAlfxe
 jv/L/Nfv/WpA+m9SVZIvIZL+eJm3/M0AV45SRd+7llTbDch3Gz2bDxtkbl4Z7YLn/Ca9K3R2/oj
 HSX6E8U/RJRnjpTjRt1n34WYrP2Fk1p+LDCXImGOG4BYW3NHJaT/HJ/ybNEb7Mw3cdZK4QSfQ+a
 OpOjM0MNbZGILOR/W2TWq/E8GHmR0XE56yUR8nlPTDszxjvzV3M7y0NCPveVSGsxfDC2s+WjOsr
 iaiSbI+bqx+rVS09E1x7M1JRwbNUxbbS9y/2QrukM2DAxnF2MYhOJWJosdVARkCNjoW8KObqCJ0
 fYCw0SFXmWHG7OB0zhg3SBFBv5CMNsyufeq5otNAT230ykp3N6aDiGceXnSCvgVW5XUdOlTbIXr
 UUpP7lWBPb/VIYwE4Uw==
X-Proofpoint-GUID: zS1NQFdp5brmESSkY7kXeXGMjj2OU9Ei
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a03f3a8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=Q4-j1AaZAAAA:8 a=VJYubktbAAAA:8 a=gmDo1nssAAAA:8
 a=Vt2AcnKqAAAA:8 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dvTS-QfVpD0fLrn8FskA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=OqWDEjY5HwswFcA5adJo:22
 a=DmCNEmdWNTAeIjfGWauO:22 a=v10HlyRyNeVhbzM4Lqgd:22 a=6ft9yNkZjdd813gQxDxM:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: zS1NQFdp5brmESSkY7kXeXGMjj2OU9Ei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126885

On Wed, May 13, 2026 at 11:25=E2=80=AFAM Changqing Li via
lists.openembedded.org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hi,
>
> Current  postfix 3.10.8 not support build on Linux 7.x,  and it is suppor=
ted from 3.11.0.
>
> But distro like ubuntu26.04 has Linux 7.x.  Maybe it is better that we al=
so upgrade postfix to 3.11.2

I think I'm ok with taking the upgrade since we've just branched off
unless someone else has strong objections.

Thanks,

Anuj


>
> for wrynose.  if upgrade for wrynose is not accept, then we maybe need to=
 patch postfix with the following patch:
>
> [meta-networking][PATCH] postfix: make it can compile with linux 7.x
>
> https://lists.openembedded.org/g/openembedded-devel/message/126826
>
> Regards
>
> Changqing
>
> On 5/13/26 11:09, Changqing Li via lists.openembedded.org wrote:
>
> * Refresh patch to mute patch-fuzz
> * Add patch 0001-sys_defs.h-workaround-for-musl-lib.patch to workaround
>   for musl lib
> * This upgrade include the following commit, which make postfix can
>   compile on latest stable ubuntu 26.04, which have Linux 7.x kernel
>
>   Postfix works on Linux 7.x kernels. Frank Scheiner. Files:
>         makedefs, util/sys_defs.h.
>
> Changes:
> https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../postfix/files/0001-Fix-makedefs.patch     | 25 +++++------
>  ...1-sys_defs.h-workaround-for-musl-lib.patch | 43 +++++++++++++++++++
>  ...tconf-to-a-variable-for-cross-compil.patch |  9 ++--
>  ...tive-compiler-to-build-makedefs.test.patch | 17 +++-----
>  .../postfix/files/0004-Fix-icu-config.patch   |  9 ++--
>  ...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 ++---
>  .../{postfix_3.10.8.bb =3D> postfix_3.11.2.bb}  |  3 +-
>  7 files changed, 73 insertions(+), 44 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-sy=
s_defs.h-workaround-for-musl-lib.patch
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.10.8.bb =3D> p=
ostfix_3.11.2.bb} (98%)
>
> diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-maked=
efs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs=
.patch
> index 785fe87452..4e187849dc 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.pat=
ch
> +++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.pat=
ch
> @@ -1,4 +1,4 @@
> -From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001
> +From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 2001
>  From: Li xin <lixin.fnst@cn.fujitsu.com>
>  Date: Fri, 19 Jun 2015 16:45:54 +0900
>  Subject: [PATCH] Fix makedefs
> @@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
>   1 file changed, 11 insertions(+), 16 deletions(-)
>
>  diff --git a/makedefs b/makedefs
> -index a740e41..28fb128 100644
> +index d5103ce..9713327 100644
>  --- a/makedefs
>  +++ b/makedefs
> -@@ -230,9 +230,6 @@ echo "# pie=3D$pie"
> +@@ -232,9 +232,6 @@ echo "# pie=3D$pie"
>
>   # Defaults for most sane systems
>
> @@ -32,7 +32,7 @@ index a740e41..28fb128 100644
>   ARFL=3Drv
>
>   # Ugly function to make our error message more visible among the
> -@@ -563,12 +560,12 @@ case "$SYSTEM.$RELEASE" in
> +@@ -608,12 +605,12 @@ case "$SYSTEM.$RELEASE" in
>   case "$CCARGS" in
>   *-DNO_DB*) ;;
>   *-DHAS_DB*) ;;
> @@ -48,8 +48,8 @@ index a740e41..28fb128 100644
>      else
>   # No, we're not going to try db1 db2 db3 etc.
>   # On a properly installed system, Postfix builds
> -@@ -577,12 +574,12 @@ case "$SYSTEM.$RELEASE" in
> - echo "Install the appropriate db*-devel package first." 1>&2
> +@@ -623,12 +620,12 @@ case "$SYSTEM.$RELEASE" in
> + echo "Alternatively, build with CCARGS=3D\"-NO_DB ...\"" 1>&2
>   exit 1
>      fi
>  -    SYSLIBS=3D"-ldb"
> @@ -63,7 +63,7 @@ index a740e41..28fb128 100644
>      do
>   test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
>      SYSLIBS=3D"$SYSLIBS -l$name"
> -@@ -602,7 +599,7 @@ case "$SYSTEM.$RELEASE" in
> +@@ -648,7 +645,7 @@ case "$SYSTEM.$RELEASE" in
>         if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
>         then
>     :
> @@ -72,7 +72,7 @@ index a740e41..28fb128 100644
>         then
>     echo CCARGS=3D"$CCARGS -DNO_EPOLL"
>         else
> -@@ -626,8 +623,6 @@ int     main(int argc, char **argv)
> +@@ -672,8 +669,6 @@ int     main(int argc, char **argv)
>   }
>   EOF
>     ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
> @@ -81,7 +81,7 @@ index a740e41..28fb128 100644
>     rm -f makedefs.test makedefs.test.[co]
>         fi;;
>   esac
> -@@ -644,12 +639,12 @@ EOF
> +@@ -690,12 +685,12 @@ EOF
>   case "$CCARGS" in
>   *-DNO_DB*) ;;
>   *-DHAS_DB*) ;;
> @@ -97,8 +97,8 @@ index a740e41..28fb128 100644
>      else
>   # On a properly installed system, Postfix builds
>   # by including <db.h> and by linking with -ldb
> -@@ -657,12 +652,12 @@ EOF
> - echo "Install the appropriate db*-devel package first." 1>&2
> +@@ -705,12 +700,12 @@ EOF
> + echo "See: https://www.postfix.org/NON_BERKELEYDB_README.html#build-con=
f" 1>&2
>   exit 1
>      fi
>  -    SYSLIBS=3D"-ldb"
> @@ -112,6 +112,3 @@ index a740e41..28fb128 100644
>      do
>   test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
>      SYSLIBS=3D"$SYSLIBS -l$name"
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.=
h-workaround-for-musl-lib.patch b/meta-networking/recipes-daemons/postfix/f=
iles/0001-sys_defs.h-workaround-for-musl-lib.patch
> new file mode 100644
> index 0000000000..b7a8e05165
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-worka=
round-for-musl-lib.patch
> @@ -0,0 +1,43 @@
> +From ce15792203ae0c787e3602d6d38a892ea1ce31ce Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 12 May 2026 15:04:55 +0800
> +Subject: [PATCH] sys_defs.h: workaround for musl lib
> +
> +Fix musl lib compile failure:
> +vbuf_print.c:215:46: error: macro 'VBUF_SNPRINTF' passed 5 arguments, bu=
t takes just 4
> +  215 |                     VSTRING_ADDNUM(fmt, width);
> +      |                                              ^
> +vbuf_print.c:132:9: note: macro 'VBUF_SNPRINTF' defined here
> +  132 | #define VBUF_SNPRINTF(bp, sz, fmt, arg) do { \
> +
> +Previously checking condition will make #else branch is selected, and
> +NO_SNPRINTF is defined, and when NO_SNPRINTF is defined, VBUF_SNPRINTF
> +only take 4 arguments, and cause above failure. musl lib support
> +snprintf and we only have glibc and musl libc, so workaround by when
> +glibc is not defected, take it as musl lib, and select the #if branch.
> +
> +Upstream-Status: Pending [Reported to postfix-users@postfix.org]
> +
> +https://www.mail-archive.com/postfix-users@postfix.org/msg107898.html
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/util/sys_defs.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
> +index 1890577..c3527c9 100644
> +--- a/src/util/sys_defs.h
> ++++ b/src/util/sys_defs.h
> +@@ -794,7 +794,7 @@ extern int initgroups(const char *, int);
> + #define NATIVE_NEWALIAS_PATH "/usr/bin/newaliases"
> + #define NATIVE_COMMAND_DIR "/usr/sbin"
> + #define NATIVE_DAEMON_DIR "/usr/libexec/postfix"
> +-#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1)
> ++#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1) || !defined(__GLIBC__)
> + #define SOCKADDR_SIZE socklen_t
> + #define SOCKOPT_SIZE socklen_t
> + #else
> +--
> +2.34.1
> +
> diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-fi=
xed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipes=
-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-c=
ompil.patch
> index d46efb95cb..a74c46fa92 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-pos=
tconf-to-a-variable-for-cross-compil.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-pos=
tconf-to-a-variable-for-cross-compil.patch
> @@ -1,4 +1,4 @@
> -From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001
> +From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 2001
>  From: Li xin <lixin.fnst@cn.fujitsu.com>
>  Date: Fri, 19 Jun 2015 17:14:58 +0900
>  Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
> @@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
>   2 files changed, 11 insertions(+), 9 deletions(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index a37f89f..17cb64b 100644
> +index 8d7501a..d2a85e8 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -22,7 +22,7 @@ META =3D meta/main.cf.proto meta/master.cf.proto meta/=
postfix-files \
> +@@ -23,7 +23,7 @@ META =3D meta/main.cf.proto meta/master.cf.proto meta/=
postfix-files \
>   EXPAND =3D sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
>      -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
>   SHLIB_DIR_OVERRIDE =3D \
> @@ -102,6 +102,3 @@ index 563ee27..00d4651 100644
>       "daemon_directory =3D $daemon_directory" \
>       "data_directory =3D $data_directory" \
>       "command_directory =3D $command_directory" \
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-=
Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/recipes-=
daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.t=
est.patch
> index 6f8e3e84da..201b4741de 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-nat=
ive-compiler-to-build-makedefs.test.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-nat=
ive-compiler-to-build-makedefs.test.patch
> @@ -1,4 +1,4 @@
> -From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001
> +From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 26 Aug 2017 10:29:37 -0700
>  Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
> @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
>  diff --git a/makedefs b/makedefs
> -index 28fb128..313b401 100644
> +index 9713327..e879832 100644
>  --- a/makedefs
>  +++ b/makedefs
> -@@ -622,7 +622,7 @@ int     main(int argc, char **argv)
> +@@ -668,7 +668,7 @@ int     main(int argc, char **argv)
>       exit(0);
>   }
>   EOF
> @@ -25,7 +25,7 @@ index 28fb128..313b401 100644
>     rm -f makedefs.test makedefs.test.[co]
>         fi;;
>   esac
> -@@ -865,7 +865,7 @@ int     main(int argc, char **argv)
> +@@ -914,7 +914,7 @@ int     main(int argc, char **argv)
>       exit(0);
>   }
>   EOF
> @@ -34,7 +34,7 @@ index 28fb128..313b401 100644
>     ./makedefs.test 2>/dev/null ||
>   CCARGS=3D"$CCARGS -DNO_SIGSETJMP"
>     rm -f makedefs.test makedefs.test.[co]
> -@@ -903,7 +903,7 @@ int main(int argc, char **argv)
> +@@ -952,7 +952,7 @@ int main(int argc, char **argv)
>    &error) !=3D 14);
>   }
>   EOF
> @@ -43,7 +43,7 @@ index 28fb128..313b401 100644
>   $icu_ldflags >/dev/null 2>&1
>      if ./makedefs.test 2>/dev/null ; then
>   CCARGS=3D"$CCARGS $icu_cppflags"
> -@@ -1024,7 +1024,7 @@ int     main(void)
> +@@ -1088,7 +1088,7 @@ int     main(void)
>       exit(ferror(stdout) ? 1 : 0);
>   }
>   EOF
> @@ -52,7 +52,7 @@ index 28fb128..313b401 100644
>       ./makedefs.test || exit 1
>       rm -f makedefs.test makedefs.test.[co]
>   }
> -@@ -1180,7 +1180,7 @@ int     main(void)
> +@@ -1245,7 +1245,7 @@ int     main(void)
>       exit(ferror(stdout) ? 1 : 0);
>   }
>   EOF
> @@ -61,6 +61,3 @@ index 28fb128..313b401 100644
>   parm_val=3D`./makedefs.test` || exit 1
>   rm -f makedefs.test makedefs.test.[co]
>   eval ${parm_name}=3D\""\$parm_val"\"
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-c=
onfig.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-co=
nfig.patch
> index 0660ee098e..daf5c7089e 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.p=
atch
> +++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.p=
atch
> @@ -1,4 +1,4 @@
> -From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001
> +From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 16 Jan 2022 11:21:54 +0800
>  Subject: [PATCH] Fix icu config
> @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 deletion(-)
>
>  diff --git a/makedefs b/makedefs
> -index 313b401..e5db212 100644
> +index e879832..f9c132e 100644
>  --- a/makedefs
>  +++ b/makedefs
> -@@ -906,7 +906,6 @@ EOF
> +@@ -955,7 +955,6 @@ EOF
>      ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \
>   $icu_ldflags >/dev/null 2>&1
>      if ./makedefs.test 2>/dev/null ; then
> @@ -29,6 +29,3 @@ index 313b401..e5db212 100644
>   SYSLIBS=3D"$SYSLIBS $icu_ldflags"
>      else
>   CCARGS=3D"$CCARGS -DNO_EAI"
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-=
add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/recipes-=
daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-defa=
ult.patch
> index 1571aa844d..c2e640d6ff 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lns=
l-and-lresolv-to-SYSLIBS-by-default.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lns=
l-and-lresolv-to-SYSLIBS-by-default.patch
> @@ -1,4 +1,4 @@
> -From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001
> +From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 2001
>  From: Yi Zhao <yi.zhao@windriver.com>
>  Date: Fri, 12 Oct 2018 12:38:02 +0800
>  Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by default
> @@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>   1 file changed, 2 insertions(+), 20 deletions(-)
>
>  diff --git a/makedefs b/makedefs
> -index e5db212..b00049b 100644
> +index f9c132e..5ebef5b 100644
>  --- a/makedefs
>  +++ b/makedefs
> -@@ -577,16 +577,7 @@ case "$SYSTEM.$RELEASE" in
> +@@ -623,16 +623,7 @@ case "$SYSTEM.$RELEASE" in
>      SYSLIBS=3D"$SYSLIBS -ldb"
>      ;;
>   esac
> @@ -35,7 +35,7 @@ index e5db212..b00049b 100644
>   # Kernel 2.4 added IPv6
>   case "$RELEASE" in
>   2.[0-3].*) CCARGS=3D"$CCARGS -DNO_IPV6";;
> -@@ -655,16 +646,7 @@ EOF
> +@@ -703,16 +694,7 @@ EOF
>      SYSLIBS=3D"$SYSLIBS -ldb"
>      ;;
>   esac
> @@ -53,6 +53,3 @@ index e5db212..b00049b 100644
>   SYSLIBS=3D"$SYSLIBS -ldl"
>   : ${SHLIB_SUFFIX=3D.so}
>   : ${SHLIB_CFLAGS=3D-fPIC}
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb b/=
meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> similarity index 98%
> rename from meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
> rename to meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> index a66ecc0b5d..14fec1b276 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> @@ -26,9 +26,10 @@ SRC_URI =3D "http://ftp.porcupine.org/mirrors/postfix-=
release/official/postfix-${P
>             file://0003-makedefs-Use-native-compiler-to-build-makedefs.te=
st.patch \
>             file://0004-Fix-icu-config.patch \
>             file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-defau=
lt.patch \
> +           file://0001-sys_defs.h-workaround-for-musl-lib.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "31d4b3eb8093d823b5a151f571719ff7c0462571bc95e644=
0d87ca525bfb096c"
> +SRC_URI[sha256sum] =3D "daed65b08c9288cdb386a914f3e52cdddd44935407b5ce5a=
ee8bcc3aa4207778"
>
>  UPSTREAM_CHECK_URI =3D "https://www.postfix.org/announcements.html"
>  UPSTREAM_CHECK_REGEX =3D "postfix-(?P<pver>\d+(\.\d+)+)"
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126884): https://lists.openembedded.org/g/openembedde=
d-devel/message/126884
> Mute This Topic: https://lists.openembedded.org/mt/119292155/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

