Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90A0CEBF61
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 18:23:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13880.1763230995731277120
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 10:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kAFqPtOd;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429c48e05aeso1799194f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 10:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763230994; x=1763835794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrwTeRigPNebJmpwm4uecmXzfVqAJhIWUXfOp7rfRBg=;
        b=kAFqPtOd/7J9HNN+fjsyaJ01P6NwSn7uVXK4odGgJl8+mTDKnbbygHriXHWdbItnuV
         5dCs/r98pu1yzibNtl3KWOaWgXhhGg2iAeY/hgAbZSOKOdAldLgkloSvre+GhBmYlJlB
         xkuP3RuXpdg7aU1F5Bl3eFRWTd8b71kmi7BwTRHkcLhu7ImTHS29trxOyNHJYQgGn6bp
         45+VtOGNpgJxj4sZ5w6wDoJNmHheQEYP/fNi4D7OslmAxt5Gh35NYVKvD0f5COGqhcbm
         bIZlQHGZD0oNap2Mdt1zhuMIQ7govy9hfgkvhys8QInN/TQf1lfLvL3JOshJj5fVOdGz
         wnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763230994; x=1763835794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FrwTeRigPNebJmpwm4uecmXzfVqAJhIWUXfOp7rfRBg=;
        b=Kqh3uOXvy81gDgtpbiKxTctIT2rVoqilllkte8hKRb7lXdkPn/9QKVfT81HpXkjqgz
         uGsDATckCQGMfW+yERFwuOVH43haikibWBpfzJETTVwePfajiQxCu7Hrl0AQMdUu3T3r
         pXEaav3tUxuJcrRt4EgfnaPqfbpJtnO62w1HfVHIGJUserQoqATTPa3Rz+2MIeQsVAKH
         QPj2gEzs1xGG8agIj+Q1jwpEOaYel8Su6CbqNLl6CcPINdd1ClqnuLOzSpLH5FQeWRYc
         SEiS/2vzbUYG+AZi/t2NYNs/QUqxcjV5GXWo99y11MV+7/1LTF4rzpPkdQbxoCsJ8tBJ
         N0gA==
X-Gm-Message-State: AOJu0Yy9U/ydCDa7qYRQN/Pz7wlmkCkjyYlMKQT8LkZtHQaszDMCNXXO
	2h6bKNc0XJIpObtzGn3JZ0Dbor417E2mVIZE6MJL+2Mo9+b6UO+vOlie6muBrEUL
X-Gm-Gg: ASbGncuj/6rDxc3tF4LehwbcXGraMAGNo/oQtVG0sedR0WesbP2MKLGJFdfLBsUhlv5
	EIz9N2dUH8irublkwNJkSvq/zXFnXBFxElfpYGGeMNDFxYBekSuoA2Isc4Q4L8dpb2BFQt2KLTt
	RgH6LG4Ai6Jpb5UbF7gW05yt8gX7q/Y+7DaDrhPCXYMui0+1H0LQN/Ugu6Dh293iJNPhi52kDMF
	E10RFqVwOEXjhLT0BeHLl9Z4NZ45311ty5AwL0gFomvUbJjaJyW9I1yfNdVBvTeX8iagovmbsaI
	JUMojUZ4wqbTE3eoeXYFFlg/uR+HZmhYh1uEplk8//Ds/ti/6Ht5HPQsmj/z2p737U9ntEnJELs
	d0eiXst9puVe/qshO8IliqB0Eit8rDaYH4rYoRnOs0vvYGwsqSmIXfDtDlGQ6ecjSraw+lGWRrQ
	==
X-Google-Smtp-Source: AGHT+IHn7Koje5tYNCOjlXKzU80uhA6gGfEEbXQg4UjGol+k3n8+KBsIpAi+pB9JP41dcTTMRDXX4w==
X-Received: by 2002:a05:6000:4182:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-42b58d67e84mr6022197f8f.6.1763230994002;
        Sat, 15 Nov 2025 10:23:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f176basm16791186f8f.34.2025.11.15.10.23.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:23:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 2/3] proftpd: set status of CVE-2001-0027
Date: Sat, 15 Nov 2025 19:23:11 +0100
Message-ID: <20251115182312.1262645-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115182312.1262645-1-skandigraun@gmail.com>
References: <20251115182312.1262645-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 18:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121744

From: Peter Marko <peter.marko@siemens.com>

This ancient CVE [1] is unversioned ("*") in NVD DB.
"mod_sqlpw module in ProFTPD does not reset a cached password..."

Looking at history and changelog, the module was removed [2] around
the time when this CVE was published, likely as reaction to this CVE.
"mod_sqlpw.c, mod_mysql.c and mod_pgsql.c have been REMOVED from the
distribution. They are currently unmaintained and have numerous bugs."

Note: It was later re-introduced as mod_sql when it got fixed under
new maintainer.

[1] https://nvd.nist.gov/vuln/detail/CVE-2001-0027
[2] https://github.com/proftpd/proftpd/blob/v1.3.8b/NEWS#L3362

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 03a1b56bc7ce88a3b0ad6790606b0498899cc1e3)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
index ec38fb54e1..2488c30d53 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -23,6 +23,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
+CVE_STATUS[CVE-2001-0027] = "fixed-version: version 1.2.0rc3 removed affected module"
+
 EXTRA_OECONF += "--enable-largefile"
 
 PACKAGECONFIG ??= "shadow \

