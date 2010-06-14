Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OOGFb-0004eB-44
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jun 2010 22:27:19 +0200
Received: by bwz14 with SMTP id 14so2502668bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jun 2010 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:to:to:from:date
	:subject; bh=0Bio5/THXluQXixkjD8Pz+gVtvwRXM1vL2DUNld+Sts=;
	b=ULvU2+gIYhAaykVcsxdcPMhZtWonKJNDbzkr+fJP2137wYEkDAdKUvdr8B0+rRN7Sx
	z6kXie4kBUNiD2fEABvZghLeXilodifD8Hnk3s6Qi7YlnKMj2eje6y0+klSVGQA0/fSo
	3QEpOEa8J6pP0QXvVZkxbeybxpvWHFdxqHeEg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:to:from:date:subject;
	b=nM3Hmo2M5/lNUq2OVpwQpGdBJHqNOnxv3hsZ0W4610H2SqTaw5rfxZj+/01AwU/+KR
	27muOcb7s65BIAK4qM5mZWwrQcVI9wYDKrTpuJtbe1gfsicx/1Y//yqyLiJXiBee1avG
	ApecLg1Q9tsFcWF0C0Jp9Kw5tmngEewxPP+EU=
Received: by 10.204.160.72 with SMTP id m8mr4675226bkx.58.1276546973679;
	Mon, 14 Jun 2010 13:22:53 -0700 (PDT)
Received: from localhost (82-170-243-215.ip.telfort.nl [82.170.243.215])
	by mx.google.com with ESMTPS id v2sm20976808bkz.1.2010.06.14.13.22.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Jun 2010 13:22:52 -0700 (PDT)
Message-ID: <4c168f9c.02afcc0a.1a9e.7e1c@mx.google.com>
To: openembedded-devel@lists.openembedded.org
To: Leon Woestenberg <leon@sidebranch.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
Date: Mon, 14 Jun 2010 22:12:34 +0200
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] udev/{acl, attr}: Fix install. Wanted to install to host /usr/bin/.
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
X-List-Received-Date: Mon, 14 Jun 2010 20:27:19 -0000

The subdirectory Makefile includes a file, that overrides the
variables inherited from the parent Makefile. Those where provided
to the parent make through '-e'.

Make sure the subdir makes also use '-e'.

(An alternative fix is to sed the include file.)

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 recipes/udev/acl_2.2.49.bb  |    2 ++
 recipes/udev/attr_2.4.44.bb |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/udev/acl_2.2.49.bb b/recipes/udev/acl_2.2.49.bb
index aeec494..027a8c6 100644
--- a/recipes/udev/acl_2.2.49.bb
+++ b/recipes/udev/acl_2.2.49.bb
@@ -30,6 +30,8 @@ do_install() {
     export PKG_MAN_DIR=${D}${mandir}
     export PKG_DOC_DIR=${D}${datadir}/doc/acl
     export PKG_LOCALE_DIR=${D}${datadir}/locale
+    # ensure the subdir Makefile do not use the (wrong) variable overrides from the include file
+    export MAKE="${MAKE} -e"
 
     oe_runmake -e install install-dev install-lib
 
diff --git a/recipes/udev/attr_2.4.44.bb b/recipes/udev/attr_2.4.44.bb
index ee48693..c2054d1 100644
--- a/recipes/udev/attr_2.4.44.bb
+++ b/recipes/udev/attr_2.4.44.bb
@@ -30,6 +30,8 @@ do_install() {
 	export PKG_MAN_DIR=${D}${mandir}
 	export PKG_DOC_DIR=${D}${datadir}/doc/attr
 	export PKG_LOCALE_DIR=${D}${datadir}/locale
+        # ensure the subdir Makefile do not use the (wrong) variable overrides from the include file
+        export MAKE="${MAKE} -e"
 
 	oe_runmake -e install install-dev install-lib
 
-- 
1.6.3.3



