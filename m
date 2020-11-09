Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.15229.1604943511206123808
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZmVusA3Y;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id r10so7728225pgb.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HOlRAz6oNSUYhOTL5EBk1D9OTwmE01AeMNlruASEQhI=;
        b=ZmVusA3YkDece7UsnKzqB20IcUpaeqJtCFaRDp5fpQOUkGVlJTKr1tvoRHcqaFm/9C
         sKVW9c9GcZN7osFf/RNuNlqdHF9+vJ0pQ7nusv6phhJV0X7F63saTQJ0k+CYKoQVYSnh
         Dz00gTwhLEaFkPYNCLc46nTzhcOp9SQDVJdrZlpZJRSVIiJ39HMdDjbro0x04Vz/px+5
         HwZWmbOPOV9eSp7jByL3iox/k2HNmrkqB6THrsewqh0G88MlN/5YaB5gCKIs49rFv66J
         4YYKCFVvyHAit0/b/DZNZWnFi0R8LJV2Ah9Mnv9DQ+ABDGC61vxp3m/T4YjCq6X1IfvH
         WwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HOlRAz6oNSUYhOTL5EBk1D9OTwmE01AeMNlruASEQhI=;
        b=jwEfY3SwLKkbK/7xw+tSM1yWq+j9vVFppxPfIPPuuFolFG9xVynJJRSS8ysnHkwGqm
         oQABJpwfUX/LI55QmimZnQ+cv2enUthgh/JkpDtUYcqR76BkpdtnTznyhFa44dzZp6Iy
         4u0ZJV21NCCAezp+UNMHwLWnsfT5WaPS/VnZG6bM4M1P5yyNArLBh5BU1QWREYd3B0Ws
         gTHUZdKjFsY/wqz7/JugyjecpTril5kio6uiu1IUXVRaGLG+sPgd0iHnVWWPq8DPZYyC
         Mv+o2ApRXFzr2Kdh7/yyiJ5rWDfglTCNTyqR+zYESgo45pMGm+ZHtC1Nka0Yl1OJ8sdK
         4XIQ==
X-Gm-Message-State: AOAM532hrx0NcswdPxNOpJc82WjjZMCh9yz71Qq9kMHCn7SvfK1rb4Te
	UAFmeIs1/TAPqH2mk+nSQaypAuTZc8M/Aw==
X-Google-Smtp-Source: ABdhPJw2gqJtmGEx6b+/Hmm4LpqTMLUwpA7jgm7huXJDrhxjZHgqSf/8VKadjqviORCHfzVGmJ/KOQ==
X-Received: by 2002:a17:90a:dc01:: with SMTP id i1mr240980pjv.195.1604943510475;
        Mon, 09 Nov 2020 09:38:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id d7sm11198467pgh.17.2020.11.09.09.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:38:29 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 7/8] dovecot: Disable LTO
Date: Mon,  9 Nov 2020 09:38:19 -0800
Message-Id: <20201109173820.3545516-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109173820.3545516-1-raj.khem@gmail.com>
References: <20201109173820.3545516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
index 0f7fad2b24..bda1740234 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
@@ -44,6 +44,10 @@ CACHED_CONFIGUREVARS += "i_cv_signed_size_t=no \
 EXTRA_OECONF = " --with-ioloop=epoll \
                  --with-systemdsystemunitdir=${systemd_unitdir}/system"
 
+# Uses hidden symbols
+# libssl_iostream_openssl.so: undefined reference to `ssl_iostream_handshake'
+LTO = ""
+
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "dovecot.service dovecot.socket"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.29.2

