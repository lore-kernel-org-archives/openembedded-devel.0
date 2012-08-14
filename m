Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrapet@gmail.com>) id 1T1Dv4-0005yy-MR
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 12:00:14 +0200
Received: by wgbds1 with SMTP id ds1so3600249wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2012 02:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=r/Isb9zBtWxHlioKMi9vfPpS1Gp1dEeC2tqTxRXoUTI=;
	b=r1yTThaeYkdthuuqccigbit8Hjo71ogiDZAoXxhHTAh768b9A8r5cmYLV+hk+TRTC1
	V0ycNUb3J5ntW1EtHanqf9SAwCa3O2ZqGl2uPqKszxBgO++2JHjBMPS4GHMN+1lBv52F
	SOCqHs8+K27E4oX/LTP49kEjG7ptKSnmwqUhmX3jmNhRDzw0/cTHtAnGR1UIyRi3H3SQ
	g4FzuR3WeWZxE4PsfCHIqbiXpAQqE+sutbZX8QaNfN39E2Hnl+5G5BWbcKvvLBzrbuRI
	VMHVNgOCW1ijh6YwG+4aTYG6zZ38ZAkZOTcybIvLFBA4R8uPqIsAKFhRyYDEwh4vmi+T
	TI+w==
MIME-Version: 1.0
Received: by 10.216.135.148 with SMTP id u20mr7679554wei.137.1344937700338;
	Tue, 14 Aug 2012 02:48:20 -0700 (PDT)
Received: by 10.194.22.5 with HTTP; Tue, 14 Aug 2012 02:48:20 -0700 (PDT)
Date: Tue, 14 Aug 2012 11:48:20 +0200
Message-ID: <CAL2sKTn13OQ4edHfMwEVzLrpEO1prWGJ_V-1ueZj4KH4BBTDtA@mail.gmail.com>
From: Matthieu <mcrapet@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][PATCH] plowshare: Add Git version (initial recipe)
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
X-List-Received-Date: Tue, 14 Aug 2012 10:00:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Add recipe for plowshare (git repository).

Signed-off-by: Matthieu Crapet <mcrapet@gmail.com>
---
 plowshare_git.bb |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 plowshare_git.bb

diff --git a/plowshare_git.bb b/plowshare_git.bb
new file mode 100644
index 0000000..ec33bff
--- /dev/null
+++ b/plowshare_git.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Command-line download/upload tool for file sharing hosters"
+HOMEPAGE = "http://code.google.com/p/plowshare/"
+SECTION = "console/utils"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+PV = "gitr${SRCPV}"
+PE = "1"
+SRCREV = "${AUTOREV}"
+DEPENDS = "bash curl"
+
+SRC_URI = "git://code.google.com/p/plowshare.git;protocol=http;branch=master"
+S = "${WORKDIR}/git"
+
+inherit allarch
+
+# Nothing to compile, it's scripts!
+do_compile() {
+	:
+}
+
+do_install() {
+	oe_runmake PREFIX="${prefix}" DESTDIR="${D}" install
+}
--
1.7.9.5


