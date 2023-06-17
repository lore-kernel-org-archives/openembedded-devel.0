Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE14CEB64D9
	for <webhook@archiver.kernel.org>; Sat, 17 Jun 2023 17:15:05 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.9535.1687022104861619915
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jun 2023 10:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oU+MJGvK;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-57026f4bccaso22806347b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 10:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687022104; x=1689614104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDMmMgrDKwr+uV/wsjEsuLDPlhSwEDB7HcLtHVLXQt4=;
        b=oU+MJGvK8N3WaVet7B/r8YtEc0Doe2qsjNE+e2S9P93mAKGTuyLjBUM0L6kaDNUo8P
         ZVaU7ckbEfYkuc6d1iGS5Dr0jUujVv5tEojYqLyit55DGY0cTdta/DLTaF08oY8QkH2Z
         FWaursiuchdB/hln1PHZM361JAksJDotFB/r6S4D7RTArtSz7A3JFDXV7ZTDX/LdCdkj
         m948Ds8Mmi7frnk7c5YjMb+XXLggGn2+k+U8pK82UYuO+NnNrnVa832Ui2wG3otjiu5s
         w9+JGDpsjw2RXInSGLFDBpWuImU+NFBFl8VjEWe+TqNQucX0ROcQYeRkhjUpKTrChctd
         ryXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022104; x=1689614104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDMmMgrDKwr+uV/wsjEsuLDPlhSwEDB7HcLtHVLXQt4=;
        b=gW5veIPPLdhxOvTH/QQIR7mhrIzYDkw6iQjJ+CsRMniUcaPeGeRtyU86db7Nwm/qHq
         8uGCNjlnkvh3JaQsx4dSOXCOn+VFjH8GcTUxAIhYtlZp0GBw01kZGmUdAC9314NCTk8K
         uv0qomF+5Gv3tuV6QGsX03igotmGsXi5z/haQ2TvoZlYIL5pEqwgKYNTVlemrPquxKTH
         2wivTgf1oZ0qJZSLE6oWDOEmvuS7LwGLxij2epNsoQcdZzki41XfzcivRiQ7FLUYYoRF
         I4XdhCOg93Ylg3s2PolYWoBxvq1DPSvjkEizaQ6VwCsmaPtFGRv7EX05IGVsu5G1Dr/1
         Muwg==
X-Gm-Message-State: AC+VfDyZljjcqsjRpkQ9iGFszbKk/o/idcCvyzBRyCRfrm2Crqqj62ba
	6+fM837Iq8I0M9knzDomYyb9Cd182mM=
X-Google-Smtp-Source: ACHHUZ569FGdo+kJ/HnsI3CqwFYVwSJkvYs82PuwQAhPR4biNB/8WadulEcRiBVLnkNOiEAdpvepeg==
X-Received: by 2002:a0d:eb93:0:b0:56d:805:1507 with SMTP id u141-20020a0deb93000000b0056d08051507mr5783884ywe.16.1687022103685;
        Sat, 17 Jun 2023 10:15:03 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:89fd:7ebd:1d10:5272])
        by smtp.gmail.com with ESMTPSA id o125-20020a815a83000000b00545a08184cesm5737043ywb.94.2023.06.17.10.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:15:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 4/6] imsettings: add missing DEPENDS on autoconf-archive-native
Date: Sat, 17 Jun 2023 13:14:58 -0400
Message-Id: <20230617171500.70558-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617171500.70558-1-akuster808@gmail.com>
References: <20230617171500.70558-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 17:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103349

From: Ross Burton <ross.burton@arm.com>

This can be satisfied via transitive dependencies, but make it an
explicit DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2697f5bcf4f2396efe93a3597d2f96290d9fd2a8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb
index cdf4557cd3..21e9b3908f 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 inherit autotools gtk-doc gobject-introspection gettext features_check
 
-DEPENDS = "gtk+3 libnotify"
+DEPENDS = "autoconf-archive-native gtk+3 libnotify"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.34.1


