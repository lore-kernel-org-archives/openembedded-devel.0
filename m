Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpu-0006mS-0V
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:53 +0200
Received: by mail-ee0-f52.google.com with SMTP id c13so1134836eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ANIg+eak4Wc56ncmB3uShHywq1lfyvYJ7PCtY3yf/d0=;
	b=VlVFw/mIKE4f9qZhJHuubrmZoaTElRgN7YBM9eXWSEF/jX9LRG+26u2OrIyCBD8Te+
	gpdrr0s15i7qdxQtMDPNsEIi7iXgS1Q69LpuQFtRHzYHh1sMykst+zvspbPmuqOqfzrJ
	dxMXXeXgVThqu438IjdpRySNJ9WAQciMy/AMZOwcXQQbEg4Y69zSsMMzzAsCaS6hCKi9
	jcsaBpF5CvFYR1TGa07DPICGpOEK848T563orOT03EUqqc1Ra01b0sgG6qTOTPFmjcAF
	8yxHcsS1XNW599gttRybGVPHjd6Ah4XWXvJF9IPiDVkozVmdfoMEhvkx+5I+olGCqHUu
	SO+w==
X-Received: by 10.14.216.201 with SMTP id g49mr74332642eep.42.1368631416524;
	Wed, 15 May 2013 08:23:36 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:51 +0200
Message-Id: <1368631259-13401-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 06/14] packagegroup-xfce-extended: add thunar plugins
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
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-extended.bb    |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 7ee65f6..e2ed864 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -43,6 +43,9 @@ RRECOMMENDS_${PN} = " \
     xfce4-brightness-plugin \
     xfce4-closebutton-plugin \
     \
+    thunar-media-tags-plugin \
+    thunar-archive-plugin \
+    \
     xfce4-appfinder \
     xfce4-screenshooter \
     xfce4-power-manager \
-- 
1.7.6.5



