Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1OdkIG-0003lp-RI
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 15:34:10 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Tue, 27 Jul 2010 15:33:44 +0200
X-TM-IMSS-Message-ID: <27d0cc910000ce68@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 27d0cc910000ce68 for
	<jaap.dejong@nedap.com>; Tue, 27 Jul 2010 15:33:47 +0100
Message-ID: <4C4EE037.7070501@nedap.com>
Date: Tue, 27 Jul 2010 15:33:43 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C4E9C53.7040405@nedap.com>
In-Reply-To: <4C4E9C53.7040405@nedap.com>
X-OriginalArrivalTime: 27 Jul 2010 13:33:44.0220 (UTC)
	FILETIME=[5570FDC0:01CB2D90]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] update libftdi recipe
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
X-List-Received-Date: Tue, 27 Jul 2010 13:34:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi
below an updated version of libftdi.
I've dropped the libftdi-native and ftdi-eeprom-native recipes.
I don't even know why they are available in earlier versions...
When do you need a native recipe?
Jaap de Jong
---
diff --git a/recipes/libftdi/ftdi-eeprom_0.3.bb 
b/recipes/libftdi/ftdi-eeprom_0.3.bb
new file mode 100644
index 0000000..1289abe
--- /dev/null
+++ b/recipes/libftdi/ftdi-eeprom_0.3.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A tool for creating, uploading, and erasing the 
configuration EEPROM for a FT232BM/FT245BM FTDI chip."
+HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi"
+LICENSE = "GPLv2"
+SECTION = "console/utils"
+
+DEPENDS = "libftdi confuse"
+
+SRC_URI = " \
+    
http://www.intra2net.com/en/developer/libftdi/download/ftdi_eeprom-${PV}.tar.gz 
\
+    "
+
+SRC_URI[md5sum] = "331652a593f0b0afd5f2874b37b7973a"
+SRC_URI[sha256sum] = 
"7b40ec5abb2c93362b9636974e4e4715cb588121c1e1da09d7f499ac7f12d056"
+
+S = "${WORKDIR}/ftdi_eeprom-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF = "--disable-docs"
+
diff --git a/recipes/libftdi/libftdi_0.18.bb 
b/recipes/libftdi/libftdi_0.18.bb
new file mode 100644
index 0000000..44616bd
--- /dev/null
+++ b/recipes/libftdi/libftdi_0.18.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "A library to talk to FTDI chips: including 
FT232BM/245BM, FT2232C/D and FT232/245R"
+HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi"
+LICENSE = "GPLv2"
+SECTION = "libs"
+
+DEPENDS = "libusb"
+
+SRC_URI = " \
+    
http://www.intra2net.com/en/developer/libftdi/download/libftdi-${PV}.tar.gz 
\
+    "
+
+SRC_URI[md5sum] = "916f65fa68d154621fc0cf1f405f2726"
+SRC_URI[sha256sum] = 
"5b6f3c3ee51c6aa24d3b87135e01762cf68821d1c3599d87d349fea4ede74c62"
+
+inherit autotools cmake
+


