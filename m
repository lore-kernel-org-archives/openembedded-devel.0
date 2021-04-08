Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web09.265.1617899799787071657
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HpjCBH9P;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso977235otb.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=z+7CRcpXQoreDCWyc36H8u4ccHrQ5IPjw1C3L9PR28Y=;
        b=HpjCBH9P3AktWSP6+5mfy7yvYP6VH3FNLfsMnkO2bA/hUS5S/dXzwmoqewCBxin9gz
         mUivpgatBbc57GESOf2KZp+q/zjeLCQKlnDG72xBYqPHVfTgpfaHaTr4BDHKWzWZASfm
         UOEtIjMI6jNp5u5bocq1rgvULXdlT7SLexO3Gkz19bCR7xQGbWWxN4NPkyuilxFz6bCH
         w8B/xaGsJtId1eCShrm3HYYtFZZhpBp2S9lw/0PYp3GpHZXfRSCx8u7uC3KTGar8JI81
         SCOAjSrmD8GgqCW1sLZ/LMgHkw8274Ec3FXLgHYCJe+HekFZOwpfEahsdlP6PoYI/3FX
         PInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=z+7CRcpXQoreDCWyc36H8u4ccHrQ5IPjw1C3L9PR28Y=;
        b=WMaGo4HVc5ClRbHlZItE9EWaWqHQ9WGWaLqhVKjS0PwZXA7iMTAibceLyYfNDs+6H4
         QtSehl5Z4ftSvd24Vu+gCzfssIVTWYjgNZxFi/MNjip1mXOAetMz163cHtT/9xhjlsUU
         IYGyww7qAJxdaZvXb5H+E/M++ZPJ+d1bgt38T19qncaj4LprLY3bHtea6uAuUm0PxaLR
         mCUbrg6KnkNuWZhR1aiGHnV6NFJfSI0kKbsTZ04n2w4WFo6OPXFJ06ekd6mCVf0Plb2s
         sLUpeLhjRbDmQvEbBL2/B8RzecZx7qZzi3VMZNeDq3BFTTPAwOjcwZSPZbz4ER8BUCuL
         2XfQ==
X-Gm-Message-State: AOAM530TN9dCv7sXyQNb3cpfULP9GqoOZzkCjul/zzRxj4gL+YD1FW8s
	wwY1arqs/pD2o6qNzf8Ia8A+X9nB/EU=
X-Google-Smtp-Source: ABdhPJw5RiRa0KyVaee7AtDgZAK2VYkQJXlQ2tSuLXytXMIrXkGpnmsd8oP9wrZ5DgWkgYzUbQx73w==
X-Received: by 2002:a9d:6f06:: with SMTP id n6mr8343022otq.189.1617899799024;
        Thu, 08 Apr 2021 09:36:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:38 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 28/64] networkmanager-openvpn: upgrade 1.8.12 -> 1.8.14
Date: Thu,  8 Apr 2021 09:35:35 -0700
Message-Id: <16aed184fa0c19fbf6af734dc80e34cb6cfa01af.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 30a80664e38912d3532cfab5291e468191507625)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ger-openvpn_1.8.12.bb => networkmanager-openvpn_1.8.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.8.12.bb => networkmanager-openvpn_1.8.14.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
index d455a0f06b8..a1a61bed1e3 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
@@ -10,8 +10,8 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "e8b1210011ece18d0278310fbff45af5"
-SRC_URI[sha256sum] = "0efda8878aaf0e6eb5071a053aea5d7f9d42aac097b3ff89e7cbc9233f815318"
+SRC_URI[md5sum] = "bef67eca77bee68da703609b92f804a0"
+SRC_URI[sha256sum] = "e7419053fc3b5a7e25f1a7517c313ad4531b6ea280255524ebb85a70c76fdbeb"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.17.1

