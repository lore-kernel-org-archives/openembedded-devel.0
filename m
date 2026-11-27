Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3724.1795810344933710679
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 12:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rTgUwQdD;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so82798575e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 12:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810343; x=1796415143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wbJ5vPyTbWUM6i7Yjcf6gX/ywn6KMEFPjsN1ZpR0sU=;
        b=rTgUwQdDOmHbQPdE5tzaI+3E6nGt+kL0wYU0ekpBDfTt/JzBekj6AR6I7aA4TCd8Qk
         7kbQVQ2/qUmq8fxZs38Q0EV4wv/BQuNBYOprQ8vpO1xZMj5PvW0QqLWn9Cd+Ftc1RvNd
         gCp6/8KvNBA0c+kQL1nJcXVc6Yw7kI9RBKpr1U5+PmhPbCbUmR/pbuul1E3+Ya6togyE
         KgjocLlqAKe+ECzAqp8KGUfQwDYL0PlwJ3+oZGvAFqsGqPEfmWuxvR8LPdnHWEyzKuA4
         wyg3Qq4bR11BuIqAP3kvBFsy4lUo7Asl6IQCevU873BCXfaj8coCLLiE0dtt/+j8+9xW
         lJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810343; x=1796415143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/wbJ5vPyTbWUM6i7Yjcf6gX/ywn6KMEFPjsN1ZpR0sU=;
        b=GPBSBjyJxgm3y2BYdBeMlYLkG5pg2zCJbJuY7zKT9fTmjr517fyXWOzmdrCGsSDFsJ
         ldOGDPaxVtvkzQb9lNv/aU7HQ/pLXXMBcgiAW8XBQ5c/Q2FFTgWbPhd5Wi5PF7iObikT
         YF/T2L3jPFvgQxXadEbe6zGuNkYlv2LrDmPdS7rF/8+3rDstFrG7eOnsoxrd0rP3iW33
         xrOAkAYIIv3lQxwYXMuFMHlyVQGRO+N1LkleSNe/BsBKXRRS9g3eJ/e1yJkAZ1ePOil0
         MFCyhV6EhwI98qmZqIVve8EqzAZz3Z0ZaEqq/v12O4zHyC2AfJ3AlG+FvPuwdJjaJ9va
         kmhQ==
X-Gm-Message-State: APuU4Z/66h1++JNjbA2rvntEHo4OHv6k676OMCNA16J7Yn3TlBJB+JF3
	67dd22YIThUMFepxLgfCq2e040p09H0KTQPF8Tes/Ab7v4Ja0PevHcW8iO9bnA==
X-Gm-Gg: AZFdTZcN8pHmoxOOeazfjb60AKwgfdc59gMLL79iJ7qZW3FOMRCTHopNSDXAEsXy/sV
	G08BPJw5EGxuY1z9HIgMf7ayyCeRAPS0yuGWc9OGGt+C8YlQ8oEyvGVRT/ukDqtP5IMNw64DyQH
	5D2vR12X63/OaqI25Y21EfI6xkl7/0IyMEFAJNTcwJIIdWrP8BV+nC3QuP0nYrVvFYzxyKZZWjv
	HqQXdD0Iej8es0x3KlOnmINWzvgBJQqvEghtJlYvjMgmtayrrBLKMtQL2+tdCFkVw/OihRQQybd
	mQeSlyekkwcx+h/52lzCHakXX/UK9D6A3m1UlrTCC/iJvxEIAnNGMzcugvdefRd4smNxMc70Tin
	GZu3cCfjwRLmlivOeUFZ75s610DLvjPXUqjxz8FjhWjdZxTxJv+R7uI43MPhJ3V5LU7gBFAQ66n
	g6zwyKYXct4D5QFyT/UPi99kOuBCUNSx+MhOdX63CUqpr/MJ0gT02iMHC1X3DD5yzYL4i/lJgSX
	E+lmtiqmgegzv8ovjY/JGuNQnlkwxcNcx3OZxOnIwBDLleJUPn7nlh4MSlJ4SSMmyigxV6pMbMq
	0wTPLzqH3oCYepmp41Ksr1+RDwLR0GhysRA855zr/WjeQcRp28CMUy3QQajfkJXILWo=
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr508831425e9.10.1795810343197;
        Fri, 27 Nov 2026 12:12:23 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm51460047f8f.29.2026.11.27.12.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:12:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] gtk-vnc: enable pulseaudio subject to DISTRO_FEATURES
Date: Fri, 27 Nov 2026 21:12:13 +0100
Message-ID: <20261127201213.914864-4-alex@linutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127201213.914864-1-alex@linutronix.de>
References: <20261127201213.914864-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 20:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133389
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.6.0.bb b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.6.0.bb
index c5bbf8464f..cd2fdda8c9 100644
--- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.6.0.bb
+++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.6.0.bb
@@ -21,7 +21,7 @@ VALA_MESON_DISABLE_FLAG ?= 'disabled'
 PACKAGECONFIG[pulseaudio] = "-Dpulseaudio=enabled,-Dpulseaudio=disabled,pulseaudio"
 PACKAGECONFIG[sasl] = "-Dsasl=enabled,-Dsasl=disabled,cyrus-sasl"
 
-PACKAGECONFIG ??= "pulseaudio sasl"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} sasl"
 
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
 
-- 
2.47.3

