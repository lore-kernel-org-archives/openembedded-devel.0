Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B937C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 09:50:20 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.3450.1662630614681839993
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 02:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=X7P/acRQ;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=L0oMHKWn7k8jPV5xiHG50SeCVtvfbZ/5Y1oiZfc9l5g=; b=X7P/acRQPfM37pQKASbh1snWlI
	G2zSFt1NLNYuFU65wgJoBI5vj5ah2dqmrFJxWY2x6IGIxplRDYSEUomLs3sOybGGzroX/H3EiRfia
	vxVzqpnQH0Zfxzc+mVUkwa1N2IRSGxpJTwIhn+nJ9oIW2Wf/zMeUkLuahLs9Agis03iIR+yVWwHTj
	NkZSoKr5KNF/tzqDmmA+kBor+hZ4Cjs/zSkzVVVbRxwzkU/YZxaCltxa6kV+IyNRTMKTo0LwEiUql
	AOxGVl2KdnO/WehVmlHF0a98qPB3akowMig9Evl999HsOoyjr1VHeA9/mWH1PdDRhijnYsj/iHVX4
	AadHF6pw==;
Received: from lan.nucleusys.com ([92.247.61.126]:39282 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oWEBD-000B0Z-0N;
	Thu, 08 Sep 2022 12:50:13 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-astroid: Upgrade 2.12.5 -> 2.12.9
Date: Thu,  8 Sep 2022 12:49:51 +0300
Message-Id: <20220908094951.594032-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220908094951.594032-1-leon.anavi@konsulko.com>
References: <20220908094951.594032-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Sep 2022 09:50:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98719

Upgrade to release 2.12.9:

- Fixed creation of the ``__init__`` of ``dataclassess`` with
  multiple inheritance.
- Fixed a crash on ``namedtuples`` that use ``typename`` to specify
  their name.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.12.5.bb => python3-astroid_2.12.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.12.5.bb => python3-astroid_2.12.9.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.12.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.12.9.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.12.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.12.9.bb
index af2f51858..4fb29709a 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.12.5.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.12.9.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "396c88d0a58d7f8daadf730b2ce90838bf338c6752558db719ec6f99c18ec20e"
+SRC_URI[sha256sum] = "0dafbfcf4ebdecd3c8f6d742c9d9c88508229ca823d5c98ab872d964f3321e56"
 
 inherit pypi setuptools3
 
-- 
2.30.2


