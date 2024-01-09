Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CF4C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 10:02:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13513.1704794556275303505
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 02:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ILLUiFKh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17388c6827=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4097wCjL015325;
	Tue, 9 Jan 2024 10:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/u4Ne
	lTS/ljs6u/2fpNiuDRQbGKq+h2t7AFrst19cmw=; b=ILLUiFKhFc8mxHUSRv7yk
	pMCXXZ8ViTy4unTouACC71fQJVKbrUvsX/EA2k5XELihRdk1QfCKuZYocYJ2j418
	Kh2Dpzx40ALsZF1p/2JSrsyo55YMQ/szVwYldFN1P1FUTgshzELO8v+VwFERSbMh
	0z6PtrlOYYDytxxspDmX08s5Jv5nsnA9LzmUFP/V/GDVOd+hs8CbLjKX2Yzk+83N
	xSq5eXyZJ+9jGxjazYls3tYNgGcEgecb9KBPJCHc5pAzvTasxE1I9waPn0Twvj70
	+o+i3cLy5VJD01Z11jLTZ+ENtDm3Q3Neoxpbb8kzGNaeTDnU9fGC1tk9bdLIeDbh
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vewu5b304-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 09 Jan 2024 10:02:34 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 02:03:06 -0800
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-aiohttp: upgrade 3.8.5 -> 3.8.6
Date: Tue, 9 Jan 2024 10:02:15 +0000
Message-ID: <20240109100215.3283074-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: wH29UJt3egDhAlyb5LuHQIe5k-xNa-qF
X-Proofpoint-ORIG-GUID: wH29UJt3egDhAlyb5LuHQIe5k-xNa-qF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401090080
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 10:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108185

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 3.8.5 & 3.8.6 contains the CVE-2023-47627 fix and other bugfixes.
https://github.com/aio-libs/aiohttp/security/advisories/GHSA-gfw2-4jvh-wgfg

Changelog:
----------
https://docs.aiohttp.org/en/stable/changes.html#id72

The git log --oneline v3.8.5..v3.8.6 shows:

996de262 (tag: v3.8.6) Release v3.8.6 (#7668)
8c128d4f [PR #7651/45f98b7d backport][3.8] Fix BadStatusLine message (#7666)
89b7df15 Allow lax response parsing on Py parser (#7663) (#7664)
d5c12ba8 [PR #7661/85713a48 backport][3.8] Update Python parser for RFCs 9110/9112 (#7662)
8a3977ac [PR #7272/b2a7983a backport][3.8] Fix Read The Docs config (#7650)
bcc416e5 [PR #7647/1303350e backport][3.8] Upgrade to llhttp 9.1.3 (#7648)
b30c0cd2 Remove chardet/charset-normalizer. (#7589)
5946c743 CookieJar - return 'best-match' and not LIFO (#7577) (#7588)
8c4ec62f [PR #7518/8bd42e74 backport][3.8] Fix GunicornWebWorker max_requests_jitter not work (#7519)
a0d234df Use lenient headers for response parser (#7490) (#7492)
f92b27b0 Update to LLHTTP 9 (#7485) (#7487)
8129d26f [PR #7480/1fb06bbc backport][3.8] Fix error pointer on linebreaks (#7482)
8d701c3d Fix PermissionError when loading .netrc (#7237) (#7378) (#7395)

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../{python3-aiohttp_3.8.5.bb => python3-aiohttp_3.8.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.5.bb => python3-aiohttp_3.8.6.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
index d04279ed97..f8ca9a4739 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "b9552ec52cc147dbf1944ac7ac98af7602e51ea2dcd076ed194ca3c0d1c7d0bc"
+SRC_URI[sha256sum] = "b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.40.0


