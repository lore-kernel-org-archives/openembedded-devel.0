Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Em-0007i3-5L
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 18:59:26 +0100
Received: by mail-we0-f175.google.com with SMTP id t11so1371371wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=e8ZEWYoOZ3WlPAlXi6JhfW0JVxjWDPBxRQhxsMnlJOU=;
	b=VLl1/6ZzkmUybRDIUSRY1IE5HSrc0yrHBMp0XGyZMfBCoCirWkl9P7Jr6ZyFC1l45L
	E4aaWWjnDENj8gZxUYxBlsFZG8lnLA2zQ5kxcY5s3Y7W57PS5HI0AdTM6iGMOZms7sSz
	XZGEPQtO49xKzgNeuA9wHXU78Bj1KUbKtOtA+mz7WAytuVQfW7HhLrWwpb9UsgyHGXJ9
	BH4NPKtYZ4sJO/mcoJ8RyU6xXeiuFkTyCZHG9FuRWJEnDVb54H8bcrmvaxnze7l4ySgS
	Mc/x9wBr8+b/j9o6Wc/3V9ltYmPs/9qjWk6S9guJTUy80oHF9T/XmZbM9mdMdiJ+c/Cf
	ByHg==
X-Received: by 10.195.12.133 with SMTP id eq5mr4663822wjd.52.1363974110362;
	Fri, 22 Mar 2013 10:41:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.49
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:35 +0000
Message-Id: <e6ef80ed83d8d6464ef59144c0e8f38b743c16d1.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnttRmNNsyV0cRaI5jU1Cj02ipvCjIYABhOQ380SfIBGMS+cYzZDYDh/iuubYm2DbGamW88
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/22] default-distrovars: don't add INITMAN to DISTRO_FEATURES and DISTRO_FEATURES_BACKFILL
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:39 -0000

DISTRO_FEATURES_INITMAN is going away as it's not useful in a hybrid init script
environment.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index f0fec2a..eafbcc2 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -18,7 +18,7 @@ DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-b
 DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
 DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
 DISTRO_FEATURES_INITMAN ?= "sysvinit"
-DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ${DISTRO_FEATURES_LIBC} ${DISTRO_FEATURES_INITMAN}"
+DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ${DISTRO_FEATURES_LIBC}"
 
 IMAGE_FEATURES ?= ""
 
-- 
1.7.10.4



