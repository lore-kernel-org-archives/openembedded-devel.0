Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11796.1795762952958841169
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KDJ7MGDU;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b546061d58so18010421c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762952; x=1796367752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMsYXvpv3fUTy9ZDrMt3rzMs84zjpP53aifiVbHPTIE=;
        b=KDJ7MGDUuZKezNL6XYWSmaPiGCz+d1/1xPFYu/amqj57fjGKLTkc5H1dJFoetSXZ0I
         Wj+rUuZJvIi4/rzYiBZL/cOBXHr+r8kDY1VID5zPe/MiDFKUdx0Wf8tI6iv8Sp+o5RDa
         q0cUGnKHsX7GREAjc8s5wTSTCRrBXFgIuCnRKA6XbIazP6ZddypNKKEKQJM8zvNQT3LV
         aTPbt74N9cn1M8YIlTvToKmnI/sbrooPYJ6PujQf3EydQ48TmlRCT0vG5qfGzG2Ve0gO
         jEgaTIR+zbnfE5VG66ejtyG/SxxC1abJyrBOlf+1MeNwdKEq0TWU3Nfne7WipHYoAR76
         6g/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762952; x=1796367752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMsYXvpv3fUTy9ZDrMt3rzMs84zjpP53aifiVbHPTIE=;
        b=ZPJj4coC+L0XOIArTESrYgqVHN7wuCKYUyLRYt8REas4v2l6yK6B5ezex7JnajL7fu
         CHOWRsZTiAsGqFpZmyL8uLU53p5k0R6/F6TgPShdBjsZw4TuHNvsaYASaERq+EKEiamB
         JG6x5GLc7kD6K+hJW0DYp4GfBKWy1QBbFhDJouLAJGkeNxgmbZxVCVUuyAF+Adc7G/1h
         qlYeRA3HBnPNpu62aCgEx9vdEHqCp2qmWoh1qo3AnRziupS0GqsW1n4SDJph6YX0ieB7
         ZSZr1pio4AhoCnD4xZUuyP0NWP5jtmusmXx2CrMGiHSoGVvQd6Q8l3e7q21ijqREOugg
         Iw5g==
X-Gm-Message-State: APuU4Z+Z53rpcJ4kSMjH6QywIw7jbz0cotrBnk8tJ9ARUdyNqAA9YGsJ
	ZtARLVUY8uDwhUKWCW7+oBAQZ4z/4fR+BSK4K43RwQMre5BRO7xfZLQWDj2WYDhB
X-Gm-Gg: AZFdTZdwQckAML24pTHklAY/mxuA8M5KEeGyK9f0u3o5vBG1cQ6NTvkMzCswiN0/qtv
	IFtUVW1v/FYJXu4xJpBT3emiRtAG/5rIekH7nX94Acsd1lo+AoRtYyiNY2/vR5T745BscufSm6/
	PZ+3bEVAJbBFCbe22kWpzBywR31b1YG+xj7VtyWEZfdyyxZsY1XpPDBs9wsJAOSY8S4DJYYxBGK
	o8VotJIV2XdJ4bIRVFLslmNQ5FHF5HFWA3JbWCxpT+Tu1kNtHdeasenkETbCXwZhK8vStNTBYRm
	N2Gfztfb7WSSfXGEkCAjvuDmRsG9vFyivUOSFthkVTqva2139oFUucPus/Z8pkG3dYs81bkqeYm
	SvtCbOx8qCjl/5+9Ycl0MGYrbAN4OOlKXQV/5xJMWOtujpWV8ZNe79UTFNreG0pBdfI8VoVWuue
	p7Yi6NtpDOyKrtXu96FuobYCPxQQsXQqhJU34I0bblCb5s4Do5g5NyuCCbSp98kdgDFaw9FB2S+
	/75AJu/IhzjDuHbgG0N+aasrtNgC7UwQKXwx7R+ccGHpXjyfBKHkQ6cSdcp2Ef++CCQiZnOIr2q
	dn7Ac1lQ/KkA9KVVQLOR7RDEGNjxY2H+JQ0MD444a/UOtyYlEuOC+on/PmOYmGEOVCDU0ZAQ2GC
	IGtpgfNI89PvBpfBKHuv2jOrNsEZljZGIhkPl0igDLxi2UilJItjLKpaGKjKTP/WrBHaoeiWD6K
	aLXR0esrv1ZpbGUI1JbX0B3iqW3QTnyk5BWF2ZcsOIi15WH9E8NzeweWHCwo6fZJF5jdw4IcimH
	ImrnHMz/dnIR95eKDwUs+zezXTxuuEvlpaWa5TMgQd1HTJ78Wc0hfH567DsdNXk4ns/WdlcDAl7
	KtGC
X-Received: by 2002:a05:7022:92a:b0:143:26eb:18e9 with SMTP id a92af1059eb24-1b5568eb4dfmr32809403c88.28.1795762952278;
        Thu, 26 Nov 2026 23:02:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 16/21] nautilus: upgrade 51.1 -> 51.2
Date: Thu, 26 Nov 2026 23:02:04 -0800
Message-ID: <20261127070211.2329979-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133343
Content-Type: text/plain; charset="utf-8"

Bug fixes, among them a stack buffer overflow when dropping text, a
use-after-free when opening a regular file location, crashes in the
file chooser portal, and use of the file-chooser portal directly. Also
treats webp and jpeg xl as pictures for search.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../nautilus/{nautilus_51.1.bb => nautilus_51.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_51.1.bb => nautilus_51.2.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_51.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_51.2.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_51.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_51.2.bb
index 14b0b0668c..047dd7847a 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_51.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_51.2.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "a703bc152d18d161d9dab957e2390a36e6246bb5c24de7b15c9624fcfa2f2816"
+SRC_URI[archive.sha256sum] = "11e3784441cd59a4696b47ed458dddaacf5b1b616f71686d6738fdbaa4809db1"
 
 REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
