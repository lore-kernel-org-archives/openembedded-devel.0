Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1086771ABE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:47:47 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n189so9016232qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 09:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=InuOwxk9G6/GothE3RnBuQ2ZwpelZQsxvCBG2ReMFH4=;
	b=LndhYMwOZu91XawGWODxKps5lhWILGZ8/jYCbZ7VFM9rHJWeXaWBaxItfsuQcOaDeO
	INTq9Ca0XPdT0W8EgCU5+Gsy8KTnjtkEEQwDaCHKw7UmQXl78saE4LQlz/ubJXqu8GCz
	Q0iHi3WH6digEkCYrKNQyymPu6dfdCBjOzcPIQLdSKiO0jf42hH5lLMBl8QNjVh9GcC7
	lEWuKv5DH02NKyhksVvIE31uwnoogAhLqRuGWuS6zSzDk5Kc3cwakB5TjlPr4P/e1uCN
	fL0UShJv0ZWQXpuODKf/tP4QnC1lwuSu76n9IU0mwkIhbHtf2Kxq9FzPsO2zWq08WZT9
	K4+g==
X-Gm-Message-State: AA6/9RmPE2ZsGzlAIGXEKWYqxz490nXxw/qaeGW5d24CA3PuV2UuDb1KMEIHACu6dU7zeg==
X-Received: by 10.55.80.136 with SMTP id e130mr12195628qkb.119.1476463669102; 
	Fri, 14 Oct 2016 09:47:49 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id b12sm7466360qta.4.2016.10.14.09.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Oct 2016 09:47:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2016 12:47:34 -0400
Message-Id: <1476463654-15349-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] mpich: update to version 3.2
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
X-List-Received-Date: Fri, 14 Oct 2016 16:47:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/mpich/{mpich_3.1.1.bb => mpich_3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_3.1.1.bb => mpich_3.2.bb} (86%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
similarity index 86%
rename from meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
rename to meta-oe/recipes-devtools/mpich/mpich_3.2.bb
index 1dee6bd..4537a66 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
@@ -9,8 +9,8 @@ SRC_URI = " \
     http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "40dc408b1e03cc36d80209baaa2d32b7"
-SRC_URI[sha256sum] = "455ccfaf4ec724d2cf5d8bff1f3d26a958ad196121e7ea26504fd3018757652d"
+SRC_URI[md5sum] = "f414cfa77099cd1fa1a5ae4e22db508a"
+SRC_URI[sha256sum] = "0778679a6b693d7b7caff37ff9d2856dc2bfc51318bf8373859bfa74253da3dc"
 
 CACHED_CONFIGUREVARS += "BASH_SHELL=${base_bindir}/bash"
 
-- 
2.7.4


