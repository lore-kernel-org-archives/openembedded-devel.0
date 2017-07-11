Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9F42E77E4A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:45:20 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id 77so6802522wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hebPCGjrUCQJhHo2aMUTRhpN4RAdpUNsbeqvw9SuJvs=;
	b=hUV/JmQB1xWB/PK/HMtPu7YHESfvg5II4Y0jaz7LOQgn28Cw+eFsu0oWj9+VV8S1Uj
	AKkLVFbxCU1KsjBdXmqIxFTKFZximJEcwNi0Hyfx83TmrCr1/I+jkrP2LMTlocPKKt/H
	WCK8+dsMKKAthJi8mIvzKyaO1g0GRcAcS5BaI4RSK0DXENxcWAXVunFeRs5kE+n2R0kU
	RsMPrZ95JqZbNt8+vh+8bnny95WTY/SM8H9DwJLj524NlC1a3vI9VfUFgabbMVxtLr4l
	vARf/mcWj11jnIwQMX5df4RpKpH51CWRLX4sPPhlzUlgkaelZ+na3xI+zxqfyhEifE0+
	JqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hebPCGjrUCQJhHo2aMUTRhpN4RAdpUNsbeqvw9SuJvs=;
	b=my9QvZOJPLEuiupfpCrqZNVR5+kkzWJGlNlKDMOY7nad9Zvk5gn1YrNJ58iovlCDuu
	85zdgqbb/X6zN3HvukNpQyXNHLNo/hRQSRMsvgQTb9fiyI4kecUFG6y6yTrA71jzQ8+W
	I7nTFv0Wp98EThdg4lqa6DJkJbagJFau0n9r2GjB9ymdkLCjjBtkBmXRtMINkZJfxOrn
	9tW3RDUO7W3NihQji9pKqo5K+bp/pePu01oAEXWXu6BqX6/+YnoFTMgf7sKonu4y9zxF
	cwAJwn01mpFOoCJZpwYFcGdaR7RAu/BCg8WvqjDH9JbXaahR4I6uXLRUlqSQkWbVXaSO
	Fuww==
X-Gm-Message-State: AIVw111Hn2ebrbFDH3FILl1/HomkUaZwQlCmLTeAU5CG1revY416e0qI
	s/3QY9wbc5sQZfTr3LI=
X-Received: by 10.80.137.173 with SMTP id g42mr3119521edg.125.1499791520890;
	Tue, 11 Jul 2017 09:45:20 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	p19sm1224952eda.15.2017.07.11.09.45.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Jul 2017 09:45:20 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 18:44:35 +0200
Message-Id: <1499791478-2407-6-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe/meta-perl] [PATCH 5/8] libtext-charwidth-perl: add recipe
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
X-List-Received-Date: Tue, 11 Jul 2017 16:45:20 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Text::CharWidth - Get number of occupied columns of a string on
terminal.

It's being depended by libtext-wrapi18n-perl.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../libtext/libtext-charwidth-perl_0.04.bb         | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb

diff --git a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
new file mode 100644
index 0000000..9057ae7
--- /dev/null
+++ b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Text::CharWidth - Get number of occupied columns of a string on terminal."
+DESCRIPTION = "This module supplies features similar as wcwidth(3) and wcswidth(3) \
+in C language. \
+Characters have its own width on terminal depending on locale. For \
+example, ASCII characters occupy one column per character, east Asian \
+fullwidth characters (like Hiragana or Han Ideograph) occupy two columns \
+per character, and combining characters (apperaring in ISO-8859-11 Thai, \
+Unicode, and so on) occupy zero columns per character. mbwidth() gives the \
+width of the first character of the given string and mbswidth() gives the \
+width of the whole given string."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~kubota/Text-CharWidth-${PV}/"
+
+LICENSE = "Artistic-1.0 | GPLv1+"
+LIC_FILES_CHKSUM = "file://README;md5=d8d54c8c500cbdd57a4c15911d9d96db"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-CharWidth-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "37a723df0580c0758c0ee67b37336c15"
+SRC_URI[sha256sum] = "abded5f4fdd9338e89fd2f1d8271c44989dae5bf50aece41b6179d8e230704f8"
+
+S = "${WORKDIR}/Text-CharWidth-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


