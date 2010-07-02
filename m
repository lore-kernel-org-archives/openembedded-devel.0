Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OUhfo-0003wp-2G
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 16:57:03 +0200
Received: from localhost.localdomain (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTP id 8B07746D3;
	Fri,  2 Jul 2010 18:52:09 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jul 2010 18:57:33 +0400
Message-Id: <1278082654-10070-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1278082654-10070-1-git-send-email-khimov@altell.ru>
References: <1278082654-10070-1-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: 8B07746D3.8304C
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tzdata-uclibc: add recipe for uclibc timezone database
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
X-List-Received-Date: Fri, 02 Jul 2010 14:57:03 -0000

Recent TZif2 file format contains TZ-like ASCII string at the end that is
easily extractable and usable with uclibc setup, so this recipe does exactly
that based on standard tzdata.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/tzdata/tzdata-uclibc_2010j.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/tzdata/tzdata-uclibc_2010j.bb

diff --git a/recipes/tzdata/tzdata-uclibc_2010j.bb b/recipes/tzdata/tzdata-uclibc_2010j.bb
new file mode 100644
index 0000000..9d0de5d
--- /dev/null
+++ b/recipes/tzdata/tzdata-uclibc_2010j.bb
@@ -0,0 +1,16 @@
+require tzdata_${PV}.bb
+
+do_install_append () {
+	rm -f ${D}${sysconfdir}/localtime
+	rm -f ${D}${sysconfdir}/timezone
+	for i in `find ${D}${datadir}/zoneinfo -type f`; do
+		tail -n 1 $i > temp-zone
+		# Avoid useless NULL files
+		if [ "`cat temp-zone`" != "" ]; then
+			mv temp-zone $i
+		fi
+	done
+	cp -pPR ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/TZ
+}
+
+CONFFILES_${PN} = "${sysconfdir}/TZ"
\ No newline at end of file
-- 
1.5.6.5



