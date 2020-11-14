Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.10177.1605380667937669627
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 11:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YZcc89Ah;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id w4so9454609pgg.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 11:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wb7T+zsRxpVsrqmYkFgKYjTNaQ9+q3BROfnNl3dSKco=;
        b=YZcc89AhAzVRMg0PfRK5L1SWqQLLYtsd8UKJYZecTLUO4jPos5fpMp9sbQRGwZQ7xL
         84vbmBgckfPrJwT9pr8KTDkhZy1DdNtbWkFLtwNY/hNlcL5hM6sYFrDQBKtBrTHP3s3o
         BWOuWlG5A8q6DPDhdkbdHhs3ypMOUj/Sbgw1MUvSbsXIOhFfgA69YtvNMbFfz32/PkDy
         O2/npny/EUzNIanE98iJXShvP4GPyaIr5aq2W7tjlac1aP/CIItOO0nhkT5GuVVvIRba
         sZMKLnc6DZFJbNyTgNmrtPwbn6dUvIydvzUhDOLuiCQeLdUJqo+ZErRzPC26Cf3C6DXE
         APHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wb7T+zsRxpVsrqmYkFgKYjTNaQ9+q3BROfnNl3dSKco=;
        b=ctS9UKqeRSyp8CndcXafwr2d4HLIIR4rrZdi9rmCANfxl3Ra2EaRO0+GzbXPAvnsT5
         us7RN9O2R5AsUqUyuidR8aGJtgSjgWqzHQ/NDCASN0mJQzuP/I9uJd7KwbiwP8H0C9oT
         Yy8duU/ne/W8hqXTNuiimGWp6iBOPbzBb4q+fs6fKdPreuUNVYRcOiNB3gmOdoJw3a1c
         8D6LRXO/GiLElDbG+ECwuSuz4SPDKzjbfhTMewUsKUUnhEosaB2eD5mNq180hRA//414
         WBWYG3JQ0KK8fAenNU2DTJuquDukibaDnTF00WnRzpwKU++KR62WpOO/BG3ALwQO3u9J
         l3Lg==
X-Gm-Message-State: AOAM530kRkZngpFBeyWTopiR0jhrCLE8wBlFKNnYF4IEMeeNleiaBR4G
	yKR0wu6Ropb99CCWJVHd+dIelje9MdocSghT
X-Google-Smtp-Source: ABdhPJwZ358SwVxKLngKm7s6WZVPRThMgxir5Z7F/N0jmJXpI1npTHaaH1joF01C0fy+mS0RxUcYRQ==
X-Received: by 2002:a63:f242:: with SMTP id d2mr6551871pgk.44.1605380667246;
        Sat, 14 Nov 2020 11:04:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id 82sm13274444pfv.149.2020.11.14.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 11:04:26 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/5] dconf: Add leading whitespace for append operator
Date: Sat, 14 Nov 2020 11:04:19 -0800
Message-Id: <20201114190422.2777143-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114190422.2777143-1-raj.khem@gmail.com>
References: <20201114190422.2777143-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/dconf/dconf_0.36.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.36.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.36.0.bb
index 9146726884..4b924d89a5 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.36.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.36.0.bb
@@ -15,7 +15,7 @@ inherit gnomebase bash-completion vala
 # I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
 EXTRA_OEMESON = "-Dman=false"
 # no bash-completion for native
-EXTRA_OEMESON_append_class-native = "-Dbash_completion=false"
+EXTRA_OEMESON_append_class-native = " -Dbash_completion=false"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.29.2

