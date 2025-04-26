Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3157DC3ABA0
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 11:56:51 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.7360.1745668603700226357
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 04:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=STHx8stC;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ace94273f0dso34542666b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 04:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745668602; x=1746273402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6YP68k+IC52T4EoZW81Iz3vLQI76GMasbh9OlJIkwQ=;
        b=STHx8stCnbSJsu9jrCKn8ypTQ3GC57wfvVOyn+wif52Unw/h/t3e64OPxydZEXZpqF
         BIKMgW7dVfHXZhHHykAOQvNlOUGonXzznTshvdGk8Qi0BZ/KoI0gfKHAPL0ngiNQU57y
         JqlztHcRpE3w9oORAevE0sR2ToFquDXrSelIk9exANdXJwh/UefGmRiURtuCYGi3WRza
         +K3vrCtIqbgi5Tf7BIOckH8stDUqg00pxSrWZV3u3Q8fqZG3OCqAktIGqLuR+7KCbpY4
         /rt/rwk9TvvRlBItvdQLudMt8RFKu8vil7Qmm9wgGQmt58A7JRFTuqpnWjT44LBa+ocS
         Z8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745668602; x=1746273402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6YP68k+IC52T4EoZW81Iz3vLQI76GMasbh9OlJIkwQ=;
        b=c0ahtbOnE6Yv5SnRmJj2Eu7zKuvCbBptsmIqf7JTWRMpCW00HzbECoa7aHm8Le94l6
         u4/2eBNAaZ8qkMB0Cry5mSywXu+XLZ8Nbx0KW+RMUKNM1df+frw8TjAl9Ptb5TvlSTxY
         SwqRaZj+M4/cDVXwIVMGVQz7qHnsN5HsaglHy9AAyAxRtyVnFjpavpWvxzJHKANPYyCZ
         GOEkFQkDhzCQR6kPIzCKLhDv23IJeTawHZtR5WR/w1IzRbOby3P8onh8Db35vkRBh4kV
         giBuaPHTln8C0KEctD98Y/vbVnyQWp/A1q6yEKfBrb6ZsN7uMOTqX71+qXoLHzIv+Biy
         tmKA==
X-Gm-Message-State: AOJu0Yxgsg6sgc0RoweNKgsrx7zQCjDfvvAqXGsYVvDRidJ3XqRcwfvd
	cngjt0JxsbZArMy+VkwAOjAQyofp+/bM/oXluigc/Mv+9QqNqEAKyL9lUXFj
X-Gm-Gg: ASbGncup0mWeTuoD4SgfJIjZ5VM/779+m8tU+VCuEt71wRG7BhHf0Arqv1Tkqb+QPVQ
	6atQD+orSI7AlfweD04lXlY3Z2Di1NzQrPoh55USOuiWpc58qN7soX/h3izs3PdIM3AFdGM3FOH
	Azl96bK43njfhKiR2Wyfi3p8OvipfDA8BGIq97VKo/8KCKJykb714ivRNYBugYczTBuJr19o5Bj
	KHM4+AYv/VQDxApNxmie+9lBD8umaGdXM/tPJQH2J00Pv64PNfVDnMfR6drqp8mkRXk7Xsjs8ps
	sQ6ZMUQmiFwLJpEfJqrNqjmKTsCZzunuI3T1hCzegdP2iN/7DnhS2ommeiw3Pj9ow38wmIum/ey
	mQ41f/+R/
X-Google-Smtp-Source: AGHT+IEBAFBbeq3uw//oo7j+zE0iUCzSTObXOe7xV8Mu+tDUX5GFi7nGiW2jO+p5pEoNycJUEvI6gA==
X-Received: by 2002:a17:907:3c96:b0:aca:a204:5df2 with SMTP id a640c23a62f3a-ace713ab71amr492680466b.49.1745668601942;
        Sat, 26 Apr 2025 04:56:41 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6ecf8496sm283058166b.95.2025.04.26.04.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:56:41 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 4/8] postfix: use gnu17 for now
Date: Sat, 26 Apr 2025 13:56:19 +0200
Message-ID: <20250426115623.2732743-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426115623.2732743-1-martin.jansa@gmail.com>
References: <20250426115623.2732743-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 11:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117145

From: Martin Jansa <martin.jansa@gmail.com>

* as recommended by postfix author in:
  https://marc.info/?l=postfix-users&m=173542420611213

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
index 89502d5044..a9a2163a2f 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
@@ -87,6 +87,10 @@ export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
 # ignore the OPTS="CC=$CC" in Makefile it will not use the CC=$CC $CCARGS
 EXTRA_OEMAKE += "OPT= DEBUG= OPTS= "
 
+# use gnu17 for now as recommended in:
+# https://marc.info/?l=postfix-users&m=173542420611213
+CFLAGS += "-std=gnu17"
+
 do_compile () {
     unset CFLAGS CPPFLAGS CXXFLAGS
     local native_build

