Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 04DD87803F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 15:05:59 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id s127so33118ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 08:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gWa2CvHyygNKgBvXFoGeZ52kmDlQlET48tg34yOVkd4=;
	b=omZa45dV2OeDnJGndxQsLvXRWD3J0N7Ck43xwd6iq5xhblyJAmAWXiu3NmnZHH3izK
	z73qC+L5lKoVvDhOu+hCZlDOFRb74SNZcAdQslLwG5T8Fo5fmpj9OACzoN/2enN0kL9F
	c9ecc15wknWAtwfpDrqNxDkBtAOZgISTZBDe2lC38N+QgpaNwET31i/ijLbQTNo3ta65
	LHMnDq44y9TJ3HmrslwRk4wqGG/Py/xEaNBn8rpC7VhX86YGAIHLPE/ozoAvJyTlldzM
	r7g4pPpt2nqxVElmLEu21dOw16kUqx1KncsYlHfno2zyf3lYdou0ru5t8zy4aZHReEKr
	60eQ==
X-Gm-Message-State: AODbwcAHWLSs8WcJqNneWWUlKyaX8Mj5pqpPI7pLcOj9iK5l7VBMa8Ex
	0GyGgnBXAoI6yi1q
X-Received: by 10.129.174.81 with SMTP id g17mr16534745ywk.53.1497193560305;
	Sun, 11 Jun 2017 08:06:00 -0700 (PDT)
Received: from localhost.localdomain (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	b187sm2818097ywd.2.2017.06.11.08.05.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 08:05:59 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jun 2017 11:06:15 -0400
Message-Id: <1497193576-3774-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/2] libfile-fnmatch-perl: New recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 15:06:02 -0000

File::FnMatch::fnmatch() provides simple, shell-like pattern matching.

Though considerably less powerful than regular expressions, shell patterns
are nonetheless useful and familiar to a large audience of end-users.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 .../perl/libfile-fnmatch-perl_0.02.bb              | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb

diff --git a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
new file mode 100644
index 000000000000..035fe9f654e9
--- /dev/null
+++ b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Perl module that provides simple filename and pathname matching"
+DESCRIPTION = "File::FnMatch::fnmatch() provides simple, shell-like pattern \
+matching. \
+Though considerably less powerful than regular expressions, shell patterns \
+are nonetheless useful and familiar to a large audience of end-users."
+
+HOMEPAGE = "http://search.cpan.org/dist/File-FnMatch/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://README;beginline=34;endline=37;md5=54fdfac62963b7cece5583ab38f2cf0d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/M/MJ/MJP/File-FnMatch-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "22f77c20d0fb5af01a3165e2df2fe34c"
+SRC_URI[sha256sum] = "962454b8e86bea8b132bf8af35757d0c6a8f5d599015bd6a5d68cb7ae7a9e916"
+
+S = "${WORKDIR}/File-FnMatch-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


