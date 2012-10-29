Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TSogl-0003Dy-0j
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 13:43:31 +0100
Received: by mail-gg0-f175.google.com with SMTP id p1so888928ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2012 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=62S5gBH8sdqgP5C/R9d0N/IPLtjvQkIHhxfllzuPE6s=;
	b=ikazHUXRM9jDTXgaTblL3v0tjg7RtKhyTtzfg/DlCY0LN4GYYXtG9lVy3YbBW/0Y+z
	S4TcOtDD9XDjjaNBimxKNjofFxmW0cuP+QqYFzNY8xL+pTQz8IEbcqAK20pJTLfwVLPa
	VpZ9vUJ+2htKcHXRKdSL9+YHB00Q+GfFNe7lHKIhBv4I3l2U7tLD5JTpbdRftenl+jOk
	fzpoBnMHNxhmlS8UtZx3XkJkM8nQds8bUT567rOf1BoP9Zdpib3N9ScYDuLaHGcV1kDR
	tiFEM1ON7pIA/WHBA+b6fNtNpmLWrQCTtdTeWSdgkxZ1V5uuF5IKfUVtGQhMqV2WSBRe
	8wUQ==
Received: by 10.236.135.137 with SMTP id u9mr24029530yhi.73.1351513796624;
	Mon, 29 Oct 2012 05:29:56 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id j8sm8362054ann.3.2012.10.29.05.29.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Oct 2012 05:29:55 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2012 10:29:44 -0200
Message-Id: <1351513785-15026-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1351513785-15026-1-git-send-email-otavio@ossystems.com.br>
References: <1351513785-15026-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/3] ccid: Update to 1.4.8
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
X-List-Received-Date: Mon, 29 Oct 2012 12:43:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../ccid/{ccid_1.4.4.bb => ccid_1.4.8.bb}          |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.4.4.bb => ccid_1.4.8.bb} (66%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.4.bb b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
similarity index 66%
rename from meta-oe/recipes-support/ccid/ccid_1.4.4.bb
rename to meta-oe/recipes-support/ccid/ccid_1.4.8.bb
index 734e854..8576753 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.4.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
@@ -7,10 +7,9 @@ PR = "r0"
 DEPENDS = "virtual/libusb0 pcsc-lite"
 RDEPENDS_${PN} = "pcsc-lite"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/3579/ccid-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "79ef91103bcdd99a3b31cb5c5721a829"
-SRC_URI[sha256sum] = "953e430d2e37a67b99041f584249085656d73e72390dfe40589f4dd5c367edd0"
+SRC_URI = "https://alioth.debian.org/frs/download.php/3768/ccid-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b6c37110f50b059a8ba94f118cfd679a"
+SRC_URI[sha256sum] = "7aca09fa4b9099e423402fd5df424adbafa502888710d1fda6015b6c1ff637ef"
 
 inherit autotools
 
-- 
1.7.2.5



