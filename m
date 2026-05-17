Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FA4CD4F25
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20220.1779006283397570027
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gwHW8BP7;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JNfY+QKY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GKd7jq2778556
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nqFkmMm5HT
	sc1+W2qRB9srzL++0juiLogw/+Pv+aME=; b=gwHW8BP7TgzRYEXehi6BTugegN5
	fNSSpt+c43DmG9ELey5loC9q6UROiCh+PId1uhXCL6kTkgX1O2aO2JfF+jZsR/TG
	IY9BHNK1sVfrMKZlwHFs6z9eSM4QnsmNq8HLamUOoEEWUGGnXTz9iQAtpk+veDHr
	08+nlAqLFj6LZXwhqNg5izBf/vOc7RqoGsw0tY93mSlRJ1OkHhydJhNlNQatKJbX
	RqfxNtWPReV+zpGOyEal5GAegBMjmzTn5P3US4MUQkWoOK92dv8uhP4o+nFGNv+d
	ScPY4cP9HUJFMR0wD1gZegJp8gzQim3cqv45BC+4EDaISZbuyyn/sDACjvQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcaenc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36781927b4dso2659580a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006282; x=1779611082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nqFkmMm5HTsc1+W2qRB9srzL++0juiLogw/+Pv+aME=;
        b=JNfY+QKYXlY21f6ExeGa9NwhzllVPqRV2kAqr+wQClRfpm3vYvRC8HDQLAErxVO3vB
         oIPaUPu1JHcGZPjOOpbGF4t2sltQY6dSMZdhaVdOpoGBUVBxI66SApUp18hjZoKaB4xF
         g3DO+5fYsUOr+6FrhatQcTZZqzSaxOZVdmqTolzDRE7U4SBS3MBDP7i4TeqRf/7qk3fG
         V2LEvratjoU71nUm/zj1/j02vXfwwoGqCSzquYFmi3DW1C2rNXJKfdd+tuBpuKwZri7i
         sromW6pp/Nt3+3oevqOes9VEvym5NuiA24y1gxUzQyH16iQLLImBl4VdUQdL1Asj4FBY
         ympg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006282; x=1779611082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+nqFkmMm5HTsc1+W2qRB9srzL++0juiLogw/+Pv+aME=;
        b=iuIeQvejC4xveGK+y8ZcTtKgk8V5pIVZmCCWZsMqzSCisIU7Q13j6cOdQSAtWFg3if
         +ysxDI1hidd6RjsAH/dxi1ddhVUBwBE4p75IlRe9owiPZCYZ6ZF0zfkdw5X6kVJe7/iM
         KmC6wdUsPn+BNhZxp+Z+xfhbtrUq4Ra2AtOEkBgu0IvYhzd6LAMhLVGr2gdDPcr1zo+R
         jlhxGxJkjiU+ZLbtL6IEnwCbMjSXsUNl4ov/l6d+XXvV2p+4we8Y/pTj7MZQ04RByEJx
         P/kKBjWmy6b0D89fLxRCqngbvXXZWbPtAg/JL5Oa+vufdAdBqBkAtQPML2rSPlm0fwSg
         FhEQ==
X-Gm-Message-State: AOJu0YwfrZjTvXuVbX9T0s8SxblvBeUBwJpZHdHuWAWdJr+1hpt8hSSD
	+dDjnYG2looIlgW4TrLQclS76NWbYZzcJkHlgKU0l8sXc2Bd1FkYm36+CwV0SX3AibFskwr4skZ
	YriXBCBi4btXrkwp2jQj2zGuSVlPtz+sH63bxVGpr9A8U2g/NFSBIppc/NDdQmq1V0j2QEi9cdD
	BrfYhne4eX0sAD+legSJg6/Q==
X-Gm-Gg: Acq92OF468H0k8wATHrMteizeNTpFDEl+AI3+kdN0GFNd1QOdKt/FmQ9l2mrJCCKCn1
	BTRinpPmft3vrf7eKaDwG+5rdsPdyX+UGVKHQAyFMeoX2KQDUMeO7m6R82AhSn/gni1JjABKvwg
	zicE2kk85YQ1LQNaedY+vKNdQO5lKzv3deArWLsnvYih0gS7n2Hmmgv30AdDcmlat7eHGgyaptI
	OoFH7nW+yPdWH0h3evnB8busxw1Je5FfUZKznAZoeFYhN+yoFFSVPb9kpQPOchU2m7BiO5dSkNL
	Pt58QtNlhhTP0HeC9oggDeb9WxWZQIS0Jo/fXuTcEQH+FwsnGJawdDRrqrgapXb646sdPz9zqse
	aDtfCl3J0kRhTtWeRuLrLrhyIspCUcNS7mWOM3Y1JeYBz2lrsHnxT
X-Received: by 2002:a17:90b:534e:b0:369:bddb:79b5 with SMTP id 98e67ed59e1d1-369bddb84b8mr148834a91.2.1779006282173;
        Sun, 17 May 2026 01:24:42 -0700 (PDT)
X-Received: by 2002:a17:90b:534e:b0:369:bddb:79b5 with SMTP id 98e67ed59e1d1-369bddb84b8mr148813a91.2.1779006281726;
        Sun, 17 May 2026 01:24:41 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:41 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 28/29] nftables: improve reproducibility
Date: Sun, 17 May 2026 13:49:56 +0530
Message-ID: <ce551e0201399814c37fb156fea31da51e3a0fa4.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a097b4a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=SsMK-6ewAAAA:8
 a=NEAV23lmAAAA:8 a=3HDBlxybAAAA:8 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8
 a=Vf8oi9PKAAAA:8 a=DjJ1iMIJAAAA:8 a=kY28avEZHWTb90xO-h4A:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=49hUO6naoDravHwzbBTq:22 a=laEoCiVfU_Unz3mSdgXN:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=s-HcpGhzF3c4NlUTCjwJ:22 a=jmO-1Ghq7yFKJHp-pPJk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX3f7l8mEuC7Ye
 zxCpbowEz+ffrPOdnEkwCTFmpfJNt5jZn+R9/NXgD4UR54/ec4anck0yJ8QthaMENsWf1eO8gWi
 KmyAQ9Me4K0tnS+9TeRWenIeFVfMhLqcfx5NFFc6Ov1YD83tq/vYwMOeRveyyUh5gn0Qfj9ag9k
 hGgeu0TAu2B8hjltI8yU5HsrlKYXQXxtJym151cZrY6/swYJvFKUWNSMWhWhdwEr7pMIzkaID91
 EDjoLml4/NE+4P8sTquku8cdJlXbzhYYTSO1GrPwAno+6vaVmORUw0JrfMFU4NLlEB0tBBm6ojW
 4tvZcIKxu94jfvzLsA8e9UDXU9qOyBOQEB+U1jQl1irrzoRnwTbhdWa7pChwDwuvEvitk4TN04m
 dx+GImF/np4DLEC1cRze+Ftdqno/XpVPShsuxe2+yodtbDExy/AxTPVPN9qGQMt0P5f6rXaxl4f
 30TSIiNpPrRIGCtU7cw==
X-Proofpoint-GUID: Renxk0w6EYELeC52uwNLmNtgaqMRG0OP
X-Proofpoint-ORIG-GUID: Renxk0w6EYELeC52uwNLmNtgaqMRG0OP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127041

From: Yi Zhao <yi.zhao@windriver.com>

Use SOURCE_DATE_EPOCH to set MAKE_STAMP instead of using the current
time, thereby improving reproducibility.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a3b407c9821509388fd4abd10b9f4c9fbf28cdaf)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 ...URCE_DATE_EPOCH-for-build-time-stamp.patch | 41 +++++++++++++++++++
 .../recipes-filter/nftables/nftables_1.1.6.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch b/meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch
new file mode 100644
index 0000000000..f52ff28b21
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch
@@ -0,0 +1,41 @@
+From fde27e62b241fb7d96de36a2fd6d7879c24f5de6 Mon Sep 17 00:00:00 2001
+From: Jeremy Sowden <jeremy@azazel.net>
+Date: Wed, 28 Jan 2026 18:31:07 +0000
+Subject: [PATCH] build: support `SOURCE_DATE_EPOCH` for build time-stamp
+
+In order to support reproducible builds, set the build time-stamp to the value
+of the environment variable, `SOURCE_DATE_EPOCH`, if set, and fall back to
+calling `date`, otherwise.
+
+Link: https://reproducible-builds.org/docs/source-date-epoch/
+Fixes: 64c07e38f049 ("table: Embed creating nft version into userdata")
+Reported-by: Arnout Engelen <arnout@bzzt.net>
+Closes: https://github.com/NixOS/nixpkgs/issues/478048
+Suggested-by: Philipp Bartsch <phil@grmr.de>
+Signed-off-by: Jeremy Sowden <jeremy@azazel.net>
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+
+Upstream-Status: Backport [https://git.netfilter.org/nftables/commit/?id=ca86f206c92704170a295b8dc7a41f6448835dde]
+[Adjust patch for 1.1.6]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6825474..527049f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -165,7 +165,7 @@ AC_CONFIG_COMMANDS([nftversion.h], [
+ ])
+ # Current date should be fetched exactly once per build,
+ # so have 'make' call date and pass the value to every 'gcc' call
+-AC_SUBST([MAKE_STAMP], ["\$(shell date +%s)"])
++AC_SUBST([MAKE_STAMP], ["${SOURCE_DATE_EPOCH:-$(date +%s)}"])
+ 
+ AC_ARG_ENABLE([distcheck],
+ 	      AS_HELP_STRING([--enable-distcheck], [Build for distcheck]),
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
index d27e60a18d..cc57db3c81 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
@@ -12,6 +12,7 @@ DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
+           file://0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
-- 
2.53.0


