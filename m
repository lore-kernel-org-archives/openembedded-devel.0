Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 779C96B333
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:40:56 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so218084eak.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2x4YmO1C9VBjA78aYCe6bkO/QyJiY9Dph9ZcXJjRTf0=;
	b=ABzmjxjgjBtTfICpzuyumNuMBxyaqAirshrDoM2x2+NgBD51nidcTsPY+lPhy6gbtM
	y1ZAK1Tk4Hob6yMzwhQTKWh7hLsgX781DzyTpiGYnplg2aq5aikVdaWu2z7lP0LMfg60
	cXArUIS6GxqjqlyzVfuK16XCndGDFJjR2V3G8f2np02TubgnAbiM8XfVjgrgisQoUHTt
	vByPk+pwBtz7zkOffDXy8GOlX1wv9sV7QH0BOz4zu/vhVQjUPKOVyJ/Uad662pgyBNCy
	SXSSc0WKqZcg491tHHDZYThx+xxhZltxRE2kXi7/H09mXAhWx134cVCC16/SB42Vbcpz
	8Hpg==
X-Received: by 10.14.99.71 with SMTP id w47mr37629114eef.140.1374669656885;
	Wed, 24 Jul 2013 05:40:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm65894566eeu.4.2013.07.24.05.40.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:40:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:47 +0200
Message-Id: <cab9f404c0d98acf76838c6a330a510c1850e570.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/29] cifs-utils: add PACKAGECONFIG for libcap
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
X-List-Received-Date: Wed, 24 Jul 2013 12:40:56 -0000

* libcap is autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index de2786a..07bf1b8 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -12,6 +12,9 @@ SRC_URI = "git://git.samba.org/cifs-utils.git"
 
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
+
 inherit autotools
 
 do_install_append() {
-- 
1.8.3.2


