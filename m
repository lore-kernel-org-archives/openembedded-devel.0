Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2CDC7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:33 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.11449.1685531610553067153
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kw4HLQcH;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-ba829e17aacso7742530276.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531609; x=1688123609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIUW6dh4EOQbZ9+C+jAo6OSu7ndgVOoedQ1fvTNFiI8=;
        b=kw4HLQcHM3AOCXZ4wI9b4Zv0ic5PF0HgZniSOfxerzKSj5DdqsfRfSv32QUqmPY359
         JP5CjKXIIFHw0n6sklS2NbMcgiqTWlOnfnmYAgok6Z1l2TivE5sLbyfhzgJa7WDUix+n
         Zk7hCniCJo+G1AdJoFzGVE2lPSdG9wd0lp0UiLInc5jRenzo/ZA7AQB6fmzzU5WKjgP7
         OkkLBMslvSdDsMzGTeITWJLnf9NCB+eRNdtybcObBQszcQbrh8aY0DZYkpbzKWSZq2CP
         1sooeq/Fj19/xEIFZ6q5kTifAtjb8cO0BCUeWpkNPqo13fJZ82085EuS4Xx9fwZiXKDp
         V0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531609; x=1688123609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIUW6dh4EOQbZ9+C+jAo6OSu7ndgVOoedQ1fvTNFiI8=;
        b=U+8PG3f9uj1mfcylHqAnvBMG5MIWAZMuryWMFPGbJmcFvML9miocrnDKkeXu+ZnNyo
         4K54nDP7MYLSLsXj4CzKeAhRmIhN0jFM81Km47ziQLLG32m5fMT8b5BHFOWbLXIN+RUr
         AXHfywfgnqvALkwccQqERIW/fJ/UVNb3n6fKqX2USPs3FZhvFclDsaFIflKnrbhJAJ3q
         KYXkFWGUfqrPH+LOPS/GYj5mMvU2d9QbA2lJFlWhgSUVEbUWP4DjG6Zd5PWvGGpzKMwG
         jFDU/h+hGc0fdwDI5ngdDTtIJPp8/ypnzocYNyP6ticRIESj3LWX8XO++SNkNJM5Wv6p
         9kug==
X-Gm-Message-State: AC+VfDwTbAxiLCe077j7kGiBiqIAZqKfjDAkoTyRo/36BPaG0pe+WUQG
	fFesDsS9qacIFSdQvTdxjH2C/size8E=
X-Google-Smtp-Source: ACHHUZ6gutQ/8QPWLjlosrD0SWtOzF20Y898Ldtf/vuRdRtJiciR9t5CK3U+HyXMM/rkz9SZgC5OEw==
X-Received: by 2002:a81:8047:0:b0:565:eb93:21db with SMTP id q68-20020a818047000000b00565eb9321dbmr5778238ywf.41.1685531609462;
        Wed, 31 May 2023 04:13:29 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 20/36] mpv: Remove references to builddir from mpv binary
Date: Wed, 31 May 2023 07:12:53 -0400
Message-Id: <20230531111309.2454603-20-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103049

From: Khem Raj <raj.khem@gmail.com>

Fixes
WARNING: mpv-0.35.1-r0 do_package_qa: QA Issue: File /usr/bin/mpv in package mpv contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 55d92033a2ab1d92e1ff2e03f9e98e3070854154)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
index cfb461a4c3..0f50a6e8fe 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
@@ -98,6 +98,10 @@ EXTRA_OECONF = " \
     ${PACKAGECONFIG_CONFARGS} \
 "
 
+do_configure:append() {
+    sed -i -e 's#${WORKDIR}#<WORKDIR>#g' ${B}/config.h
+}
+
 link_waf() {
     ln -s waf-2.0.25 ${S}/waf
 }
-- 
2.25.1


