Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8924071A4F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a20so2687444wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ld3lpS3SOgTqWjAUnIXnyi/NmIFOZS+kW9iZ8/iNstU=;
	b=TPMrgwF3nzE0+6TOXz4rKaIXp4awvwPq2PCgqGrfLYWJEZ09T0Ov93o/+VhWzX/3Ja
	MsTQW4s4W39F3KowzvOjbkThHAPvUyQwRz6qeMW60+/m25WaE7RgYZ18S9jkttm2qwL8
	l5aFOWMNhhy+MGeFnT/2JOe0UXcTNm59PQkxVWeiFEKALjkN/6aUR9oCZs8fDtPmEB7t
	IUEJN6rjvpwXo8Z/FKyTs5POJeOjF51dP2kb8f44GE17stu9mmaHylxVRqWjOJj10NKA
	XUzRY7YCYtq94KItMVAMJIr0cZX8bM2qU/3f2PkEhEIPNOjVQSp3h9umLpNbq4dS4/JB
	CgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ld3lpS3SOgTqWjAUnIXnyi/NmIFOZS+kW9iZ8/iNstU=;
	b=Occe70yKQTgTG491p3tJWdT+z2JWME5tsBYHfwO5BE6l5ptokv4yUEyswgtE/IRGMn
	ZrKlhsFj8AnZS2EGT+xSjyvjUcAVwCVydy7M/Q36gvWuXcs+0Ga1zqkOrxTkqJLDD7af
	KoisLTz7Emb7dal6zW8Y+IQ56W7mXAWR+jyIdY+eGfTvQ9s8j69VqPmW4SaeJgjfT7EL
	L/QwAruDc2Gzn3RTd2Cm6yta1hnHC03W/ME04NiwBclaA6jlFjFi+HTX8bhV8+EHG81i
	bR71f5G7XXL6PT+wkIW5XpHUOyrodJNakPL0U4yK5xO1euqJrPYcdYEBwKcm+mtE1zRQ
	Fepg==
X-Gm-Message-State: ABUngvfl95BCr0kikV7zkZOfPkJfzzOvnWmiKGr290FaB16p2DtebNXpMe9kX2jL7wlFJA==
X-Received: by 10.194.250.1 with SMTP id yy1mr2829740wjc.219.1478470033858;
	Sun, 06 Nov 2016 14:07:13 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:42 +0100
Message-Id: <1478470013-27247-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/15] xfce4-diskperf-plugin: update to 2.6.0
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{xfce4-diskperf-plugin_2.5.5.bb => xfce4-diskperf-plugin_2.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.5.5.bb => xfce4-diskperf-plugin_2.6.0.bb} (65%)

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.5.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.0.bb
similarity index 65%
rename from meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.5.bb
rename to meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.0.bb
index 801699c..31845e6 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.5.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "199e4365cb3a1fcd5f6164044aedba17"
-SRC_URI[sha256sum] = "cbeb0c00f97362eef3f135afb77947aef73e938bae0386250a122ac6644b521b"
+SRC_URI[md5sum] = "fdb061b5dee6efe04b14d10c166727b0"
+SRC_URI[sha256sum] = "4897f34ccd8c3d050f8d2d95652af6ab740a670a108bf01f582945779305900e"
-- 
2.5.5


