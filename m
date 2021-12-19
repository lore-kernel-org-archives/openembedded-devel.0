Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576BEC433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Dec 2021 08:48:09 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.14959.1639903688323029595
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Dec 2021 00:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PSZZNvWJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id e3so25716730edu.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Dec 2021 00:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4WsdNqMpFisgRlQ6ehUDHV8ujb9w/Q9n5zo6FR+siDU=;
        b=PSZZNvWJkRP8afdKtWm8dS0eGpKrp/Cq4gSZygub8pJFylSsnqZowcS+uBSQQe8yIM
         h9sQ/+lPvfDXrrMS3SRsNMBaFd5hEgpo1A8JqO1FhVn5hdD8c6luT2XEAQCMv9ClFBDL
         T9mbuj/dpAZgSKknIMHuglJIvt/N8wasKJyeo+X46w7G15jFX/FZ3Kjhl4t0ko6BbdtS
         mcEZ7SUPNf/bJWti0nvR0Iw883lHePPcrfPp1+NWGBtOUvrLmD7OfsqGrsxteVkb8lGE
         BTDP6qCvEYRjCvrwRlTmipxJIET41nlgXsD06kTa7ZI7UkkhKcskgNc3ZQSwqhlNfgO8
         /x/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4WsdNqMpFisgRlQ6ehUDHV8ujb9w/Q9n5zo6FR+siDU=;
        b=QK08AZ9xXk4V7RzvPjypf8ALWXwstDT/U6/Wm442JqBswdwVgVBIUyPh5mardRnIUw
         4dUogaghRZ7A0yCz0QvAmZMYy3avxzJUcICSLWuAEpFv0an5Ik6HF5klUUF/UNFYjmzv
         ZUe3TesyfsH9IjlQrir2WvjVI2KksNYu4p5ejMV0/Q7husXm64bb25qthQ95GPuz+XEr
         nNOTgkVBXFF136uNorxSK695r3n6EFPdAUyWdByq1lV/MVNFdpkRghJuvJ+e3RBgnlYr
         Y2mchemo2aap18ifFkNX9AyOOmDNIqtmzpSQOXao9vUu+nfItnPDLh4zd7iCgRD018EC
         9V2w==
X-Gm-Message-State: AOAM531t6w/Uxfo6lRilCn9rsb/S/TysRorX9sFQSBhKJ1mIhAj7dlLk
	42Gh+L26VcJM4oMbviW3tx61rH+Ug0o=
X-Google-Smtp-Source: 
 ABdhPJy/+ted+5Yk5m1MtOpYT8ZY7ketjgfPnE+fPduH6cU3egwidlZBiKLJRbQvCFblLSG8w6rl2Q==
X-Received: by 2002:a05:6402:254f:: with SMTP id
 l15mr10408446edb.12.1639903686716;
        Sun, 19 Dec 2021 00:48:06 -0800 (PST)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.googlemail.com with ESMTPSA id
 12sm4409951ejh.173.2021.12.19.00.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 00:48:06 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH v2 3/3] netdata: do not send anonymous
 statistics by default.
Date: Sun, 19 Dec 2021 09:47:54 +0100
Message-Id: <20211219084754.2215526-3-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211219084754.2215526-1-jan.vermaete@gmail.com>
References: <20211219084754.2215526-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Dec 2021 08:48:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94442

Netdata is sending anonymous statics data to Google by default.

Disabling this by default in the recipe by adding the
 .opt-out-from-anonymous-statistics file in the netdata config
directory.
@see: https://learn.netdata.cloud/docs/agent/anonymous-statistics#opt-out

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../recipes-webadmin/netdata/netdata_1.32.1.bb           | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
index d479051c4..6824dd725 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
@@ -20,6 +20,10 @@ UPSTREAM_CHECK_URI = "https://github.com/netdata/netdata/releases"
 
 S = "${WORKDIR}/${BPN}-v${PV}"
 
+PACKAGECONFIG ??= "\
+    anonymous \
+"
+
 inherit pkgconfig autotools-brokensep useradd systemd
 
 LIBS:toolchain-clang:x86 = "-latomic"
@@ -58,6 +62,11 @@ do_install:append() {
     sed -i -e 's,@@libdir,${libexecdir},g' ${D}${sysconfdir}/netdata/netdata.conf
     sed -i -e 's,@@datadir,${datadir},g' ${D}${sysconfdir}/netdata/netdata.conf
 
+    # Stop sending anonymous statistics to Google Analytics
+    if ${@bb.utils.contains('PACKAGECONFIG', 'anonymous', 'true', 'false', d)}; then
+        touch ${D}${sysconfdir}/netdata/.opt-out-from-anonymous-statistics
+    fi
+
     install --group netdata --owner netdata --directory ${D}${localstatedir}/cache/netdata
     install --group netdata --owner netdata --directory ${D}${localstatedir}/lib/netdata
 
-- 
2.25.1


