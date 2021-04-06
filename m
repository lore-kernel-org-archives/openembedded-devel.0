Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.1344.1617734558313696086
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 11:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hGOCGihk;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id u21so23534355ejo.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 11:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kxMUZ1TbgKteWv1vijuhAmC81uDkI6Msi0X/7DD0MHU=;
        b=hGOCGihkU6uURjkd7q//YDeQchbU7N+kSdV6Nj8kJgP00E0qR1QJDuGzW8NWxeusB1
         /wfzem5v2rkxWge/5Xfsg6Z7ByrgUa+tkrcoAM3Qo/Mzf457nq7rhpdX0rHlnKMOg0gC
         DUN7HpnF5oD+aj0dV+9QChoWRAX8dYekVyivekU5IE1GQKhPcKB1C8WoYvsBkHcDJCZH
         /oq+lh+e3dtclfbIY9RdqwVOtVdqUf5OorlDbni5zDSksQpdh/oNTM0qDULXA3BruAVd
         2dRcyDOKlFQxWmfWT8hh+HUwheCURzPG/y4EmnUarDyAewsKmgGHeddHvWz7SiWz7PLa
         nKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxMUZ1TbgKteWv1vijuhAmC81uDkI6Msi0X/7DD0MHU=;
        b=KyDlJdBDxqyWzUjUAVjDkxqWVSfFho4ZIHsAuoHze9IHwc1n7yxE8SVh7/gQnrFB+U
         xaxFMqKPMGHgpOBCF44Fb2NQ4tj1ef7AH5/CsqEJk4xOtYny++/b/JtEKPCX9PSjvDhB
         xhhSxn26J4a+RQJpoXdj/aUFTDC0gHMRWrPKAvfHibKb3514xXy7y9GJJD/vOEFQKEP8
         3xENdm4PupOMOsFKEmvEfL9fEpYxDiNS4MdjpIeI5KSDwRMtLCmFF6LhFk2jKIv6cNHd
         VjLly+os5vkVu8PlzLUmDhAdsTHLfAOY9xuKX6Svgoar7cTEEfSClxlcpEk+br0BSoqw
         V6Hg==
X-Gm-Message-State: AOAM532WKQZ1j96dZrepc94QvfK8IIu70EWbalMOKpNOwWF/HqhmB/T8
	ePmpSTG+JPUvBSM5EfFsHPCYKwDH4Rg=
X-Google-Smtp-Source: ABdhPJzAtXJ3bLmrqYkioiYK6hZGr97mHOX88nSPc8jk825AamZ9/9R4SV8iusOKtKs1DNoFPQNHqg==
X-Received: by 2002:a17:906:ff46:: with SMTP id zo6mr1197091ejb.123.1617734556772;
        Tue, 06 Apr 2021 11:42:36 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k26sm6248440ejc.23.2021.04.06.11.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 11:42:36 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][gatesgarth][PATCH 2/3] telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
Date: Tue,  6 Apr 2021 20:42:32 +0200
Message-Id: <20210406184233.1585138-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406184233.1585138-1-Martin.Jansa@gmail.com>
References: <20210406184233.1585138-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
index 2b05c61a0d..4d4e841f62 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
 inherit autotools pkgconfig gettext gobject-introspection vala
 
-EXTRA_OECONF = "--enable-vala-bindings"
+# Respect GI_DATA_ENABLED value when enabling vala-bindings:
+# configure: error: GObject-Introspection must be enabled for Vala bindings
+EXTRA_OECONF = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-vala-bindings', '--disable-vala-bindings', d)}"
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
-- 
2.30.2

