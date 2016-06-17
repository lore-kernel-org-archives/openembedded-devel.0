Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id D4336731E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 17:59:34 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id l81so12869690qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 10:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jZTAtQldjyCtpzcDViKEk24wW0XsTlOImn2J4U1L5w4=;
	b=EuXx0RdDoR3trZ/WZx/6qWn23+UCD6g4Ruhn3S+nRUfPB5QFDzS0BGktPThOEFrClW
	MjweSW47uetgwvrwvGm6zNdhSn9Ffyeuf3roiTumZXMRmhKDpVZZxkv3Qfnvm1WrW1ss
	pLbz26/fIZseOY47yS1PSO1aANs78/I49tNGzCWY4ZI7EBgVGsPbDOEBKeQowpqAsNof
	bc1oxnxsfNXsQzOy0NpIHRvQq3ULahdv/Q7csSghRvTqin3yXcNKB8TnZsCm4oH283Qz
	+060t9HqkAs8jNmrqryOrv1Xcp+PjwN4OtFPZmu1843VR4FtwBrBjEohSFwUgxUDZVXF
	sVtw==
X-Gm-Message-State: ALyK8tJGzJ+agSwXScmYITeiKrvX7veXgxqDXguiFw/hn6QUXxRSsgQSpVTpYI9V59tACw==
X-Received: by 10.237.36.108 with SMTP id s41mr3854699qtc.66.1466186375147;
	Fri, 17 Jun 2016 10:59:35 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	u85sm13318977qku.44.2016.06.17.10.59.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 10:59:34 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2016 13:59:27 -0400
Message-Id: <1466186367-17993-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] libqmi: update to version 1.14.2
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
X-List-Received-Date: Fri, 17 Jun 2016 17:59:35 -0000

 * Addresses build issues with gcc-6

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libqmi/{libqmi_1.12.6.bb => libqmi_1.14.2.bb}                | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.12.6.bb => libqmi_1.14.2.bb} (65%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.14.2.bb
similarity index 65%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.14.2.bb
index 937fafc..84936e7 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.14.2.bb
@@ -9,11 +9,8 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "glib-2.0"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig bash-completion
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "24c9eb300662ba6cff0152de89bd9ec0"
-SRC_URI[sha256sum] = "0857bffece4e8ddfa7f721dd9ca63b4c78de345ac9ae2faebf04062cacba3780"
-
-# http://errors.yoctoproject.org/Errors/Details/68616/
-PNBLACKLIST[libqmi] ?= "BROKEN: fails to build with gcc-6"
+SRC_URI[md5sum] = "6ec55d1a1941bb18802ab8498baca7e0"
+SRC_URI[sha256sum] = "6283b80aea1b2721523e5229087764b4d6a1c9f53488690fa16a11adff4a0040"
-- 
1.9.1


