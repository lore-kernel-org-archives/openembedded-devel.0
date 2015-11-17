Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF2760617
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 19:13:18 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so17279707pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vFkkQ+Rln+vKn8i0nUEkE7eR3459C7sxreT8CgvYTXs=;
	b=mPQYIqxYmgWpD3CQhr46kPggYY1AAZ22zGTn6IuN+w0L0JqeuOvVhFASn5lrEWL/wb
	EY3owFECqftDb2HA/AfTdUASiq9mpO6Q9LVxzfGWOnlrSuiU6nm1qmHfUbLP0zdZCCgC
	7DplY64mgb1bqEOCgGA0R2ksg+b+8TPb/VjGAUME6PenGZgHr/yPjaJtvQkSEbdXdr3h
	XgrRtrIOf1nSUSIbi0xmcBFREwuZp/ofZKiC1OHx++aX4oL1gLbHaQWi99PL33owU7hC
	47aE7o7XJXE23XGxZcecadagBNJLCpDGjuVLsiVzo+i9v4IX2l/XxJgwexWtEnUuqOyH
	/gJA==
X-Received: by 10.66.119.174 with SMTP id kv14mr65889229pab.143.1447787598775; 
	Tue, 17 Nov 2015 11:13:18 -0800 (PST)
Received: from localhost.localdomain (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	mt2sm39864779pbb.90.2015.11.17.11.13.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Nov 2015 11:13:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:13:16 -0800
Message-Id: <1447787596-32664-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [meta-ruby][meta-xfce][PATCH] imsettings: Move from meta-ruby to meta-xfce
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
X-List-Received-Date: Tue, 17 Nov 2015 19:13:24 -0000

It depends on xfconf which is XFCE component, no one
depends on imsettings in meta-ruby so move it close
to its dependencies.

Ideally, xfconf should be turned into PACKAGECONFIG
and this recipe then moved to meta-oe since all kind
of DE's can use it then.

For now it frees meta-ruby from unnecessary dependency on xfce layer

Change-Id: I6b5896b0db504fad49a9da5967d3493e27c627b0
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-ruby/conf/layer.conf                                               | 2 +-
 .../recipes-extended}/imsettings/gtk-is-required-by-notify.patch        | 0
 .../multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch      | 0
 .../imsettings => meta-xfce/recipes-extended}/imsettings_1.6.8.bb       | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename {meta-ruby/recipes-extended/imsettings => meta-xfce/recipes-extended}/imsettings/gtk-is-required-by-notify.patch (100%)
 rename {meta-ruby/recipes-extended/imsettings => meta-xfce/recipes-extended}/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch (100%)
 rename {meta-ruby/recipes-extended/imsettings => meta-xfce/recipes-extended}/imsettings_1.6.8.bb (100%)

diff --git a/meta-ruby/conf/layer.conf b/meta-ruby/conf/layer.conf
index b053450..b526a5d 100644
--- a/meta-ruby/conf/layer.conf
+++ b/meta-ruby/conf/layer.conf
@@ -12,4 +12,4 @@ BBFILE_PRIORITY_ruby-layer = "7"
 # cause compatibility issues with other layers
 LAYERVERSION_ruby-layer = "1"
 
-LAYERDEPENDS_ruby-layer = "core openembedded-layer xfce-layer"
+LAYERDEPENDS_ruby-layer = "core openembedded-layer"
diff --git a/meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch b/meta-xfce/recipes-extended/imsettings/gtk-is-required-by-notify.patch
similarity index 100%
rename from meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
rename to meta-xfce/recipes-extended/imsettings/gtk-is-required-by-notify.patch
diff --git a/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-xfce/recipes-extended/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
similarity index 100%
rename from meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
rename to meta-xfce/recipes-extended/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
diff --git a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb b/meta-xfce/recipes-extended/imsettings_1.6.8.bb
similarity index 100%
rename from meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
rename to meta-xfce/recipes-extended/imsettings_1.6.8.bb
-- 
2.6.3


