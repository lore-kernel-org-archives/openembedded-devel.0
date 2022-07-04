Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E86C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 09:59:30 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.70569.1656928763359074072
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M+PVwjRw;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id o25so15823091ejm.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G6q6Ilxj1NPp6t8H6AOb1fEcnWFYxe3+tXx34K/PsJQ=;
        b=M+PVwjRwyiCl17COBTEUi30N1AajG07w1c1i+3CPQQ/AzxZf2ujHC3YL9C+R4KSuAu
         L4nu0sy3683S0Je/o+zFO/Wlfo1tu3gfECGFCbP0AZsSXdRo3SNwyKMf0cmU2538oOS1
         iegMGPaoY/FPAi8KQ669j9XIkMJVYSGwGH9VxDkUYP6fcFUu2wxrkDCC8gLl/2FBWRo0
         GYCE/4nMPeMt9FWjFGybLu+JfwqDYK/FoeMUd2zs7Tan6mqexv44WVxfi/Pu/JghVU+W
         rXJNjHJruwPjnW3f0DI0avlFhnjQjxI76i6gUn2ieyG3v4cf9YVXIGcz1cp6nto+i+or
         Hc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G6q6Ilxj1NPp6t8H6AOb1fEcnWFYxe3+tXx34K/PsJQ=;
        b=688JgR6jDjxejxYcYUsP9rEyLEUByLAQVbHpFTVLQjjMbjl669i73psBrAX72e6Fxc
         sXiBlyEpbyQVu2x80Z83hdzXwoqNY5dSXmMeh5U6VPQV2m7pWeW0kf7eglzvvaTXXgk8
         +Zvy5KasMI9xzv+fgzSChFDoBPGp6TgtGzEDprkps9VZsFR+hl0aU/bh0ywH4Z8IRalM
         tfiCrnLRr36is7J3LWsRvh9bRaiNiOxblHTBmXTye8gPW+DfGpP/Vkxto40UJE/j6Qqh
         gkBBT8xKGV7eMMLjHB5DU8+ZQFjzid/A8Xy0wk6KrFJ3G/4FuYIkXyiPBKQCWknkVJbX
         1Lvw==
X-Gm-Message-State: AJIora8z9QKj15OT3PtrPebihyYVlIVo0z0/LAze7OtCFupQfkq4YBpW
	2fJfUZxIIb6M8IGGn5aR1dyPvP82SdQ=
X-Google-Smtp-Source: 
 AGRyM1ve+ps0Ipoh2mijsK3jDzKiwWjI8PbxxqIvm2+ZLr2YStaqd6xJtJitLKmKzFVX5PDxnhYl9w==
X-Received: by 2002:a17:907:1dea:b0:72a:6012:7bbc with SMTP id
 og42-20020a1709071dea00b0072a60127bbcmr21848164ejc.258.1656928761529;
        Mon, 04 Jul 2022 02:59:21 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 a9-20020a170906244900b00722e50dab2csm13792122ejb.109.2022.07.04.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 02:59:21 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-networking][kirkstone][master][PATCH] usrsctp: add CVE_VERSION
 to correctly check for CVEs
Date: Mon,  4 Jul 2022 11:59:13 +0200
Message-Id: <20220704095913.50754-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 09:59:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97688

The current version of usrsctp is not a release so cve-check
is not able to find the product version. CVE_VERSION is now set
to 0.9.3.0  that is the nearest version in the past starting from
the revision we have.
This is done because we don't have the complete 0.9.4.0 release.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index 4f8e4d428..dcfa7406d 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -23,3 +23,5 @@ PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,"
 PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
 
 EXTRA_OECONF += "--disable-debug"
+
+CVE_VERSION = "0.9.3.0"
-- 
2.34.1


