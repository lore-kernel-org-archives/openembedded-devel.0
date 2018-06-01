Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8E974F37
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 04:58:15 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id a14-v6so11894524pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 21:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=73N0nP5HHIJiWeFdRlf180oqKMgqociaF7yN5zQb2rM=;
	b=Li3+8ai+BMg5THhroOBaiHdp1mI8LwILUUfey8TBaTKHhlgFF2xNHCeJt3v10KoL7F
	99NJ3eY7e08PxgIA1ZR8DoOgFxN+nb1Ij3YNixWwKBgAUPppwU3/GgkE+ETdUw5j4qcH
	TC0gJSOj4PJrUd10/CMTFwK9yUQGJmrqHb1BqLCq71WnuBL1f21n2XEI2w5aQU/34aTs
	bZVMWqlKh4DiMmdBo/mHo9Y1hh4PDw3q/4KCp+Y3N1BF+VCZLkXWFVisRCAj24d9RQh9
	K8cOcs3X/DMaXlTpb6oHVQRrCzu+nK9IWVHRsyp7KfNlFJppFwOduQq5qjgQZAWQmq/v
	Hd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=73N0nP5HHIJiWeFdRlf180oqKMgqociaF7yN5zQb2rM=;
	b=TfcV8EKDJnUM2YAPwVKopcReYDPAr4eRcYM1o/OCTjo/ZFIMvKyTWZ772V9pl2Dzcp
	kSGaS3GOoAVHFeqzRbPEJ6WrW8yUcTnEONboNaRCdHLfMyJZCKDvoP5OKcQhRZXypWH5
	Y20cXcN2zZiFTOiU1s3d1lRLP02JKQLdg2cjo21mJZKM8/9HkQs3eU3iZY/ZKW+RcVeg
	UYp7vgzRx4EqbNaeYOT47LodqcVArxJQvPZTowvfdEH1AihhADf9rvu0VKut+ypqdcjx
	5SRphrtkyaZjFn5MVSrWSzEwWHBzOW6Iu5kJxqdE2io25f05qV+h7HRWxNZFYMdZz9sd
	LnpA==
X-Gm-Message-State: ALKqPwfeAZ2zXhktWVyw/VIOSJX6bEHRqMj1h0E3mupsOlVzXTQeMVa7
	coQG38e4ZbPkeQx6gSllBSL52g==
X-Google-Smtp-Source: ADUXVKL2kRyl8pFgu/+IebJL1Gf548vLOBv4vfZVDnxzJYZDQfDrQNBdagrDZjWqhH1OwArqPyXgtw==
X-Received: by 2002:a63:aa07:: with SMTP id
	e7-v6mr7658934pgf.331.1527829095925; 
	Thu, 31 May 2018 21:58:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	q68-v6sm67909762pfb.182.2018.05.31.21.58.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 May 2018 21:58:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2018 21:58:14 -0700
Message-Id: <20180601045815.15819-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180601045815.15819-1-raj.khem@gmail.com>
References: <20180601045815.15819-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] lowpan-tools: Fix build with gcc-8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2018 04:58:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tential-string-truncation-in-strncpy.patch | 139 ++++++++++++++++++
 .../lowpan-tools/lowpan-tools_git.bb          |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-potential-string-truncation-in-strncpy.patch

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-potential-string-truncation-in-strncpy.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-potential-string-truncation-in-strncpy.patch
new file mode 100644
index 0000000000..e621d8f2a8
--- /dev/null
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-potential-string-truncation-in-strncpy.patch
@@ -0,0 +1,139 @@
+From 58b6d9a2efe101e5b80fd708e6f84c7ca779ce93 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 May 2018 20:27:43 -0700
+Subject: [PATCH] Fix potential string truncation in strncpy()
+
+GCC 8 complains about the string truncation during copy
+
+error: 'strncpy' specified bound 16 equals destination size
+
+Upstream-Status: Inappropriate [depricated component]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/listen-packet.c | 3 ++-
+ tests/listen.c        | 3 ++-
+ tests/test2.c         | 4 ++--
+ tests/test3.c         | 3 ++-
+ tests/test4.c         | 3 ++-
+ tests/test5.c         | 3 ++-
+ tests/test6.c         | 3 ++-
+ tests/test7.c         | 3 ++-
+ 8 files changed, 16 insertions(+), 9 deletions(-)
+
+diff --git a/tests/listen-packet.c b/tests/listen-packet.c
+index e40af81..eae0c71 100644
+--- a/tests/listen-packet.c
++++ b/tests/listen-packet.c
+@@ -50,7 +50,8 @@ int main(int argc, char **argv) {
+ 		return 1;
+ 	}
+ 
+-	strncpy(req.ifr_name, iface, IF_NAMESIZE);
++	strncpy(req.ifr_name, iface, IF_NAMESIZE - 1);
++	req.ifr_name[IF_NAMESIZE - 1] = '\0';
+ 	ret = ioctl(sd, SIOCGIFINDEX, &req);
+ 	if (ret < 0)
+ 		perror("ioctl: SIOCGIFINDEX");
+diff --git a/tests/listen.c b/tests/listen.c
+index 75c320b..5ce1ed9 100644
+--- a/tests/listen.c
++++ b/tests/listen.c
+@@ -47,7 +47,8 @@ int main(int argc, char **argv) {
+ 		return 1;
+ 	}
+ 
+-	strncpy(req.ifr_name, iface, IFNAMSIZ);
++	strncpy(req.ifr_name, iface, IFNAMSIZ - 1);
++	req.ifr_name[IF_NAMESIZE - 1] = '\0';
+ 	ret = ioctl(sd, SIOCGIFHWADDR, &req);
+ 	if (ret < 0)
+ 		perror("ioctl: SIOCGIFHWADDR");
+diff --git a/tests/test2.c b/tests/test2.c
+index 58eb74b..5d02838 100644
+--- a/tests/test2.c
++++ b/tests/test2.c
+@@ -45,8 +45,8 @@ int main(int argc, char **argv) {
+ 		perror("socket");
+ 		return 1;
+ 	}
+-
+-	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
++	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
++	req.ifr_name[IF_NAMESIZE - 1] = '\0';
+ 	ret = ioctl(sd, SIOCGIFHWADDR, &req);
+ 	if (ret < 0)
+ 		perror("ioctl: SIOCGIFHWADDR");
+diff --git a/tests/test3.c b/tests/test3.c
+index fb36627..2f50a5a 100644
+--- a/tests/test3.c
++++ b/tests/test3.c
+@@ -46,7 +46,8 @@ int main(int argc, char **argv) {
+ 		return 1;
+ 	}
+ 
+-	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
++	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
++	req.ifr_name[IF_NAMESIZE - 1] = '\0';
+ 	ret = ioctl(sd, SIOCGIFHWADDR, &req);
+ 	if (ret < 0)
+ 		perror("ioctl: SIOCGIFHWADDR");
+diff --git a/tests/test4.c b/tests/test4.c
+index 33c274c..8737149 100644
+--- a/tests/test4.c
++++ b/tests/test4.c
+@@ -46,7 +46,8 @@ int main(int argc, char **argv) {
+ 		return 1;
+ 	}
+ 
+-	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
++	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
++	req.ifr_name[IF_NAMESIZE - 1] = '\0';
+ 	ret = ioctl(sd, SIOCGIFHWADDR, &req);
+ 	if (ret < 0)
+ 		perror("ioctl: SIOCGIFHWADDR");
+diff --git a/tests/test5.c b/tests/test5.c
+index 4439dfa..28db562 100644
+--- a/tests/test5.c
++++ b/tests/test5.c
+@@ -45,7 +45,8 @@ int main(int argc, char **argv) {
+ 		return 1;
+ 	}
+ 
+-	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
++	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
++	req.ifr_name[IF_NAMESIZE - 1] = '\0';
+ 	ret = ioctl(sd, SIOCGIFADDR, &req);
+ 	if (ret < 0) {
+ 		perror("ioctl: SIOCGIFADDR");
+diff --git a/tests/test6.c b/tests/test6.c
+index e375bfb..ce7de59 100644
+--- a/tests/test6.c
++++ b/tests/test6.c
+@@ -45,7 +45,8 @@ int main(int argc, char **argv) {
+ 		return 1;
+ 	}
+ 
+-	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
++	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
++	req.ifr_name[IF_NAMESIZE - 1] = '\0';
+ 	ret = ioctl(sd, SIOCGIFADDR, &req);
+ 	if (ret < 0) {
+ 		perror("ioctl: SIOCGIFADDR");
+diff --git a/tests/test7.c b/tests/test7.c
+index e9a5a55..37da22d 100644
+--- a/tests/test7.c
++++ b/tests/test7.c
+@@ -58,7 +58,8 @@ int main(int argc, char **argv) {
+ 	if (ret)
+ 		perror("setsockopt");
+ 
+-	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
++	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
++	req.ifr_name[IF_NAMESIZE - 1] = '\0';
+ 	ret = ioctl(sd, SIOCGIFHWADDR, &req);
+ 	if (ret < 0)
+ 		perror("ioctl: SIOCGIFHWADDR");
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index d0fe59c983..b70c43f156 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/linux-wpan/lowpan-tools \
            file://0001-src-iz.c-Undef-dprintf-before-redefining.patch \
            file://0001-Remove-newline-from-format-line.patch \
            file://0001-coordinator-Fix-strncpy-range-warning.patch \
+           file://0001-Fix-potential-string-truncation-in-strncpy.patch \
            "
 SRCREV = "1c2d8674cc6f4b1166a066e8822e295c105ae7a2"
 
-- 
2.17.1


