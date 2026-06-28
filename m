Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BF3C44507
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:16 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69136.1782634328383003572
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WjJosP+1;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-137335bc3caso4622751c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634328; x=1783239128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otaiVhUMN1Gf3CsBrLI/UOnURG4Xm7gglqcMQlK+fYg=;
        b=WjJosP+1Mpr1e2lpVKAoR5jdSHZPm30c4TrLrMZHernaRBoUKUmBbKu149QdKec18w
         cyPmiKu3+2KfDWS2isecIqYHyf3UKeJ+pj1UX+nslTO1opcjJavzYkeYXUbCyhwhYo7k
         3l3xK8OsDWauMwSnnVJgvGvcoiR7o7wc7/pDGJ/YsB5TUXe4wdm0IAHtzaONV1n67Iti
         gKZ8SvuHzGGqLwVYEOlLuYmf86sQk5CnSx2z4b7ScDb4G5j82o0k47k4g/FWdrtUTZvT
         zlkbR5qLDXv+dQQsnhN0vhP7mxO9K5+W2GgVH5HD40t71ZwzDD8J/JfhFIbrCS/uV+dk
         G+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634328; x=1783239128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=otaiVhUMN1Gf3CsBrLI/UOnURG4Xm7gglqcMQlK+fYg=;
        b=lbUsdzYvg8f5QbMr+hPCiwqkdwUme0P35MxKBQ5OV1UoP4aLApC8HQfVjnTGSt7Enw
         i3QE2B/6khvp0X3OMAq0yMVdlSeqO5MfBXvGWIwhSDD0DkndE3xLjfQvjyEbDujZibJy
         uWbk34VQ7RuWMSuC6S3voRJt+HXqSiyGIIpndtouJ/1f9kilCktZw/DdCOtLTYJPHQ7l
         xwcRi0igPcdLqaG1Ebazf+wQk2YG6Ru9htGDolaI4VVG5weJDjHkMTnm/RNmsX8Q6uPX
         n61vYbAhRUZa04E8RuCEBBHywTVY0J4Q+B7cvvegph0RLaVDgceF6ZJnoLVtQ30WFZUW
         dcEA==
X-Gm-Message-State: AOJu0YzPtVRH7CupUEmf1f6wEJ4fWaXRer+8YDrL8Bb7LE0eh3SUCiT/
	gqMPiN+N2OyZdBQaYPK/5c79vEgs9IAApG3UmRAF9lzWTh9ci0uuZVyBlOzwX46n1zPzBg==
X-Gm-Gg: AfdE7cmyOstUap8S/lMImpKVVq9LpM3G+vbo+ojBylu/XELATEQZWvvuFr07Bot7fLq
	frxUmJDVoL2IRxelw6uNK2kAzNZHgoj+WWyApYK4DyMONOCcTnR7YpMSaAslUpeXbhkVMx37Vjh
	heQeLOwuuZsEhJTeuRTIE0HAfskV+mJdmLVO1bdi3hthXtNtWkkAnrpLOkx+iUDjJdw8q3bI1Si
	cAPl3c24cqyYUIswJ6S0srMLYHPRmCvo2gnJPX9tQ4C4Hfn86UBrzA2Xj226qdgN+eVxQYlkATW
	urCPkNnho1OIZCjPMPPDuOGABAVUguRvvE8bRRnGfg64rRq+9hb7GYC7uJehMSHpeosZhiRx/1T
	kj3AJegE6JDrKEkSZfZaWEqSY90U/Y363RxIytS+qSOmHl4KG+69bx7ezkZvGvDtZd7X4ZFGaPn
	2nhwaLpTroyafV4jlUJwo24SsZjzw60iYXEFULi6guoheZ31wyChFbdx5yTmnXm2BU1SPNpbrOZ
	8oh1fVVYE2aiv9tUAsdh0dSAyhURglsPoOtHMZEiR1XMiAgYLY2OaKZdU2+AHG7OkR1SbEEniSJ
	KQ1jIuzIK1OKHT0+pe9uk00v8PWY4g==
X-Received: by 2002:a05:7300:4309:b0:30c:ab4f:9b9d with SMTP id 5a478bee46e88-30cab4fa1f2mr5642962eec.37.1782634327707;
        Sun, 28 Jun 2026 01:12:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 046/128] tmux: upgrade 3.6a -> 3.6b
Date: Sun, 28 Jun 2026 01:09:57 -0700
Message-ID: <20260628081122.178348-46-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127856

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/tmux/{tmux_3.6a.bb => tmux_3.6b.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/tmux/{tmux_3.6a.bb => tmux_3.6b.bb} (90%)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.6a.bb b/meta-oe/recipes-extended/tmux/tmux_3.6b.bb
similarity index 90%
rename from meta-oe/recipes-extended/tmux/tmux_3.6a.bb
rename to meta-oe/recipes-extended/tmux/tmux_3.6b.bb
index 63011ce040..fe84600276 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.6a.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.6b.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
 DEPENDS = "ncurses libevent bison-native"
 
 SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b6d8d9c76585db8ef5fa00d4931902fa4b8cbe8166f528f44fc403961a3f3759"
+SRC_URI[sha256sum] = "390759d25fdba016887ec982b808927e637070fd7d03a8021f8ef3102b9ae3c7"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+[a-z]?)"

