Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48495.1795411802584411571
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XazwW90y;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so6113815eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411802; x=1796016602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4aziPkAolk/cvy7z1jSle7KSkBPBsr+bitzyfjcKD8=;
        b=XazwW90yjltBNjP8oEbNN9UzDyVtIKkxdDBwPJckTnegO/K6V/ZqwIvCe9F9P08GfH
         TY2xni9AWVFsdgEtoY78xhrXL0sK3qshi7Jn3X6XyE4SZk+AfklRWawjYXbbxMmoPy/y
         97AXbkJbBZ24BWvELMq2wMzAuqPlBMVETbt9ejDy0wTJMoccpxB8rlVEei6AS/34mzOf
         +FKAm94dc006OpxtAt8mDOunZe6iBDZ4Hr1X2weGUcToCMjWJXQOWvUrwKJugkFHOq4y
         kStdl7lxkESziCZfyIYxvqqntQW3CTO/Eg9lcbyfp6C9HJNID99qBQNhT9W5jSUThnyd
         jruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411802; x=1796016602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4aziPkAolk/cvy7z1jSle7KSkBPBsr+bitzyfjcKD8=;
        b=0Pfp8mCpZeBVRPwTRQ8z3Xiih2SZug8NrtYlaFPQ87Pw3lNxotyyk0EKBSf/v7RSta
         yxFeGANQvCRHkwdkkmd5Lw+LlxY3weEOfZg9GAVd2+vz180++dssiB3DFgkByiXX4ORl
         1GLifExAjVwKkW3y2+35BwEWq4R9w2z45g7yQgcS1/8LmvHJEVSZQuYfpKoQ1Zx4tVQS
         gP3gFOzPUEj42GT612ASBEE0QSYgfGVtUAo3ElR0/LnV2J7YUY4XkSVMz0/EJgFA3b3l
         Qgf18LknWrTnEse5OAEmSw2Ar0EyCWK/UzlaAjqsxzAL/6RkmvsaTEgi2iEWIBXpamvH
         Unbg==
X-Gm-Message-State: APuU4Z/HxwPSxrE6+nQ7bP59GUBK9kFlQx8GPNQVNh42OmJ6bpGLBojr
	J5UZugcebILM6z8FeU3gBdXOOqVZzB+s27VjhCgsKnnsUGKVkLrMiPvRPoLAs6/peF8=
X-Gm-Gg: AZFdTZdsPT/A2pPlHlOaXXJXlvA/u5vSv6SGn6/pQGcRKdMPnSdTaniWlY02NlOVOrx
	oa874n2NoYiC7sZ3wIkpdTX0dlSn4C37bZf7t8EOhtkPYqVwjrwjtwbrSw/yMmCk6DnomYHO+5C
	NARTHQijQmse9y09vxPqGx6ccE5DSb4jpwb5Nq3NGOsgn+slkTwJqMY7b7mYA9e67843LTEe1Rg
	2C8XkwMVurkeI/Yz2lAaEhbutCBl52ZINqfo3uaR7u+ykQo+GQ1Zi0o6bYwFzbluhfgho9DN3p7
	id3Pk4qgWNvD1u4StxU8EtLj/Xly9oRRL5sFLFqLOacx0YsJ+XfY5ui7fYp9GMX8uOFX03XA5+K
	uZF2EzBHvi3k4SBOkQGJ983a29jcZ3xHRIPyKnpelj8Koub3xPHm7HxNs2iT83u6ZdCu6N22mXi
	/s3G+Qk0jGmAPaaLvRMeW/t59bUT94UDZmKTzJJ5vggBIFEnZ/FCPzMN++DmplfelwxcRs0Yxlr
	aTI4OE20guPt6srbrHT45tBeRz4DUBy7lCC4bhkpfKYKiSJe/yeB155YRhVSc1wRlHN1EMOfiTE
	dTK7PmH/u/FsUz2yYAyc5YEC/aOvV32rpjyXFD5GqQjw2xmr+ddA+osr3fTQKmH+fYgkFqniOGi
	1i6XeeEiAVSLxFCXR1Z0+97+YN6L5PxYRK7tNgoz5UDyAypj+5G/pE+gI7kVKieXLPzWOPQv8Gp
	XmkJ2qQQggyd6CUHIRjjp1nAQcaMSPD9GzU6rH4Tgtov+3ObqLKUjBLFkdYfrpMW95n4mb5UV77
	js9xQJowXhTTNbLCp468fBgsZ3FRenawEMaDZsSZ1JMby4EwbVcc81IC1Kma839Rdq8ciKK4eH5
	ZB+UXnDbr5ldTcHz1DKgTNihfA==
X-Received: by 2002:a05:7301:6188:10b0:386:9ba8:2864 with SMTP id 5a478bee46e88-3869ba82acfmr6396948eec.0.1795411801814;
        Sun, 22 Nov 2026 21:30:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 1/5] convey: upgrade 50.2 -> 51.0
Date: Sun, 22 Nov 2026 21:28:21 -0800
Message-ID: <20261123052953.3658549-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132792
Content-Type: text/plain; charset="utf-8"

- New layout combining the conversation list and message viewer
- PGP encryption/decryption with Autocrypt support
- Per-sender-address signatures with formatting and images
- Unread filter, list unsubscribe and Reply to List buttons, proper
  spell-check and manual proxy configuration
- Fixes for All Inboxes search, empty drafts, unread counts, mailto:
  handling and rendering of long messages

Upstream tags releases without the -1 suffix now.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../convey/{convey_50.2.bb => convey_51.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-connectivity/convey/{convey_50.2.bb => convey_51.0.bb} (95%)

diff --git a/meta-gnome/recipes-connectivity/convey/convey_50.2.bb b/meta-gnome/recipes-connectivity/convey/convey_51.0.bb
similarity index 95%
rename from meta-gnome/recipes-connectivity/convey/convey_50.2.bb
rename to meta-gnome/recipes-connectivity/convey/convey_51.0.bb
index 2a28f5aef5..0722116b7b 100644
--- a/meta-gnome/recipes-connectivity/convey/convey_50.2.bb
+++ b/meta-gnome/recipes-connectivity/convey/convey_51.0.bb
@@ -32,12 +32,12 @@ DEPENDS = " \
 inherit meson pkgconfig mime-xdg gsettings gtk-icon-cache gobject-introspection gnome-help vala features_check
 
 SRC_URI = " \
-    git://gitlab.gnome.org/donnybeelo/convey.git;protocol=https;branch=main;tag=${PV}-1 \
+    git://gitlab.gnome.org/donnybeelo/convey.git;protocol=https;branch=main;tag=${PV} \
     file://0001-meson-do-not-store-build-paths-in-the-binary.patch \
     file://0002-meson-do-not-check-for-the-iso-xml-files-and-the-C.u.patch \
     file://0003-vala-unit-look-up-g-ir-compiler-with-find_program.patch \
 "
-SRCREV = "2a0b661bf1d7fde57b6dfcb7e09ce33d7b4b9f42"
+SRCREV = "d24c1da859fc9cc2cfb19872b1d8e972d4dc1a20"
 
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data opengl"
 
