Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PsyEx-0003jt-IB
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 15:01:51 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A20011.dip0.t-ipconnect.de [87.162.0.17]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1PE0U0P018098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 25 Feb 2011 15:00:30 +0100
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 2909A37B29; Fri, 25 Feb 2011 15:00:30 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Feb 2011 15:00:20 +0100
Message-Id: <1298642420-14527-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4D67ABEB.5020509@dresearch.de>
References: <4D67ABEB.5020509@dresearch.de>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: [PATCH] libnl2: fix typo in fix-pktloc-dep-race.patch
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
X-List-Received-Date: Fri, 25 Feb 2011 14:01:51 -0000

bison -y -d  -o route/pktloc_syntax.c route/pktloc_syntax.y
make[1]: *** No rule to make target `route/pktloc_grammar.y', needed by `route/pktloc_grammar.c'.  Stop.

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/libnl/libnl2/fix-pktloc-dep-race.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libnl/libnl2/fix-pktloc-dep-race.patch b/recipes/libnl/libnl2/fix-pktloc-dep-race.patch
index 50acee4..c559717 100644
--- a/recipes/libnl/libnl2/fix-pktloc-dep-race.patch
+++ b/recipes/libnl/libnl2/fix-pktloc-dep-race.patch
@@ -16,7 +16,7 @@ Index: libnl-2.0/lib/Makefile.am
  # with --header-file=
 -route/pktloc_grammar.c: route/pktloc_grammar.l
 +route/pktloc_grammar.h: route/pktloc_grammar.c
-+route/pktloc_grammar.c: route/pktloc_grammar.y
++route/pktloc_grammar.c: route/pktloc_grammar.l
  	$(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
  
 +route/pktloc_syntax.h: route/pktloc_syntax.c
-- 
1.7.1



