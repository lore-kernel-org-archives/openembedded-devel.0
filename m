Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B455FC55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:51 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24980.1785872450887189708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gFcBnJl6;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca7c1176317so129077a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872450; x=1786477250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69nW3UFFMaXIUGhahC0Qo1cPpgIsszyAc8zEC1HCirk=;
        b=gFcBnJl60av3L3vc6sNxrPEZ2vhfunvs7LObyW5DbOzmBGaqwdq9Cxw9TDqem6HIp5
         UtXMu6kQc63oIx618a38gJKHhC644Uy8KdhUVtPNZZ+XnEt255bV3YYkUeuUWuYUkPKY
         B81tnyKa2OvXRU0cqjTdZu/ST+paAxuGTBVLPh8Xz9q1OissP6ZBfcdrALfCXPpKknp2
         6ZwpQAxvfNWnQngxEj6VP+mRKKfA8V25p4nNn5CJ+uNGYSMGfY7jJ2iJJS2mCLFb9MfE
         DUCHNFS6nM//WXfXPG1WowdZlJAWQtetX80EtBPPXiVNHC4mBa9wpqQ3Y8tZmFQULZrG
         SO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872450; x=1786477250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=69nW3UFFMaXIUGhahC0Qo1cPpgIsszyAc8zEC1HCirk=;
        b=URw8EDiqeP9FeumHrQjYG7qB2Ik0FwzAw+VXQbhRL3UhIulCINWgGC/FMUy39WsvyV
         ucYk6KolZx3WqrpfZZVKeky6ALILNbyEZY9QlpX33QEVfD39pL/lytknR7OH40urX+a9
         cz/Cp29GjoenY13D8tbx4D6BSNl5+44+koexjcKurWtFMRDE6DT0dEtC9HnxDADLpc4D
         l7Zgnshg+9iSw0eOT1+nuOOmMSdN7AkQepGK1HNzljUhbVBLqL4GhgI2CX8ei8QaNyaE
         OOUBkYOiOnJCAMwpnTz9hJ7N5wwylCwm44YyuZ+70+myQf5ZRh0Uy4uh4AGfCyF3G5dq
         7WMw==
X-Gm-Message-State: AOJu0YwPWJMSQAvLW0Kvp+kJM37wUhfBQ5LO2ahl+H9yym5ggwyEAm1S
	Jinlc0e/or2ZzD2w2//oLYNfYHskigfwNHccSCunLmz2JaS50VIMWBamIbYs8aZ8
X-Gm-Gg: AR+sD12q9vY48+hUpjY+4WV95zLMsKtenv32n4cKO2SmNVbk86RJ08JpgEC9bz4f59a
	WD4OfB6GQed6kUJOUMboG1YxuTT1bIpNt3cI/2k0aCkhCiXusAjd4PdZyIPFKoZ7TYJbh7hGZWa
	hByWX6tvLWvp7BSiurWDe7y8xkY5l2oTsSfh2ULBJPtxwrqbAkFnz6vbCUYhQzYSCIapaaM8lJZ
	XlSUtuzRMHryR/DqETPhyZr1Zrd3kBx5s5HMKrarw3gxmTzJGQuj0Ng5UTnT22vseXVfvJ4NBsU
	F2C2rl075mcq+PFHBXWubh0rYm2tNHpVHxIja66WJfzaQ9mUysshcFlPCKS7gkGvdGUkAB8vf4S
	SiCPc/rdnCs4FkO6NOh61X9U/oriPN1BCx+6XXNLAn7HM04Xj24cRRS7FfCnxZmEI2b/ELWHvqx
	yuE/esCM/wlm2F3weAvmCMCf0viUAMStXtFyYhjz0Z743auUkZnxsg+HPajHeT3SAjy4pk/vwTI
	g==
X-Received: by 2002:a05:6a20:2d13:b0:3b4:7b3d:179b with SMTP id adf61e73a8af0-3cb85dbc650mr1057144637.12.1785872450163;
        Tue, 04 Aug 2026 12:40:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 16/36] colord: set proper home-dir
Date: Wed,  5 Aug 2026 07:39:43 +1200
Message-ID: <20260804194003.3158916-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128763

From: Markus Volk <f_l_k@t-online.de>

This fixes:
WARNING: hyprland-image-1.0-r0 do_rootfs: User colord has been defined as (colord, 998, 998, -, /home/colord, /bin/false) but sysusers.d expects it as (colord, -, -, colord colour management daemon, /var/lib/colord, -)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit f4f7c09deb94ae7dd7d5f42680f7103f2fd37397)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/colord/colord.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-support/colord/colord.bb
index 6eb9db8dab..e918500161 100644
--- a/meta-oe/recipes-support/colord/colord.bb
+++ b/meta-oe/recipes-support/colord/colord.bb
@@ -46,6 +46,11 @@ FILES:${PN} += " \
     ${libdir}/colord-sensors \
 "
 
+do_install:append() {
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	echo "d ${localstatedir}/lib/colord 700 root root - -" > ${D}${sysconfdir}/tmpfiles.d/colord.conf
+}
+
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --user-group -s /bin/false colord"
+USERADD_PARAM:${PN} = "--system --user-group --shell /bin/false --no-create-home --home-dir ${localstatedir}/lib/colord colord"
 

