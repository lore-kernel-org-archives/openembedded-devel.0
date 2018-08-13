Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id E0F2578F32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:14 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id j8-v6so7346035pff.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=clox3yf/XK5h2w9G0FNDG7flXcb+oIoT+EOMi4Sb+Is=;
	b=JQ+mt3DRK/aFKEQrWgdfaWYewOXn1Ljr/wjDzNfeXvRcFVnlAcDg3cTDUPPk2H/zKS
	A2gG0hWNP90A57LADZmzN+rHdJzXxc5oh9hCCDYxaQaa8RuozPWchx7WeC0gfcEW+6Aq
	KVRlbvZ6QVGVFW+tdz3UZScx4YklNGqDq9z0HEt2GEELBy9wBYWG0PIWz5ig1gkoedOx
	mJAPi/WzqPVg4CbXZ9XcCWRy2LkRE3bsnlAf9skxDqpveg7HwYN3P43Ldr9XyRKhoOpw
	cc4NbGS21tHY9KGN0ZZICx0ESZAw2jpydXwlMpaOc/oh6nk+iZpEuLtbRXUT2i8bn8tc
	5FxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=clox3yf/XK5h2w9G0FNDG7flXcb+oIoT+EOMi4Sb+Is=;
	b=TbgMra/Y6PHTM5zyJGa6uYtxLa+mBTnThoj71ExWVKrjJCdib1yFbmdhq05Qm0JUpA
	xr8+yhlKgOkV2IT6evXWGEA2RsQJ9Ti8OlRvjSuu3dD+/izY+01E3R4Ex3kEUXtyc/VW
	t1lXT4tttpwmUl3VJLzV+VirWBJUNocKFPmxt0Fv79JF8Cieb2eDuUmripkGPF+d325j
	lozcjqGONmOFKajtmaDpUtE3WktnZuBYbrMjfxSOszxTWGhVE6EhJ19Xf7v44Jys7Upu
	772S8A3l8lWsQcSkAFrj0DEP/PlKFGqAVE0sLc7CHy9utSUplTlhESmme9Y/a3GCJDn8
	g3jQ==
X-Gm-Message-State: AOUpUlH+P/o4OshgKlOv15pL0SU26mhRuhQ2q+lpxDUE3v++fr/GJeHC
	FDcO7C8trSvEQK2MAys1GjbXd+T7
X-Google-Smtp-Source: AA+uWPxTGaJBSIrqhbpDqAXPRYLgq1MBE1TXIe3qLo8DbHJgBzHMs5kf9LQyzW1c0gq4AfkGX49Qmw==
X-Received: by 2002:aa7:84c2:: with SMTP id
	x2-v6mr10559823pfn.220.1534148295529; 
	Mon, 13 Aug 2018 01:18:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:41 -0700
Message-Id: <20180813081742.6961-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 20/21] nginx: Upgrade to 1.15.2
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
X-List-Received-Date: Mon, 13 Aug 2018 08:18:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.15.2.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.2.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb
deleted file mode 100644
index de229605ee..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
-
-SRC_URI[md5sum] = "2d856aca3dfe1d32e3c9f8c4cac0cc95"
-SRC_URI[sha256sum] = "5d15becbf69aba1fe33f8d416d97edd95ea8919ea9ac519eff9bafebb6022cb5"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.2.bb
new file mode 100644
index 0000000000..3694f5b586
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.15.2.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
+
+SRC_URI[md5sum] = "d063f746d3dc4298aed9c518f1684166"
+SRC_URI[sha256sum] = "eeba09aecfbe8277ac33a5a2486ec2d6731739f3c1c701b42a0c3784af67ad90"
-- 
2.18.0


