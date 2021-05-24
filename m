Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.27262.1621879194393502740
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 10:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=teaCPqe0;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id b17so33031832ede.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 10:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oh1SBXH+D7KzyJT86rJElN4Gqc1Eq+pv+Q6JJ2erICI=;
        b=teaCPqe0bYehki090WDSEWD0+45K7w9Lsz19wixOVwkqrB+wuPlP09rgjwQn4Dz64r
         JTJkRz7kddVjQptrGPbG/Aymghc+DAB2W5FpC/mnoTx/2ruW0c9yxFOaomzbT/IOml1/
         dEaFXTn8qUzhs1U4Ct0J9TIVyo/2/FzWGmHdJjbtIjXYfTmtJGBbPk2KXvRw2Xqov7PF
         fuerDLPL4jlLEqtyK5f0AAaVZMxtpa3JzH7wGFK4x1AKAOzVTf20WGxJSBdIJTMvi3ug
         moJ02kZ/pODzPHg3m/ZVwPV56bvfXNFvIRhfrSaocwQP8gKJ7EoTSSTCJUtZvzmOgOyA
         IOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oh1SBXH+D7KzyJT86rJElN4Gqc1Eq+pv+Q6JJ2erICI=;
        b=C6Eqs1+3zh6YfVuc3y7xIjoAQp5lm3BepJhQ0IgmMBDk+DPjTmuq6JNdn8bBeuGy0E
         YPfhDYoZo8s8/OvMtWdOiiDJLdun92VRwG/w++2Vih4WsTyH1KUb39Kei0I/pKB0sy7+
         u4CK/VVSuOpwl60IcsbY4Gv40Tb8uU052PgW9dFTnnQjLXvWGjwY2ArHMr8YxEQwkODG
         wVL5TaK6hCPm2GIj9ke66dR52kuprUg6c6S8mM/ZNOeNjwcOYDnGgj3i0U6KIZfKI7bS
         0iqXSo3edV38cV9we/zhyA78Uc2jmMRQMs00UuppvRFtp7dMzpweu/KXL+7vZThWoOrt
         mKgw==
X-Gm-Message-State: AOAM531ed3QQdH80/oufxpkm8s2nWLPCXFQsevUk6VJi/7huMDxA6qQ8
	PivqPPot59UMPmil39LyDNSYN8YU158=
X-Google-Smtp-Source: ABdhPJzBlxVTAI1barkt2LZ5N0ql83jKwBT08EM5ToMIN40iOWBlL9ECXvy5moR4ovt7g9vitT2OZw==
X-Received: by 2002:a50:fd11:: with SMTP id i17mr26855833eds.23.1621879192804;
        Mon, 24 May 2021 10:59:52 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s21sm9602538edy.23.2021.05.24.10.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 10:59:52 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] zsh: work around file-rdeps QA issues with usrmerge in DISTRO_FEATURES
Date: Mon, 24 May 2021 19:59:48 +0200
Message-Id: <20210524175948.1867428-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.8.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.8.bb b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
index 6fc5f4d993..f87231db2f 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.8.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
@@ -51,3 +51,8 @@ pkg_postinst_${PN} () {
     grep -q "bin/zsh" $D${sysconfdir}/shells || echo /bin/zsh >> $D${sysconfdir}/shells
     grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
 }
+
+# work around QA failures with usrmerge installing zsh in /usr/bin/zsh instead of /bin/zsh
+# ERROR: QA Issue: /usr/share/zsh/5.8/functions/zed contained in package zsh requires /bin/zsh, but no providers found in RDEPENDS_zsh? [file-rdeps]
+# like bash does since https://git.openembedded.org/openembedded-core/commit/?id=4759408677a4e60c5fa7131afcb5bc184cf2f90a
+RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/zsh', '', d)}"
-- 
2.30.2

