Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrapet@gmail.com>) id 1T1Gl9-00046u-Js
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 15:02:11 +0200
Received: by weyr6 with SMTP id r6so221695wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2012 05:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=eVKikkpiAL9sIPbSgMEObS4YuerdNcFwefIOXon/AQU=;
	b=E/+kan5hligaSn3/ZSbA2J8UgMG95InCtsxAJdgkVQErUw4mA/QBFC6hYQRXo8HE7q
	uCvOtxZOFuSoRbpFFvGf5Zbs6whdB1jo51/rsSQ5ermfPdu6h8wyIifx0ZuyElFDXtGK
	EXvYG0HMaylvlnrVYQStHTFePRoqJhfofWMKaZeznhyLjZI3zwypDwNGUh8+WZ56+9/Q
	cTFcVBda+UPVRSe5qq57uDKxfLJ101kFRk3Z3dXDFemS8qP0Is5d/Adj/kBC2pBwqV5Q
	kOrpXgpOjZBPjy12526HcGUlnXveaeISfAIBAf0Gr706BxqdeJ/aHju3xzhsaOZuCZLP
	W2qg==
MIME-Version: 1.0
Received: by 10.180.76.36 with SMTP id h4mr27694148wiw.13.1344948616900; Tue,
	14 Aug 2012 05:50:16 -0700 (PDT)
Received: by 10.194.22.5 with HTTP; Tue, 14 Aug 2012 05:50:16 -0700 (PDT)
In-Reply-To: <k0d7ds$odu$2@dough.gmane.org>
References: <CAL2sKTn13OQ4edHfMwEVzLrpEO1prWGJ_V-1ueZj4KH4BBTDtA@mail.gmail.com>
	<k0d7ds$odu$2@dough.gmane.org>
Date: Tue, 14 Aug 2012 14:50:16 +0200
Message-ID: <CAL2sKTm8xG5o7MfWiALcXrzTsvqk-vR0VmkJbC4Wt4ecCZVxPQ@mail.gmail.com>
From: Matthieu <mcrapet@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [RFC][PATCH v2] plowshare: Add Git version (initial recipe)
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
X-List-Received-Date: Tue, 14 Aug 2012 13:02:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Add recipe for plowshare (git repository).

v2:
- fix big mistake DEPENDS => RDEPENDS
- set SRCREV to empty string
- keep PE=1 to respect upstream scheme

Signed-off-by: Matthieu Crapet <mcrapet@gmail.com>
---
 meta/recipes-support/plowshare/plowshare_git.bb |   27
+++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-support/plowshare/plowshare_git.bb

diff --git a/meta/recipes-support/plowshare/plowshare_git.bbb/meta/recipes-support/plowshare/
plowshare_git.bb
new file mode 100644
index 0000000..f819255
--- /dev/null
+++ b/meta/recipes-support/plowshare/plowshare_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Command-line download/upload tool for file sharing hosters"
+HOMEPAGE = "http://code.google.com/p/plowshare/"
+SECTION = "console/utils"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+# Follow uptream (debian) naming convention,
+# for example: plowshare_1~git20120807-1_all.deb
+PV = "gitr${SRCPV}"
+PE = "1"
+SRCREV = ""
+
+RDEPENDS_${PN} = "bash curl"
+SRC_URI = "git://
code.google.com/p/plowshare.git;protocol=http;branch=master"
+S = "${WORKDIR}/git"
+
+inherit allarch
+
+# Nothing to compile, it's scripts!
+do_compile() {
+ :
+}
+
+do_install() {
+ oe_runmake PREFIX="${prefix}" DESTDIR="${D}" install
+}
--
1.7.9.5

