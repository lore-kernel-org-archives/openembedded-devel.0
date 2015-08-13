Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4E473231
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 15:32:35 +0000 (UTC)
Received: by ykay144 with SMTP id y144so44140814yka.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x7rQhnkz9ohTRZdsXnbV54MlpUV6LKY3cVjONVxC05Q=;
	b=nKyGRTYzTGqTu3aiqPrsZUJ8spNl074IJYgcuIYIE8oupjD7V2KsLXHMM14jC5CoBA
	9IAYMbfueXieUBPHblVh1nKFnsZx3AYK5bFKtlSK24nUlOco8ogYvGkAw2T8wim/0WZJ
	VWH7WXYuM5ReekTr/EMbrCQSAlpJOiow4DdulVpBzBx6+mbtOih0InUnASnfylPOxzX5
	dc/Si/4ISDZtH9Y+7D0b/UMt2IJnZlLp3ZEVBdwkQRj3d19kfDSQLdQnhUIGQanWQULi
	b+9R003hFHUlDxKccJNlcNDJ874+iZjb6YdoEM54H/bwjkkvc95tsBbh2+D0B4TknasB
	+Tug==
X-Received: by 10.129.75.3 with SMTP id y3mr24469191ywa.90.1439479955996;
	Thu, 13 Aug 2015 08:32:35 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	m132sm2315913ywb.34.2015.08.13.08.32.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 08:32:35 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2015 08:31:58 -0700
Message-Id: <1439479918-5557-2-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439479918-5557-1-git-send-email-TicoTimo@gmail.com>
References: <1439479918-5557-1-git-send-email-TicoTimo@gmail.com>
Subject: [meta-per][PATCH 2/2] libdevel-globaldestruction-perl: add 0.13 recipe
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
X-List-Received-Date: Thu, 13 Aug 2015 15:32:36 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libdevel-globaldestruction-perl_0.13.bb        | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.13.bb

diff --git a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.13.bb b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.13.bb
new file mode 100644
index 0000000..1a593cf
--- /dev/null
+++ b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.13.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Function returning \"${^GLOBAL_PHASE} eq \'DESTRUCT\'\""
+DESCRIPTION = "Perl's global destruction is a little trick to deal with \
+WRT finalizers because it's not ordered and objects can sometimes disappear."
+
+SECTION = "libs"
+
+HOMEPAGE = "https://metacpan.org/pod/Devel-GlobalDestruction/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=53;endline=55;md5=935dadb9423774f53548e5cd5055d41a"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Devel-GlobalDestruction-${PV}.tar.gz"
+SRC_URI[md5sum] = "e7be00040827e204b2b6cba2f3166074"
+SRC_URI[sha256sum] = "b29824dc0d322e56da325f05185367eb443694716010b36693dd52ffbe8ec462"
+
+S = "${WORKDIR}/Devel-GlobalDestruction-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " libsub-exporter-progressive-perl \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


