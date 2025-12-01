Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC7FD111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 07:05:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15819.1764572727612110408
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 23:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Xl/M43et;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4430a8f5e9=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B148Bl31096430
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 23:05:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5PCs4bjBHCpqXUZy8Sjg
	XLiIbhWKvZ831FUrh4L09hA=; b=Xl/M43etIWDycbt9dOGEfDq1b9pm3J9i7lOR
	1lRkgtHRmxOwZUXtgbnI8DLanv5tyX2WTgDKTWmi3xkK3Egzuxax0eoujoYwNS+e
	1iaBL3ZciuXvFkpAfbAphmkXwI1pY1NnlHtDmEbbH988FR2fbFNZgGCA2R8k5fzI
	0ZHN7RD5J7/KFjanfVJYStXFxsQna46MIDSlokZT4de6ZF7lJ47Hape81t1MEy4t
	dI9zE4VRM7kFYkvW9pl60fKQ1YBC4GDcxrqj7ue1IOoPPjXbEOqc5e0jrrQPnHSd
	siDtSqnmvMmQ5kly29Em9/VsvBo5EGjd/wzSr3AfIryFXov4DQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05hcd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 23:05:27 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 23:05:26 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 23:05:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 1/3] postfix: switch to libpcre2
Date: Mon, 1 Dec 2025 15:05:23 +0800
Message-ID: <20251201070525.362494-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UdJ1LA-RvSWLtxJePmvKrUIjpI7_29Fn
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692d3e37 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gmDo1nssAAAA:8 a=t7CeM3EgAAAA:8
 a=x2d_6KgAPg2oVtXtzm4A:9 a=Q2R_l_2dePAA:10 a=48Pn49hmi9gA:10
 a=DmCNEmdWNTAeIjfGWauO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: UdJ1LA-RvSWLtxJePmvKrUIjpI7_29Fn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1NiBTYWx0ZWRfXzDEvmQuOg8Wt
 6PiDtj1VB6yzsXN1spptq7pbled/IhDZOAkIzvKEui2e3wnnACioHlYgZcDy2OHjfqdya6lvNLj
 XW59qlbCrvtE6j2Y9lK4p6ay9dC2Ztj70d+H6Acn6DbIWQIl+Ap6pen9xlmqEVu7wOK6QsUL3+9
 oy5/V0m9/J7Z2A11etplapkCD233O59VbZNbP+1caelFfURnvnEtan+JgM8A1l5qkGvusptPHDG
 E4ib/wvCYkHT5aoiCttMP4bNzUx+614LUbPXLmsokp72vKTiOoznwO/Pi5chqG7hJDwA0US3V5+
 1n5iCtfmrs/lyXbtQy+bUQrhcBJLp75wPlH5wHfTmxjJQNH5Sd5eFJQfKrWqs/bWMTT1KOtkV8M
 ToLcJUmHD+4OV7h0wOjQHkYJIHSDWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 07:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122192

Postfix 3.7 and later supports pcre2 library [1]

[1] https://www.postfix.org/PCRE_README.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
index 8b3becda9f..02fe9df7ed 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
@@ -6,7 +6,7 @@ has a definite Sendmail-ish flavor, but the inside is completely different."
 
 HOMEPAGE = "http://www.postfix.org"
 SECTION = "mail"
-DEPENDS = "db icu libpcre libnsl2 m4-native openssl postfix-native \
+DEPENDS = "db icu libpcre2 libnsl2 m4-native openssl postfix-native \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
 "
@@ -80,8 +80,8 @@ export CCARGS-sasl:class-native = ""
 export AUXLIBS-sasl:class-native = ""
 
 # PCRE, TLS support default
-export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
-export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
+export CCARGS  = "${CFLAGS} -DHAS_PCRE=2 -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
+export AUXLIBS = "-lpcre2-8 -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
 export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
 
 # OPT,DEBUG is aready in CFLAGS
-- 
2.34.1


