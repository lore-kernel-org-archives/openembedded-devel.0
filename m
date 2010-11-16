Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PILcs-00011F-Io
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 14:31:11 +0100
Received: by bwz10 with SMTP id 10so618233bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 05:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=M/w7z4Pe+bkTb0DNPvuxFTgGjOSM3Lh93qh9HQDsdXU=;
	b=wLca9gbx9e4T9jtsEM8lV+TzLa0u5XfqhW3B1DDRJUJ3yfIkmsdS+JKqOkipFUX146
	onkzUAgF5stTKnwT0900uTkyf4V7xVGLMdjZQz2IP5IXxurwUudcT2wFykOQWs1OfzZi
	udJaFkAcLwjTC7Yt/8+Zf8wx7MNBwej1JmOJM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DLTgeb1uxtopqp5GceCJf5WuytDBMEmHepAMVZvHVmhgnLVW79WK2y8RvD7tV4GMeB
	euDqQsLFSn1G59n78QZZvVAGTh14amKp7sObyc6L/l7mel3esa4gBUsOq1a50rKp21cD
	LkWcCpre8TRGBZLzGOrt1CvgF8ml5xChLo8LQ=
Received: by 10.204.114.9 with SMTP id c9mr7439556bkq.64.1289914207239;
	Tue, 16 Nov 2010 05:30:07 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f21sm585713bkf.12.2010.11.16.05.30.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Nov 2010 05:30:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Nov 2010 14:30:06 +0100
Message-Id: <1289914206-29909-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <1289658624.3521.26.camel@gnutoo-laptop>
References: <1289658624.3521.26.camel@gnutoo-laptop>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] binconfig: use / instead empty prefix/exec_prefix in get_binconfig_mangle
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
X-List-Received-Date: Tue, 16 Nov 2010 13:31:11 -0000

* 952e5e2b7a5c1deefc939594d40b81a71fb16a54 appends / in sed call,
  but it breaks ie =/usr replacement ie in libmikmod
* using at least / in SLASH_PREFIX/SLASH_EXEC_PREFIX is needed ie for micro
  distribution where prefix/exec_prefix are empty (/usr collapsed to /)
* thanks to GNUtoo!
---
 classes/binconfig.bbclass |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/classes/binconfig.bbclass b/classes/binconfig.bbclass
index b3b2236..df2c283 100644
--- a/classes/binconfig.bbclass
+++ b/classes/binconfig.bbclass
@@ -2,14 +2,20 @@ FILES_${PN}-dev += "${bindir}/*-config"
 
 # The namespaces can clash here hence the two step replace
 def get_binconfig_mangle(d):
+	SLASH_PREFIX = "${prefix}"
+	if SLASH_PREFIX is "":
+		SLASH_PREFIX = "/"
+	SLASH_EXEC_PREFIX = "${exec_prefix}"
+	if SLASH_EXEC_PREFIX is "":
+		SLASH_EXEC_PREFIX = "/"
 	s = "-e ''"
 	if not bb.data.inherits_class('native', d):
 		optional_quote = r"\(\"\?\)"
 		s += " -e 's:=%s${libdir}:=\\1OELIBDIR:;'" % optional_quote
 		s += " -e 's:=%s${includedir}:=\\1OEINCDIR:;'" % optional_quote
 		s += " -e 's:=%s${datadir}:=\\1OEDATADIR:'" % optional_quote
-		s += " -e 's:=%s${prefix}/:=\\1OEPREFIX/:'" % optional_quote
-		s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote
+		s += " -e 's:=%s%s:=\\1OEPREFIX:'" % (optional_quote, SLASH_PREFIX)
+		s += " -e 's:=%s%s:=\\1OEEXECPREFIX:'" % (optional_quote, SLASH_EXEC_PREFIX)
 		s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
 		s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
 		s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
-- 
1.7.3.2



