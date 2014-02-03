Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id F184B6E9F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:50:49 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id un15so6656403pbc.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KQLkePj0+1ZQpKWvIMNj2MvDfukjGUp88k6Izo9csFk=;
	b=zI4gUwTsitYT4kcbINF2pTQ8jNhubHlZUfj9IV5wQV5AiaOqgY2RivF9+wETGcUn4l
	E+Mbq+tqkzwGIUG7wKbDb3MT2ccR5qOsjSE/OvvWc0OXgnTwxKCyJr6DCEM3wriIisRP
	bk8dHGne/XsnmTgsWo5aV8/T74floqphP7r4txbj2Uh8kFiZkLKRru/33zfz7tVC3uxh
	5tmQbSAvYPvoHS83WyvT5S8T8sjB12K6fkdD4bKH3zemviM/fXwhc+OpM801es4+cuxN
	DSNxExfwawckU/RXResdRzmaFUgfZ2dPWbaS78+Wv7G51Sb0W2gzTv9t25QMsxp+R5FD
	Qlzg==
X-Received: by 10.66.136.229 with SMTP id qd5mr35809766pab.118.1391410251303; 
	Sun, 02 Feb 2014 22:50:51 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	i10sm137068968pat.11.2014.02.02.22.50.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 22:50:50 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2014 22:51:15 -0800
Message-Id: <1391410275-31251-11-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v2 10/10] libalgorithm-diff-perl: add 1.15
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
X-List-Received-Date: Mon, 03 Feb 2014 06:50:50 -0000

[from README]
This is a module for computing the difference between two files, two
strings, or any other two lists of things.  It uses an  intelligent
algorithm similar to (or identical to) the one used by the Unix `diff'
program.   It is guaranteed to find the *smallest possible* set of
differences.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../libalgorithm/libalgorithm-diff-perl_1.15.bb    |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb

diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
new file mode 100644
index 0000000..554a6b0
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
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NE/NEDKONZ/Algorithm-Diff-${PV}.tar.gz"
+SRC_URI[md5sum] = "457cd497a0411a88b47d3741eb176071"
+SRC_URI[sha256sum] = "aa848b75ad3ecc32d31e8651909551e851cceef74a32822c7a3cb35c259f5190"
+
+S = "${WORKDIR}/Algorithm-Diff-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


