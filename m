Return-Path: <joe@deserted.net>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id B6C4261222
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 13:05:37 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so3440474eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 06:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=w879hW/MkLWBxaMn39rAbyPi+iJwUjOqH9DvblDIEEs=;
	b=HBuZ1mPhowtO1gQLEs1EsxybePAwqyOjcGsCTUB0uXG4NQP9JStGRFRf7Z1jckPR7P
	SVhDp40+yqLVP+IlMBK67e+50cTPFirECX99GWkBedLK+8PK98y77z300vxodk1qXz/8
	1QHmqoGOx9ntsZSVhJ/0EKTpbSDfqbxgptNer4vBWYOpsXKCxTZRwaTqKx9xAmKwlWHN
	uQCOTtG8sGfwqjLx+UyW5ECXhRdT/rBm5ZPAjJ+oHU6GjueCY4YTgp/39/Wu2vFPA75D
	5nX4M+ev/UBGOf2DYEjdjyXwIUfsinr3yOuCUFRfvxoXNnc2rKAaITDuGPRhnNOpHzo+
	QErw==
X-Gm-Message-State: ALoCoQmNgZLiPQWmdKVDm+gnRKqItJ6L30vr2O+6z7NWbb6JOgf7lLPEewlS/E3Nz8OhsCTyL6Ne
X-Received: by 10.15.24.129 with SMTP id j1mr25956033eeu.17.1376312737599;
	Mon, 12 Aug 2013 06:05:37 -0700 (PDT)
Received: from burninator.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPSA id p5sm57201932eeg.5.2013.08.12.06.05.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 Aug 2013 06:05:36 -0700 (PDT)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Aug 2013 09:05:23 -0400
Message-Id: <1376312723-5608-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] quagga: backport documentation patch
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
X-List-Received-Date: Mon, 12 Aug 2013 13:05:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The latest stable quagga adopted this patch:

   http://git.savannah.gnu.org/gitweb/?p=quagga.git;a=commit;h=b58c90807c9d0bfa9601704c7490a16070906004

to repair a documentation build error.  Trivial backport.

Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 ...1-doc-fix-makeinfo-errors-and-one-warning.patch |   61 ++++++++++++++++++++
 .../recipes-protocols/quagga/quagga_0.99.21.bb     |    2 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/0001-doc-fix-makeinfo-errors-and-one-warning.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/0001-doc-fix-makeinfo-errors-and-one-warning.patch b/meta-networking/recipes-protocols/quagga/files/0001-doc-fix-makeinfo-errors-and-one-warning.patch
new file mode 100644
index 0000000..24fdac5
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/0001-doc-fix-makeinfo-errors-and-one-warning.patch
@@ -0,0 +1,61 @@
+From d6cbd8bbc34529a1aff74b5ee73366b89526c961 Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe@deserted.net>
+Date: Fri, 22 Mar 2013 08:54:44 +0000
+Subject: [PATCH] doc: fix makeinfo errors and one warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 4afa50b added few lines that are syntactically incorrect
+with leading plus sign.
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/gitweb/?p=quagga.git;a=commit;h=b58c90807c9d0bfa9601704c7490a16070906004]
+
+Cc: Denis Ovsienko <infrastation@yandex.ru>
+Signed-off-by: Timo Teräs <timo.teras@iki.fi>
+Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
+Signed-off-by: Joe MacDonald <joe@deserted.net>
+---
+ doc/ipv6.texi   |    4 ++--
+ doc/quagga.texi |    6 +++---
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/doc/ipv6.texi b/doc/ipv6.texi
+index b6cc437..2482c1c 100644
+--- a/doc/ipv6.texi
++++ b/doc/ipv6.texi
+@@ -136,8 +136,8 @@ for the lowest preference possible.
+ Default: 0
+ @end deffn
+ 
+-+@deffn {Interface Command} {ipv6 nd home-agent-lifetime <0-65520>} {}
+-+@deffnx {Interface Command} {no ipv6 nd home-agent-lifetime [<0-65520>]} {}
++@deffn {Interface Command} {ipv6 nd home-agent-lifetime <0-65520>} {}
++@deffnx {Interface Command} {no ipv6 nd home-agent-lifetime [<0-65520>]} {}
+ The value to be placed in Home Agent Option, when Home Agent config flag is set, 
+ which indicates to hosts Home Agent Lifetime. The default value of 0 means to
+ place the current Router Lifetime value.
+diff --git a/doc/quagga.texi b/doc/quagga.texi
+index ff913aa..b4105ac 100644
+--- a/doc/quagga.texi
++++ b/doc/quagga.texi
+@@ -1,13 +1,13 @@
+ \input texinfo @c -*- texinfo -*-
++@c Set variables - sourced from defines.texi
++@include defines.texi
++
+ @c %**start of header
+ @setchapternewpage odd
+ @settitle @uref{http://www.quagga.net,,@value{PACKAGE_NAME}}
+ @setfilename quagga.info
+ @c %**end of header
+ 
+-@c Set variables - sourced from defines.texi
+-@include defines.texi
+-
+ @c automake will automatically generate version.texi
+ @c and set EDITION, VERSION, UPDATED and UPDATED-MONTH
+ @include version.texi
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
index 5c403a9..2b46930 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
@@ -2,6 +2,8 @@ require quagga.inc
 
 PR = "${INC_PR}.0"
 
+SRC_URI += "file://0001-doc-fix-makeinfo-errors-and-one-warning.patch"
+
 SRC_URI[quagga-0.99.21.md5sum] = "99840adbe57047c90dfba6b6ed9aec7f"
 SRC_URI[quagga-0.99.21.sha256sum] = "9b8aea9026b4771a28e254a66cbd854723bcd0d71eebd0201d11838d4eb392ee"
 
-- 
1.7.10.4


