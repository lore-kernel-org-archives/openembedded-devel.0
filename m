Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Pd77N-0003vE-OT
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 21:16:29 +0100
Received: by fxm17 with SMTP id 17so920089fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 12:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=kRqkfZLAglec+yNGIERg/VT1ENQv1MNUl8YMxLfWA4A=;
	b=sHbATadLCkz4z2szpUe87lZ1CF5AeRGQmLCU195NYaCMPnwFsRt0b+kGzaAU66vPNz
	MsY1KUd8Y6p4cxGf/obIt2FlWMaOo/JUlNymQzhP12IP/OEMMZ24wJ13K6lqgidEfhVn
	it6Gx6UQfcreMKmubuUW5txL9utiYsnyzkzQ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lg4ECuimxqT6dVmL6B/hSAPdqN+PTXxDhAMov5TLmEDFuP17xcxfwI1sSLtW1tDW98
	SpIJQKpA3W363BdWONPGibPhWCxMFEH29ho87bTJCLphImHWbJGHD5iGC7nuhDTmPT2c
	hf2NkxDl+6vuIYQEBCUXYBociJo3kDNzp76M4=
Received: by 10.223.72.14 with SMTP id k14mr399142faj.45.1294863357279;
	Wed, 12 Jan 2011 12:15:57 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id e17sm377493fak.34.2011.01.12.12.15.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 12:15:55 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pd76n-0000OZ-PE; Wed, 12 Jan 2011 21:15:53 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 21:15:52 +0100
Message-Id: <1294863352-1486-4-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294863352-1486-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294863352-1486-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 3/3] autotools.bbclass: use grep -q
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
X-List-Received-Date: Wed, 12 Jan 2011 20:16:29 -0000

-q is a required arg so use it instead of redirecting to /dev/null

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/autotools.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 45b75df..3850ae9 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -160,14 +160,14 @@ autotools_do_configure() {
 			else
 			  CONFIGURE_AC=configure.ac
 			fi
-			if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-			  if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
+			if grep -q "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC; then
+			  if grep -q "sed.*POTFILES" $CONFIGURE_AC; then
 			    : do nothing -- we still have an old unmodified configure.ac
 			  else
 			    oenote Executing glib-gettextize --force --copy
 			    echo "no" | glib-gettextize --force --copy
 			  fi
-			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+			else if grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
 			  if [ -e ${STAGING_DATADIR}/gettext/config.rpath ]; then
 			    cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
 			  else
@@ -181,7 +181,7 @@ autotools_do_configure() {
 			done
 			oenote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
 			autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
-			if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
+			if grep -q "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC; then
 			  oenote Executing intltoolize --copy --force --automake
 			  intltoolize --copy --force --automake
 			fi
-- 
1.7.2.3



