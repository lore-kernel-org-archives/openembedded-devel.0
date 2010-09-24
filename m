Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1Oz8dm-0004uB-2v
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 15:48:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C33C38AC4B0;
	Fri, 24 Sep 2010 09:42:37 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08339-03; Fri, 24 Sep 2010 09:42:37 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 8411D8AC4AB; Fri, 24 Sep 2010 09:42:33 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id AFC678AC496;
	Fri, 24 Sep 2010 09:42:27 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id B63C55000E3; Fri, 24 Sep 2010 09:42:27 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 09:42:26 -0400
Message-Id: <1285335747-10346-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <4C9C9CE5.80404@mlbassoc.com>
References: <4C9C9CE5.80404@mlbassoc.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] gst-plugins-base 0.10.30: depend on gtk+
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
X-List-Received-Date: Fri, 24 Sep 2010 13:48:44 -0000
X-List-Received-Date: Fri, 24 Sep 2010 13:48:44 -0000

Some of the tests and examples require gtk.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/gstreamer/gst-plugins-base_0.10.30.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gstreamer/gst-plugins-base_0.10.30.bb b/recipes/gstreamer/gst-plugins-base_0.10.30.bb
index e4fb226..0826562 100644
--- a/recipes/gstreamer/gst-plugins-base_0.10.30.bb
+++ b/recipes/gstreamer/gst-plugins-base_0.10.30.bb
@@ -16,7 +16,7 @@ PROVIDES += "gst-plugins"
 # if alsa has been built and is present.  You will
 # not get an error if this is not present, just 
 # a missing alsa plugin
-DEPENDS += "udev cdparanoia pango libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv"
+DEPENDS += "udev cdparanoia pango libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv gtk+"
 
 # Needs a udev that enabled gudev, which isn't the default
 EXTRA_OECONF_append = " --with-gudev"
-- 
1.7.0.4



