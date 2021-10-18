Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC20C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 17:52:37 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web09.39970.1634579556522324292
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iW2A1YuI;
 spf=pass (domain: gmail.com, ip: 209.85.167.169,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id o204so831585oih.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kZnf6sKCxUu6xTcq5OOZ9dQ177HPe+JZZZ82JLv/KEM=;
        b=iW2A1YuIEMY8arrll8CI8mhobQGjvzG2wH88DCy2XHoLktEEi+HGtIfjzWkmUDSGRK
         Jn6e1FWaB96CcLlXvdAPiaX6R++xJ0QcQMNNOHO7wpcCSN/fT1YDtLXuHUM+udHb3C98
         Ebd7BLbSdUm53ThMdl+0JPs2PUzePKC0/SAlbinj/w4aA83vh95x1pd51kJD2Q0uaqyM
         +Boi0GK1uvP2niSw0cXbYTLIDir8sGZ1XhbmkOmUwWZh0WgGZaFRbn9wM7E+P1UgxEdi
         P8li7fMJQAJfk5LBPoBjsv4ql+1PDQ+2JuH0+kcTfImXwULYAJCIMe5gNOkeS30rGlM4
         sSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kZnf6sKCxUu6xTcq5OOZ9dQ177HPe+JZZZ82JLv/KEM=;
        b=H0bDxgKKBnnmCeUXuVvdanev02mdwf4MtG/EMK46fqWZsi5kkAetN2+WcToCm6dv6+
         QqCp3t9xaS5VEgRgdTZX4LK1/0saxyRgiZvxqnEO78xz9wfHCHSF1D5dQZbe5vpDYFUU
         Et0U2yMPyPlP8vLH0D1RligWMzaDcQcCIl67MWxiJX44pclJWfWLknRPWmLCsdrIx/aq
         l3PLDG3pA9A4fIfePaxbUge2RUlxvBPTNjOzeqbu2gczXOeaifhn69YcJLCijiaKa+7T
         EV7p/2WIGN0s95/cQ4LlgYQSeQ9vfs8Co3oMOAl1aboTQHujdbdDNW0bTU1bpPmLlJ4k
         aJ8g==
X-Gm-Message-State: AOAM532qduJ+OnGmM20JRNkuaP+x11eW/wJHZ9hQHO/mPQIIRqNC0CYg
	2tK4tsVVqUbtDrmqYLp5W0Jbu188Etc=
X-Google-Smtp-Source: 
 ABdhPJxB3LbZvIY+GsUUt9W/91U5SYDYa1UskuNkfxBGruZqa7Eezo2KdUIDxo2Q6/OvzWWfPuIKug==
X-Received: by 2002:a05:6808:2129:: with SMTP id
 r41mr293495oiw.110.1634579555669;
        Mon, 18 Oct 2021 10:52:35 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 j6sm2592588oot.18.2021.10.18.10.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 10:52:35 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ticotimo@gmail.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH v2] mutter: Move gsettings to a separate package
Date: Mon, 18 Oct 2021 12:52:28 -0500
Message-Id: <20211018175228.3801941-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211018173750.3739908-1-JPEWhacker@gmail.com>
References: <20211018173750.3739908-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 17:52:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93440

Move the mutter gsettings to their own package. Some other compositors
(specifically, phoc) want to use the mutter provided gsettings to remain
compatible. This allows those recipes to pick up the runtime settings
without having to pull in all of mutter

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
index 72e776719..b659d9295 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
@@ -73,7 +73,9 @@ do_install:append() {
     done
 }
 
-PACKAGES =+ "${PN}-tests"
+GSETTINGS_PACKAGE = "${PN}-gsettings"
+
+PACKAGES =+ "${PN}-tests ${PN}-gsettings"
 
 FILES:${PN} += " \
     ${datadir}/gnome-control-center \
@@ -93,5 +95,5 @@ FILES:${PN}-dev += " \
     ${libdir}/${MUTTER_API_NAME}/lib*.so \
 "
 
-RDEPENDS:${PN} += "zenity"
+RDEPENDS:${PN} += "zenity ${PN}-gsettings"
 
-- 
2.33.0


