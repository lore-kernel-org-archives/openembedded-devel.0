Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ramaxlo@gmail.com>) id 1M1sVv-0007TN-Sa
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 03:35:12 +0200
Received: by rv-out-0708.google.com with SMTP id f25so356176rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2009 18:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=OaL50FRWmCJ5WXrmNFgCAZ4ZrsIUKEGa0XpBjSYbyr0=;
	b=jJD7za1NRmVqQWbvsnejwPIsgQHC806crnhb71Xehb607NXcyfYViardmC+XpBl6fp
	RXZPGPrdt1Xm56t2628kkSmhbvZjo1oY1LWPuL37JyEgeJQtjdZL/CpX8vBLiDhuf+9S
	c5FFViDy7B6x5mdV3pjnr5h7F/Mi49xM7nvgQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=buVVLH7SPe9pp3CBI6gXriJ0qANhiE7ALJTxtNazcWTNx1CQ6t2b8oDr2vNnU/g8CL
	+Qz22Ubg7w1kaxsQz4Fpmvgb9qC3GCGeDWGn3H8GHguNhbtzglwuNWBFY0Px4j6Ex9Tk
	GLoNCp6B+xjfMmx9kipC5ZpWwp3xZw3W+33EQ=
Received: by 10.115.73.20 with SMTP id a20mr1925989wal.1.1241659744460;
	Wed, 06 May 2009 18:29:04 -0700 (PDT)
Received: from renaisance1 (220-128-119-163.HINET-IP.hinet.net
	[220.128.119.163])
	by mx.google.com with ESMTPS id f20sm14022242waf.17.2009.05.06.18.29.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 May 2009 18:29:03 -0700 (PDT)
From: Ramax Lo <ramaxlo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 May 2009 09:30:00 +0800
Message-Id: <1241659800-17298-1-git-send-email-ramaxlo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
Subject: [PATCH] at2440evb.conf: Add AT2440EVB machine config.
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
X-List-Received-Date: Thu, 07 May 2009 01:35:14 -0000

---
 conf/machine/at2440evb.conf |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/at2440evb.conf

diff --git a/conf/machine/at2440evb.conf b/conf/machine/at2440evb.conf
new file mode 100644
index 0000000..f3fa5ed
--- /dev/null
+++ b/conf/machine/at2440evb.conf
@@ -0,0 +1,19 @@
+#@TYPE: Machine
+#@Name: Avantech AT2440EVB Dev Board
+#@DESCRIPTION: Machine configuration for Avantech AT2440EVB Dev Board
+
+
+TARGET_ARCH = "arm"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttySAC0"
+
+IMAGE_FSTYPES = "tar.gz"
+KERNEL_IMAGETYPE = "uImage"
+UBOOT_ENTRYPOINT = "30008000"
+
+MACHINE_FEATURES = "kernel26 screen touchscreen"
+
+require conf/machine/include/tune-arm920t.inc
-- 
1.5.4.3



