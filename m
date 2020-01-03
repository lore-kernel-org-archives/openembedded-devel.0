Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id C0FB57F9B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:44 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id c13so18545013pls.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IHqdvjNlFRnUSguux/U4B8B23MWW3RbKsTacKvd6Kno=;
	b=kUuMBYJLpsArRhM9oAnXG9FQC8OES+JBDzroIocxHXyX/VVPrvbAxVJ0E/bdv1ccBn
	61xX9UDkdPuoAvO/yyMjcbiWKnTsogKHC8WCEy1Z3dS4h61xx0VdarR8jAsPbKxjGpGe
	XaEl1VHe+GgltRw3Oj7S+C29ctfodoH5CePCFAjixnqAVXAyIrlyKfXBYu/IK9MdgDyE
	TXhwK7BNsUFbKIMWOj5eP897obF7DemIe968AqJnlqDB+Lt07xewrsM2AiZtHk4UfqWn
	2rVYvlDWRxZdmHSF9lAubxoKWu/nJWtyyp47ijakA5LAuPvZNOV8aIEuc8OP/dcqu55f
	i1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IHqdvjNlFRnUSguux/U4B8B23MWW3RbKsTacKvd6Kno=;
	b=M/Coj1BIqQ6VD2Xnk7ABk3YuyzbXp5EtnUlGi4ziXugFAku8lQ7xMxFW80lndoX+gL
	0w8x3TZGHe7QyHGIjD+3qdTXPzBmKPTp5w4VkxrzOK+OPYVfzhJhQu3roEwxrEVGzf2E
	+hNRX2CRfPzpeNUuVo/MhXRBvIjYzjyavmBZoOSsiFolkQ6h3S0TzjV8tu8GfzWW4VcC
	GmMe9xDVUe7VDX5EuVbb4yUykPTHR4t4peW+qfPYRoqLWYFVg+/Wyo1p/MC/GWy9bst4
	TdJsnnhlfbaAn14ITdnUrQEnA4VE1PnksXI7sDS+tCFITTXUO7IaNDpOLlrnOK2ofscP
	+e6A==
X-Gm-Message-State: APjAAAUhwxYwtDnJttxUNJbNaYYQ2eiZcomKrGtJ1bPFztod/wDIYksV
	0JXPsxkWurmV33vgxgRPnwG8pMezibs=
X-Google-Smtp-Source: APXvYqyzSKFv9XONzQ94qdzaLwygiBXhUkDcDSK4RiVwBaNWgVzJoXBp8BBhxIr3op+3mvfuoK9avw==
X-Received: by 2002:a17:902:9f91:: with SMTP id
	g17mr87294354plq.179.1578019785746; 
	Thu, 02 Jan 2020 18:49:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:14 -0800
Message-Id: <753d1860659d1b36582e1814e9d3fd610ed2d398.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 17/17] libqmi: Upgrade 1.24.0 -> 1.24.2
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:45 -0000

From: Adrian Bunk <bunk@stusta.de>

This is a bugfix release on the 1.24 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libqmi/{libqmi_1.24.0.bb => libqmi_1.24.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.0.bb => libqmi_1.24.2.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb
index 9b89e1dd8e3..35a58d2f1d4 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "4b181c0a8b933226ce3dce09565fe8f8"
-SRC_URI[sha256sum] = "aeb69f90c273467cce246176cba0967c6413f1995a976992770a597c4fe28c79"
+SRC_URI[md5sum] = "e49c419112d708b5301af7ccc2c090ff"
+SRC_URI[sha256sum] = "4ae4e476f960dbc0d04b1c0368776eb78edffd4421f3e4c074bb2bfb6375b282"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.17.1


