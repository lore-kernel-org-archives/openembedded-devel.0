Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE6BEE0AE4
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3882.1770467019144102784
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kXjNnGCU;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso17367635e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467017; x=1771071817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFfv5ZdMhpAqJc3GHYwIZEzk08SoSXHOmgV1VokaYcM=;
        b=kXjNnGCUfp3e+mY9oW5UR9I22XiAC3qyJERq4B0Ah3XTfIyjPHQQw993xC+aZEVCdF
         4z1c+mVFYvQgN3x/GNP0O1SINdxm5UWYOyT7RUdkbSRBBnWfMtivNurtyhnL2J0uOP+P
         zzyXN72K007aPv9jKUCgFUrb/kX3oCKbc6QrirRveNdADDPNQw+53gnrsso2qUOuc+Xa
         i4YorSjdVc6S0G4BHv3VyOXYHP+SEcNobBymfpBpse2+2iyWP5mZ+lxyT0bmAew6X0h0
         sEA4dMoiuu9qylQYJSWwqZHdOMdPGilCF9jnrUnXqwfdWkCZa5hgB6JYA2on6WZ5v7W9
         s+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467017; x=1771071817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFfv5ZdMhpAqJc3GHYwIZEzk08SoSXHOmgV1VokaYcM=;
        b=mXTCqnxnaRhG77gvWwKAuXhv6PD/8gCj/UW6Oljvgm4SGvwaobjZ0EYqSB//yk0kwa
         3DQVzZ+AevM21d4TXUTi3sXQ2sZkb0TFz508L6MDT9X8MOplNNeve8ZEEd8KPdqqjcpx
         IP3bRAMbr8d7DULflnND4bfQ3SOcFIccfCWYczHmVI3JMviwrZ08PZufszhfRftGZAPC
         NGtYUVmt+xxCg5b1ZVkvGz8lo18e0SfXIQYPtPDoHRK8umQVhWg8hTIr+vHE6cEQuo7y
         7LJ7nl7VBsBvgcUWfS+tasaUF59h+r45z73oH36C72jKHuhv7O5M7a74bKM7yr3FbZ/i
         aqLg==
X-Gm-Message-State: AOJu0Yzj+Ra21cKaom6RY4Uhgkxo2hOmeC/ggJOFmFZlmEW1ViN7fskj
	kn4YaYzzQvIL/2otYfoNKro67DBQhRrlL2J5eeRahiaI5608F9xpouN6+PNXSw==
X-Gm-Gg: AZuq6aJV+eDtVMzhiHxluGsfBY/KUq0SliosFvRw/2RJC7+pgGtIWfliGUdfA5A1N27
	PO7bYzFhcAUWCKNMtfKWTMSA0rrwVu6LsqahI1K7KBU4zcV+Ic4Vjds3EuppBRFZsQeGWcul1x+
	54q0d+kYtDR2u+o5M0Hs28P+ZfVmNuzSRiv0W7AEfNFkxuj+Uw9G0euSpVsTXj9OVytbSSdXEgs
	Asz8AdZAWoUl3J31yRmwmUttJCJbgNCMsTc06dQrN763UpRTHyXl6OMVfY1gNee5XHItoqBfJvH
	agdIbJ9lnExG00fK8+3Amcg/Q+0hHylyoSiVFP24RT2FL93dcKxnZ6t5jBjVHVCc+EPFiAoA/3A
	CRq3q0OPEGaTg4acKd02kbz4ThQj29nex7AkkCnqyTXunRYsoU+oAhpbnpSTotM5A4MRevalZ41
	w/jQQQ8JuPlwzf85A+d9k=
X-Received: by 2002:a05:600c:3553:b0:477:9976:9e1a with SMTP id 5b1f17b1804b1-483201dc5bamr81644625e9.6.1770467017399;
        Sat, 07 Feb 2026 04:23:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 12/12] gnome-keyring: upgrade 46.1 -> 46.2
Date: Sat,  7 Feb 2026 13:23:27 +0100
Message-ID: <20260207122327.664604-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207122327.664604-1-skandigraun@gmail.com>
References: <20260207122327.664604-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124268

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Don't use 'bool' as variable name
* autogoo: replace AC_HELP_STRING with AS_HELP_STRING
* Default "automatically unlock" checkbox to false
* build: Fix distcheck with systemd unit
* rpc-layer: Fix undefined reference to g_strlcpy
* Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0e55ce901a9697f273b1b04dc6daa15b81d4173f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-keyring_46.1.bb => gnome-keyring_46.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_46.1.bb => gnome-keyring_46.2.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb
rename to meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
index 41f1f164ed..b723a0dd71 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
@@ -24,7 +24,7 @@ inherit gnomebase gsettings features_check gettext
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "b1d3ae9132ff2f8b3f25a190790892968e3d0acf952a487e40f644a8550ce3f6"
+SRC_URI[archive.sha256sum] = "bf26c966b8a8b7f3285ecc8bb3e467b9c20f9535b94dc451c9c559ddcff61925"
 SRC_URI += " \
     file://0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch \
     file://musl.patch \

