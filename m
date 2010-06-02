Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJujF-00031t-MF
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:40:02 +0200
Received: by pwi5 with SMTP id 5so2476341pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=NtUzSwFYM+IAuJNQatC/l71Ehf8nPgwfK1yyOvjR8/g=;
	b=onqxLeAEY1Vbgw47kYJcofJ828A5a0Q+Zcv/F+1mEcNzSNIoMSGhwcMgbMayuaZHXG
	RWyla8LdMcXWMne/eFihyEzIXAbNEIZU2C4m2zmIM+lgwTNNF0ltuQMzwKtqVsVwHaI1
	WeBNW2oTCbRebyFF+tQtvDA/AAwA50UQFbh7k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sil/HpOleiLF3GlE3Af5DZgaS890s89vz1U9nSpRKtNWdOrhmcfXnc0tod1O9nrhbk
	UASSVJ0zLaoRJ4azsVkN51ETrhdf/5U2XLx1CVeib3MyEUr4B2r9Xu14kD/IauhnbGGp
	rL8dbqqFjX8BGutN8yaOwWzzoiZ/j5/pFJCmo=
Received: by 10.141.214.41 with SMTP id r41mr7126571rvq.77.1275510941752;
	Wed, 02 Jun 2010 13:35:41 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:50 -0700
Message-Id: <1275510896-30845-11-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 10/16] inetutils_1.8.bb: Add recipe
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
X-List-Received-Date: Wed, 02 Jun 2010 20:40:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/inetutils/inetutils_1.8.bb |   43 ++++++++++++++++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 recipes/inetutils/inetutils_1.8.bb

diff --git a/recipes/inetutils/inetutils_1.8.bb b/recipes/inetutils/inetutils_1.8.bb
new file mode 100644
index 0000000..11fb818
--- /dev/null
+++ b/recipes/inetutils/inetutils_1.8.bb
@@ -0,0 +1,43 @@
+SECTION = "libs"
+DEPENDS = "ncurses"
+LICENSE = "GPL"
+DESCRIPTION = "The GNU inetutils are a collection of common \
+networking utilities and servers including ftp, ftpd, rcp, \
+rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
+talkd, telnet, telnetd, tftp, tftpd, and uucpd."
+
+PR = "r0"
+
+SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
+"
+
+inherit autotools
+
+EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR}"
+
+do_configure_prepend () {
+	cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
+	rm -f ${S}/glob/configure*
+}
+
+do_install () {
+	autotools_do_install
+	mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${PN}
+	mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${PN}
+	mv ${D}${bindir}/logger ${D}${bindir}/logger.${PN}
+}
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${bindir}/tftp tftp tftp.${PN} 100
+	update-alternatives --install ${bindir}/telnet telnet telnet.${PN} 100
+	update-alternatives --install ${bindir}/logger logger logger.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+	update-alternatives --remove tftp tftp.${PN}
+	update-alternatives --remove telnet telnet.${PN}
+	update-alternatives --remove logger logger.${PN}
+}
+SRC_URI[md5sum] = "ad8fdcdf1797b9ca258264a6b04e48fd"
+SRC_URI[sha256sum] = "c8500baee04b9ea408c9e65e24ad7f5b41e7d96d42fb1d29abf25b52b68311c7"
+
-- 
1.7.0.4



