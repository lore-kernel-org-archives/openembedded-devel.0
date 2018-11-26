Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9D25C6C609
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:35:26 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x10so17722491wrs.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 23:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2gjIlUKEUuhYI4g5pRMrFelB1ANDa26dfZpojdd8mcs=;
	b=tG1Vj+RbNAjcIXZILqEy2bQIPS97ub6duMigDaNg+sMhXROuL6/+MxX5wxInO8d/eg
	9DF3Tq5Rp2LaApdaznA/2pua1Jdc7JtSbzEdLUikyxNv1IkY8N5hN4gTOnR7XkzQ6P0i
	qeLA8LpiRGGCrR1Iiexj2ThTpc4a28QQWrbsI4Vw5fiAAcGfhsetc79Fg68ldpXKQkFD
	uSlAuCigpjoHC10uSgSV6578aJci7s8Q8hYWdv/oz9EhLA519P176i+WtMOgf6NU8lcR
	op3d/elqK+R3qyZK54kkXe2vraPi7SoZT2yUL75bRafBbwaBU/c+8bSb0o7SXlh5na8P
	HIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2gjIlUKEUuhYI4g5pRMrFelB1ANDa26dfZpojdd8mcs=;
	b=OEnVZnD6eTs2kPR681jql4IN9C8r8T5r0130d+eV4tLkSSpfMlpR2L/qHf3S03j7yf
	k91edrNdnZgm32ncQLpp9g6HU1f5LNTryeg1pB8mmqJs9kK6Cjmj+Vp3+5Ull0zsl0XN
	nBLDZ/gchdBIIP+R2slm1UoQxupHdYymskP3ARW0xevkh8GC8jROAi21JrGX5KMSs0zO
	+lWioOouL0/W+iO0yBKhTDBvemRQEJ+oqQeSzazA+t6vpXTj/R4LYacPZtHlU5HkbPnV
	Y/T/5knQjSRZiKVld1uOm9gPGdaqMgBmYK9V6qoAxYa9D25QQ4n9TAt6NWoXeDxZ1Rxg
	ZE1w==
X-Gm-Message-State: AA+aEWbhOy4sdH5Pou2rLnX2gk0UekBydIxByPlRofJb+h4Z6J5FTTLV
	uucUkR2BRNxL5UNGfrVNeLcvOQDHn6A=
X-Google-Smtp-Source: AFSGD/XcllFH0pmrT9Uck0EHX3CvVb1DFqcpDE6HKOr2U5wPEGxvA7B5qOyLsSJ866aTjV28rfSRMA==
X-Received: by 2002:a5d:6648:: with SMTP id f8mr23431907wrw.117.1543217727116; 
	Sun, 25 Nov 2018 23:35:27 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id g2sm9479986wrw.78.2018.11.25.23.35.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 23:35:26 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 08:35:16 +0100
Message-Id: <20181126073520.18859-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181126073520.18859-1-brgl@bgdev.pl>
References: <20181126073520.18859-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/6] libserialport: new package
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
X-List-Received-Date: Mon, 26 Nov 2018 07:35:26 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../libserialport/libserialport_0.1.1.bb             | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb

diff --git a/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb b/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
new file mode 100644
index 000000000..192d4bce6
--- /dev/null
+++ b/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "libserialport is a minimal, cross-platform shared library written in C that is intended to take care of the OS-specific details when writing software that uses serial ports."
+HOMEPAGE = "https://sigrok.org/wiki/Libserialport"
+
+LICENSE = "LGPL-3.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+inherit autotools
+
+SRC_URI = "http://sigrok.org/download/source/libserialport/libserialport-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b93f0325a6157198152b5bd7e8182b51"
+SRC_URI[sha256sum] = "4a2af9d9c3ff488e92fb75b4ba38b35bcf9b8a66df04773eba2a7bbf1fa7529d"
-- 
2.19.1


