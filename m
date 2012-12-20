Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlfsI-0004Rs-AT
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 14:09:22 +0100
Received: from mail-fa0-f72.google.com ([209.85.161.72])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 04:54:39 -0800
Received: by mail-fa0-f72.google.com with SMTP id s10so2768502fas.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=bwtGfgatVD7h9dZQiutWt60siZpVcSkj2QWF//9QHAU=;
	b=GBI7ia7+d98BaF605WY27k4QAYhU51ZwR8Ojn6kLk3ABVNtnuNnAoV5WdQWgIPQWhe
	zjLv9ixeScHH/ZMy0HefBLm4NRtIGKg9M9calMc/S/uFnZ7IeawS/jSPYNEm1frZ42M/
	39QYevLsYGMsaouqdRxgwBVMkjl2IcPD5fxTMmvQHw7ud1lp1H+Ti5mBGWzOOqH5CrLA
	F2ZINRxMNWJt4Zb17qh7bxkbCrif2kTvkmTwHTP2OrCCuMFfFDGp8SF1E7jvtJ78pL9b
	O790cKly44bBY6vJ6DpILIKeCCAucnNI1I1V0KZ45u6rBUhVCiuhjhLb5JcWgHcB8Usj
	VlCw==
X-Received: by 10.194.118.229 with SMTP id kp5mr17569187wjb.2.1356008077466;
	Thu, 20 Dec 2012 04:54:37 -0800 (PST)
X-Received: by 10.194.118.229 with SMTP id kp5mr17569178wjb.2.1356008077386;
	Thu, 20 Dec 2012 04:54:37 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bd7sm12973656wib.8.2012.12.20.04.54.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 04:54:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Dec 2012 12:52:43 +0000
Message-Id: <1356007963-12208-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
References: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm94OEPsfFeghR/3xJ746xOOelbZo5UrpAG56Cqrtjrj0kf5W/hvvxGVewW5MKsYOwlWXFb4Wk/rUdaONzk9ERLwds1q60nygrd8l4S597U18T6GfB1V9tdCO8bpK8EKFYZQC8zz62lgpIrg0CdcgIuS3IQDtF3E4b4uJQJE88qZEz0E07XeB9CMBEdme1dITi+aHcp
Subject: [meta-multimedia PATCH 6/6] gupnp-tools: add 0.8.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 13:09:26 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb         |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
new file mode 100644
index 0000000..7a26453
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Tools for GUPnP"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://src/network-light/main.c;beginline=1;endline=21;md5=033bf37c030780c5a72165846b3003f6"
+DEPENDS = "gupnp gupnp-av gtk+ gnome-icon-theme"
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.8/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "cafc2a4f2d1a91a8c1228799073d1d7d"
+SRC_URI[sha256sum] = "57d5ca899f8da7e4ae69e5f98d75d1603aa7f388022f9ccb357f90abb22b75b6"
+
+inherit autotools pkgconfig
-- 
1.7.10



