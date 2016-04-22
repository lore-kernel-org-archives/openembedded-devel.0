Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4642E6E667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 17:51:40 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id c6so63766395qga.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 10:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y5oaLQx3OColhsfq1GUc3BSAreq9Dncvkub9EAqkBW4=;
	b=L3T5+tK/O7WelYdfrmUqDmz5G/8HoKzEdpizlCX20gX0vbXsRhX5qHh7eFs2bqS8UO
	azhCc6n4OdXNKPjcj2eNaNnZrAcxuHZ+p36zbIweWuH30RnhK08+wFbpmPrpPyIwBRSf
	1unBKH3zwH/fZGag9s+qAOoC+luMoGakX8Z2sB6w/Tze/yW+ASqhFHElCfPSCUlTZUPB
	f9hFw7z53UeZygcCZypUNIfnLGmssPXqrN4vsoubcr0JJlR20RZ/NElF9d/p43pHaANA
	skRhyheESpxiRwuM5pXoWRJrtsyNXStmSFbibT489h6wrLEDeB8YK6NIzN0GvNo37ZZY
	CgKw==
X-Gm-Message-State: AOPr4FV0eCmGWqtevpcx7dk4XmFV3oYkkUv7d2NgmhCOYk6kMU6IqOOuQLUW98/dwSdW+Q==
X-Received: by 10.141.1.138 with SMTP id c132mr23019459qhd.7.1461347501154;
	Fri, 22 Apr 2016 10:51:41 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	201sm2807342qhu.34.2016.04.22.10.51.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 10:51:40 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 13:51:30 -0400
Message-Id: <1461347490-13320-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] libgee: update to the latest stable version (0.18.0)
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
X-List-Received-Date: Fri, 22 Apr 2016 17:51:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/libgee/{libgee_0.16.1.bb => libgee_0.18.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libgee/{libgee_0.16.1.bb => libgee_0.18.0.bb} (83%)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb b/meta-oe/recipes-devtools/libgee/libgee_0.18.0.bb
similarity index 83%
rename from meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
rename to meta-oe/recipes-devtools/libgee/libgee_0.18.0.bb
index bf9705c..3fa9d9f 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.18.0.bb
@@ -20,5 +20,5 @@ do_configure_prepend() {
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
-SRC_URI[md5sum] = "d30cf203784431b0fdc3216b1acd999c"
-SRC_URI[sha256sum] = "d95f8ea8e78f843c71b1958fa2fb445e4a325e4821ec23d0d5108d8170e564a5"
+SRC_URI[md5sum] = "29ea6125e653d7e60b49a9a9544abc96"
+SRC_URI[sha256sum] = "4ad99ef937d071b4883c061df40bfe233f7649d50c354cf81235f180b4244399"
-- 
1.9.1


