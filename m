Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7845C5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:01:58 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2520.1787029318291484725
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NPn3m/Y7;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so3319637a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029318; x=1787634118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dX+vsOmbA6UHsne/CJ2xLjUYI+A5yQLPQ8tfpcqVjU=;
        b=NPn3m/Y7+tdJkZGTfsrmyJMGw8F/JYQsJ7mxZxvsHDX6w8Sep53BmKfA1ceVSdcMDh
         O7deeWlWvUpC+l3iJ7LofEmjoNMxCMFbmmg0KEFX70CuzgicA5ZI9Udr5srK8FT6tiCp
         4Tfx1M9NWjmLFUHfvB+ir2XNRxRY7wF4lJNw8cjY6LGnu82p3y1OyrQGrc29o35QySnl
         I8KW3eRkLJWRHs8jr1l6v+DlO16YsJKZB6mxVT/HMLOisnO/Um+ZhyCTg/agl1hssIT3
         YPUMhruOcxAcIWChqN8105GVTwxyMsd+oa5APyLfCiZwepWrf8JHME5XIehO2+mb0OKH
         LqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029318; x=1787634118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7dX+vsOmbA6UHsne/CJ2xLjUYI+A5yQLPQ8tfpcqVjU=;
        b=fqjo4PwnLnYRPkVOemanqUzxUWePh2p6XJfW0cMjXIHAF1l9LIRbRUiu8vZp+oVSnb
         6p8nRq34l9nSFmakmKLDQ3IrSho6ETI9hU8mxolOsmpW0aA7zzK6NhXzhOI7Lsd1vjjz
         J+YhgtupsYTHb6BrPAmRRyCEkBbaxRQf0MhQTxFRzPdHjqfrC0lJYbOrkSEv6XClpbFP
         PU7UpbVmnJxHZKCIXbBOBIMwW7yx7I+36S8N/WVjaON4GVYMfRbV4qhuOGnfQt/YAAwY
         DcJYsvo49ovBWv5tTCGp9vunJ9VObpYve1OHGCUy6Zt2y6H3HG+H5InwDro4YjPOFXyA
         qQvg==
X-Gm-Message-State: AOJu0Yym74zBejIXvn2bYmnqBPABvgflG1dXSrfhCIJ9VfNGJe99EQZ7
	NgvZ61mpfhJFIoMG/9NhzNT/QD7J0LKtr68X0XiUKerZ3HxekJCj31PARPnJqGfQ
X-Gm-Gg: AR+sD10y1JGtLIivkMu5FhVrMtZx6SGgJpupJev0cSUtOODrt42xkcqw4pfq2jtgI7z
	fPvjPHq1SndWNLtbFWGZr44iUQmlPBZ19BhHe28Q5e8Dfl5J8NLhDnWdNUVLhj2mwE0Q9uZpAbd
	oa6DyyR3CyCgStIHYh4oCPbsFmly4O/IORkpQVbNG2f8oElvGqqu0N8lEj5dNQVxttAyAul8ofc
	U2BvmVPs+m3/4/RsdVPgYnPRc8mihs+28p9YqmbNliMRobfdqF8t3erG6sPVzrfdWjlg2JVFmQ6
	IQdzN+X/KYOa5hPDqoaAVLY+fLXVnaLacWLmDvhJ0tlWjTgxhOgL63fPVHytclszT1n16Rw8773
	cq4xAAqErok7Cs5PgFH9UwHMgiQ5szYDOYu+Kf5JfbFQ2jMBYJiBkOtdTqInQteHXubNgSWVcCe
	UOsta8Op1OBbWo0YgJDCAl+MhksTxSvr0D1+XbbuhPWqi9Ex9NschWsRh/vaCLuJaiTtgT4HMc0
	w==
X-Received: by 2002:a17:90b:4a89:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-3933b714d58mr29766932a91.4.1787029317641;
        Mon, 17 Aug 2026 22:01:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:01:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 8/27] accountsservice: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:03 +1200
Message-ID: <20260818050123.2901739-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129207

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version accountsservice
...
INFO: Current version: 23.13.9
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/accountsservice/accountsservice_23.13.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
index f0c68ed62a..79870608a3 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
@@ -28,6 +28,9 @@ EXTRA_OEMESON:append:libc-musl = " -Dwtmpfile=/var/log/wtmp -Dtests=false"
 
 SRC_URI[sha256sum] = "adda4cdeae24fa0992e7df3ffff9effa7090be3ac233a3edfdf69d5a9c9b924f"
 
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/accountsservice/accountsservice/-/tags"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+
 GTKDOC_MESON_OPTION = "gtk_doc"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} admin_group"

