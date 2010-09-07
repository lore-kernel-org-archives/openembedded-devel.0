Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OsvwX-0007LZ-6Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 13:03:09 +0200
Received: (qmail invoked by alias); 07 Sep 2010 11:01:45 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp030) with SMTP; 07 Sep 2010 13:01:45 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/PJ4EtDAfPN8+uVCBJ5pMGRSG1uI8P+C+j2myY/H
	Kw0i7X/q5i9DPi
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 7 Sep 2010 12:47:24 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201009071247.24747.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] clutter: the font display problem is worked around.
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
X-List-Received-Date: Tue, 07 Sep 2010 11:05:22 -0000
X-List-Received-Date: Tue, 07 Sep 2010 11:05:22 -0000
X-List-Received-Date: Tue, 07 Sep 2010 11:05:22 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

* see http://lists.clutter-project.org/pipermail/clutter-devel-list/2010-September/000071.html
  for more details

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../clutter/workaround-broken-mipmaps.patch        |   13 +++++++++++++
 recipes/clutter/clutter_1.2.12.bb                  |    1 +
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/clutter/clutter/workaround-broken-mipmaps.patch

diff --git a/recipes/clutter/clutter/workaround-broken-mipmaps.patch b/recipes/clutter/clutter/workaround-broken-mipmaps.patch
new file mode 100644
index 0000000..f2a2915
--- /dev/null
+++ b/recipes/clutter/clutter/workaround-broken-mipmaps.patch
@@ -0,0 +1,13 @@
+--- a/clutter/cogl/pango/cogl-pango-fontmap.c.old	2010-06-08 16:19:26.000000000 +0200
++++ b/clutter/cogl/pango/cogl-pango-fontmap.c	2010-09-06 14:26:07.000000000 +0200
+@@ -173,7 +173,9 @@
+ 
+   renderer = COGL_PANGO_RENDERER (cogl_pango_font_map_get_renderer (fm));
+ 
+-  _cogl_pango_renderer_set_use_mipmapping (renderer, value);
++  /* disable mipmaps until they are fixed */
++  /* _cogl_pango_renderer_set_use_mipmapping (renderer, value); */
++  _cogl_pango_renderer_set_use_mipmapping (renderer, FALSE);
+ }
+ 
+ /**
diff --git a/recipes/clutter/clutter_1.2.12.bb b/recipes/clutter/clutter_1.2.12.bb
index a454544..fd6247f 100644
--- a/recipes/clutter/clutter_1.2.12.bb
+++ b/recipes/clutter/clutter_1.2.12.bb
@@ -3,6 +3,7 @@ require clutter.inc
 PR = "${INC_PR}.1"
 
 SRC_URI = "http://source.clutter-project.org/sources/clutter/1.2/clutter-${PV}.tar.bz2 \
+           file://workaround-broken-mipmaps.patch \
            ${INC_SRC_URI} \
           "
 
-- 
1.5.3.4


