Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11786.1795762942251807688
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wL3dgbzA;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14394530ec6so1574264c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762942; x=1796367742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pOtuCCaCewTovbDfksa8MD1jNhc+DU231uJHLRka7M=;
        b=wL3dgbzAx6/yqW/pwNC/6T52IGQnup72/ohVrysWFOwGT+3SJryAUdzFTEeOvvVXBv
         ObJjjNDhRi5p4jQJ125ByY8tqY+f3au/K+s4mlL9cNGWLOWdIErcWCepZeHpUbQP0txQ
         YNNnSX9R9HoIXobetK21lW2eBlYRpumOztOx3rqlT/gSK0gxLtIkOvhp9/p2Ub5btDLf
         TTPeQ2xB8wKNNvdLQzucGGgav9ndcFGw27i/bE3fq0T9rEmxVk8TWaIAXH6wkpinMBgq
         SJSLX2uyKfxwTBxaXeern67wo7gInZjW6GXvbo91YwQdXr4+3ASFHIzALVQLlxJfcrJc
         hl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762942; x=1796367742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9pOtuCCaCewTovbDfksa8MD1jNhc+DU231uJHLRka7M=;
        b=ltmyDa14QM1FzORkqXJZ+t26zyv9Tm/61ihbyNLjWh6e7COCEL4iSJplmShjZh6RNn
         T9AwhHndeyynP/rG/7pLvsvc444TLQMa21EtPFBuVfPj11yBnshkL6PtIa5YRZlJT+Yc
         p5dWVUD0nAlmiY7odIXrazZqfkrZarjLobKsFKLzZYYWEpXomBprLGeg27Gwz20OXnbT
         EqvI9eWAyyL+BTmiNnfl2/OtuJ2vhx2uJwOsN7gBluKmDTIWhT6K2Ul7j4DEysEdfvhy
         XmsUzmMNJQ7oboIav+fA3J2uec7gTlLmWXiuxIm0A/0NwUdCd5O08Cz2qodna4bMqTWH
         hF8A==
X-Gm-Message-State: APuU4Z+2lPL0KKA3eFg6V1LxzpSXw3WN6IbyZ54mUOdnw5tZLUE21a8Q
	2gI1ujHfk2i4pReY7X9qq6bISi6bM5HMeO0eeidMlFq2QjG/c7cltmf98NVJodsj
X-Gm-Gg: AZFdTZdbIxQqA99kP7kLtWhZt9zF64qmos3KboNvzqXeQ19qeI45Fb8Sn1AbAlnFx9l
	F1SHUvEniErmyu0Kez65mvS6i7pfWslbLG5jR6rUk0O8h1W1vv9yEKMAvlDx9jpykWixyYcZCkG
	GVpXGGZR/wMkoWS5Kv1q1SAizwQQ2IAEa+0CVUKZ+LMKkuvvutmwwBl7lH578ccKMa5xpHD3fMK
	ga6W0eyA8bNtzPJbpEkmRjuKIKb9Zlc3f2Ijedgd8nZ0VvQCppU3ho3bpJQ5II96tlxgQYP+ugM
	U1PJkP88c/1l7LdUsS6EGaGZFZEtVhjVqiXQqtmUoEzya380gX7gj3dgsfQohg8qJljVZvbVuHi
	BenQHf9JiU2l2bCe1/FqqfpXOlpFhrexavlxZLf/CuKbR5XvzliqhBwAU+NHmM/xB7W+5tSulkv
	EnpFBkSUHIDBk/JPC0OVVdfJ8rI4/xAjAAilNjgiEc7PFjwqb9whuLKQEUecBakOqQc1DiuV37u
	/VLeTz+8arPJwb23waWll/67NtFIbfA7rHo30d4V2VkJvmoTAPj43Z12vj1VJPkDWSupaFEcCWq
	0XieNYVqlhFglpZYqrPUp86/+QVOZ+ThGzY/MYGzKqg4JyAkR6xscikZKjIANz95S4f/iYq3Kqj
	GiD2zgljANpMWqfuc+a2dpjjvKLAV5wK+YTj+fWTuL6uPkIokDtSU9E4DyXW69Z3EGwpCaTlIZj
	gwg14XiI+6nF56h1QVNBZroYwuyvY+TKpqAIXIIzD0QJSrMfWiCfgWSVyHwE0f4+0DTwTrRo8vL
	okpZunwX7nLeOV/iU66BH4PTv8LAyGffoFklQmfePtHYRdJngBiby6pWMF3DuAJUWWIJlesPFCB
	Hzsp
X-Received: by 2002:a05:7022:ea8a:b0:1b5:3819:f8a with SMTP id a92af1059eb24-1b5569050demr22944898c88.38.1795762941491;
        Thu, 26 Nov 2026 23:02:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 06/21] libpeas-1: Restrict upstream check to the 1.x series
Date: Thu, 26 Nov 2026 23:01:54 -0800
Message-ID: <20261127070211.2329979-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133333
Content-Type: text/plain; charset="utf-8"

The check reported 2.2.1, which is packaged as libpeas. Match stable
1.x tarballs only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/libpeas/libpeas-1_1.38.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libpeas/libpeas-1_1.38.1.bb b/meta-gnome/recipes-gnome/libpeas/libpeas-1_1.38.1.bb
index 3a76ed91cb..25ca4732a6 100644
--- a/meta-gnome/recipes-gnome/libpeas/libpeas-1_1.38.1.bb
+++ b/meta-gnome/recipes-gnome/libpeas/libpeas-1_1.38.1.bb
@@ -18,6 +18,9 @@ SRC_URI += "file://0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patc
 SRC_URI[archive.sha256sum] = "e82fd328adcac1aba34b64136bdfcbbacf2b3258a8bc4e5f480a72502a611ae9"
 S = "${UNPACKDIR}/libpeas-${PV}"
 
+# 2.x is packaged as libpeas
+UPSTREAM_CHECK_REGEX = "libpeas-(?P<pver>1\.\d*[02468](\.\d+)+)\.tar"
+
 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
 
 PACKAGES =+ "${PN}-demo ${PN}-python3"
