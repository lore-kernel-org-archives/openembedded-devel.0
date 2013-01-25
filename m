Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tyi36-00035O-8g
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 13:06:24 +0100
Received: by mail-ee0-f48.google.com with SMTP id t10so149312eei.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 03:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=+5BlsrxXidBgDOKyemvEBLxNXF3Hl7XsrbmyMq1yzyg=;
	b=0N0/yldnsY+kcq62Z+a5LrkifDLY0VIX3nmkwbZbv7jHW/0HcJAUCIxpx1ErEWT6ev
	FnRPE25UQ+LFXBtjPTx0VySVOuDPhJw1RQjcGJpAJX4vc1StydCniKa5fdwFDkmbAShJ
	+p9MlkBjuc8zFbNnf9tRILFMFNjWCpwULxCz9d4zNb2nmFu6ntkTKN4A7Fq2Z2AGbdWi
	SCw0oWrrfiBWCPIYQgQUP1qTz3LfDpFh6PKdAtlylulWAnKQmM57ddoocOE+JSP2HmAZ
	gf7N7RWTtqA3xxCw03ZCmVyL/J5J9Qz/pWB88uQ49XMkbR3Js2FWF/ce9URXVvwGWJPO
	Avfw==
X-Received: by 10.14.177.1 with SMTP id c1mr17338109eem.8.1359114650439;
	Fri, 25 Jan 2013 03:50:50 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id f6sm1244955eeo.7.2013.01.25.03.50.49
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 03:50:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 12:48:55 +0100
Message-Id: <1359114536-3823-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd 4/5] geany: initial add 1.22
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
X-List-Received-Date: Fri, 25 Jan 2013 12:06:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/geany_1.22.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/geany/geany_1.22.bb

diff --git a/meta-oe/recipes-devtools/geany/geany_1.22.bb b/meta-oe/recipes-devtools/geany/geany_1.22.bb
new file mode 100644
index 0000000..1e56ec8
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany_1.22.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "A fast and lightweight IDE"
+HOMEPAGE = "http://www.geany.org/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+DEPENDS = "gtk+"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://download.geany.org/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "0672077fe83e2a739aa0eaca426aacf0"
+SRC_URI[sha256sum] = "901a35a7395ef10a80fb10b3ab63bae3871693a4e82d56388e9521a27877577e"
+
+FILES_${PN} += "${datadir}/icons"
-- 
1.7.6.5



