Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tgbsi-0000eE-PL
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Dec 2012 14:52:52 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2447526eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Dec 2012 05:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=4tp1OzYXTUj3Mo0BJk0LabJcil6ojfWMrdfyXxvIz2c=;
	b=lir1IcdFOpQw89JSsblEDtM3C4HR5rwz9CAWCaiIH7/vi97pKS/epEyWb2BWCXDJ2I
	uzveryzPqXVZzL7EWiaqMa01IYpiHYCoK3uePipUCV13d1Q9WQRAIw0gH2cmvubzRJSY
	VeQcC1tCeI6TAZwvLEAtikl5AHtahjwNdssFQxls0bbMcDzvxRkMuaKX0Dj49zIY85JZ
	DhoP32uv2uENmxXMbzkYNEezotu2xizknHnjpWuPThwTK+cjLYYb86DNeeqZy1d0wmxm
	lJQeWlqyX+YOgbWxq9qX4bauaqG081ijj09LgvHik6K+lbHApynMq3T6Ih/dGG8YVALy
	dVSw==
Received: by 10.14.3.195 with SMTP id 43mr5742056eeh.36.1354801107532;
	Thu, 06 Dec 2012 05:38:27 -0800 (PST)
Received: from localhost.localdomain (ip-178-200-247-119.unitymediagroup.de.
	[178.200.247.119])
	by mx.google.com with ESMTPS id k4sm9551169eep.15.2012.12.06.05.38.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:38:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Dec 2012 14:36:59 +0100
Message-Id: <1354801019-11200-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-systemd] lighttpd: follow oe-core to 1.4.32
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
X-List-Received-Date: Thu, 06 Dec 2012 13:52:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...pd_1.4.31.bbappend => lighttpd_1.4.32.bbappend} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-systemd/oe-core/recipes-extended/lighttpd/{lighttpd_1.4.31.bbappend => lighttpd_1.4.32.bbappend} (85%)

diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
similarity index 85%
rename from meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
index b016bdc..0e08358 100644
--- a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 1}"
 
 inherit systemd
 
-- 
1.7.6.5



