Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1121.1609970847768415096
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51612 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxGxd-0004lA-Ge; Thu, 07 Jan 2021 00:07:26 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-transitions: Upgrade 0.8.5 -> 0.8.6
Date: Thu,  7 Jan 2021 00:06:57 +0200
Message-Id: <20210106220702.10483-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106220702.10483-1-leon.anavi@konsulko.com>
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.6:

- HierarchicalMachine.add_states will raise a ValueError when an
  Enum name contains the currently used NestedState.separator.
- Bugfix: Reset NestedState._scope when enter/exit callbacks raise
  an exception
- Bugfix: Let HierarchicalMachine._get_trigger which is bound to
  model.trigger raise a MachineError for invalid events and
  AttributeError for unknown events
- Introduced HierarchicalMachine.has_trigger to determine whether
  an event is valid for an HSM
- Feature: AsyncMachine features an event queue dictionary for
  individual models when queued='model'
- Feature: Machine.remove_model will now also remove model events
  from the event queue when queued=True
- Feature: Machine.get_transitions and its HSM counterpart now
  accept Enum and State for source and dest

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-transitions_0.8.5.bb => python3-transitions_0.8.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.5.bb => python3-transitions_0.8.6.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
index 7f88bc1d22..701c82cda8 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A lightweight, object-oriented Python state machine implementation with many extensions."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e441c66a0c753d56c01c3e5e547f21dbe4a5569c939f12477475c5e81d79769b"
+SRC_URI[sha256sum] = "032e10113139852ffb3ecfa4c2a5138f87441d85c3d6ad9122bb4b0978180a8d"
 
 RDEPENDS_${PN} += "python3-six"
-- 
2.17.1

