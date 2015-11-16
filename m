Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 40B0E734B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 12:27:18 +0000 (UTC)
Received: by qkao63 with SMTP id o63so109830189qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 04:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=7PZk0y4nuSCT4O1b0i83RUuO2Ll8c1Cs7msO9CFCf2c=;
	b=XFk8HwgW3pcskjUxhFwkpix8133iVT7jSxIrwr5JFu+Z7l1wDemWol78rB12hzssjY
	t1KenceCeh+/EvTIHSg55Po/wEv1piRo/mWzIo5ZziptEafQXKC2AhBnZrRRXaDd/UbE
	o2knoysizGwOJfn2MXXfUsYN+3u5X/cVmII1CnGofi4mpqdrXfDiMn0Prpkd14ZmU79U
	NA4L1OUs4i7xYBNUTXKXr0sXWvImAmxL6dEAgDd8rSwCU1yCZAe+xzNz9FABL6gmahIS
	CifuklF7nGXE0GhWDAAd0KWKAJc+vIBVprpj2HbY1mNduI080ygRHi9avZYVtomQrbSX
	BAQQ==
X-Received: by 10.55.82.193 with SMTP id g184mr35953736qkb.65.1447676838734;
	Mon, 16 Nov 2015 04:27:18 -0800 (PST)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	y95sm8610830qgd.27.2015.11.16.04.27.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 04:27:17 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 Nov 2015 10:27:12 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Nov 2015 10:27:09 -0200
Message-Id: <1447676831-2933-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] scripts/firefox-gen-l10n-recipes: Use HTTP to fetch the xpi files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Nov 2015 12:27:19 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 scripts/firefox-gen-l10n-recipes | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/firefox-gen-l10n-recipes b/scripts/firefox-gen-l10n-recipes
index dc22bb4..1f2ae9d 100755
--- a/scripts/firefox-gen-l10n-recipes
+++ b/scripts/firefox-gen-l10n-recipes
@@ -11,7 +11,7 @@ OLDCWD=$PWD
 
 cd $TMPDIR
 echo "Downloading XPI files..."
-wget -c ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$1/linux-i686/xpi/*.xpi
+wget -np -nH -r --cut-dirs 7 -A "*.xpi" http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$1/linux-i686/xpi/
 
 cd $OLDCWD
 
@@ -21,7 +21,7 @@ for f in $TMPDIR/*.xpi; do
 	lang_code=$(echo $f | sed "s,$TMPDIR/\([^\.]*\).xpi,\1,g" | tr '[A-Z]' '[a-z]')
 
 cat > firefox-l10n-${lang_code}_$1.bb <<EOF
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
 require firefox-l10n.inc
-- 
2.6.2


