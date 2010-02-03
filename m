Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Ncdj0-0002BZ-1U
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 12:48:53 +0100
Received: by fg-out-1718.google.com with SMTP id 16so110800fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 03:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=DhM6tH2hqlzCWXXJOhfL6oqLreWLnMIJJbK9ibJDtZw=;
	b=nsTc0t/FPGm+z4rVKr6vRuHfnZeywjW5MjsEsF6ByXEiBFsTP4fQsdCRYwgYe57xFH
	T+TM17xBVO4UJKCnuEV1xfZwk59QEHroALosJqRw0H37mXJH4MI2faJLzRyVdYGdyB/9
	kTP76PHVgVWFy9om3ZZ+iXOnAEPq/7gtkdevk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bmmhTSYQGmfF4pp6OuATTNzqz2rYQh7oN1uz91NaeSa/CmTYoMg+ZAxC/XUsTqKCkL
	uNqTUfyYH8di9H9ViPtQ7CsyZ6NlbRKeH65/xMTEhBJV/cmgH1JyO0p42CH8eb1T60/y
	Af33GduzL4MgclhTb7wN5m1haH4bqZ4jalOP4=
Received: by 10.103.81.20 with SMTP id i20mr4820mul.21.1265197584435;
	Wed, 03 Feb 2010 03:46:24 -0800 (PST)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id n10sm336489mue.44.2010.02.03.03.46.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Feb 2010 03:46:23 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Feb 2010 12:46:48 +0100
Message-Id: <1265197608-19919-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] libdbd-sqlite-perl: SQLite DBI interface driver (new recipe, reworked)
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
X-List-Received-Date: Wed, 03 Feb 2010 11:48:53 -0000

---
 recipes/perl/libdbd-sqlite-perl_1.29.bb |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 recipes/perl/libdbd-sqlite-perl_1.29.bb

diff --git a/recipes/perl/libdbd-sqlite-perl_1.29.bb b/recipes/perl/libdbd-sqlite-perl_1.29.bb
new file mode 100644
index 0000000..1f0c5d2
--- /dev/null
+++ b/recipes/perl/libdbd-sqlite-perl_1.29.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "PERL database interface driver for the SQLite database."
+SECTION = "libs"
+LICENSE = "Artistic GPL"
+DEPENDS_${PN} += "libdbi-perl-native"
+RDEPENDS_${PN} += "libdbi-perl \
+         perl-module-file-spec \
+         perl-module-file-path \
+         perl-module-scalar-util \
+         perl-module-list-util \
+         perl-module-test \
+         perl-module-test-more \
+         perl-module-test-harness \
+         perl-module-file-basename \
+         perl-module-storable \
+         perl-module-extutils-makemaker \
+         perl-module-locale \
+         perl-module-tie-hash \
+"
+PR = "r0"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/DBD-SQLite-${PV}.tar.gz;name=dbdsqlite"
+SRC_URI[dbdsqlite.md5sum] = "2a47cea6ecff62508775d90151a8030f"
+SRC_URI[dbdsqlite.sha256sum] = "51d0d529e453ada1ce85772deb5cc4c86a2ebe9da2dd2fb0b40b77b555720867"
+
+S = "${WORKDIR}/DBD-SQLite-${PV}"
+
+inherit cpan
-- 
1.6.4.4



