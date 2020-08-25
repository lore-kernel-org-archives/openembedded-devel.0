Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10321.1598349262206433878
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 02:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54770 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAVel-0003Eu-T7; Tue, 25 Aug 2020 12:54:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 3/3] mercurial: Upgrade 5.4 -> 5.5
Date: Tue, 25 Aug 2020 12:54:07 +0300
Message-Id: <20200825095407.18867-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825095407.18867-1-leon.anavi@konsulko.com>
References: <20200825095407.18867-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.5:

- clonebundles can be annotated with the expected memory
  requirements using the REQUIREDRAM option. This allows clients
  to skip bundles created with large zstd windows and fallback
  to larger, but less demanding bundles.
- The phabricator extension now provides more functionality of the
  arcanist CLI like changing the status of a differential.
- Phases processing is much faster, especially for repositories
  with old non-public changesets.
- For the case when connected to a TTY, stdout was fixed to be
  line-buffered on Python 3
- Subversion sources of the convert extension were fixed to work
  on Python 3
- Subversion sources of the convert extension now interpret the
  encoding of URLs like Subversion.
- The empty changeset check of in-memory rebases was fixed to
  match that of normal rebases (and that of the commit command).
- The push command now checks the correct set of outgoing
  changesets for obsolete and unstable changesets. Previously, it
  could happen that the check prevented pushing changesets which
  were already on the server.

More details are available at:
https://www.mercurial-scm.org/wiki/Release5.5

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../mercurial/{mercurial_5.4.bb => mercurial_5.5.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_5.4.bb => mercurial_5.5.bb} (87%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_5.4.bb b/meta-oe/recipes-devtools/mercurial/mercurial_5.5.bb
similarity index 87%
rename from meta-oe/recipes-devtools/mercurial/mercurial_5.4.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_5.5.bb
index fa3c73451..7980960f1 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_5.4.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_5.5.bb
@@ -10,8 +10,8 @@ RDEPENDS_${PN} = "python3 python3-modules"
 inherit python3native
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[md5sum] = "0859029d0bb54bcf7c583c55680573cb"
-SRC_URI[sha256sum] = "1df8d1978aefcbb65dc51e3666a452583f47aeaf3c5682e4c00a3b23cd805d6a"
+SRC_URI[md5sum] = "17b21729cbc61dda80b2e3dfc046319f"
+SRC_URI[sha256sum] = "c1ed28e1534304a7a4981ed59905286d1c56acd5b75755eedd184171a4a782b4"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
-- 
2.17.1

