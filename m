Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 136BB610B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2020 05:29:39 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id c23so1770212plz.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=rEQqtFZxtHCEtnfi5Iiq/NFx2RE2dUvlMR1e/ae3hXM=;
	b=FJgLuvfkIpU3IHzQ9HxyiOg2fZ7PFmTN6e/Ctzy0FwTBdQKNJ7O2dUEhe5QVLwGZDu
	YE7nSQ+MIHFOrt1RYpqFXBGfo/nMmKW7u2C2frJT5tm9YVDzcQHYwtVrI33IWzu8EBoh
	4CyVzj6d6in1w43uaVtnGfVdTAfxuVijV7+MNQTXUACpb31Y6I4TQqHK5MKJI4hb68mb
	gRmSZTrtl5fY38qQ1g0E4cIeHPuhysm2jlMm9dp9zw4ALEhq/+FjxNXuhdyw7+S3yxir
	KD1MAC8SgjjINUsJRxOdaD5FkBEyJeed9WuJo4vgCD3bUvEcL9FJBVkT8wEBLIOLSvfn
	TXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=rEQqtFZxtHCEtnfi5Iiq/NFx2RE2dUvlMR1e/ae3hXM=;
	b=qvQVFdEDikPg3DVMTnlbtL2W16VJ7Lxvav+4BvONbaueCwJU0DNSAGw+MXXYyutHkw
	iwIz0w6lhQFqmklbD8Uh/UxZH2b0IDbb82D1Q2haf/KYKiNH2pgoRNDgslIOw5HMuBbk
	5r7DPkBiRLkG/p8SR5KXK2MwUUYWoYtiAu9YM8sO9tjLQIfGIxTYXnUK3DLnIuwDEcWs
	X13klkubcObh2jtaDnq/mDJzr1vtx/ZVqu27T5uT8fhMo/gcUnC9rQkMD47W0m5Vqeac
	AlMMzLdQRZNf4faszQqZ4YZPg8PD/0lJwv4gfjzOCgIG43q0W7dEw4JbBoz47CnEGHXE
	+CJA==
X-Gm-Message-State: APjAAAVgkxE7LerN302eAQFBSRYjAOKJwdPL90+EFFW8ztq4T8GBtXCu
	KZLIyZ54TTkLTqlf9iaygXZqDfXaqX7FLA==
X-Google-Smtp-Source: APXvYqxwVaa4Wb8X+0lE7+eCVmZQke7jehnlp9n5frp99u4JYHEpCOnTk5fuWOZJVTt6kqfjfQM+yw==
X-Received: by 2002:a17:902:9a85:: with SMTP id
	w5mr39403548plp.290.1582349380397; 
	Fri, 21 Feb 2020 21:29:40 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id b6sm4627173pfg.17.2020.02.21.21.29.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 21:29:39 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 655F12A04DC; Fri, 21 Feb 2020 21:29:38 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 21:29:35 -0800
Message-Id: <20200222052935.19762-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-oe][PATCH] ipmiutil: gzip man pages with out timestamp
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
X-List-Received-Date: Sat, 22 Feb 2020 05:29:40 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

A timestamp was getting encoded into the gzip header. This
causes multilib conflicts when installed together, and would
likely fail reproducablity tests.
---
 ...ess-times-from-changing-resulting-gzip-md.patch | 25 ++++++++++++++++++++++
 meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb  |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch

diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
new file mode 100644
index 000000000..82d0e99d0
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
@@ -0,0 +1,25 @@
+From da668e5bf1a721797361ab866d09913ee8e157c4 Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Sat, 22 Feb 2020 04:37:04 +0000
+Subject: [PATCH] Prevent access times from changing resulting gzip md5sum
+
+Upstream-Status: Pending
+https://sourceforge.net/p/ipmiutil/support-requests/40/attachment/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
+---
+ doc/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index b792762..2c52ce6 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -59,5 +59,5 @@ install:
+ 	${INSTALL_DATA_SH} iuser.8 	 ${manto}
+ 	${INSTALL_DATA_SH} iseltime.8 	 ${manto}
+ 	${INSTALL_DATA_SH} bmclanpet.mib ${datato}
+-	cd ${manto}; gzip -f *.8
++	cd ${manto}; gzip -Tf *.8
+ 	
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
index 3e2634028..d0f3688a2 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
@@ -21,6 +21,7 @@ PARALLEL_MAKE = ""
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
            file://fix_systemd_path.patch \
+           file://0001-Prevent-access-times-from-changing-resulting-gzip-md.patch \
           "
 SRC_URI[md5sum] = "292d6df25cad678bb27e5c8cdc6748f9"
 SRC_URI[sha256sum] = "58ccdbd5755d7dd72478756715af09e9c73330dfad2b91dbf03d2ac504b301a3"
-- 
2.13.3


