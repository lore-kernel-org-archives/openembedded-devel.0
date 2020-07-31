Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.19822.1596206591302863029
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 07:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=glwauTGm;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id w9so31647374ejc.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 07:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nREQ1DrLaccrtZRTFyNxTSQpEwC6Ppjdxnh84sCseX8=;
        b=glwauTGmFOHWnoyCN2erO36QYqxKODaeoLZXMzZ6XcudqFbnrne5wSd6wabQmUS+z3
         80YrARrlijgQzvR3t2SNTHCKqZnH5ac4Hkrehau16PxEcHZQ+bT+DQGlibcuLJfm8YDO
         0SOk2Oy5hyUBh6GdfA2Vr/0yYdJctkhh5TVCGwTQdZc1qxxOa2kzvRBwWJU6Yloe4Gso
         ZT6aC4NuoN5czvHN2VUI1/8ODvG7VJxAREJXfmpo1sRztFkZXW0xjpeCWCrV1wKNq/sI
         M/pNcwG+fT0FwbZSTCejx1rkmZm9IL/oJHow2NI835SgtytmA6Ui8SHunbT6bBmEj4Yl
         az5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nREQ1DrLaccrtZRTFyNxTSQpEwC6Ppjdxnh84sCseX8=;
        b=n9bJsAHgrkKeUNZUKi/22E45vXEC1Rp8TegZhw+Sevy2tpUKXZwWV/RerlkROzPP9S
         cX4+3Jihu+WbZKSg/7N03Wj7qmdVdoHDLCcUKQNNhwskKBlwxM0be3cC8AL2OeQBLuZb
         2yyQ4CWltZNeD6+SNW6n8y5Iw7yoHfOFR7M3HfG+0S03iRlKl/LbC+lqI43WriLdlaS1
         mNM7GLQt2OHRWXdk8PqO2R8S6kxomCja4OPFhTfo6InhPO9MFPgkChDBzfI3ze/eqEIW
         9bj3WGsCv/0T4rKnPwK/r4vXJf8CWPWhH25hFTtHAW0SGMCYqWfdY0Q1Wf4Wo5K9SPhF
         a9Yw==
X-Gm-Message-State: AOAM532Hx7Q0qxTDkj/0dmy3D8ZASeCjp4WT6mtoL2Om66QNcMsg/IW6
	Ieeqlrsu7PLdIR/iqOaIIjMkLtqx
X-Google-Smtp-Source: ABdhPJxpqmTOnod0pB3bvHnsNuvJClyb3WDkUBuAdlWI1A5ZXjppR5WmQtKdtnGr53CEAwgfSraEAg==
X-Received: by 2002:a17:906:a219:: with SMTP id r25mr4434647ejy.201.1596206589387;
        Fri, 31 Jul 2020 07:43:09 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix05-Bionic.lan ([2001:b07:5d32:c012:3f:a5ba:1524:a0bb])
        by smtp.gmail.com with ESMTPSA id h18sm9711747edw.56.2020.07.31.07.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 07:43:08 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 2/4] dlt-daemon: add new dlt-filetransfer PACKAGECONFIG option
Date: Fri, 31 Jul 2020 16:43:00 +0200
Message-Id: <20200731144302.7074-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731144302.7074-1-costamagnagianfranco@yahoo.it>
References: <20200731144302.7074-1-costamagnagianfranco@yahoo.it>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index 3f5089672..74270b579 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -37,6 +37,7 @@ PACKAGECONFIG[udp-connection] = "-DWITH_UDP_CONNECTION=ON,-DWITH_UDP_CONNECTION=
 # Command line options
 PACKAGECONFIG[dlt-system] = "-DWITH_DLT_SYSTEM=ON,-DWITH_DLT_SYSTEM=OFF"
 PACKAGECONFIG[dlt-adaptor] = "-DWITH_DLT_ADAPTOR=ON,-DWITH_DLT_ADAPTOR=OFF,,dlt-daemon-systemd"
+PACKAGECONFIG[dlt-filetransfer] = "-DWITH_DLT_FILETRANSFER=ON,-DWITH_DLT_FILETRANSFER=OFF"
 PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF,,dlt-daemon-systemd"
 
 inherit autotools gettext cmake systemd
-- 
2.17.1

