Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1QcERl-0002no-Cq for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 12:26:09 +0200
X-Envelope-From: sledz@fensuse.internal.dresearch-fe.de
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p5UAMQYo027386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 30 Jun 2011 12:22:26 +0200
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id B17CD442EDE; Thu, 30 Jun 2011 12:22:25 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jun 2011 12:22:15 +0200
Message-Id: <1309429335-3762-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1309428937.2551.107.camel@phil-desktop>
References: <1309428937.2551.107.camel@phil-desktop>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: [PATCH] ppp: 2.4.5 seems to be ready for oe-dev too
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
X-List-Received-Date: Thu, 30 Jun 2011 10:26:09 -0000

Oe-core is using 2.4.5 and it works OK there.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/ppp/ppp_2.4.5.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/ppp/ppp_2.4.5.bb b/recipes/ppp/ppp_2.4.5.bb
index 2b6b6f7..86d5ae5 100644
--- a/recipes/ppp/ppp_2.4.5.bb
+++ b/recipes/ppp/ppp_2.4.5.bb
@@ -4,8 +4,6 @@ HOMEPAGE = "http://samba.org/ppp/"
 DEPENDS = "libpcap"
 LICENSE = "BSD GPLv2"
 PR = "r1"
-# Not well tested
-DEFAULT_PREFERENCE = "-1"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.6



