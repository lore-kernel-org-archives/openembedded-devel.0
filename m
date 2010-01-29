Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Nanne-0003W5-4y
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 11:10:05 +0100
Received: by fxm4 with SMTP id 4so1692323fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 02:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=G+oFMzr9bupAmKqZapDPmD/rLXa5ZeaLcaDMRHRomcg=;
	b=PBOZojxR64FQgWd2dPT3r6YjwYuTcri4tt4gvEPBcAG4bM466ub2QSBVcXEZWZVXGB
	Xae8SXJ6o9TmH26xP2Pj+W0rHZzPRdF6oLeW+7j9dgfuUTd0JZfG5p3zKxJJfpMd/uvQ
	fld35fC9XJMsiBvRG+L2iy0iZE2ml4o/VLyNg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ICuVdBHplZWkiceAbSmwERD74WmgbRxUxUAYIfnBmomCtLTT6qLaY21BG42Quad8/b
	zs3buglLd1Z9kJsE5tiQNevdF3js3nxDBNvIQ7HUbDVo67OUnTIidS7Yo1TUTr8IlHMx
	GtrBM91xGXP9JPTRwYuoVjiL1XA9DU/qRKXkg=
Received: by 10.103.122.31 with SMTP id z31mr180477mum.136.1264759657356;
	Fri, 29 Jan 2010 02:07:37 -0800 (PST)
Received: from localhost.localdomain (mk090152231120.a1.net [90.152.231.120])
	by mx.google.com with ESMTPS id e8sm5489357muf.10.2010.01.29.02.07.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 29 Jan 2010 02:07:36 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jan 2010 11:07:56 +0100
Message-Id: <1264759676-23841-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] libdbd-sqlite-perl: New recipe for SQLite DBI interface driver
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
X-List-Received-Date: Fri, 29 Jan 2010 10:10:05 -0000

---
 recipes/perl/libdbd-sqlite-perl_1.29.bb |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/perl/libdbd-sqlite-perl_1.29.bb

diff --git a/recipes/perl/libdbd-sqlite-perl_1.29.bb b/recipes/perl/libdbd-sqlite-perl_1.29.bb
new file mode 100644
index 0000000..10fe73a
--- /dev/null
+++ b/recipes/perl/libdbd-sqlite-perl_1.29.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "PERL database interface driver for the SQLite database."
+SECTION = "libs"
+LICENSE = "Artistic|GPL"
+DEPENDS = "libdbi-perl-native"
+RDEPENDS = "libdbi-perl \
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
+
+BBCLASSEXTEND = "native"
-- 
1.6.4.4



