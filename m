Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 85F127191C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:48 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so13771wgh.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=X9kjYSFnbBjLxsZk7Ndh5ElSU+IT35Gohlz72nSyNnA=;
	b=Wg7jphV4gfWYeUXij7deMB+m4bdDqa/f7lBNYO7gY//LGTBsazeRfJTF5JPQWvemI/
	MhainW78NB8Sgh5qklyBu3GbjJpTaeKDF9hse76Bxum6ehP9LvK7ko/kD57RIPtf5F9w
	x0/tdAEe35lI14bOpDm/lqKelTRr9FeC4wZi66UyIR6KBIv9+yo/8rLg8JNQec3Qxxpl
	GTTDduSIFbDUDAyvxjtiW8KaE4zRQILacfDzmgBTKAHeWeUdQDKMF08CWNB3jQ2teBOK
	NqUdRCF0WdfqP1yywxBTcdzAk+bhM+gQwxhCmk2GQG02nb3wbMYeJwfpoG2vJf/lRqww
	x+xQ==
X-Received: by 10.194.187.164 with SMTP id ft4mr7951428wjc.76.1413324888924;
	Tue, 14 Oct 2014 15:14:48 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:22 +0200
Message-Id: <1413324868-11856-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/15] gigolo: initial add 0.4.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Oct 2014 22:14:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb

diff --git a/meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb b/meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb
new file mode 100644
index 0000000..c846e78
--- /dev/null
+++ b/meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Gigolo is a frontend to easily manage connections to remote filesystems using GIO/GVfs"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "gtk+ intltool-native xfce4-dev-tools-native"
+
+inherit xfce-app
+
+SRC_URI[md5sum] = "4abc6fde56572adf3ec3a0181092584c"
+SRC_URI[sha256sum] = "553fc78fe4e7bd2f01f3851baea7e63f6414fe652dfb4b08c60b5c4b2b909164"
-- 
1.8.3.1


