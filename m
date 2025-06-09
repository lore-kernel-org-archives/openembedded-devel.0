Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB189C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 11:12:15 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.56729.1749467528620070816
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 04:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IOllVKh/;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e23e9aeefso29707167b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 04:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749467527; x=1750072327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2K/oHYOIRTimPck+guheKepHDzmizu9sNMLqlB3ask=;
        b=IOllVKh/UdPPeSoT90oKDWFSHohnI034ujGR4g13WpASR9u98W2pQriQNs5PHd2pvq
         pn0jVwoQYdPiVPc233VoggMMNbRcQy1vfMpteuO9ZvpVvc55dUXpaHfMVwjlJIRwIWtf
         PXPwBbaaijFHEZoc7EsXIewfhqGz8OEuLq+BDjK5w362ylsaHn8U9/2OkMgqq2AevUOk
         KZh4C+HKjppKEO1Qq1tnd5D4or3b/697JIDANSrVzO9dL9EIvzJhGyDJi5QDJSBvemBw
         sbhL081B8h09NW8iUiHIMq/sGg3CHbYlENo+5S9xoNBW7/KAwxtxzbr1L9nJhH0Gx8Xq
         1HIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749467527; x=1750072327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2K/oHYOIRTimPck+guheKepHDzmizu9sNMLqlB3ask=;
        b=eIn+1uxzxIYd4C8CIsddRVP8cvzjMzO5DOnBMUmuSAp6bWQqZkwvLC7liQNDEanFQa
         CeY4lQZ184RbyUTut80VEYT7KXAX3FHjUS7hXme95lSiR3Y3a4E6Nw+UdPj9SM3ELrZ+
         umxWSMneBCPriczBH0SMf90DRa5hfdxlhp8bjAa2m+VfMhX7Wx1Cxkvl7S9/yq6i8RTa
         NYzZIjC7OT0jNynWgYpsMVU46cQWIrQixF+eKnxtYxP4mEoljhvkPHiv7mIAwA6M4zP1
         Vmb8V6G9LlYpgsLVomIwCOcgDRhqXbayp35KYHvUAHN3SYmh3O/g4UjBLux6aDxD+ZnT
         +viQ==
X-Gm-Message-State: AOJu0Yw+cdXV04Ejv+qRouJcg6nQ13kYngs5E8LJNe6xXfhy1cALRBR/
	bAglGVTYrDqB84xpPTfK/1COKJdqnniZSqNBoqtucv64JhqEWDLDQTm8MDeVnBpK
X-Gm-Gg: ASbGnct4C3M7Y4vb+BlItPHnnuPtvJ7djAfk4iseGFV0/GCgKWq/vRb/lrbvDKtJttn
	i2DLiymLNmk1GWJBeu7rIX4XMGA+HUG0I89upPAJOho8dbOdQ3kQjbCkxXAmPPhiKYq72D0xZxh
	Q00Y6SoIQGGMU4J22Ds/OV/eMUGSU4aJ7B06jNwXo9mKOJ0tosuW3R3V87FLgfsbKn5IyFN5LZk
	Y+GLrIBv0Srh3wBTMnD8Aud4zuAqB8yYvNyKVDpQ/RPvPeKd0jxk1f2WyK0CwKtiAMehRVkkEPi
	3R2Zzj6UfRKLrcTuw4M8pnTCoEmxE1vjfxErN4HAl85vcJL4GdIQwAsGsUgVZ8GP/th179JX7VP
	58n55Tz7RuMuXYvrmlBfv
X-Google-Smtp-Source: AGHT+IGWh8t8w1XtP6H9glTzl817d1by9Tp3lZPiMeYpNyq8VHBY/esn5U4+IGcyJ18GvBxZhOW0Tg==
X-Received: by 2002:a05:690c:61c3:b0:70c:d322:872c with SMTP id 00721157ae682-710f763eb39mr177312387b3.1.1749467527053;
        Mon, 09 Jun 2025 04:12:07 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f9a2e5aesm11979157b3.125.2025.06.09.04.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 04:12:06 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/3] xfce4-mpc-plugin: upgrade 0.5.3 -> 0.5.5
Date: Mon,  9 Jun 2025 07:11:52 -0400
Message-ID: <20250609111154.1056573-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 11:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117785

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-mpc-plugin/-/tags/xfce4-mpc-plugin-0.5.5

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-mpc-plugin/-/tags/xfce4-mpc-plugin-0.5.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-mpc-plugin_0.5.3.bb => xfce4-mpc-plugin_0.5.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-multimedia/xfce4-mpc-plugin/{xfce4-mpc-plugin_0.5.3.bb => xfce4-mpc-plugin_0.5.5.bb} (84%)

diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.5.bb
similarity index 84%
rename from meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb
rename to meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.5.bb
index 2d4cdfa498..0cc523e876 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.5.bb
@@ -14,4 +14,4 @@ LICENSE_FLAGS = "commercial"
 # for now we recommend our own mpd-server
 RRECOMMENDS:${PN} = "mpd"
 
-SRC_URI[sha256sum] = "0467fb4d1acd982d3c3e0b89cb41019946850524ff19ed0f658a8d56c7b7664d"
+SRC_URI[sha256sum] = "4ce7d77667a263ee9916c0cab2a733b17e3bd65705cd4ed5cec3cbde6e7298cf"
-- 
2.43.0


