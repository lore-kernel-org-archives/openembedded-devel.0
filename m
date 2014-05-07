Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id E415F60DD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 02:08:15 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id lj1so369847pab.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 19:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SxHNg8enp7LpVxw/u2miX36gBvVt1QSwk8v7VXTWLak=;
	b=cw3rrT6R6orhjlDNdE0lznivX0PQLEq8kgZ+4XyCErzgqsWL+d5990J8RSm7flDs93
	n51An9nhZCLFXUXuShKMqUEp5bqFlJ8Md1CLV4LoyC0gni+oL4AdSu5RgVD5RyiCMUh6
	I4RpbgxLSZt59Jl+fE1iSHPYNu8s0Gjz+bY3UdKTJqVxP0m3l5Knt74iE5ClaVUXFJfh
	SCrcdvw71YEZ52dSNjdk7wjB3iW4sgM74bmUx1gmSsrtrV3BNdhxt/7W9faB7HIW1uMD
	Gzagw4kS+kwUKWjTYhN2247Lbfhp5fQCcQpTsnDGFrdT4201HbCJj5u6UtHxJzsuidAM
	Gt8w==
X-Received: by 10.66.233.9 with SMTP id ts9mr13051821pac.37.1399428497169;
	Tue, 06 May 2014 19:08:17 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ec2sm142236pbc.63.2014.05.06.19.08.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 19:08:15 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 19:09:25 -0700
Message-Id: <1399428565-30499-10-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
References: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v3 9/9] libalgorithm-diff-perl: add 1.15
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
X-List-Received-Date: Wed, 07 May 2014 02:08:16 -0000

From: Tim Orling <TicoTimo@gmail.com>

[from README]
This is a module for computing the difference between two files, two
strings, or any other two lists of things.  It uses an  intelligent
algorithm similar to (or identical to) the one used by the Unix `diff'
program.   It is guaranteed to find the *smallest possible* set of
differences.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libalgorithm/libalgorithm-diff-perl_1.15.bb    | 23 ++++++++++++++++++++++
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
1.8.3.2


