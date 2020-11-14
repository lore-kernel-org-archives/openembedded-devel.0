Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.7713.1605369623947864897
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 08:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n192CNLG;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id cp9so5961306plb.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ojeAwDvKcMFFXIxN3Q/bdwG6SdnkCOeHtBbROC3cml4=;
        b=n192CNLGQNukozv+5YCJ+2L4AUWriFKnHxkX4oasjTAkQKB/xnI3ZSnsXcNUQwlB2t
         twSJsydfUavtu6AjSkopuz7k00jDG3ezU9Lejh/YaBZW+euZwXK6bzrRi4m7XHKr8iGS
         kZzbvv+WKNqllPCBq1CdYPFv4UtaBaxVN7aJK1X5JxRUwCjkB7XaOEArRr7CYH2Pjy0Z
         9mxfBqz8BCKHlCJp3kXBs0vxNf4+DMme+9NSZe+9UC6NmgHF0jue4nFz7tYRQ/GFzX1D
         Ts7NcbKkupqjrUowkB4wo+J+NRLQoQihb8zk9qsRtyN2TrHAeIDRpFnxD3y+T5jQACax
         2g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ojeAwDvKcMFFXIxN3Q/bdwG6SdnkCOeHtBbROC3cml4=;
        b=Q3oWG8nfMUA20vau+uu7/3zuSrLtp/b2T98UDF0OYmLS7ii2L4wpA0Oa0OYnyk4C89
         vnwpXpFj/aHOltQn/UkKjQgdP57xrQusJRDzZjDDo+Af0E8EzvePPpSnU4KNshk3Oogo
         0A8ZODu9fmoApaK2h3sOPNe7zDJrwvB5lDcjsE82cmjm9qKELGl6L2HadqusPTALjziK
         qNGsOgB2WP13KMoJS3k2J+lupoJ3KfwFPveRvg0J+BIYXsdMonmGkYtzYoBKbsy9pssI
         huLt2ewXDvtlvuj2VYsFr+0gZxYAO4ev8xS6gpW/X8Suf4zNLYcl0z5wlcsRsbp1ugPG
         JKRw==
X-Gm-Message-State: AOAM532RWjHPQRqNWwK6VKZctLJTHGDCf2K3+fWFg0bUkdnlsMrsRFSx
	nPbZD7CJQpn/YtbFeePMOmQek7h8ROa//l8g
X-Google-Smtp-Source: ABdhPJw/W4fO+loj4Ipiak/PDNNKSN6y/GNg5/NR7+npyzhgL+cC3T5mHmUqyKG/KG39mBdOix1qOQ==
X-Received: by 2002:a17:90a:4a0f:: with SMTP id e15mr8036657pjh.151.1605369623311;
        Sat, 14 Nov 2020 08:00:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id w196sm12647687pfd.177.2020.11.14.08.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 08:00:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] gedit: Inherit python3targetconfig
Date: Sat, 14 Nov 2020 08:00:18 -0800
Message-Id: <20201114160019.1885976-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114160019.1885976-1-raj.khem@gmail.com>
References: <20201114160019.1885976-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed to find _PYTHON_SYSCONFIGDATA_NAME

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
index 506bd11c78..b20f20449f 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
     tepl \
 "
 
-inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg
+inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg python3targetconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.29.2

