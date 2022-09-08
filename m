Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291CEECAAD5
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 09:50:20 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.3448.1662630613420164812
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 02:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=fCCHx1D5;
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
	bh=TVcLVwfv304noLEx8nUuFsJZ3wZ99BpqiHJdgSH2txA=; b=fCCHx1D59INKud9zqBoKkP2tz7
	VmFxDtaVfPPwZ9K8vufcfsA3quvfS/OukOOYKSNOcEb41iH/kwfmrVsKb9t3bBIkEsOCFjgZ7Apgy
	oDDVOWyheR3l7jeUsn1r86R6Ii0pU/CUhCcIGSE+kUEtmbkXcvTB5rZM0EXG7lrl804ZX1uu6NLK+
	q6rO0YfT00CokIaSlYekwK7u0qCs9mUV55fhYuiS25DXeEVVRVsQjJvhuJy9TIctW+Ur3SO+VmK3l
	FmCapfjn+eE3UYs0CCUGbY7fDtgHzldyBB2ZiMuKBr214ETnQ8CiXLZdcZwQzTRLqJOeGQ+lVfttr
	GlTOiBNQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:39282 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oWEB8-000B0Z-3W;
	Thu, 08 Sep 2022 12:50:11 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-transitions: Upgrade 0.8.11 -> 0.9.0
Date: Thu,  8 Sep 2022 12:49:50 +0300
Message-Id: <20220908094951.594032-2-leon.anavi@konsulko.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98718

Upgrade to release 0.9.0:

- Removed legacy implementation of HierarchicalMachine from the
  package
- Fix active state styling in GraphMachine
- Fix issues related to scopes and queueing in HierachicalMachine
- Reflexive transitions (dest: '=') had not been resolved correctly
  when source was a wildcard
- HSM did not detect reflexive transitions if src was a parent
  state
- Fix implicit fallback to graphviz when pygraphviz was not
  installed
- Fix on_timeout callback resolution when timeout had been
  initialized with timeout=0
- Last label in GraphSupport was not correctly aligned when
  show_attributes=True
- Feature: Add pyi stub files for better type hinting. Since many
  functions and constructors allow rather arbitrary arguments time
  will tell whether typing should be strict (and cause more mypy
  issues) or more relaxed (and thus less precise).
- Reviewed and improved method documentation
- Add may transition check to transitions
- Refactored error handling to be able to handle MachineError in
  on_exception callbacks
- Add mypy to test workflow
- Add Retry state to supported state stereotypes
- Machine._identify_callback has been converted to instance method
  from class method
- LockedMachine._get_qualified_state_name has been converted to
  instance method from static method
- Removed _super workaround related to dill

License-Update: File changes, the licese remains the same MIT

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-transitions_0.8.11.bb => python3-transitions_0.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.11.bb => python3-transitions_0.9.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb b/meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb
index 14189424a..980351bf1 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A lightweight, object-oriented Python state machine implementation with many extensions."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7b20d32906ea4d60ee6f6c1f5dc9c9f178802425c5b155213eb0f25c277f04e4"
+SRC_URI[sha256sum] = "2f54d11bdb225779d7e729011e93a9fb717668ce3dc65f8d4f5a5d7ba2f48e10"
 
 RDEPENDS:${PN} += "python3-six python3-logging"
-- 
2.30.2


