Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10250C77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 23:27:35 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.425.1684970846673723379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 16:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CkA0bCqS;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-255dfed74afso636807a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 16:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684970846; x=1687562846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+BpJCRHxhszISIKGmuLMFR6pYbN9DPU7s9RdNtPk/c=;
        b=CkA0bCqSPbFTzr5s1LVeLyR27WzHQm9NVHtdWJsMP6yrpJkyH9ZyHx4moI47vwLlUU
         LPwatqFNqjYIOaQCXSJcpha38Z4lgnZf87vBn0p813Rx+nz2uFaG08YRoJ4WkoxmZIvy
         KmAi2g2iNgier7Wwy0fyBhP56Si220wEzqCGHLCDZhJfKK9en+myTyG/GkLjir16DRNO
         ozb+xp+Ak6zgqRABrkpAMAJlWWQCQ1lFQcxcyn7daKbUFn4RavvV+Ih2JnCuqgdMzKJS
         nvBkaCC3iXBXHsUJfQCqWWiOHHHWSNMnuxmcZEeKb9Q25/7g+gFS7DDeMviWFJz2vEbz
         KI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684970846; x=1687562846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+BpJCRHxhszISIKGmuLMFR6pYbN9DPU7s9RdNtPk/c=;
        b=HWAlUD3lOSIC1BgIaH5myZDv/vrKTfYb10puI0h11/EypUKR6Fn08cUyiGJ5cFIqcz
         P7UruDUSIssN+0i0bi4ohUUXVdJGU7saFVnkU0uEnrZVobTtkTo88ff11FuWYifmImYC
         SxCmYs3uCBOF/+VapkbpvdP8xt74KqG/tgECaxg+KYvBx3dYqv/JJXLJQxXQ63J5asHv
         HryMtjMAheaqwvi6R6LFOfWyxkTk9uz1scL6XMSSwV35/mYA+u6b1aV+AnF2St7P2I48
         aHhcrR+TyyqWdm/ouILNSeeO2nnpi2HHN/nao/4fizdFBQLhfFFLquHQ6yE7DgAwlOMx
         33zQ==
X-Gm-Message-State: AC+VfDxeO0F3aG4XAF8KDguktWOqjr9SkGkJHEi87GKTBd52Y7PmEI65
	fZT09+VKnkVx+Yi16BRdrS+DeQObDLU=
X-Google-Smtp-Source: ACHHUZ7C50TETfAUHMDgKk81eAQLMGcis9qLioOILuf+1kHbrNuKNREDzYsjKHN9rOhX470bMAnF4Q==
X-Received: by 2002:a17:90a:fb50:b0:256:16e:e9dd with SMTP id iq16-20020a17090afb5000b00256016ee9ddmr93221pjb.32.1684970845765;
        Wed, 24 May 2023 16:27:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id h22-20020a17090aa89600b0025315f7fef7sm1806013pjq.33.2023.05.24.16.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 16:27:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/4] vlc: Remove WORKDIR from CONFIGURE_LINE definition
Date: Wed, 24 May 2023 16:27:21 -0700
Message-Id: <20230524232723.869580-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524232723.869580-1-raj.khem@gmail.com>
References: <20230524232723.869580-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 23:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102796

This is emitted by configure into generated config.h which is used in
src/misc/messages.c and flows into binaries

Fixes
WARNING: vlc-3.0.18-r0 do_package_qa: QA Issue: File /usr/lib/libvlccore.so.9.0.1 in package libvlc contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb
index dd6eceae51..92f05544dd 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb
@@ -101,6 +101,7 @@ do_configure:append() {
     for qtpath in adapters components/epg components/playlist components/sout dialogs managers styles util/buttons; do
         mkdir -p "${B}/modules/gui/qt/$qtpath"
     done
+    sed -i -e 's|${WORKDIR}||g' ${B}/config.h
 }
 
 # This recipe packages vlc as a library as well, so qt4 dependencies
-- 
2.40.1


