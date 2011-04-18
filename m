Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBlny-0007Fd-1u
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:35:42 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317697fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=CyluIq8nvFTBIPiUIqgX5FHtqrAyti8ZTwhXXEiQ6yU=;
	b=Zdx+E29fXaP1I35kkqqhrbYYlTtpkDsVoC96bygqesYtb39UDnND9RyBmvOTCZGpKf
	AGJcUFAjJ48bcAyOcMWpz/tkKJa3URzxezGUe3ftK1s9xqHumnpKe5rc5TUKYEmxiZrt
	Syj913eRMnXLwW0o0fh9lxyJrd8gQ9gran1AY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xmByaX+M+VG6sX+uqdVHn9q3/wUPjcqgWwxs8h4aK35T0/QiY+zJzKmMfA5BBtsHLI
	TQdLWQkpaUdfhZHqIm8rwyL1UQTyPk3heMO7G3WrvQ6SnELsYtltsSDy7iPjUi8IKAwD
	Fr8IJLVpF2/9ek4Zeok/V/mSGg3xQNdDllWjI=
Received: by 10.223.73.133 with SMTP id q5mr1613126faj.127.1303122804089;
	Mon, 18 Apr 2011 03:33:24 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j12sm1624179fax.9.2011.04.18.03.33.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:33:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:33:17 +0200
Message-Id: <3019cab01a6f6ec284f6e048b6edfb311099abc7.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/13] libusb1: add native and nativesdk BBCLASSEXTEND
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
X-List-Received-Date: Mon, 18 Apr 2011 10:35:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/libusb/libusb1_1.0.8.bbappend  |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend

diff --git a/meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend b/meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend
new file mode 100644
index 0000000..608377e
--- /dev/null
+++ b/meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5.rc1



