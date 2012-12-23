Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkpq-0001g9-Ph
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:39:58 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2496566eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=FeZKVqgpPb6JdoZLOsH17nafScDejwBPxHfoARB7iZo=;
	b=cb8hBI962BS6RCNc5sl8JPkrhH9GmCszEAxt4cpC1QBJjPftIfClt5MHEHsmHN+cnO
	CgYDGGyMaxvrg+lT4/arDZGStBJNQ+C7h9gRC0+YObnN83zbKGn30rFzQBfXLxwqkVR1
	ozS14pxKjLvrHC1aYZzNprlIL19iOHNL2IW6VexCrQJanZy1HhlhoJf0CDSRNaQpx+p1
	IadoCVn+Y3r/gwlDeGmSHqSw/W4xpkQ+MV+MJ3AiIywdmIfjn/YX56qJY916W1vUl/QB
	Sls/SwqGkfw1jyTaDOF1QrNLiQqSm1Wy5XJnPWFmD6CTLfFKfvRL6GThiVUSzOjxy8YI
	TTiw==
X-Received: by 10.14.204.198 with SMTP id h46mr48271537eeo.1.1356265470499;
	Sun, 23 Dec 2012 04:24:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d3sm34563643eeo.13.2012.12.23.04.24.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:24:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:42 +0100
Message-Id: <6a0d5149a131d98d4eba0198e12f7ba7c6ee3755.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 17/30] udh: inherit pythonnative
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
X-List-Received-Date: Sun, 23 Dec 2012 12:40:36 -0000

* fails without:
  | -- Configuring the python interpreter...
  | -- Could NOT find PythonInterp (missing:  PYTHON_EXECUTABLE)
  | -- Python interpreter: PYTHON_EXECUTABLE-NOTFOUND
  | -- Override with: -DPYTHON_EXECUTABLE=<path-to-python>
  | CMake Error at cmake/Modules/UHDPython.cmake:54 (MESSAGE):
  |   Error: Python interpretor required by the build system.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/uhd/uhd.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/uhd/uhd.inc b/meta-oe/recipes-connectivity/uhd/uhd.inc
index 27584da..c237a96 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd.inc
+++ b/meta-oe/recipes-connectivity/uhd/uhd.inc
@@ -7,9 +7,9 @@ DEPENDS = "git-native boost libusb1 uhd-firmware orc-native"
 RDEPENDS_${PN} += "uhd-firmware"
 
 PE = "1"
-INC_PR = "r2"
+INC_PR = "r3"
 
-inherit cmake
+inherit cmake pythonnative
 
 PACKAGES =+ "${PN}-tests ${PN}-examples ${PN}-e1xx"
 
-- 
1.8.0.2



