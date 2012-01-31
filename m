Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RsLM7-00086R-BN
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 22:35:11 +0100
Received: by eekd41 with SMTP id d41so138718eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 13:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=S31HlL8Xi0gZJyqsLRW+f9vHxIQBUrJaFhHD/Wf3/Is=;
	b=V87Ox4QUtHh5MBR/X8wrTkEp0GmNbd+zfyHfuiS0kRwGp91/jGgD7uqnQRF0OWEDH9
	ThRw2/2iE9/HRjZTthWy8uba81BxXW4UghYMBobCSJexo25PsyPKiNaSCwDlXVimH8wK
	ao8fHST/P6WUUsc1EQrcLsFtNRrZTDEoSAO1k=
Received: by 10.14.95.9 with SMTP id o9mr1629339eef.125.1328045237285;
	Tue, 31 Jan 2012 13:27:17 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id y12sm90523724eeb.11.2012.01.31.13.27.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 13:27:16 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2012 22:25:11 +0100
Message-Id: <1328045111-8189-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] gconf.bbclass: Add proper RDEPENDS to packages with gconf postinststep.
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
X-List-Received-Date: Tue, 31 Jan 2012 21:35:11 -0000

Right now gconf bbclass adds both postinst and prerm steps, but it does
not ensure that packages involved have gconf in RDEPENDS. This can lead
to a situation where postinst/prerm steps fail because gconftool-2 is
not installed.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta/classes/gconf.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index c1dbbe3..7bfa871 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -56,5 +56,8 @@ python populate_packages_append () {
 				prerm = '#!/bin/sh\n'
 			prerm += d.getVar('gconf_prerm', 1)
 			d.setVar('pkg_prerm_%s' % pkg, prerm)
+			rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
+			rdepends += " gconf"
+			d.setVar("RDEPENDS_%s" % pkg, rdepends)
 
 }
-- 
1.7.3.4



