Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id CB2D07719F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:35:31 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id y9so111992128qgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2zQMCAVA7K7es3pz3gw1KTpvHxwcZbCEKaJowQPotY4=;
	b=jdbGkpswlTHFOxAfPiZx+PibdOL4FBWSPK2hisui5dxjvD33rTjw/QijnFkWzYiGtd
	cZvJu5pgvGQWeBa7eZ6PoRTj9Tm9vabtSLYf6277ova1Ks3K75Phayg/3w8xKSMxhi53
	5JzTkZlgpe1A5qLh2T3TWm8mQaWy59G2d/oaALnZlUlOFQZjhlFJKzWfptNY6Y6WlC9s
	xrJ01lTIAIu/b7DSreRfC+6OkcITJnsiZm25S1DFNrvRRCE9l8+g+Mh8JN8KogBKT0uo
	vr+CncE5Pd6JMVLDjZoXpo4kYqmS9g3KbNl63KUFze1DijSLLLDsjx/FUFRpwrhEcxak
	SLdw==
X-Gm-Message-State: AG10YOQD1rcyAZNh2CltaW2imLaIqlNs3plW2JuIW2YqHRpTmf/SwIxO0Autze9KseXcOg==
X-Received: by 10.140.89.8 with SMTP id u8mr35022328qgd.77.1456148132701;
	Mon, 22 Feb 2016 05:35:32 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id w1sm10232368qha.3.2016.02.22.05.35.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 05:35:32 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 08:34:59 -0500
Message-Id: <1456148105-9644-5-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456148105-9644-1-git-send-email-derek@asterius.io>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 05/11] python-prettytable: fix fetch issues in divergent pypi url pattern
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Feb 2016 13:35:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
index 14edb03..c8f7b5f 100644
--- a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
@@ -6,8 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
 SRC_URI[md5sum] = "0c1361104caff8b09f220748f9d69899"
 SRC_URI[sha256sum] = "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f"
 
-PYPI_PACKAGE_EXT = "zip"
-inherit pypi setuptools
+SRCNAME = "prettytable"
+
+SRC_URI = "https://pypi.python.org/packages/source/P/PrettyTable/${SRCNAME}-${PV}.zip"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
 
 do_install_append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
-- 
1.9.1


