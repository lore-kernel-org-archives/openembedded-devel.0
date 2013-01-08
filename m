Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsYoy-0006J6-6l
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2013 14:02:26 +0100
Received: from mail-ee0-f71.google.com ([74.125.83.71])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 04:46:10 -0800
Received: by mail-ee0-f71.google.com with SMTP id e49so380002eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 04:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=+4iRL/trpLf6BxsxR9dGKYBuj+0CvSedmTOmCH6uTO0=;
	b=W0i91AdWr5ML7WAiQz4RnOknRPDqMfq5CNnBuwVgxzDKBonzGysBs6x6yDNfk45kay
	rqXVDPY4zzh65vR1pQERAJrmM13QnS5Yw/e+yqVo2cf9gCbSgqFA95rhATW44LC77hVF
	RVjhzYL9DbfEAitUc5dq84tvIRDqAwRGVQsr0rqIeTvaQI3yzygeCT/YttVtbSsrFHHF
	A/AaVYAkVjLj3Lp6uAQhLOLGlJqSCRitVgrESavDZGUE32z64sLtQrHdkNogkkHT8Vqn
	PNJgTnAWqCZt86JHvBT0QZhpeNxBuyCn+q6dCbIe7BFDtF4aVg1S57w86r88gj2sgO0s
	dcAw==
X-Received: by 10.180.100.163 with SMTP id ez3mr14553479wib.24.1357649230469; 
	Tue, 08 Jan 2013 04:47:10 -0800 (PST)
X-Received: by 10.180.100.163 with SMTP id ez3mr14553459wib.24.1357649230228; 
	Tue, 08 Jan 2013 04:47:10 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t17sm18290333wiv.6.2013.01.08.04.47.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 04:47:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Jan 2013 12:45:12 +0000
Message-Id: <1357649112-11476-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357649112-11476-1-git-send-email-ross.burton@intel.com>
References: <1357649112-11476-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkyL5a2/cwDYFE5bwDI3C/6yZnOW1oeYzZg+6w2x9lvI7bgG9Q04AwqL7DqEjN7K4q3TQb1Z2JXPJKS1nOBf0IyvqqQID5LdzvnhT/p3C3bCTrhvXIal3RJOdriXP3mHou6kY4b8Up2kTZpClMQPOeiFH/R42Wy7fYk4myT2+uZEBsrqVsN0zGiSZNbtE967jRMNTF6
Subject: [PATCH meta-gnome 2/2] at-spi2-atk: add
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
X-List-Received-Date: Tue, 08 Jan 2013 13:02:26 -0000

This is a build dependency for GTK+ 3.6.x.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-support/atk/at-spi2-atk_2.6.2.bb |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-gnome/recipes-support/atk/at-spi2-atk_2.6.2.bb

diff --git a/meta-gnome/recipes-support/atk/at-spi2-atk_2.6.2.bb b/meta-gnome/recipes-support/atk/at-spi2-atk_2.6.2.bb
new file mode 100644
index 0000000..53f0a4a
--- /dev/null
+++ b/meta-gnome/recipes-support/atk/at-spi2-atk_2.6.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "AT-SPI 2 Toolkit Bridge"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+
+SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/${BPN}/2.6/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "7e43d24b64d156119b2b0879393cc94d"
+SRC_URI[sha256sum] = "496c8432e8ab82735145f9af5d45209e9b708bf3c94e527ee091d08641a9bcfa"
+
+DEPENDS = "dbus glib-2.0 atk at-spi2-core"
+
+inherit autotools
-- 
1.7.10.4



