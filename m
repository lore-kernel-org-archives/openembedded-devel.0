Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 4366C71BB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 08:55:26 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 01CFB22066D;
	Tue,  9 Oct 2018 10:55:26 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2018 10:55:21 +0200
Message-Id: <20181009085521.5771-2-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181009085521.5771-1-max+openembedded@blarg.de>
References: <20181009085521.5771-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 2/2] libmpdclient: make TCP support optional
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2018 08:55:26 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Allows more tinfication.  Without TCP, libmpdclient can only use local
sockets, which is a good choice anyway if MPD runs on the same
machine.

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/musicpd/libmpdclient_2.16.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb
index a51dc865b..455e76fcb 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb
@@ -11,6 +11,9 @@ SRC_URI = " \
 SRCREV = "4e8d990eb5239566ee948f1cd79b7248e008620a"
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ??= "tcp"
+PACKAGECONFIG[tcp] = "-Dtcp=true,-Dtcp=false"
+
 do_install_append() {
     # libmpdclient's Vala bindings are outdated and unmaintained; it
     # is likely that nobody will ever use them, so let's not install
-- 
2.19.1


