Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 50AC777E4A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:45:06 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id 77so6794024wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KOIq1Yw8x4WyUJvNVagjVqAg/EE2Yx/8GDBb0OMXS74=;
	b=NocwN/QYU1sCYNaPmfRSemwsoUwDVNuBcZ8YweVSzMaj7W4U55G1iNYIMG/tWviCi7
	pEQRg+khkCxOZn9cawdLpvar1aO9cFpFwmUOf2R1D9Jk+U+vQBf9P0zZOuFJYPe0Q6Cf
	8codRTU6UcQOZkjaiYBEHyVZknE8lUZLfU/jST9L3uwaLtYl1GFi/sNGPhONqsnKk3I+
	1g62swPiJZHErlpDVUFmEvoEv/jo0YWysrRf3695KPyJNEqg1g0+hyI89+J0MUPZJdyV
	KtQYUgQGlPYiqRlr9HIuXpMvRgOyllkdNU5Zb2QeoaCdy1NbhBwxPURjC4IRBlMvOCOJ
	QhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KOIq1Yw8x4WyUJvNVagjVqAg/EE2Yx/8GDBb0OMXS74=;
	b=ul9el74sgl/wJfIT/jkxeDXQarfNQ6B1YWgbVzpRgQvRWcC/ScyIXm/DDvi/3Fehme
	5OugWh38pJePjkb+Y0mQKjF0dFzD8ou2SGZ4YtMAIRBGaxIkWThC7pvb97Uqgvh7F+HM
	tz3GIpJgXnbkK1mHdnX4j8w2biDQN5oEj37lA4BG5ULxWsmII1hwAQAGbV6Kctbd6BYO
	BVWdx+P5E/KcPxosooDUmI1NyPD0K3JjczeF1ANurwvEeXBm0kg6hd+qSw+x5AVjlqOg
	nOorYdiz9sU6yLrEL23Jh42JxIW1sAT37f/lGoe+gWieZue6wfcAyhY4J3CMuPAqpzn4
	nT3w==
X-Gm-Message-State: AIVw112JB53xUZL7p6seMfWvumYLPnsQ5IDrlflpkqPm5IknIhaz+yc8
	8cHWhzcLpuOIk03M
X-Received: by 10.80.226.140 with SMTP id p12mr3252416edl.37.1499791507884;
	Tue, 11 Jul 2017 09:45:07 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	p19sm1224952eda.15.2017.07.11.09.45.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Jul 2017 09:45:07 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 18:44:32 +0200
Message-Id: <1499791478-2407-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe/meta-perl] [PATCH 2/8] libmime-charset-perl: add recipe
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
X-List-Received-Date: Tue, 11 Jul 2017 16:45:07 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

MIME::Charset - Charset Information for MIME.

It's being depended by libunicode-linebreak-perl.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../libmime/libmime-charset-perl_1.012.2.bb           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb

diff --git a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
new file mode 100644
index 0000000..79b4681
--- /dev/null
+++ b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "MIME::Charset - Charset Information for MIME."
+DESCRIPTION = "MIME::Charset provides information about character sets used for MIME \
+messages on Internet."
+HOMEPAGE = "http://search.cpan.org/~nezumi/MIME-Charset-${PV}/"
+SECTION = "libs"
+
+LICENSE = "Artistic-1.0 | GPLv1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/MIME-Charset-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "71440416376248c31aa3bef753fae28d"
+SRC_URI[sha256sum] = "878c779c0256c591666bd06c0cde4c0d7820eeeb98fd1183082aee9a1e7b1d13"
+
+S = "${WORKDIR}/MIME-Charset-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


