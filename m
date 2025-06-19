Return-Path: <chaitanya.vadrevu@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A37C7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 21:40:17 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.web10.581.1750369216077190220
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 14:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=zIG95HO+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.142.35, mailfrom: prvs=526545cf67=chaitanya.vadrevu@emerson.com)
Received: from pps.filterd (m0144092.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JL7rlG003053
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 21:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=email; bh=ciag1ytYmU0DDMB37fCKDnIeph
	U9zG62XxY/JSCHEe8=; b=zIG95HO+bHzZ/2Vzr5LMOPvjJZeiRBXj+9TO3mnpJc
	7yIDkRK4nQM9VLck6lkJ9neYcmmOYDjdRG3lsAD7S0RX9yUbOUS1jaS20aoGVhYl
	MQMtDT8Uj5rYY83POvmHHJhCgmHkz7qtEQXABiZRT105yWG9yl0vQK6+PydhnJ9F
	rQKXoaCgKucTX/kk58m4hgA9v3dMTrJQA2IMJMLXrZmIBmL/PuSdu1pAPD5lYds6
	mDCR+JIRUo2cTub0H6qkOGIZ1HTzWowi5hOGVaQxXYVNut7/I/Pf1dLxx37iQlgp
	YFA06OpVCebkJeDzjwDlkhqGsi8IiV+p4KpezsUjqzxQ==
Received: from us-aus-excas-p1.ni.corp.natinst.com ([130.164.94.73])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 47ct6agb10-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 21:40:15 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 19 Jun 2025 16:40:13 -0500
Received: from cvadrevu-p620.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 19 Jun 2025 16:40:13
 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>
Subject: [meta-networking][PATCH] samba: Run populate-volatile.sh update in postinst
Date: Thu, 19 Jun 2025 16:39:48 -0500
Message-ID: <20250619213948.706294-1-chaitanya.vadrevu@emerson.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BvHpQESxRsdsPl_6sp9zraB5KXhBMHmx
X-Proofpoint-ORIG-GUID: BvHpQESxRsdsPl_6sp9zraB5KXhBMHmx
X-Authority-Analysis: v=2.4 cv=cb7SrmDM c=1 sm=1 tr=0 ts=685483bf cx=c_pps a=cVKeW2pxJVqlUTLH3Z+MUA==:117 a=cVKeW2pxJVqlUTLH3Z+MUA==:17 a=6IFa9wvqVegA:10 a=geDs06hvAAAA:8 a=lsdzrKVcxtB7gVYWMOAA:9 a=7yvi0DHx91fDKfvzWsLo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE3NyBTYWx0ZWRfX+G3crtAiv1xh DRrM/Wkm0rHOj+UnWcMwKhlGmNrsS7R4KGrseWTnNsQUPcvQEExr+vR8UhsRg8AAqVQP7e09G80 E70lu4klIJ1nWgZb56bJYBZvn2HSH2NL4zZlk5J7zgY7jcPjuahKuAWE9S3WQdUmAiYQGSg4/9J
 PKQrsORxPBKFoEtoF2JVf5PkOk+KcmwKv2KDxqzgbrHulwI0bAoupD2B9I8G0mbvgU6MDfokDnf DDwPtBsAFepEKUMerkH0HS83BPsCI57Nl+hF5O5fWWRQT28tWOtRlTJi252e3k3pwgq5Fcuj9DJ FchMaJkjeZYN2yf8R+qkxaC6wBTAlCyRVA+2f+gTe/IvOKhtlrjtZHdHXyTIpsjQLsDZswm9KTh
 ldS4gb1EIjgmX7cVYQ/nVrzWtN5/KNlHA5vrhUVNsDQTI2oa61sEFXWJAN5xYQBiQA8y9jLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_07,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190177
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 21:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117957

samba-common installs a volatiles configuration file but had not been
calling populate-volatile.sh to apply the configuration. This causes
samba installation to fail on a running target due to missing
directories.

Call "populate-volatile.sh update" in samba-common's postinst which
creates the required directories and enables samba to work.

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.19.8.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
index 0ec0051c43..0213d131e5 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
@@ -354,4 +354,10 @@ RDEPENDS:${PN}-test = "\
     ${PN}-testsuite \
     "
 
+pkg_postinst:${PN}-common() {
+    if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+        ${sysconfdir}/init.d/populate-volatile.sh update
+    fi
+}
+
 ALLOW_EMPTY:${PN}-test = "1"
-- 
2.43.0


