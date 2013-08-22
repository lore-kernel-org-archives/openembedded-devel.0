Return-Path: <lpapp@archlinux.us>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id C847C6B25D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2013 19:07:27 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q56so1126247wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2013 12:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=fmrlHO6YRHmx7ROw7wWF/osE1KWFwvFdtWyL1L21WF8=;
	b=m+zQeFbYWZiB23Xqw9EKRxDtT7yHlVsEBaJb5lXZErk94/nws0V9UqqoHAK2HQWVgm
	PNQ5pVrledZ/eM7Y6AgrJVcqaRmDiJT/z6T/Bp96TuO7KX6EaUuinbKDE2wo5Ac222Z8
	KYgBHFOBeAlrveRueEUGN2jFRThFcVVetWjmrvpcwPzcw7+CAvbRjnPcabSj0KeolYd5
	axz0NzX3mbeWVQkZJNMEpZ6OK2d0URweHJjtw7N++MmEm4j8MN11GZM8JoPp1UlnSRIr
	Dp/nV95roShD2XpEfopnHNdI4B8KDOC52e2ruPEjMOXgGdnqyDRQmQlFwrkg+EH6+SDb
	8U8w==
X-Gm-Message-State: ALoCoQnnphqgACWa5xqxiCl5/kKu3CO0m7U1daEzWoxc+Fx2hQnzlZKxPOnyUwKCrNsSkqGHSMEp
X-Received: by 10.180.206.42 with SMTP id ll10mr22116018wic.50.1377198447840; 
	Thu, 22 Aug 2013 12:07:27 -0700 (PDT)
Received: from archlinux.us (cpc11-cmbg15-2-0-cust30.5-4.cable.virginmedia.com.
	[86.30.245.31]) by mx.google.com with ESMTPSA id
	mb7sm18932417wic.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 12:07:26 -0700 (PDT)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by archlinux.us (sSMTP sendmail emulation);
	Thu, 22 Aug 2013 20:07:36 +0100
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2013 20:07:32 +0100
Message-Id: <1377198452-1546-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-networking][PATCH] stunnel: Add 4.56 version
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
X-List-Received-Date: Thu, 22 Aug 2013 19:07:28 -0000

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.bb

diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
new file mode 100644
index 0000000..0ee8cc8
--- /dev/null
+++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
@@ -0,0 +1,14 @@
+SUMMARY = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
+DEPENDS = "openssl"
+
+SRC_URI = "https://www.stunnel.org/downloads/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
+SRC_URI[sha256sum] = "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
+
+inherit autotools
+
+EXTRA_OECONF += "--with-ssl='${STAGING_INCDIR}' --disable-fips"
-- 
1.8.3.4


