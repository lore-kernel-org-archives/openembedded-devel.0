Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE9175E2D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Apr 2016 14:45:44 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id b32so12778361qgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Apr 2016 07:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CKUOMC20MdU30s8Mf3KAEnCbQt5wvo5NmMECzNDkaeU=;
	b=FXLNIJLwHdWc0Nh5AvbSRdRXBPlnrcrBII4+d5nQU4TC/e1nxlpyhIXuC2wdDPEhQ/
	CGbf3bIE8q49JbJy+sTwpKYHHJwNd6pbuQQ24cvAdtry+OcQVPDFHGKaTp2MrkPIUhv0
	daSk6/Ik4ZkJIvCu5z2bMukefzcHtHmtTMtjeTiAt2KIJaspGIF7jUFhV8TXtL41Bqib
	D0QExiJYx4ZUKd/MWPiJCgAvO9gtCYgQeEMBAAixEuK3LgvQHc9rrxl7ZXOfTKpBy2Ff
	QKXQeRlbvTNRdS4lqvyKh8rxYNPY6vyDJ3yAW1LDwQ+eVxiR1443II6BsigSVMy/RgTr
	19hQ==
X-Gm-Message-State: AD7BkJJaN0e6tjTOZvclu9yjrHJhkvaEyhnBt4hVxrPqLQt/5hCiwnY+yB/1fsdxL5KEMQ==
X-Received: by 10.140.227.137 with SMTP id x131mr10112710qhb.7.1459608345481; 
	Sat, 02 Apr 2016 07:45:45 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm8450194qkb.9.2016.04.02.07.45.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 02 Apr 2016 07:45:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Apr 2016 10:45:29 -0400
Message-Id: <1459608329-26531-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459608329-26531-1-git-send-email-derek@asterius.io>
References: <1459608329-26531-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 3/3] libstrictures-perl: update to 2.000002
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
X-List-Received-Date: Sat, 02 Apr 2016 14:45:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{libstrictures-perl_2.000001.bb => libstrictures-perl_2.000002.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libstrictures/{libstrictures-perl_2.000001.bb => libstrictures-perl_2.000002.bb} (92%)

diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000001.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000002.bb
similarity index 92%
rename from meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000001.bb
rename to meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000002.bb
index c1de4e7..11a6e50 100644
--- a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000001.bb
+++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000002.bb
@@ -29,8 +29,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=246;endline=262;md5=43be558cf4f19823cdd6af22135cf5f8"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar.gz"
-SRC_URI[md5sum] = "fb1350b4af50a2f6ba053c1cfd97e920"
-SRC_URI[sha256sum] = "1e738a8ad63ce8c9b447111c8304ae124a3277c2dc17953b4f647581525e20d3"
+SRC_URI[md5sum] = "fb1fada8260992bc85e126c21ffcc6d5"
+SRC_URI[sha256sum] = "130355dcb3afd8c3c8213c24b924e71deb7e1e1197da8f90c5ae191766aa4100"
 
 S = "${WORKDIR}/strictures-${PV}"
 
-- 
1.9.1


