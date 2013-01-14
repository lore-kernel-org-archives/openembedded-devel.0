Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1TumaA-0002Y8-Ux
	for openembedded-devel@openembedded.org; Mon, 14 Jan 2013 17:08:33 +0100
Received: by mail-qa0-f45.google.com with SMTP id j15so1549562qaq.11
	for <openembedded-devel@openembedded.org>;
	Mon, 14 Jan 2013 07:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=QjrVPYJ0I/4+Kh4E+wAzoKDsV0Ratfqtqd9bnYZ0nTs=;
	b=0k4aaUgjB5NlKEnpR3c3bQzq6q98dpctvJ9CHdK2PT/j+Y1tARay8gusnwSei6Y8PU
	WUZr+nuOn7/CT75vXtjUvLlB7vEI+kLu7jtwv8O87BQR6O2tR8YLTzBuDYV7oMjU9nb7
	1SyGG1bhksfaTWrJM+rbx4bdWzYIoRtYxOvGkHolAJ1qG9W0SSwbWVkNxnI28OdVfiSc
	gC0l/3MG/ge6T8Ueka+VwjsEbPV+mxk4T8+jnTnHJHo6bqsfDzKUsVdeVVUAC7TZ+mrH
	3BKCbbmZzwQmbVWM1iNC4GQqdLH9gE0A7aVY7XEUPsjNjH5QOMtLllMpJc3kXdcgxmb6
	UXTw==
X-Received: by 10.49.120.225 with SMTP id lf1mr66756860qeb.14.1358178779343;
	Mon, 14 Jan 2013 07:52:59 -0800 (PST)
Received: from localhost.localdomain ([96.240.164.36])
	by mx.google.com with ESMTPS id gm4sm10014077qab.12.2013.01.14.07.52.58
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 07:52:58 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Mon, 14 Jan 2013 10:52:52 -0500
Message-Id: <1358178774-13647-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH v2 1/3] uhd-firmware : Update to version 3.5.0.
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
X-List-Received-Date: Mon, 14 Jan 2013 16:08:35 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../{uhd-firmware_003.004.000.bb => uhd-firmware_003.005.000.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/uhd/{uhd-firmware_003.004.000.bb => uhd-firmware_003.005.000.bb} (79%)

diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb
similarity index 79%
rename from meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb
rename to meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb
index b445307..ee771fb 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb
+++ b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb
@@ -4,13 +4,13 @@ HOMEPAGE = "http://www.ettus.com"
 PE = "1"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=d8a4f8958d3b56a11bbb1bb134826b28"
+LIC_FILES_CHKSUM = "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=8df143216c46b7c49804f95056c7057a"
 
 inherit allarch
 
 SRC_URI = "http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz"
-SRC_URI[md5sum] = "4269fac82df1fe593ba76206773ce551"
-SRC_URI[sha256sum] = "4b80ebf90079a823212d3b77e5311ef1b467497a4a3585c2cfb4fe65bff71acf"
+SRC_URI[md5sum] = "dd2373263740d2d48fb39e57846bcd2a"
+SRC_URI[sha256sum] = "352fbf69fbfff03a02b5d9b3c398771db40e4c5b77f99f0fdbff67c547cc0d18"
 
 S = "${WORKDIR}/uhd-images_${PV}-release"
 
-- 
1.7.11.7



