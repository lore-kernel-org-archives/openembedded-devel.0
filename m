Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8Xts-0007Uc-A4
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 12:59:24 +0200
Received: by fxm20 with SMTP id 20so3050038fxm.12
	for <openembedded-devel@openembedded.org>;
	Mon, 25 May 2009 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=JWkdsogIMNuygW8zMYU6b0Gs78/VS0ICYC9P0hlc5p8=;
	b=CIo4PPBo9fYvqNOLNP82IsObgHeXFEa30XJPh5xlcu1nnS+hgHNwtYtx+N6ZZGYeZX
	LtSwrIFU7ER2pa8ggZgkvxlU9D0ufWNHBF8UURITg7nqopWgri2xCh6TssRkPvVh85O9
	Pv3hr8X0pi6tiH+bXFhKIoYmb8NsAZYJdZEvU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=G4G/JKQSKu4xHZ8O6LarduJRRRhDvYI7L+Fe6u5mTeDX8E/or6RtSvapq/bu/GeTFl
	X10S9F8d3WscA/vBBvgIN/c5FZa+s38iu04MdB7FIshNFWeMajlEH37RleRbpOg+S5FO
	hxjmuRLKDCpHZ+yrJUl1xfKs/wQQjm8Kc543E=
Received: by 10.103.1.5 with SMTP id d5mr3561860mui.113.1243248683149;
	Mon, 25 May 2009 03:51:23 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id y2sm14998575mug.13.2009.05.25.03.51.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 25 May 2009 03:51:22 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@openembedded.org
Date: Mon, 25 May 2009 13:51:19 +0300
Message-Id: <1243248679-28230-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243248515-28181-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1243248515-28181-1-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH] udev: include udev-utils into udev rootfs
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
X-List-Received-Date: Mon, 25 May 2009 10:59:25 -0000

The reason for the move is that udevadm binary is executed from udev
init.d script.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/udev/udev_141.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index 7e26798..068d23c 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -6,7 +6,10 @@ LICENSE = "GPL"
 # Untested
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r7"
+PR = "r8"
+
+# needed for init.d script
+RDEPENDS_udev += "udev-utils"
 
 SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://mount.blacklist \
-- 
1.6.3.1



