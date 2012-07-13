Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6F-0006VU-9s
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:23:47 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so885914eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=9vR2iIV06DMyhTCeA64wvX5Wqwg1wcwnv115mU93r04=;
	b=N4ch6CtvyjKmtsJN1JVgqRNpg+twHmYNtjrNeKg0DImJuTT/7m6eKIyNXcfwLMhVAK
	dbCMLe0Al8n5tuIZf0GBQyL7w3/VlR816f9lWwQtpaYrRO7Tw009hQtxm1bGw7WAju3p
	P2r2vQ8v1AUPmwfvtWZDKmbrE3f+20NC2zPbtMoudJxDQhFAYFoINvjjkyVPBTkoMUfE
	jePJgCynAUOtSHxntOGVECJfxRuKvwR6tTpFxgvGz2+AvrlNCJ0H1eU+aedaAoP9c2hj
	SkhAB3rBtPSTCiJsCVzQsh8s5EhIfY0KRiXBoR88sODs003uLI9iKUhORDqqe7byA30C
	aCqw==
Received: by 10.14.37.12 with SMTP id x12mr73483eea.161.1342170755388;
	Fri, 13 Jul 2012 02:12:35 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id p41sm23231431eef.5.2012.07.13.02.12.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:12:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:11:50 +0200
Message-Id: <1342170730-14982-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmWW9pVGnXHrR+NIlUlQYzj7KxZUXPd2w7ODC8/VHTTX+3s481B64cDLTlKhT0+OwIIYcS/
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 04/24] fb-test: add latest git version
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
X-List-Received-Date: Fri, 13 Jul 2012 09:23:47 -0000

This is a suite of utils to test the linux framebuffer and aid in debugging problems.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/fbtest/fb-test_git.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/fbtest/fb-test_git.bb

diff --git a/meta-oe/recipes-support/fbtest/fb-test_git.bb b/meta-oe/recipes-support/fbtest/fb-test_git.bb
new file mode 100644
index 0000000..43acfd6
--- /dev/null
+++ b/meta-oe/recipes-support/fbtest/fb-test_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Test suite for Linux framebuffer"
+
+PV = "0.0"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
+
+SRCREV = "85eab266b123a08098af86afdb1599947d276e32"
+SRC_URI = "git://github.com/prpplague/fb-test-app.git"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}${bindir}
+	for prog in perf rect fb-test offset ; do
+		install -m 0755 $prog ${D}${bindir}
+	done
+}
+
-- 
1.7.10



