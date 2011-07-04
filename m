Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@mobil-400-586.intern.dresearch.de>)
	id 1Qdeje-0002JG-CF for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 10:42:31 +0200
X-Envelope-From: sledz@mobil-400-586.intern.dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(pd95cb174.dip0.t-ipconnect.de [217.92.177.116])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p648X2FP006568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 4 Jul 2011 10:33:02 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 3CA64C39B7; Mon,  4 Jul 2011 10:31:42 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jul 2011 10:31:19 +0200
Message-Id: <1309768279-4797-2-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1309454880.4401.32.camel@mattotaupa>
References: <1309454880.4401.32.camel@mattotaupa>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH v2 2/2] ppp-2.4.5: remove `DP = "-1"`
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jul 2011 08:42:31 -0000

Oe-core is using 2.4.5 and it works OK there.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/ppp/ppp_2.4.5.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/recipes/ppp/ppp_2.4.5.bb b/recipes/ppp/ppp_2.4.5.bb
index 883b695..faab816 100644
--- a/recipes/ppp/ppp_2.4.5.bb
+++ b/recipes/ppp/ppp_2.4.5.bb
@@ -3,9 +3,7 @@ DESCRIPTION = "Point-to-Point Protocol (PPP) daemon"
 HOMEPAGE = "http://samba.org/ppp/"
 DEPENDS = "libpcap"
 LICENSE = "BSD GPLv2"
-PR = "r2"
-# Not well tested
-DEFAULT_PREFERENCE = "-1"
+PR = "r3"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.3.4



