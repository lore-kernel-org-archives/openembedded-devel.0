Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10854.1612366710645233292
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 07:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46228 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l7KEf-0007tX-3F; Wed, 03 Feb 2021 17:38:29 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-graphviz: Upgrade 0.14.2 -> 0.16
Date: Wed,  3 Feb 2021 17:38:20 +0200
Message-Id: <20210203153822.25077-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210203153822.25077-1-leon.anavi@konsulko.com>
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16:

- Add ``.unflatten()`` method to ``Graph``, ``Digraph``, and
  ``Source``. Add standalone ``unflatten()``.
- Make ``Source.__str__()`` return the ``.source`` instead of the
  ``repr()`` (like ``Graph`` and ``Digraph``).
- Render with ``dot -K<engine> ...`` instead of ``<engine> ...``
  internally.
- Add documentation hint to archived upstream version for Windows.
- Re-render most documentation graphs with Graphviz 2.44.1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-graphviz_0.14.2.bb => python3-graphviz_0.16.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.14.2.bb => python3-graphviz_0.16.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.16.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.16.bb
index 0de4c8f40..1af657098 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.16.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f"
 
-SRC_URI[md5sum] = "7123efabb68270f579525df74bf8b0c9"
-SRC_URI[sha256sum] = "92b7637ece63c77e3d39221ae1f4df98e9256cb449e9860c598335b34496d195"
+SRC_URI[sha256sum] = "d2d25af1c199cad567ce4806f0449cb74eb30cf451fd7597251e1da099ac6e57"
 
 inherit pypi setuptools3
 
-- 
2.17.1

