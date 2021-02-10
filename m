Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.531.1612925551111772009
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 18:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aHSqOhx2;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: rfried.dev@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id u14so848696wri.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Feb 2021 18:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gEpIKK3sOpfkTIOh2lH9mhGSOYjBEJBozo0zqjrCjjY=;
        b=aHSqOhx2nGqQASOGnbkJDUs50eqLxmTyxnHjrJnRHiR9p2kG9hciDbMtQ54OePW2Tr
         9Mybv6ZV8czspUf1Qk1I8yJrlIen4ZWSS56AxeQ6eX0qLmQ7SCJ6PA6xKUCVtNv5Mrr8
         XKyLrRS92SgHy9lnNAQUQEhDbBYKJLL0b2NIftJKQBvlReBrP3JYPJ7t9iR5NKA+DJPw
         HtSNCEfRruYgf9u7Xku+F6KrphXanImtpY1hJTb/V4QHL1whOGFZJMf4RXBOnG5QtwHI
         KWfFSiuYHqqxIxZWuXT9Afr3bqSGO4mr4goFGNRnyM8ZOWdolbRyyXiKG/WIric8Mut4
         733A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gEpIKK3sOpfkTIOh2lH9mhGSOYjBEJBozo0zqjrCjjY=;
        b=IGMgQCDzwEwokvTkZaQ7myR0DZ1E1e89rIhuE8RSF0jkXAuBizGf7ecMORedu7nipG
         XtLp5N3WdDqmeVf6uxU3YYWEZa6s13r1MthFQhzbqgFT5gNBTg3Ox2LLR5sXmmPHuXNA
         EqTjh8ddQIhAyVWY0GLX4vgxkD6zueiaAs8gE7MTR9kDNBHJRRQPEb0coJj6DwJZ8HaC
         f9WZ3/+U0xACWbAGzP0lAeAFEeBluRoVwIbEBGdEjCqI7cG2ZQSrnC9x2K8fgPtKhIGA
         TBuc21vrw5BMQ1wr9NrOjD/pX8Mg3qWN5/oPO93Xu3+E3VhyAVfp8vTdRNBoUPzOQMVP
         rJng==
X-Gm-Message-State: AOAM53039VU8SgpZNYI379t0c2H4dhOTsfcqRuGCr/JUnwgmpzR1vLZz
	pAk1kvL9YT8xH31QsRUsE+89+SYEIVrYwA==
X-Google-Smtp-Source: ABdhPJypwhaMKmlDUzskKXYZOOkVqf+DtHmS0Iz2W0fRmaRkxf20znkV1l9fkTWTAAF/kpk6NOur+A==
X-Received: by 2002:a5d:6847:: with SMTP id o7mr1086266wrw.216.1612925549245;
        Tue, 09 Feb 2021 18:52:29 -0800 (PST)
Return-Path: <rfried.dev@gmail.com>
Received: from lotus.nr.ent (82.166.25.98.fix.netvision.net.il. [82.166.25.98])
        by smtp.gmail.com with ESMTPSA id 36sm913375wrj.97.2021.02.09.18.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 18:52:28 -0800 (PST)
From: "Ramon Fried" <rfried.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [meta-oe][PATCH 1/2] fluentbit: fix systemd input plugin
Date: Wed, 10 Feb 2021 04:54:24 +0200
Message-Id: <20210210025425.43148-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.17.1

Because of missing dependency of systemd, Cmake configure
step didn't find systemd and skipped the systemd input plugin.
Added necessary dependency if systemd is available.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index bc4cd0cf9..47ed36a29 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -22,6 +22,7 @@ SRC_URI[sha256sum] = "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f9a4b12d781
 
 S = "${WORKDIR}/fluent-bit-${PV}"
 DEPENDS = "zlib bison-native flex-native"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 DEPENDS_append_libc-musl = " fts "
 
 INSANE_SKIP_${PN}-dev += "dev-elf"
-- 
2.17.1

