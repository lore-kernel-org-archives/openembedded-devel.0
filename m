Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1899B7199C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:12 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p190so13518509wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YuVUWyeIJzXtNossps6WxuNN9h27tbWsEmGgJbPIC6M=;
	b=MJJTsFIBbbhv9w/y4TLD0YxUdG7dbywIQwMZPy/UI7GPtHa7sCSijfccF4TCl4fMQF
	EGscXdcYaGL5aSRzn6dVPzPzLfeO4UiKbDYNQA0rIO0nzSSiB+yWZW5NO50fhFTSAYJr
	NuNYlls/cfBiXB1Uy3rS8N4C9QQJqlg3fyNvE/p9/rWc96vWzywmTp0cY7dkzQQo1g0a
	5bqtjx09H7M4/EhaF7zEqSZ3ViWKMFqsjzQi0D4A+W+4/7d1RrhW3H+gULHt1WeTPIAi
	JJaYN9zIZ2Wdhz4txrGzO7H8XtlkK/f7NESaz3pEuTNqKuq9Z7jwbR8M3JZVYDEraKnJ
	J81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YuVUWyeIJzXtNossps6WxuNN9h27tbWsEmGgJbPIC6M=;
	b=fdM3LNMq9Qm9Or88EaOuEf5R9Qcmete0XV2ZDSM287vt+lEIuKrjG8W53V7zNqF8l/
	lLfVpq0pCtksH5z1LtJfh5KfoDCNQD1/2HMbFikPJK8AZ5F+3/x/PgSz0gIJ2KNlaOc7
	t3jG0kBWnhOwIW1DhFM3zR3YTlP2nxrGRQAt51dC1T1Ro2hBf2ATVxWWz3/Cn9DxRE5E
	NLsI5zL6eKDpFsXf3XFkVRAaBKi/f89BbExRktg0ldmHlNEGGOjmvErxEhB54Gc+FhaH
	BC/SKWRsv8Q2K84Yda8kfMMhaxER1KaHRqML5452NTJOvNsKjO+6i5tH2NOzcD9PBqQz
	UCYw==
X-Gm-Message-State: ABUngvfkd7VfkXHOTAMqrzQIksM/2QrL8LmHlNYfUc+7LytJz01o4fFcx9cfJq0YCy/+Pw==
X-Received: by 10.194.120.38 with SMTP id kz6mr2913002wjb.177.1478470033202;
	Sun, 06 Nov 2016 14:07:13 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:12 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:41 +0100
Message-Id: <1478470013-27247-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/15] xfce4-datetime-plugin: update to 0.7.0
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{xfce4-datetime-plugin_0.6.2.bb => xfce4-datetime-plugin_0.7.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/datetime/{xfce4-datetime-plugin_0.6.2.bb => xfce4-datetime-plugin_0.7.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.6.2.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.6.2.bb
rename to meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.0.bb
index a97ba6c..af38ba5 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.6.2.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "fe604a251eadbc5b0f2b4737b85d92c8"
-SRC_URI[sha256sum] = "9734da671e8d1d7de5fae92093a05d653c9245b838542fb9aff3e10368cc9e2c"
+SRC_URI[md5sum] = "30caaa94c6c267827a31ad69fa472e51"
+SRC_URI[sha256sum] = "297f3077f7aee52a237449fbd8595e232267bc600b5b9e7ddc5baab306ed67b9"
-- 
2.5.5


