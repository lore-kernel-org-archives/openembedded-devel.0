Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7349F7CE5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:17:47 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id z26so1929191wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/y596nlKeIodhMp23+hqCjhmYOa5+W7/ql4U/lrgWXQ=;
	b=LkexfCIbX8OQScV0JF7JT+julSevpo92Vp2lCUHqWcbYXMeyy/9yudJ9DGnzyanlLg
	SWM4NeLa2vPJMGPpZH7v0UzuPtkRQoR7/ZOJLilHY56/M1Df2e5Z04Zq4bPSHjfOPL1N
	hVbhjIfIRUPtI87B9RErpHYgGzd5z2J/JdqpUcqsjTMJEZ/OtiQi2lbV1+a1wcUs2Teh
	vM4UN3YdKMu+puK+HYhHxusc5d39DmiaJvKJ6fIHBU2aVWri63FosBf90HrhIVQa6EzX
	+YrrUsvez1a1Y/iq1yF2Pi6ag+w7vdyNR+ovBH8kgtsIDalgRTAH0Av9U0qUpUyMRcla
	AUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/y596nlKeIodhMp23+hqCjhmYOa5+W7/ql4U/lrgWXQ=;
	b=sOeNAtUQ6YlIxZASF/aezCxznSaJDIjeNqgA68bssGczR2We7dvR3ZosTkSGPRdkAm
	/CEfz/VccS0WAKJVIzfXP1Eu4bz5HWwxrGus1OYrdR1/Vi9lAHKmAYCAL3E3pFpaLHBy
	KwJq+6teyBlgAN72zARE9PctcGEEmZtBalMKCSVxaHLaO2occ0kXOwzKn4wWS0CkkCBO
	DpWd8kQ+zzt/LJcCQmYv3iBCu44oiNdVQzkp+roicVtc+Y8IUgPEGwjzp+Q/MACFq6dq
	ZslnjDnFzkKW4hWgdNGECJN4zF/+ykEgVxlxJxy3n6vSAU4I542I4dtTMneesFt7nDWd
	75sQ==
X-Gm-Message-State: APjAAAX7uhh+dJTMtr7Ci5ZUOmyRp4kerPvXbi6uXsv0Y5frSt1EWy3k
	NpIhzG4p4qHbnbaKIr3ST0Kn5koE
X-Google-Smtp-Source: APXvYqyFeGFdEO7PftdsAzzU8hG9EHGrpwXwQ/0BhKcC7X31+GSALhr1NlVN8xQcMYJqEOJ5sEnq8Q==
X-Received: by 2002:a7b:cae2:: with SMTP id t2mr3442322wml.161.1574147867928; 
	Mon, 18 Nov 2019 23:17:47 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB657F29A81DEDF319DFC.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b657:f29a:81de:df31:9dfc])
	by smtp.gmail.com with ESMTPSA id
	b1sm24480182wrs.74.2019.11.18.23.17.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 23:17:47 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 08:17:29 +0100
Message-Id: <20191119071730.2682-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119071730.2682-1-schnitzeltony@gmail.com>
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] gnome-terminal: add gsettings to inherit
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
X-List-Received-Date: Tue, 19 Nov 2019 07:17:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
index ffbabbf88..ba9a79d89 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.GFDL;md5=a22d0be1ce2284b67950a4d1673dd1b0 \
 "
 
-inherit gnomebase gnome-help gettext itstool upstream-version-is-even
+inherit gnomebase gsettings gnome-help gettext itstool upstream-version-is-even
 
 DEPENDS = " \
     glib-2.0-native \
-- 
2.21.0


