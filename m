Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi77-00040y-D2
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:20:01 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926936eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tCetdDK2sDayQmje5aSP/wiOAU6UCJpJlTh3d15vyvo=;
	b=GStRSjXr0Y6DWZMLWyoDLiEiuLKRjfp0340NXWj6RsxktzpQACGOvpHK5F5kbL4o7i
	RbzRw09BdBgwjKssxk5EzOJPqHNGp7ntkw0iWSDJKMrezv5ko/saehWioz6KKrHJnt7e
	eyyHwuBXgch/elXVeGXBHN+hL6qfN4QiGdRIYFPGpklAh9wWMMzdjLfLSgXrWgWIKlGv
	qW4eA1ijy7NWVc8N4bMZo8ZyhHlkBxVPYDtA9kvzxItuZepHfkbWx+JDHUmfkRXTfMNj
	eQSf+jtdDxkwdDBGDVtUy16isyfnxXYoe9Hx6LOYFd8UhlzA+TWwBHQjAKCOa1WwuQpg
	8YsA==
Received: by 10.14.221.5 with SMTP id q5mr42294489eep.33.1354586741813;
	Mon, 03 Dec 2012 18:05:41 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm34819334eeg.4.2012.12.03.18.05.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:05:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:17 +0100
Message-Id: <1b238f2dbf90c01922839e02c7eee4daa3132f67.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 44/58] pcsc-lite: add bbappend in meta-systemd
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
X-List-Received-Date: Tue, 04 Dec 2012 02:20:01 -0000

* fixes packaging QA warning, when systemd is autodetected:
pcsc-lite-1.8.6: pcsc-lite: Files/directories were installed but not shipped
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/pcscd.service
  /lib/systemd/system/pcscd.socket

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend      | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend

diff --git a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
new file mode 100644
index 0000000..b8150b7
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
@@ -0,0 +1,6 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "pcscd.socket"
-- 
1.8.0



