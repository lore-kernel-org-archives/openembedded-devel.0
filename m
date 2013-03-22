Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6K1-00005E-Lr
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 19:04:24 +0100
Received: by mail-wg0-f52.google.com with SMTP id 15so3396990wgd.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=5TM3cRsQb/ZWMebUIPwjqpuocbizwrBq6ffbLuppizc=;
	b=dFRT12o5VEk6+/ZNoGFF+zUeLMAJ1mRuFIhwcyfyHrkmDLyAwLV8Fr1nf3RD3KZ27j
	r0+WKJJkzy3GTrwWJmKEGUGnZWzMCxbgTS4UBTJtR7h/T9FW6VWuFZeeZ6WvRfHtOVF4
	bEt5u/N7gCG3DWCk2zUHxWVE0XTfYflOIMCRCjUe8GCkzxfcJEQgNBDeBoK5eD+McI+O
	AExx2g99GTIRU6gtMJkkVcPRfET+UMLupXimd6uvYVYH6IK9DK5XRs2KtPj5vznSd2we
	yug1IC+OwrLPDDsBUAI58WafIevMH3d7W6YtXNx0NaMcQ+DrZeeoul2QhjDm8WsJOzGo
	kFbw==
X-Received: by 10.180.13.34 with SMTP id e2mr12982927wic.29.1363974114161;
	Fri, 22 Mar 2013 10:41:54 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.52
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:38 +0000
Message-Id: <a7a7fc34777c0b8cfe62b6ac337418edec5bcbe9.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQny9wi8fbRcxRF6hJNDe3DAPD72OQ6s4Fl01Wdo6yzgMvVIzkWRB0t0rCv4f0KW0YzuBuF8
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 18/22] default-distrovars: remove obsolete DISTRO_FEATURES_INITMAN reference
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
X-List-Received-Date: Fri, 22 Mar 2013 18:04:36 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index eafbcc2..b0586d6 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -17,7 +17,6 @@ DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-b
 					libc-posix-wchar-io"
 DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
 DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
-DISTRO_FEATURES_INITMAN ?= "sysvinit"
 DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ${DISTRO_FEATURES_LIBC}"
 
 IMAGE_FEATURES ?= ""
-- 
1.7.10.4



