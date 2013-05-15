Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdps-0006mI-3E
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:53 +0200
Received: by mail-ee0-f52.google.com with SMTP id c13so1073728eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Ksn3T677zTG2zHlNxvG37/IqdvHuunPp1v+tSbmlM1Q=;
	b=Zof9KXwRBnY0m1wDqNA4SKRdJW7CARp0la29HhvN8Fbm1CJb9SUb7hLfZLHZWk2jVY
	WvX83w/zIG7UYlrA0jKqmChv4cTBBLmY6gchQ/+7fHOw52EYVjwG8rBwf8erz8Qn25qU
	CmyAhyDTstDJ6gCF8x/aMA/+5KY8fcs8pwrpzjz+nH4uI6En9zgGt4An2URq3x8h6Bh7
	Zx1FDf/fewRA0WyD4jcsVitY3OCKUVI07AoOo7ppFmU+lnqOzRWISistevhjzV7Lgj5W
	Rw9+noW4R2fKjfEj7ubaidrfUkQ4MrZcT/A+4XOxIurcbdz2yRnZZVl3lqHw8joGAID5
	eKJw==
X-Received: by 10.14.69.138 with SMTP id n10mr104302224eed.32.1368631415527;
	Wed, 15 May 2013 08:23:35 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:50 +0200
Message-Id: <1368631259-13401-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 05/14] thunar-media-tags-plugin: initial add 0.2.1
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
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../media-tags/thunar-media-tags-plugin_0.2.1.bb   |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb

diff --git a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb
new file mode 100644
index 0000000..3fb250c
--- /dev/null
+++ b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Adds ID3/OGG tag support to the Thunar bulk rename dialog"
+HOMEPAGE = "http://thunar.xfce.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit thunar-plugin
+
+DEPENDS += "taglib"
+
+SRC_URI[md5sum] = "0106e900714f86ccbafdc72238d3cf8d"
+SRC_URI[sha256sum] = "056d012a10403ee3e2e55b6ff2faecb796821de9ebee000315589b95d95ed253"
-- 
1.7.6.5



