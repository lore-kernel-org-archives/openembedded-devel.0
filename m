Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S3FHe-0006NQ-Lx
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2012 00:19:38 +0100
Received: by eekc1 with SMTP id c1so354437eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2012 15:11:08 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.213.7.13 as permitted sender)
	client-ip=10.213.7.13; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.213.7.13 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.213.7.13])
	by 10.213.7.13 with SMTP id b13mr852915ebb.89.1330643468540 (num_hops =
	1); Thu, 01 Mar 2012 15:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=9y3q5sDD554C9TYK4ovksGVUBUxZSt+Dmv7si4nfqr4=;
	b=c9qJZN3V9r95ZQWEmmVJqYO/weoe/1zUStJYpvD7+eLxwnfrION7HBCQxQD27Tjhy2
	ZXAYYaeumB4JO+Nnn2tTwIA6LKOTqLgMWXNW5zRrb330hCvb4CnGCC40x2ZMMAzcI9w7
	Z2b8s01Hn0+P8RCKadQ6ASCfUVeG2fz2NWwivJA1QGLQEnOTR5BAiLKmCewTF02tyTFx
	MmTaJx1E9P4zy0z72hTjgwbtOf/CDm06uVC04NJyilOJjEDsWEnbXy4mt7VTC9xtYJiL
	JZ5p2yCBV6vWduJS7tYSgQTNSJS6VUDqfii1tW5phvb66juWI/oqA9OVH2NOd58HqOPn
	/DMQ==
Received: by 10.213.7.13 with SMTP id b13mr644938ebb.89.1330643468266;
	Thu, 01 Mar 2012 15:11:08 -0800 (PST)
Received: from localhost.localdomain (p5B0A0FC0.dip.t-dialin.net.
	[91.10.15.192])
	by mx.google.com with ESMTPS id y14sm12713178eef.10.2012.03.01.15.11.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 15:11:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2012 00:14:22 +0100
Message-Id: <1330643662-23516-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe] pango: disable introspection
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
X-List-Received-Date: Thu, 01 Mar 2012 23:19:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

meta-oe's pango.inc inherited gnome.bbclass which disables
gobject-introspection

error was:
| /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
| /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
| error parsing file Pango-1.0.gir: Failed to parse included gir GLib-2.0
| make[4]: *** [Pango-1.0.typelib] Error 1

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
index 65c4028..b14430f 100644
--- a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
+++ b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
@@ -10,5 +10,6 @@ SRC_URI[archive.sha256sum] = "f15deecaecf1e9dcb7db0e4947d12b5bcff112586434f8d30a
 
 SRC_URI += "file://no-tests.patch"
 
-PR = "r3"
+PR = "r4"
 
+EXTRA_OECONF += "--disable-introspection"
-- 
1.7.4.4



