Return-Path: <vsivanagulu@easyarm.com>
X-Greylist: delayed 1104 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Nov 2017 14:20:51 UTC
Received: from linux8.hoststud.com (linux8.hoststud.com [94.130.9.145])
	by mail.openembedded.org (Postfix) with ESMTP id 1F127781CE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 14:20:51 +0000 (UTC)
Received: from [122.167.197.5] (port=53820 helo=[192.168.3.24])
	by linux8.hoststud.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89)
	(envelope-from <vsivanagulu@easyarm.com>) id 1eJJzN-0002zb-BD
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Nov 2017 19:32:25 +0530
To: openembedded-devel@lists.openembedded.org
References: <mailman.12095.1509099493.1653.openembedded-devel@lists.openembedded.org>
From: siva <vsivanagulu@easyarm.com>
Message-ID: <d5b86b79-c406-7bb2-4558-4df02ec57e0e@easyarm.com>
Date: Mon, 27 Nov 2017 19:32:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <mailman.12095.1509099493.1653.openembedded-devel@lists.openembedded.org>
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - linux8.hoststud.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - easyarm.com
X-Get-Message-Sender-Via: linux8.hoststud.com: authenticated_id:
	vsivanagulu@easyarm.com
X-Authenticated-Sender: linux8.hoststud.com: vsivanagulu@easyarm.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: madplay support for meta-oe
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
X-List-Received-Date: Mon, 27 Nov 2017 14:20:52 -0000
X-Groupsio-MsgNum: 69760
Content-Type: multipart/mixed; boundary="------------80B600BF370856CD3B96A067"
Content-Language: en-US

--------------80B600BF370856CD3B96A067
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear team,

I have added madplay support for meta-openembedded. Please find the 
attached patch.

--------------80B600BF370856CD3B96A067
Content-Type: text/x-patch;
 name="0001-madplay-support-for-meta-oepenembedded.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-madplay-support-for-meta-oepenembedded.patch"

From 19863f512fff92f305629a1379e915b4369ada54 Mon Sep 17 00:00:00 2001
From: Siva Nageswara rao <vsivanagulu@gmail.com>
Date: Mon, 27 Nov 2017 18:41:44 +0530
Subject: [PATCH] madplay support for meta-oepenembedded

Signed-off-by: Siva Nageswara rao <vsivanagulu@gmail.com>
---
 .../recipes-multimedia/madplay/madplay_0.15.2b.bb  | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/madplay/madplay_0.15.2b.bb

diff --git a/meta-oe/recipes-multimedia/madplay/madplay_0.15.2b.bb b/meta-oe/recipes-multimedia/madplay/madplay_0.15.2b.bb
new file mode 100644
index 0000000..3e2b87f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/madplay/madplay_0.15.2b.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Madplay is a command-line MPEG audio decoder and player"
+SECTION = "console/multimedia"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "ftp://ftp.mars.org/pub/mpeg/${PN}-0.15.2b.tar.gz "
+
+SRC_URI[md5sum] = "6814b47ceaa99880c754c5195aa1aac1"
+SRC_URI[sha256sum] = "5a79c7516ff7560dffc6a14399a389432bc619c905b13d3b73da22fa65acede0"
+
+DEPENDS += "libmad libid3tag"
+inherit autotools gettext 
+
+do_configure_prepend() {
+
+        touch ${S}/NEWS
+        touch ${S}/AUTHORS
+        touch ${S}/ChangeLog
+}
+
+ARM_INSTRUCTION_SET = "arm"
+
+FILES_${PN} = "${bindir}/*"
+
+#  plese add the below line in your conf/local.conf when you have got any LICENCE errors of libmad
+# LICENSE_FLAGS_WHITELIST += "commercial"
+
+
-- 
2.7.4


--------------80B600BF370856CD3B96A067--
