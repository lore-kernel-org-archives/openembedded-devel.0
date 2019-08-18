Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 72B0C7F278
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:33:45 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c3so6713508wrd.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rZUT4t0I3+cYPk6JsJDl9TzVi94mqKx+Oy/F0aeBr/s=;
	b=EMMW4egLojXc+7IKurcTvRf0qU+2tS6dpmq30RW6ZQ6KFUbkWw5aVk6twWBHlda76F
	y8vZHVTqo+aGKCQV3/2kEvKBW+1UwnThbUE3r/C5NFS6VRSy67yqWWuUdRb7rAcXbmF4
	ocknP+YagyCFGxeuh4MtkQwb3LKuu6nfR/uYkz0DpU8tXB+1+4ajOdQfQq5b+ak1niRm
	K/MsAi/+PqqlJKW4IrcNSrtcYpuxnEFbOjLfKqoMP/T7YbQCda86sLrIQq2AsGPklc5h
	d25V68U5+gG+u1Sxn9pGybKSpxzTbnA2dp1+CopMwbr15SpzGbae4Sz1dwU66x/tBe2k
	1n4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rZUT4t0I3+cYPk6JsJDl9TzVi94mqKx+Oy/F0aeBr/s=;
	b=kKFWFaT+6+5lz/RxND2J57ZHyxscOnQtaQ5YjnioM5gEIMVcvjpuC6yFTMJKGEfeks
	zV06Tyto4aLSFLM4VbajeRy8J9/N2N8//Z8vnQCxYIu+GwlC3LXlE8hdbAy56UhCAtZX
	F6edXUKoxwR/+IMDLAjQNTKbKhtnMQcmKvz+V9A85O8Td4KxCa+WTs4FiZCbFcpSIM5k
	bhe3/rI5YpFGMAkY64wSE/nf0s8an+gv9DW3JMQihru5UO5Zf2E3ro4JVpnVzfIp3e52
	gD4fXH4P6pdH+Nm1TakLLA5kw+UHbfzYTN/8lLTtMiUnSto6r7z3wP6qqM379brO4rz/
	Wisw==
X-Gm-Message-State: APjAAAUVhGd/PGyLQwMnxYlrZA0H1xvoDqwtqrtfLNq2X9elzrkmghdK
	PLi2ON9VbuZuD6PPOInxK/f65O7s
X-Google-Smtp-Source: APXvYqzsynQ1XmgOx8K7QR80WGpE7cPrJAVltIByBZQkN6ltDGlAncvRJbsdCxLvDbWI5+09+o0eDQ==
X-Received: by 2002:a5d:424d:: with SMTP id s13mr24003970wrr.178.1566167625894;
	Sun, 18 Aug 2019 15:33:45 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8718C84C5511B02F056F.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8718:c84c:5511:b02f:56f])
	by smtp.gmail.com with ESMTPSA id
	k124sm30390814wmk.47.2019.08.18.15.33.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 15:33:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 00:33:16 +0200
Message-Id: <20190818223316.19772-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818223316.19772-1-schnitzeltony@gmail.com>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 10/10] gigolo: upgrade 0.4.2 -> 0.5.0
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
X-List-Received-Date: Sun, 18 Aug 2019 22:33:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Frome release announcements:

* Stable GTK+3 release to go along Xfce 4.14
* Migrate gvfs commands to gio
* Updated translations

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gigolo/{gigolo_0.4.2.bb => gigolo_0.5.0.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/gigolo/{gigolo_0.4.2.bb => gigolo_0.5.0.bb} (54%)

diff --git a/meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.0.bb
similarity index 54%
rename from meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb
rename to meta-xfce/recipes-apps/gigolo/gigolo_0.5.0.bb
index c846e7802..4446214f8 100644
--- a/meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb
+++ b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.0.bb
@@ -3,9 +3,9 @@ SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "gtk+ intltool-native xfce4-dev-tools-native"
+DEPENDS = "gtk+3 intltool-native xfce4-dev-tools-native"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "4abc6fde56572adf3ec3a0181092584c"
-SRC_URI[sha256sum] = "553fc78fe4e7bd2f01f3851baea7e63f6414fe652dfb4b08c60b5c4b2b909164"
+SRC_URI[md5sum] = "273111f5d7c26898e5ddea7b97d5dfe1"
+SRC_URI[sha256sum] = "97a301aff012a143d0b99e7ecbb27084d3872aa203a74745e8357aab3a1880dc"
-- 
2.21.0


