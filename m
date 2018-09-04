Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9D078771B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 21:21:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v17-v6so5387144wrr.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 14:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=d/CkBsqkHbglu53sggARQgajOjNOYDCjHwk/UMGOuqo=;
	b=fsyWWeFbWyG2KCtMQjtWMg0rHP2mt1YwyRW+A6cO86wtbkMfEW+8UpmVPOAs19QxVV
	wa8V+8D/+qDbalJZD9d09ECh22n33fVviHZE+tdTwtd2sYuRaza1prso1BRvooHdanbY
	KCvoleJ/FBDW0lsUR+iRdTzvHwrRIMzV5KvFrH8RgKq1Teeyt45z4KbTPCkcjrRvvHiT
	30fM3QSrLYynV30ugRk6reQi8eRElU6bjDSRl1JL3w5qRcZUZ4OnEiaWYJxBdRU5IAKx
	+iU4Vr1rrvm+Ql/NhRDXomsRY1gVppRbulQw4rYz3JY3jCBNgckGyn1zwIp/aIG3U19Y
	OjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d/CkBsqkHbglu53sggARQgajOjNOYDCjHwk/UMGOuqo=;
	b=VHfYL7gYDS7vv/7bKXF0XKiQ/oR2O4na0FrkFgWngPzsf0gM+d7zDVvpA3suzNPLxj
	piXgw1fCdT5XrCnuPulxQpVykcDMk3rIy+8TAVvDozNTZL3K5OeIof+17wyCkrOQjqJe
	ezVvj4wWP9hVur1pwJ7/3UUR/ii0+5LDZz0UYZPVfOqrCTmEhY1Jp6wdAAyC2HhumVA8
	4YkJd0yuvfZreAYp1W0PsTSFI9CdPbq4KncnWUo68EbYwsxgARR6P8rSs7p8jX+nZ2P5
	9731F/HcEEUfqh8OWlf5sSh6/tW23bz1NcmbcfZ4n8lw4p1r1oFD/thOh/VwFYTA9yaM
	12ug==
X-Gm-Message-State: APzg51CvXk8WExfn9OSG16RwOQlyHSvG4hEuWTb/AtyQkg5LyXvzdGSZ
	Obh9AERBDYjF3yiJtt9wb5UeOS7w
X-Google-Smtp-Source: ANB0VdaBZcc3hqxQdhf9Mh7Nkg0fAOsm5oUxEHUoLp98E417piIZW754Tj7+8eAFnu9/JukS1BGDdQ==
X-Received: by 2002:adf:b202:: with SMTP id
	u2-v6mr22362959wra.19.1536096103090; 
	Tue, 04 Sep 2018 14:21:43 -0700 (PDT)
Received: from localhost.localdomain
	(host205-252-dynamic.245-95-r.retail.telecomitalia.it.
	[95.245.252.205]) by smtp.gmail.com with ESMTPSA id
	f18-v6sm22437581wru.51.2018.09.04.14.21.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Sep 2018 14:21:42 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Sep 2018 23:21:37 +0200
Message-Id: <1536096097-23605-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: rebase x86_kexec_test.patch
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
X-List-Received-Date: Tue, 04 Sep 2018 21:21:42 -0000

After last upgrade this patch does not apply anymore.
Replace the previous hack just commenting out the two lines
(package vmcore-dmesg as well).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../kexec/kexec-tools-klibc/x86_kexec_test.patch           | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch
index b7d7c10..1c471f5 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch
@@ -14,17 +14,17 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 79188d8..953c141 100644
+index fb01134..440730d 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -178,8 +178,8 @@ PSRCS:=$(foreach s, $(SRCS), $(PACKAGE_NAME)-$(PACKAGE_VERSION)/$(s))
+@@ -173,8 +173,8 @@ PSRCS:=$(foreach s, $(SRCS), $(PACKAGE_NAME)-$(PACKAGE_VERSION)/$(s))
  PGSRCS:=$(foreach s, $(GENERATED_SRCS), $(PACKAGE_NAME)-$(PACKAGE_VERSION)/$(s))
  
- MAN_PAGES:=$(KEXEC_MANPAGE) $(KDUMP_MANPAGE) $(VMCORE_DMESG_MANPAGE)
+ MAN_PAGES:=$(KEXEC_MANPAGE) $(VMCORE_DMESG_MANPAGE)
 -BINARIES_i386:=$(KEXEC_TEST)
 -BINARIES_x86_64:=$(KEXEC_TEST)
-+BINARIES_i386:=$(SBINDIR)/kexec
-+BINARIES_x86_64:=$(SBINDIR)/kexec
- BINARIES:=$(KEXEC) $(KDUMP) $(VMCORE_DMESG) $(BINARIES_$(ARCH))
++#BINARIES_i386:=$(KEXEC_TEST)
++#BINARIES_x86_64:=$(KEXEC_TEST)
+ BINARIES:=$(KEXEC) $(VMCORE_DMESG) $(BINARIES_$(ARCH))
  
- TARGETS:=$(BINARIES) $(MAN_PAGES)
+ UNINSTALL_KDUMP = $(sbindir)/kdump
-- 
2.7.4


