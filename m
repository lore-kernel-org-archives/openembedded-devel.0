Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17f-00005o-J9
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:51 +0200
Received: by mail-ee0-f54.google.com with SMTP id e50so3446442eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=0RqyJcwAX82nDlHjWZ33XPwlfuxYv/ZOTPVxwnwvNVQ=;
	b=KATW1PzrEC5wn1aLW4CJ0q58z4G6STge+S+KL9Wwwo1aB3e29FMEeOlhicsAwMqSHL
	OwT9lhKz6qbJovuqB7JayfeFMbZOZ/WP4UInMl2XzXSqk/qhSXJqyFTpjzLE+XJQV/jS
	nTbUGQZlN/xXkG2x5+RVo5ikbiRba27RvbiBLxEUM4HqND9HQQMNAO5z5sMH0B+uC+nu
	fnA+hO5ihrVg6osLDE8eCjNzlZbDoUnqn1vvJjp4XITK/vMZsVjeycPJWUMItp6palmQ
	JysTtW+/IH+T6xdyy8vgMRsWwxIq2FEz5pM9+oi3FmYZc5FAE0bhxrEeinWov49GjcuA
	gfxA==
X-Received: by 10.14.172.195 with SMTP id t43mr10867645eel.34.1368959253324;
	Sun, 19 May 2013 03:27:33 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:09 +0200
Message-Id: <1368959233-28288-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe++/master 07/11] atkmm: initial add 2.22.7
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
X-List-Received-Date: Sun, 19 May 2013 10:45:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it is required for the update of gtkmm in the following patch

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb b/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
new file mode 100644
index 0000000..35ba589
--- /dev/null
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "C++ bindings for the atk"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "atk"
+
+inherit gnome autotools pkgconfig
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI[archive.md5sum] = "fec7db3fc47ba2e0c95d130ec865a236"
+SRC_URI[archive.sha256sum] = "bfbf846b409b4c5eb3a52fa32a13d86936021969406b3dcafd4dd05abd70f91b"
+
+EXTRA_OECONF = " --disable-documentation "
+
+FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
1.7.4.4



