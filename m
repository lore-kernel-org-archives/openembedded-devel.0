Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED370C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 09:33:00 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.12459.1699781579147280798
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 01:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lqb4jFTO;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5446c9f3a77so5497482a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 01:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699781577; x=1700386377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt4nTxqmNiFIST58tM31qyS6rzGYsrXbsK0Mr3ClGR4=;
        b=lqb4jFTO9KozdoTSqFtCjDQvDzm/nqtILJUKsdo8rduDy2OpSFWxaaWn32JhPMla+H
         g4IEIxSQUQtP1PGxwaRlGWa9mB73ewnaVqnlCQq7P7Bn6ot9V+d2wQKkaipnAkSTcOrb
         AiemNZHmOWw/FIDkmy0s55kHixEpXBmzf0G3EdCoyF+fbDI7o330oQsu+/37t9m9cBmD
         CgLPka23VK0IDJm898y6kCe2tDcYNmiOPW3Bkrg/Zei55FgnA+cj7Mr3XHS7N6pJo5Oq
         0w47X7AAqVfKvuRQwLAJHI+sJeJMkS+BHtaE6pY8lAj+iGVN2OL4y2b91NVAEQMc6i0g
         YAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699781577; x=1700386377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bt4nTxqmNiFIST58tM31qyS6rzGYsrXbsK0Mr3ClGR4=;
        b=ZYPSdGxUvy4paKoXvGBGKYPKaKPz9x38tFijFL5rDcgsktng/Vy9/A7W6IPzR+/aFv
         Bw4PZQdOt4iOzHbhYrg7c+pzGB9Off1zR8FlvReaLswSUvZPx5DdYUr3a6Y3a3Yvhn52
         o7vP4oEPYAWujVg3pMB1CAMHNukkBWI5qVKcC1mwwkcMDCT7NDY7iBk28c96qm1JO8cL
         DlXEP0EjKFlKn9kOVCl54+3LUCP+vup6LhDM4/zJVb5TZngelAp4ukhLog66H1KQAymj
         jZn7p0i8vSAXpW9I7mLy7D7UaLyrsftvvsH19rA5W53NRjSzna5yyDT3zTCysNA+QnYS
         CtCw==
X-Gm-Message-State: AOJu0YybYLepqwvPYW/Qx1fBynNlue9SNeC7MkptgLKEs/0ydsyV0AQt
	E/PDoDo+8kQvJUQNnNj1Yi7+vWYTj5uz7g==
X-Google-Smtp-Source: AGHT+IGQocF5i311Xbyx7uZNGA5U3N8cf6W9BmbggpMzE7yhR0Vy4voGv/VYuTjenIi62/QcPttyrg==
X-Received: by 2002:aa7:c9cb:0:b0:542:d56c:ed67 with SMTP id i11-20020aa7c9cb000000b00542d56ced67mr2618796edt.4.1699781576779;
        Sun, 12 Nov 2023 01:32:56 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id s1-20020a50d481000000b0053e5f67d637sm2110083edi.9.2023.11.12.01.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 01:32:56 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-filesystems][PATCH] libisoburn: 1.5.4 -> 1.5.6
Date: Sun, 12 Nov 2023 12:32:49 +0300
Message-Id: <20231112093249.107673-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 09:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106581

Changelog:

* Bug fix: False -status failure with -boot_image --interval:appended_partition
* Bug fix: -no_rc prevented pre-scanning of arguments for stdio output and
           others. Introduced by mistake in a62f6af5, 2011.10.18.162119.
* Bug fix: -not_leaf and -not_paths were not applied to -extract and alike
* Bug fix: -report_system_area cmd misperceived -part_like_isohybrid with
           -isohybrid-gpt-basdat
* Bug fix: -report_system_area cmd misperceived combination of isohybrid and
           appended partition in GPT
* Bug fix: -as mkisofs option -part_like_isohybrid did not cause a MBR
           partition table if the partitions are data files in the ISO
           rather than appended
* Bug fix: Split file directories (-split_size) were created with wrong
           permissions
* Bug fix: libisofs did not mark clones of imported files as imported.
           This could cause that original and clone occupy data storage
           in the newly written session. Thanks to Ivan Shmakov.
* Bug fix: Partition offset was preserved from -indev rather than from -outdev
* Bug fix: libisofs could misrepresent Rock Ridge information if many
           symbolic links or AAIP data were recorded in a directory
* Bug fix: Data files named /boot.catalog or ./boot.cat could be left out of
           the emerging ISO if the boot catalog was set to be hidden
* Bug fix: -toc reported wrong track LBA with overwritable media with
           unrecognized content (pseudo-closed)
* Bug fix: -find test -has_xattr matched "isofs." attributes
           in -xattr mode "any"
* New API call isoburn_assess_written_features()
* New API calls isoburn_igopt_set_max_ce_entries(),
  isoburn_igopt_get_max_ce_entries()
* New flag bit12 with isoburn_read_iso_head():
  Read even if start of multi-session emulation is damaged
* New -boot_image settings gpt_iso_bootable= and gpt_iso_not_ro=
* New -as mkisofs options --gpt-iso-bootable and --gpt-iso-not-ro
* New -as cdrecord option --obs_pad. Automatic no_emul_toc with -as cdrecord.
* New parameters "obs_pad" and "bdr_obs_exempt" for -dvd_obs
* New -as cdrecord option --bdr_obs_exempt
* New command -assess_indev_features
* New -find test -size
* New -compliance rules max_ce_entries=, max_ce_drop=
* Allowed lseekable device files with -cut_out.
  Proof-of-concept by Ivan Shmakov on bugs.debian.org. (Closes: #1010098)

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../burnia/{libisoburn_1.5.4.bb => libisoburn_1.5.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/burnia/{libisoburn_1.5.4.bb => libisoburn_1.5.6.bb} (89%)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.4.bb b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
similarity index 89%
rename from meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.4.bb
rename to meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
index f263b5135..3982eae63 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.4.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
                     file://COPYRIGHT;md5=43cfe25a7e4a65f722d6253fa0649bb1"
 
 SRC_URI = "http://files.libburnia-project.org/releases/libisoburn-${PV}.tar.gz"
-SRC_URI[sha256sum] = "2d89846d43880f17fa591c53b3bea42ffb803628e4e630c680fc2c9184f79132"
+SRC_URI[sha256sum] = "2b80a6f73dd633a5d243facbe97a15e5c9a07644a5e1a242c219b9375a45f71b"
 
 DEPENDS = "libisofs libburn"
 # This replaces the xorriso recipe
-- 
2.25.1


