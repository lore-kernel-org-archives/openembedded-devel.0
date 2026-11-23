Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48499.1795411806275161258
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kLh3f2ih;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-380c28f9e35so3961731eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411806; x=1796016606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GnmSO+4edkoO8GnHC+zBbODhP7fDk9usQPfR8HGoH4=;
        b=kLh3f2ih7s/K9YKdXoSVKwAA/JeeMrimiCPwJBa78gbQeHaOtCtaRbioQh0/pN59ZU
         KACH5TMFSHEQJUxKotqU1rL6H/Xo3Dzm2h8hMYwLmCM6rs50ib6yWfWdpEHLEQ4NkzQb
         GPUyzilOxZMlQ+Kdd1I7lUBo+YIKvtdOtlQbiaJL727RJvlXSXh1vb0ggOzg4DlnAiJZ
         MmhXjvXnt79poNz1sfKpfWZoujYbHOg8fPWC5mVNVeVLmBGTO+3nOYQ820OOTsSaj1o8
         OIuSrKajrQgVPFjS+vKyhdWPhPGj/eWLWUIVUsm7qf0CF1f5ZFbgJO+p1Lh4qzKg5rBc
         FFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411806; x=1796016606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4GnmSO+4edkoO8GnHC+zBbODhP7fDk9usQPfR8HGoH4=;
        b=pP5KeZvBAANG+lO1ouEgVVU77EYxeHt5pmP3hwD4/LZWSpJai3CWga82Nbx+RkUKaD
         DuQGF6nEVnNGoq+NoV0SJDGEiIQnTAa26HP6wzuMdeeeFPhGaoHQOpY+ZheSAKa3oLsM
         JCcms8ADDT47VLCxdgzoRie/uPY4o2C6RQD6t4BTbLgdPaqLDPsZSUEI7jeyB+jo1jRh
         yJV99EdrrEsZLxjO7zDvuOcxSLdxqshs8xbVFT9dWNPdwp5hG08WiPIG4IZLzEv6ttzM
         i1lX5evHm/SA4hV16pQ8yeyCXbxZY2OKbWetFBEOIZ8I87+k92/X4TWmNl92iAzOYdA5
         6koA==
X-Gm-Message-State: APuU4Z+9h+8UpHZYAzZWJrTXjmarLOlVmzhmOVVThOImzrJgyp6IIwU9
	mpRwtrUWSrfWEN+729Y29N1qRbhe7iHPfzbgfvquUz6wBMZYUi8/H4dE3guACgfZVNI=
X-Gm-Gg: AZFdTZeIxmyuK10uQ0ac6kNll59/tqsBqODGd2Kzy5BHZdgXs4L14F3p/BI3PSvUVVS
	lPn7bLWIEktQglj7FnSAzRoH935Q/OTviqg/3p4J9VMJnnQt275V2WupaciDKR/G6EVMWoub6mX
	ZAj3VcvQwgKUKfOErH2ZmT5ncEGTog92QwAWh0Nf+opDx0FccDuxkIqaGVcGUAkuM3/T7ObobEg
	c8qRTY+f47QsPgud0LBPIYs87WE1gQMx7cRByOfM0+WMQLFQHYrBUjH2Au2M8dmGaN0hJYfZx5X
	YejZRTfu8AxqSN0G7sgbZl2AxG6NEcS/b0b569oIw8GEBJnC4UaTMz/Tat++6C6dHNvA2tfmMIy
	Yxwfm4H0lCuRu3jFXJ3ZwpvLIuw6ux6I8xquhnQRQa6wDZeZ8pbwS0iqTw7Rg7e/DHFEQQqGNmn
	B6PvpXrb/i0/YGyFLuQBmw5capYh0Ij3CmgmkWkRoHLNEVlly4m9vfL0TAoqj7T1smmkw1FhMHj
	pKyviPGn8DhHBY1rrDoFKoDtRZce9QeNSQ3tTKwV+CEDc09cdknOankTWbEoed1/QlSHN2Q2pOf
	puDq9DoBl4FJ4GY5zsFloM+ZT+OD0hHCnpt+v8KSZaWEcYqN2N+f+gvmEYX9L6HP9Jz5xIwoQvE
	oC9yW3vzDXh8JNfnJnZuSWeIfH624DRtkGMwLIzBTUlajDeYlQJSqOiDnYEIeiGYiQDu5jhkUec
	o4TfMnfRsq4GeFvo7soKRfACltouQgVM9yKSsM+YVtt3Yg5IraklSGRtDK64C4G/F26dkJ6WUBh
	orVoXgL/wFNQpnBCe6R0AUaobIcqhjFBwwmDiWtSG+uzeak/5Ca4gbCv7On4bKS6nekZzI8iiD2
	6XSZ
X-Received: by 2002:a05:7300:6b0a:b0:382:75b5:e77 with SMTP id 5a478bee46e88-384b4a80eeemr12982851eec.25.1795411805515;
        Sun, 22 Nov 2026 21:30:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 4/5] gthumb: upgrade 4.0.2 -> 4.0.3
Date: Sun, 22 Nov 2026 21:28:24 -0800
Message-ID: <20261123052953.3658549-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132795
Content-Type: text/plain; charset="utf-8"

Browser and viewer now show the selections a file belongs to. Bug
fixes: keep a custom zoom when changing image, allow renaming files in
writable locations, and fix sorting when compared values are equal.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-gnome/gthumb/{gthumb_4.0.2.bb => gthumb_4.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gthumb/{gthumb_4.0.2.bb => gthumb_4.0.3.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.2.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.3.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gthumb/gthumb_4.0.2.bb
rename to meta-gnome/recipes-gnome/gthumb/gthumb_4.0.3.bb
index 5323451ef6..16432b0506 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.2.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.3.bb
@@ -34,6 +34,6 @@ inherit gnomebase gsettings gtk-icon-cache mime-xdg vala features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI += "file://0001-util.h-Include-stdbool.h-for-bool.patch"
-SRC_URI[archive.sha256sum] = "13cd9d6ce111262c25f4ff325bf36e9b806eec2d9b50be3c459cc2e69d4bbf69"
+SRC_URI[archive.sha256sum] = "37d17c8eab0010b001d7a6cda776d81c73fb169abc28f9a930e0afc57ac8978d"
 
 FILES:${PN} += "${datadir}/metainfo"
