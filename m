Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1OcDs5-0006Os-2E
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 10:44:45 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 23 Jul 2010 10:44:22 +0200
X-TM-IMSS-Message-ID: <122e61ca000067d0@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 122e61ca000067d0 for
	<jaap.dejong@nedap.com>; Fri, 23 Jul 2010 10:44:19 +0100
Message-ID: <4C495665.3060605@nedap.com>
Date: Fri, 23 Jul 2010 10:44:21 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100527 Lightning/1.0b1 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 23 Jul 2010 08:44:22.0684 (UTC)
	FILETIME=[3F81D5C0:01CB2A43]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Introduce xc3sprog recipe
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
X-List-Received-Date: Fri, 23 Jul 2010 08:44:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

below a recipe to build a great tool for programming Xilinx fpga's etc.

thanks and best regards,

Jaap
---
diff --git a/recipes/xc3sprog/xc3sprog_461.bb 
b/recipes/xc3sprog/xc3sprog_461.bb
new file mode 100644
index 0000000..66775d4
--- /dev/null
+++ b/recipes/xc3sprog/xc3sprog_461.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "suite of utilities for programming Xilinx FPGAs, CPLDs, 
and EEPROMs"
+LICENSE = "GPL"
+HOMEPAGE = "http://sourceforge.net/projects/xc3sprog"
+SECTION = "console/utils"
+
+DEPENDS += "libftdi libusb"
+
+SRC_URI = 
"svn://${PN}.svn.sourceforge.net/svnroot/${PN};module=trunk;proto=https"
+SRCREV = ${PV}
+
+SRC_URI[md5sum] = "916f65fa68d154621fc0cf1f405f2726"
+SRC_URI[sha256sum] = 
"5b6f3c3ee51c6aa24d3b87135e01762cf68821d1c3599d87d349fea4ede74c62"
+
+S = "${WORKDIR}/trunk"
+PR = "r0"
+
+inherit cmake
+



