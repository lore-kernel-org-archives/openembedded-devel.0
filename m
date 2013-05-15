Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpq-0006ly-1b
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:53 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so1133801eei.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=fnZdcwQglzQS3rP3Sht9NJk693g/FWv9qCPsAa5LYKw=;
	b=hb+nYhDIL2WmNLo5cs7SyK/+a1pjZHiy0IDYxeiHZfg0tzP6qs51GU057huclZd0hK
	T8lH4LMb7a6F1tnV+5TeFR/grEKUmvkSU7szHyRIqGssW0V4JsOvaB7GC4sLKGRPoFLa
	iNBpscSkLNV0yIWCZIce1Zr5pde5SpnKoohCsCl8juCyXZ/Ni/mwY2sKXuM42P4lDelz
	gdEaWYVijTFIfwE3lsrdGFc+UCsZJuq4Trcel6Dw0FqJB794bgDv2w1FRZpAKYHYcKiv
	D5OYfOm5scZAaeQ6Hzveh7gsynTIu5KxK4YnuYSo2aPTvRg8xWCQbSLqoWOtITuJYXhO
	7kyQ==
X-Received: by 10.15.24.72 with SMTP id i48mr83637623eeu.37.1368631412959;
	Wed, 15 May 2013 08:23:32 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:48 +0200
Message-Id: <1368631259-13401-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 03/14] thunar-archive-plugin: initial add 0.3.1
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
 .../archive/thunar-archive-plugin_0.3.1.bb         |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.3.1.bb

diff --git a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.3.1.bb b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.3.1.bb
new file mode 100644
index 0000000..90ab6af
--- /dev/null
+++ b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.3.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Thunar Archive Plugin allows you to create and extract archive files using file context menus in Thunar"
+HOMEPAGE = "http://goodies.xfce.org/projects/thunar-plugins/thunar-archive-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
+
+inherit thunar-plugin
+
+SRC_URI[md5sum] = "425f4faaace6dc7a4716a35b7795463a"
+SRC_URI[sha256sum] = "9ad559b0c11308f6897ad56604e5a06dc8f369f649eb20120b2d3018ef5da54c"
+
+# install tap files in ${libdir}/thunar-archive-plugin
+EXTRA_OECONF += "--libexecdir=${libdir}"
-- 
1.7.6.5



