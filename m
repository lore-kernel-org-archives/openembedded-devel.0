Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f181.google.com (unknown [209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id D87506A38B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:50:12 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id z10so1133097pdj.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 00:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iSsVIN8KoGWcSLER6wDE0EfT/zYr02Nxjh8+56hVr/0=;
	b=zX7uxAdiuOhvgCG7p1niNxuonpHXsOZEBNXITnHwQDoeVtAvRyJ6mHVCDnk6FAKuSV
	AndNju7IRFMhsYFJ1suH2kXioN0eGkkTeNgRSkq1FOKqZkj2LmQOzTrhj7v/m9ywSiDO
	qzv6tDiTvjyIbFLfe5jwfDsS3cIY3gZ4/pqQc94CmeKmR+Qz8jx07Lg/BrhgZUwKPpVf
	6Z1lAH/23IAJ1Y2kKGyyFj3ZRMzwU6nxzrjEpp0D+dNdGARf7g822SDgCGAP325p+wqR
	DyEYSI5vkHQVtp6wNWlfnf1mHK6W06XuWqA5oiVOzc6lPaangBqPGkoTIii2hBY1ucUT
	W7LA==
X-Received: by 10.66.180.200 with SMTP id dq8mr57142234pac.104.1400658122008; 
	Wed, 21 May 2014 00:42:02 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id it4sm6669337pbc.39.2014.05.21.00.42.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 00:42:00 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 00:43:42 -0700
Message-Id: <1400658223-15804-10-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v4 09/10] libalgorithm-diff-perl: add 1.15
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
X-List-Received-Date: Wed, 21 May 2014 07:50:12 -0000

From: Tim Orling <TicoTimo@gmail.com>

[from README]
This is a module for computing the difference between two files, two
strings, or any other two lists of things.  It uses an  intelligent
algorithm similar to (or identical to) the one used by the Unix `diff'
program.   It is guaranteed to find the *smallest possible* set of
differences.

* Add ${CPAN_MIRROR} option

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libalgorithm/libalgorithm-diff-perl_1.15.bb    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb

diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
new file mode 100644
index 0000000..4155fad
--- /dev/null
+++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Algorithm::Diff - Compute 'intelligent' differences between two \
+files/lists"
+DESCRIPTION = "This is a module for computing the difference between two files, \
+two strings, or any other two lists of things.  It uses an  intelligent \
+algorithm similar to (or identical to) the one used by the Unix `diff' \
+program.   It is guaranteed to find the *smallest possible* set of \
+differences. \
+"
+SECTION = "libs"
+HOMEPAGE = "http://search.cpan.org/~nedkonz/Algorithm-Diff/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=406;endline=409;md5=d393b8ad3b8994b9d0ae9299b8a8a1ee"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEDKONZ/Algorithm-Diff-${PV}.tar.gz"
+SRC_URI[md5sum] = "457cd497a0411a88b47d3741eb176071"
+SRC_URI[sha256sum] = "aa848b75ad3ecc32d31e8651909551e851cceef74a32822c7a3cb35c259f5190"
+
+S = "${WORKDIR}/Algorithm-Diff-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.2


