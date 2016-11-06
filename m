Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 072CD71A8D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a20so2687574wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WTpG6Tm+fPX5aJOK9+2VPZ6QnZJ4HWYnfMMx8taANEQ=;
	b=v+eHYO4VBq8BsDt/ZuAyrHxGY/FtItGeL99N0Hhh875JvHApDSt/1dklFaWMmXB0KS
	sw91jSsRPNQUgywTz+gUbkiLUc3P6Sz5IUghLK+adFntXZZGmy4l1KRYm6QgMXTdNd9J
	9iB0I/LUh5FH+w3TZ2WweirfiA7W7KI/0wF75jzjD3q1U9Cc6rGEkAG3OKkVEU1HkGGh
	WBSQOBdgAVan83V5izqV7SMNerQhPL3zFlIUiJkgqrn3d+nh3HGIRdemAyjZyMbkpTGV
	BjkW7q78N9xE3zAL7aUIISTQ3jwWhfH8g+UBlahjCSfo8lvmbNkLRwqwpz2DZLPLwpLF
	8Gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WTpG6Tm+fPX5aJOK9+2VPZ6QnZJ4HWYnfMMx8taANEQ=;
	b=hsaui8pXei5DrDzyzBsWab6uecNoq1EzAm9FNOVbnpXPZx04q2FvpntEQ18klPu/gi
	SyqW6RTQ6E61l1wT1aiJTRhj0YmGIs23FJA8JXwegR9TOPYhy6ufdoeMq1sdpApSu/Na
	6a2m3odDmJN+Y2XzBLSL2Nhyv1g2PQtAi93OsUyX7eIork34GiZ29cBNlqYJvPQ40eP5
	joIu73jcxfbZ+751MW2zINRVAXtFfJktT5/n/RK2CDN6Ae4lGlRmWTNd2FyW6n0zQMKF
	slSP5nW42ntHWkCmHErUEyAXAqNCvGcjagc406cMNCAGsbIGqzx/9t4+y3KGwpoKq4nJ
	6jow==
X-Gm-Message-State: ABUngvfBa1KRfd1Opydz1c3LdFhffBdvA+KjMcRHgUffScmhdUrfKKM1HX96eNs9yWwHlA==
X-Received: by 10.194.29.161 with SMTP id l1mr2920265wjh.97.1478470036987;
	Sun, 06 Nov 2016 14:07:16 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:46 +0100
Message-Id: <1478470013-27247-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/15] xfce4-smartbookmark-plugin: update to 0.5.0
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...rtbookmark-plugin_0.4.6.bb => xfce4-smartbookmark-plugin_0.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/smartbookmark/{xfce4-smartbookmark-plugin_0.4.6.bb => xfce4-smartbookmark-plugin_0.5.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.4.6.bb b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.4.6.bb
rename to meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.0.bb
index 3f47f06..6289ad3 100644
--- a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.4.6.bb
+++ b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "01b7735d4d9ab0150d4ddd3becb94d5f"
-SRC_URI[sha256sum] = "3bed2b322cd39ce5845d6da07938c702260f3f1a9700b690ef377fba752ba24f"
+SRC_URI[md5sum] = "6f242fe584ee2fdd2b1d3d69ef3d5914"
+SRC_URI[sha256sum] = "139539c58d54d878de86ef8a882c793cd909981e6b888f7f9d5e230a8fe310a4"
-- 
2.5.5


