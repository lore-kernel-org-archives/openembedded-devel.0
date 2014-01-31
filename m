Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id E7CD86E9BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 15:11:22 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id y10so4359083pdj.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 07:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6H/h4jQoGf+24e8Nwmz71c5jI8sUJWyi8henyWNov0w=;
	b=P8+G+pqKsDXrTj1m4RyZ//H8f0NLh0vutUbkOr7nHgzpReVfKq4TgWozp+QQvhG9Zn
	UL0bGD+r3rWoxXUWMuoz/GB1Ia2ubeTuFy14WiLBQ6e5DlaQQGpS9giHifp4t5GwQ2RH
	NIFM1D/+1buiE30nFyD3B4FkrzPTg6lFrs+8p0G1HsLQKXylgfPy3ELHaikSAa8rOsMp
	d55y1zGZEZeJIC8Q4isvZL7y7WHBzRHk0ayhr1WOwhHEoUVCMf+8mY+kA0iPO+8/XoTj
	6TFJ+g8WPDnYDjsHclE6TFUA14BjKXuM/mDnv4vl4cJpx/dZ5cqkgoQtF30HHjUHkRBB
	L9+A==
X-Received: by 10.66.142.132 with SMTP id rw4mr21699388pab.6.1391181084163;
	Fri, 31 Jan 2014 07:11:24 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	zc6sm69486700pab.18.2014.01.31.07.11.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 07:11:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2014 07:11:33 -0800
Message-Id: <1391181100-32525-2-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
References: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH 2/9] perl-module-text-diff: add 1.41
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
X-List-Received-Date: Fri, 31 Jan 2014 15:11:23 -0000

[Description from CPAN]
diff() provides a basic set of services akin to the GNU diff utility. It is not anywhere near as feature complete as GNU diff, but it is better integrated with Perl and available on all platforms. It is often faster than shelling out to a system's diff executable for small files, and generally slower on larger files.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../text-diff/perl-module-text-diff_1.41.bb        |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-perl/recipes-perl/text-diff/perl-module-text-diff_1.41.bb

diff --git a/meta-perl/recipes-perl/text-diff/perl-module-text-diff_1.41.bb b/meta-perl/recipes-perl/text-diff/perl-module-text-diff_1.41.bb
new file mode 100644
index 0000000..0daf360
--- /dev/null
+++ b/meta-perl/recipes-perl/text-diff/perl-module-text-diff_1.41.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Text::Diff - Perform diffs on files and record sets"
+DESCRIPTION = "diff() provides a basic set of services akin to the GNU diff \
+utility. It is not anywhere near as feature complete as GNU diff, but it is \
+better integrated with Perl and available on all platforms. It is often \
+faster than shelling out to a system's diff executable for small files, \
+and generally slower on larger files."
+
+HOMEPAGE = "http://search.cpan.org/~ovid/Text-Diff/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz"
+SRC_URI[md5sum] = "30d56e6dd5551ca16b8e16cc7299dc21"
+SRC_URI[sha256sum] = "a67f50a48e313c1680cc662109ce5f913ea71454db355d0cf4db87ac89d2d2fa"
+
+S = "${WORKDIR}/Text-Diff-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-extutils-makemaker \
+                   perl-module-algorthm-diff \
+                   perl-module-exporter \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


