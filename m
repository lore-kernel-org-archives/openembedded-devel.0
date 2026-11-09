Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.742.1794204048810187934
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lY++ywTr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=R21Gc/v0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93K5Mt2936858
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 06:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tGSILjWj7yR
	cVZXT/c3PU74jbevMLRb8rhzGJVG5GZg=; b=lY++ywTrdwFsXZw4CvKyCbhKX34
	SQv91Pxg3NbzHCB+T8K9xU+BP68lk3CvgobS/F2hgtWA9MAppo5OLLlJyD7VhlSb
	Qh2PWYStH8nn3YCJ0AOWzL/dVK07ZOl52NilZnRytzDUTCmy6lhkIHH2AB0gdF5A
	RA0H14iTF4Lr2j4pLhctStgwLPgj4Jr+ZL1YCZEf9+JwBehG159fADR//GBhf8hY
	0uk8GPbZNTHvo8gyqpkpvn1wnGS/WC46h75xVN6QGJW7PTG1m1n/GUU/JMKxucEW
	WqbldjlkjbXHQAwWybzKrV63NpAljoXcWfcyTg7ESxzH4ygWvPEITB99UVg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagw09c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso853477eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204046; x=1794808846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tGSILjWj7yRcVZXT/c3PU74jbevMLRb8rhzGJVG5GZg=;
        b=R21Gc/v0w9K+09LN7Rw0x1VRC1UEGVyGOJnb+goxH3nXMBMAB8rJxpqf697DG2vZeF
         boxNa8m5tIx1OQfCMyEreuHtpPsJx6QDdVboVgrWYAdwUu7pQoV41n7F4yFw2Lo7KM1U
         TB80sXZxv619ABf+ge6N1mLvmkIvbNExZN3Zn4PcbL2TdTM3PNaGZVQm7Mxltqc9zk9A
         JjN/gFQosl5A7F/0DxJ3YLLwlA2ZYVNqTRlyeTQs/a4oQ78a1MElolSDtM7/P+qyLfJ2
         ElbkiZtsxPh7Dml/WZkvxH1SpAU77mXn1hwwMjJ5+3KvQlZI32fJ+a0cNpy49P/JYBeK
         1FzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204046; x=1794808846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tGSILjWj7yRcVZXT/c3PU74jbevMLRb8rhzGJVG5GZg=;
        b=C6S8cDhA48xyxAOR3U2qSAk4rkXGFDG1cyQXgchfhk56CnDwCwX8CZ5JrlBvUJf39q
         n0UFTNQHJA+pxpJfL8JQ/OoNmj3Ip7jHa5LnxbRYdO7UNJShGR9JwM8zbpbCFccIPK/Z
         y3zSmZeh/S8mHJA0ur10ZK9sMV6atv0eea6x6PwOk5YeJ3v6GtfJY2Si9jolbwU+OAN3
         n0RQ1msLlDAGgJ7vehCaPfye+Pv5T9NRShzHH43dXd3C/DGmwSE/NEGHPQtmiiAxswim
         +/4eFjBkpGzyQOr+xfxw1Juo27dItaPu7pdrtDSZokm+W3zL84IRd1zS32DRGxtjk39M
         PHVg==
X-Gm-Message-State: APuU4Z9vYXj974RC2zRGwvb/Y5KlgWNtE46NGLAdpJ8ktewdAFYUMULB
	gI1DgpXwxUXDx2PNFnjwSau1qUc731Ze4mLUfTjdqJE7ade7u+wH8cTrLVOKwC3VzAgZYpcIev0
	bxeSISkeZedROvNYWhdcQy3GsSuIomO3HlCyJfkT/98anf9RrIGtFCKnEeAvrKeXSSe1H/hbRVN
	xuVbpLWawTo7dZeZUpmi/c8w==
X-Gm-Gg: AYBFou3nAhDLfqTW75HK/C17DpXzHwNyp54HGWuN0jeYfLM7gWZA3cJRIzH0F5VVbZ4
	Eb6S/2DaOxAcq6DeS6bsu0zg8xjMtmpWzwSmTP7b9yzSXsfHBFUjMHw83TR+qyZU2OntshNuGEa
	MoiJ8UQncn06TtShHQfJK8bNADNdqhY/HunMO+moZQ1K/x6dccsdePXxrIm5rb7H03qQuRTTQLN
	HyGDadmw333bO0eVdgNFgrcnKLskmEzQc/yVYy7vvsS0W2dQLgJ5maCNsZ70uN0q5yxd8pHQWpr
	+kdR5E0XUInvEsDSAkeqGTsXDvmfXgPF0EtTCPSKyf6LrJCDDbIpvL7497bo7jAnz8kcNiNh/V0
	GLr23oswRt1sVTWnDxln6Xf0TYqQZqu7dEVRuu0x+QFZLtVo5EDU+K9nGczs0Y4LxGx+eC2ix74
	Q0ECs=
X-Received: by 2002:a05:7301:a0f:b0:35d:eafd:5737 with SMTP id 5a478bee46e88-372570da9b0mr6190483eec.22.1794204045789;
        Sun, 08 Nov 2026 22:00:45 -0800 (PST)
X-Received: by 2002:a05:7301:a0f:b0:35d:eafd:5737 with SMTP id 5a478bee46e88-372570da9b0mr6190449eec.22.1794204045089;
        Sun, 08 Nov 2026 22:00:45 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff17f5sm10819979eec.16.2026.11.08.22.00.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:00:44 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 07/10] libmspack: patch CVE-2026-110602
Date: Mon,  9 Nov 2026 11:30:27 +0530
Message-ID: <20261109060030.621745-7-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
References: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX+yUTyHptngSi
 0cUFPpu6mg2EkzSpLWmsJUxvl09Rq00Nkn8QbGd+PUFyymZg6DIYZDU/fEZH1HiKY8qUaVZSL/3
 5VFwmdegRYSSV1PqRtsU4xxYZVajoFXHyb6J/a9oWNuyEYIlJ+wYDi1uv5nPeGJGDu1uQN7tNOq
 +CHfZ1/ba4cj1zrD9u8aQULgARTje0rMRLZbA6YjlY8JA2G7Xnf4IBHO2Aut1+AXi6gUT4V9/H8
 lGq1Y39kNqP+ChuILaDK2448gDHu0SCJ/0bGzo0x7UpnMxm+5LeGtwbKr3MiAsyMG9br95bQv8+
 r4E2ucbmw7DfEA7djRz3KTonkjA2QYEls2a5qH4OyycBjRHWXdN8d+1YBsTNR8UJOlSoUrZqPe2
 6rL/xMn7hG18uxsILswdp3t6FuQnwX8DDETplh9exUTQFB+/3FB4fk3HQicAyDG38k5hpiLr7hY
 +lZsCCcL0ck9MmVxqhw==
X-Proofpoint-ORIG-GUID: YLKV2oCx6L0aJDdM7IYoqOpVmLvTaERJ
X-Proofpoint-GUID: YLKV2oCx6L0aJDdM7IYoqOpVmLvTaERJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX3p2EQxe4bhhN
 neaebXQ2+vq/Wij9/CwqSKjNqQsKwkYsmQAJnIXJ54rMizOZxQ2vUSqT95ggpn2rtYtsyQKZ9ac
 HPLY6lzMbT8XdLQDGBkT+JgYS3oE2nw=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af1618f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=vlfEKXvPAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=WU-XI_5Pccc1sne58FIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22 a=PnTDuSQR5rMvcWp5Oz0h:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132045
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-110602

(cherry picked from commit 94901e4ad41b2d45e1a28e92ceeda8ae74148081)

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ba17174e3975d3a02e6059871b925b7b80c8460f)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../libmspack/CVE-2026-110602.patch           | 41 +++++++++++++++++++
 .../cabextract/libmspack_0.11alpha.bb         |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch

diff --git a/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch b/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
new file mode 100644
index 0000000000..15d690945f
--- /dev/null
+++ b/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
@@ -0,0 +1,41 @@
+From aca3603bed20772fd86ce5b901005668cee835ad Mon Sep 17 00:00:00 2001
+From: Stuart Caie <kyzer@cabextract.org.uk>
+Date: Mon, 15 Jun 2026 16:33:33 +0000
+Subject: [PATCH] kwajd_read_headers(): initialise pointers before returning
+ any error
+
+CVE: CVE-2026-110602
+Upstream-Status: Backport [https://github.com/kyz/libmspack/commit/4d868504114346aa767d435fbb89a8b76603493f]
+
+Dropped changes for test and ChangeLog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ mspack/kwajd.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/mspack/kwajd.c b/mspack/kwajd.c
+index 30caa89..ede91dd 100644
+--- a/mspack/kwajd.c
++++ b/mspack/kwajd.c
+@@ -160,6 +160,11 @@ static int kwajd_read_headers(struct mspack_system *sys,
+     unsigned char buf[16];
+     int i;
+ 
++
++    /* initialise pointers */
++    hdr->filename = NULL;
++    hdr->extra    = NULL;
++
+     /* read in the header */
+     if (sys->read(fh, &buf[0], kwajh_SIZEOF) != kwajh_SIZEOF) {
+         return MSPACK_ERR_READ;
+@@ -177,8 +182,6 @@ static int kwajd_read_headers(struct mspack_system *sys,
+     hdr->data_offset  = EndGetI16(&buf[kwajh_DataOffset]);
+     hdr->headers      = EndGetI16(&buf[kwajh_Flags]);
+     hdr->length       = 0;
+-    hdr->filename     = NULL;
+-    hdr->extra        = NULL;
+     hdr->extra_length = 0;
+ 
+     /* optional headers */
diff --git a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
index 169a5f271b..c612e54e17 100644
--- a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
+++ b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
@@ -8,7 +8,9 @@ LICENSE = "LGPL-2.1-only"
 
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.tar.gz"
+SRC_URI = "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.tar.gz \
+           file://CVE-2026-110602.patch \
+"
 SRC_URI[sha256sum] = "70dd1fb2f0aecc36791b71a1e1840e62173079eadaa081192d1c323a0eeea21b"
 
 inherit autotools
-- 
2.55.0

