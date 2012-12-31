Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TpjEF-0005xA-K1
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Dec 2012 18:32:54 +0100
Received: by mail-ee0-f42.google.com with SMTP id c41so6156727eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Dec 2012 09:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=8sV7antA+ArM6/c9yjDtWCHiXXemZLmqHCYxlqfmV3A=;
	b=vIfJydJkVnw3QWA36Sqrvz7l4wcYOoM2DmQGP2XVV0Bd1ncXTlA5Q7E0CH5WQVjfFK
	cAWhwl2HthGaSFJ5Avfl6nKOOTRtcMb0tO02tPVNeZAGhQcQFn725ol8RTCWyxWwlbKy
	pvHcIpQ9k+08z8lGbB+MtSwOp64Z5/YHBezV6bE5u/Na6TesRf50Xugny/A2tcRCFwL7
	YvcvzRiLY1LWy8a/sD7Na3cknhyBBHmPuwZq1U2CDr03lb11+HPdU+VRO1v7q1HX0T88
	5O89DeWDwxmnyJwi+RWBnR0IbzERt9heMWRkWdpQGDwx1U+ygy1PQIy1APscDffTtUY+
	c8dQ==
X-Received: by 10.14.223.135 with SMTP id v7mr112191234eep.41.1356974268047;
	Mon, 31 Dec 2012 09:17:48 -0800 (PST)
Received: from localhost.localdomain (p5B0A1BD4.dip.t-dialin.net.
	[91.10.27.212])
	by mx.google.com with ESMTPS id 46sm86204729eeg.4.2012.12.31.09.17.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Dec 2012 09:17:47 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Dec 2012 18:17:21 +0100
Message-Id: <1356974245-3497-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 06/10] mousepad: initial add 0.3.0
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
X-List-Received-Date: Mon, 31 Dec 2012 17:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
new file mode 100644
index 0000000..9028ec2
--- /dev/null
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "A simple text editor for Xfce"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "gtk+ dbus-glib"
+
+inherit xfce-app
+
+SRC_URI[md5sum] = "dcfcdfaa8a19c89f35d5f6f64753e6e1"
+SRC_URI[sha256sum] = "10f27506994d0d0b8f9e02555404a144babedab97517abe3b6be8b2d21ff046d"
-- 
1.7.4.4



