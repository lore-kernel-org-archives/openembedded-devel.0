Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PL9vR-0003Iv-04
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 08:37:57 +0100
Received: by fxm7 with SMTP id 7so2117081fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 23:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=d0Vl9J/FaFOfgdSUSUC4RCg0FAAqHFteXu7A+tI6oH0=;
	b=lZ7GYAG/kcqna29tVluXYCMa+6y4Zr4yW28sN1dwQPfnpYOQeF9M1kB2qCN/3e/3qM
	onH4/qvZNnPnBec6KEmSfvvzfuuxEMGcM3BYeZj5msPy5z2ePAzDC962nG5jdi4TThQU
	R4C+mvf9Sxl61Qgs26LGSCZCjKNaAJYFyRACc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=myT4X0o6oLOLlCIfEJ9T8EwHwM7uZvFi9onWCEOHT/2kOO86ut6q0RHid1pHONLX8R
	ngoCrcDzo8CU3hTW7T0XG/zsOI1norjSzzmBAzD3QYDuZnWmvrKp4MpDZkRE3PM1qbmb
	kCv77qKFg1Z7fXjOt3csXipO5CyLK/1241mzo=
Received: by 10.223.54.132 with SMTP id q4mr2334432fag.117.1290584202536;
	Tue, 23 Nov 2010 23:36:42 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e6sm2078491fav.32.2010.11.23.23.36.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Nov 2010 23:36:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Nov 2010 08:36:24 +0100
Message-Id: <1290584184-19331-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <1289914206-29909-1-git-send-email-Martin.Jansa@gmail.com>
References: <1289914206-29909-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHv2][RFC] binconfig: use / instead empty prefix/exec_prefix in get_binconfig_mangle
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
X-List-Received-Date: Wed, 24 Nov 2010 07:37:57 -0000

* 952e5e2b7a5c1deefc939594d40b81a71fb16a54 appends / in sed call,
  but it breaks ie =/usr replacement ie in libmikmod
* using at least / in SLASH_PREFIX/SLASH_EXEC_PREFIX is needed ie for micro
  distribution where prefix/exec_prefix are empty (/usr collapsed to /)
* prefix and exec_prefix are expanded only in shell environment (after
  get_binconfig_mangle is returned so to check if it's empty we have to
  pass them expanded as params)
* don't push this patch it fixes libmikmod with !micro, but in micro
  it's still broken, because libmikmod-config has empty 'prefix=' which
  is the case when we normaly don't want to add OEPREFIX (whole point of
  this patch), but in this case it's needed (let's just fix libmikmod.in)
* thanks to GNUtoo!
---
 classes/binconfig.bbclass |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/classes/binconfig.bbclass b/classes/binconfig.bbclass
index b3b2236..e462083 100644
--- a/classes/binconfig.bbclass
+++ b/classes/binconfig.bbclass
@@ -1,15 +1,21 @@
 FILES_${PN}-dev += "${bindir}/*-config"
 
 # The namespaces can clash here hence the two step replace
-def get_binconfig_mangle(d):
+def get_binconfig_mangle(d, env_prefix, env_exec_prefix):
+	SLASH_PREFIX = env_prefix
+	if SLASH_PREFIX is "":
+		SLASH_PREFIX = "/"
+	SLASH_EXEC_PREFIX = env_exec_prefix
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
@@ -52,7 +58,7 @@ binconfig_sysroot_preprocess () {
 	for config in `find ${S} -name '${BINCONFIG_GLOB}'`; do
 		configname=`basename $config`
 		install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
-		cat $config | sed ${@get_binconfig_mangle(d)} > ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
+		cat $config | sed ${@get_binconfig_mangle(d, "${prefix}", "${exec_prefix}")} > ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
 		chmod u+x ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
 	done
 }
-- 
1.7.3.2



