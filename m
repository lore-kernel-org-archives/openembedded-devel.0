Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8034.1617805943039898892
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 07:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lU9E7-0007iS-Up; Wed, 07 Apr 2021 17:32:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-transitions: Upgrade 0.8.7 -> 0.8.8
Date: Wed,  7 Apr 2021 17:32:03 +0300
Message-Id: <20210407143209.21813-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 0.8.8:

- AsyncMachine does not remove models when remove_models is called
- Introduce try/except for finalize callbacks in Machine and
  HierachicalMachine. Thus, errors occurring in finalize callbacks
  will be suppressed and only the original error will be raised.
- Show references in graphs and markup. Introduce
  MarkupMachine.format_references to tweak reference formatting
- Introduce Machine.on_exception to handle raised exceptions in
  callbacks
- Machine.get_triggers now supports State and Enum as arguments
- NestedState and HierachicalMachine.add_states now accept (lists
  of) states and enums as initial parameter

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-transitions_0.8.7.bb => python3-transitions_0.8.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.7.bb => python3-transitions_0.8.8.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.8.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.8.8.bb
index 04a033742..2b82df581 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.8.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8c60ec0828cd037820726283cad5d4d77a5e31514e058b51250420e9873e9bc7"
+SRC_URI[sha256sum] = "e7a86b31a161a76133f189b3ae9dad2755a80ea4c1e0eee1805648d021fb677d"
 
 RDEPENDS_${PN} += "python3-six"
-- 
2.17.1

