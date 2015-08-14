Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5C41F763BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 16:13:47 +0000 (UTC)
Received: by ykll84 with SMTP id l84so9602945ykl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 09:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=n06MS6PKO58qabZrbJF89p1bN6KrVBiY2mccQ9UCWUk=;
	b=nUdIhVIMBeEMtzkrI4UMX7Xr0x7oSKRLnjEquKIjQzsNmSNVOvwmpgt19U+wdcQ46h
	q4NzuQl2IdtkU3j8otEilcOGiG5TW8FlMvF26GdNlEK2sYneCgLuofXZkyAads6E6U9w
	GBCE99Do8Vguulsj6VG04lO4qjaK8RXQt7k/VmvI3RPUwGVjQW0BKEedCrYlTfVeZh/b
	0eOEZjpczegGlxHhgX6AzbYXolQEL3CuIFYTCASzPyPQnBLTiUNwqwGcY/Y4WBmE02dP
	TYjITgaeUPi+7yKXpsYiSk46dQBbq8XC0qwnhFbx+/sXh6fj9kbXwdPAzgSNGynZRMuU
	4vgA==
X-Received: by 10.170.155.197 with SMTP id w188mr3167521ykc.29.1439568827516; 
	Fri, 14 Aug 2015 09:13:47 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id c6sm5559241ywe.12.2015.08.14.09.13.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Aug 2015 09:13:46 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Aug 2015 09:13:25 -0700
Message-Id: <1439568807-1839-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-perl][PATCH 1/3] libstrictures-perl: add 2.000001 recipe
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
X-List-Received-Date: Fri, 14 Aug 2015 16:13:50 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libstrictures/libstrictures-perl_2.000001.bb   | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000001.bb

diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000001.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000001.bb
new file mode 100644
index 0000000..c1de4e7
--- /dev/null
+++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000001.bb
@@ -0,0 +1,45 @@
+SUMMARY = "strictures - turn on strict and make all warnings fatal"
+DESCRIPTION = "I've been writing the equivalent of this module at the top \
+of my code for about a year now. I figured it was time to make it shorter. \
+\
+Things like the importer in \"use Moose\" don't help me because they turn \
+warnings on but don't make them fatal -- which from my point of view is \
+useless because I want an exception to tell me my code isn't warnings-clean. \
+\
+Any time I see a warning from my code, that indicates a mistake. \
+\
+Any time my code encounters a mistake, I want a crash -- not spew to STDERR \
+and then unknown (and probably undesired) subsequent behaviour. \
+\
+I also want to ensure that obvious coding mistakes, like indirect object \
+syntax (and not so obvious mistakes that cause things to accidentally compile \
+as such) get caught, but not at the cost of an XS dependency and not at the \
+cost of blowing things up on another machine. \
+\
+Therefore, \"strictures\" turns on additional checking, but only when it \
+thinks it's running in a test file in a VCS checkout -- although if this \
+causes undesired behaviour this can be overridden by setting the \
+PERL_STRICTURES_EXTRA environment variable."
+
+SECTION = "libs"
+
+HOMEPAGE = "https://metacpan.org/pod/strictures"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=246;endline=262;md5=43be558cf4f19823cdd6af22135cf5f8"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar.gz"
+SRC_URI[md5sum] = "fb1350b4af50a2f6ba053c1cfd97e920"
+SRC_URI[sha256sum] = "1e738a8ad63ce8c9b447111c8304ae124a3277c2dc17953b4f647581525e20d3"
+
+S = "${WORKDIR}/strictures-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-carp \
+                   perl-module-strict \
+                   perl-module-test-more \
+                   perl-module-warnings \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


