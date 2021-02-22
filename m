Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.96.1614016251637312363
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 09:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55530 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEFM8-0008OK-Lw; Mon, 22 Feb 2021 19:50:50 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-transitions: Upgrade 0.8.6 -> 0.8.7
Date: Mon, 22 Feb 2021 19:50:39 +0200
Message-Id: <20210222175043.21231-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.7:

- State configuration dictionaries passed to HierarchicalMachine
  can also use states as a keyword to define substates. If
  children and states are present, only children will be
  considered.
- HierarchicalMachine with custom separator now adds is_state
  partials for nested states (e.g. is_C.s3.a()) to models.
- Use model_attribute consistently in AsyncMachine
- Testing now treats most warnings as errors
- As a consequence, pygraphviz.Agraph in diagrams_pygraphviz are
  now copied by transitions since AGraph.copy as of version 1.6
  does not close temporary files appropriately
- HierarchicalMachine now checks whether state_cls, event_cls and
  transition_cls have been subclassed from nested base classes
  (e.g. NestedState) to prevent hard to debug inheritance errors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-transitions_0.8.6.bb => python3-transitions_0.8.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.6.bb => python3-transitions_0.8.7.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
index 701c82cda8..04a033742a 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "032e10113139852ffb3ecfa4c2a5138f87441d85c3d6ad9122bb4b0978180a8d"
+SRC_URI[sha256sum] = "8c60ec0828cd037820726283cad5d4d77a5e31514e058b51250420e9873e9bc7"
 
 RDEPENDS_${PN} += "python3-six"
-- 
2.17.1

