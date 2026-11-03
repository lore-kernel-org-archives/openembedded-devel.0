Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1474.1793731024238722350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xghvPbtr;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-19430bf08d8so18613c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731023; x=1794335823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JX+lYPMTwlEmfa1GvqPPrkuhIcv04by/4AX48+j4h1w=;
        b=xghvPbtr+sp/h6ZXOzpmqyYL2lq6cs4G9M2emgNtt53hZ7f/v9RrPulaCOwSDcvGfo
         unVWG3PgyVjzUTtDnN9JXH8Ze0NKKGUKsdfEXRF/dNmI0W8YN5NIxInNLaanpfRs7w7Q
         QpS7VcZinKnbNo/ZeT2GisobMN3Wp5a/sIb5ZwChScfL1iW+yoy6Cko/VWfr2yxqBU0A
         QVCKEFwNDZb329GIAxnNcwJ0xrd9WcCz72ylVPRI952RojJ7Vs2CAHTyE8r4TYg6xFxg
         UL4wzmZ0HquZ1L6XCCzIU9nkwq4HBQvoIyh6bGjRllyAyID04P6ZUsnmcw6FiWbug2x/
         JFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731023; x=1794335823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JX+lYPMTwlEmfa1GvqPPrkuhIcv04by/4AX48+j4h1w=;
        b=RN+PDOPQwfP1WTJDqdLcIj1BGJ5FO5ZoKNIB5QzXfbQmymd97ZX/B5vKreZJRxSBF8
         2i6rZUFkEbSfP+KPl87a4eQT6IwxYNhknLLu9kprjOUpRdv3O0r915MPwPkRF12PqPF+
         2RyJ7Zgot0gWr55wJiSDxoqCHOhJ9GH1E68SYltxKSEKyCyV8tDR/W/iLxyDk+6sQxZ8
         TOKv5rsWvkw46h2aMwIBekd056iw8OyDolWEj4j+EqPdzKOfDTgXKFQ7QdoAqEmkYT7z
         /k7jJF4+GbpKCw6dcETDFBzSQ1/7LMDUU+yx9QVqn6HT08acqqA9temH4Q9Gem8ro7Fq
         ZR9g==
X-Gm-Message-State: APuU4Z/JxMj2jPzoQ4pW9wGCstKTicXJo7t0D7yxftPrTvXu3/ejgrLG
	+4S0HMKZsT+MV5Jv9h6ms++ZoiFsJhGQc1QVNuHObnqrtmedKAzR8+vX6shStg==
X-Gm-Gg: AYBFou3UfS6ilEOFFh/Je0NCHXm3lOQ3zWKYjKoYDgz9mu/Tr+9G+KUJP/JceVGnvp5
	7YQeoU3B/JDLiuuZiPiBxqsI8oSbE6McVgiczMTl7Nqga6rR+tV72BZjL+8vmvWnpRisQvMkKqq
	05Qpqx+i8Ij8kchPBFrHmk/NwN/aJTQWIzPTFGouXrMipNONLavCTk7UgRfs3LvX9tItQLSfUb3
	sG9fIShg8Jiq57JHQE25vFOc5zN3yY36TsoLPlZ11Z2CYCK2S+JuGuzMU9jopFdeBIuAsYsujla
	f+T+K1LyE4fi43OCuqRLhPUe2ugd/fREAyIrNPitaFFlxplRS21FNySF9N48EdoscRo+yGA5WKl
	H3R/PvaeT3fJmrL0CH55+rvPnc4LMh8kvPTZyT00K8hTWekGZEy1UIdxUN0IoneTQC0WIEQXl/+
	x/IrFPcV8QJ58xJPlPCiA1zI49hW/I7exL4PHlsFuxqWWLKqBlj8S2abL4FICvgf3lqo4UEdah0
	9zyr4KmJEGFh7VK6LsojbUWslu8UONO13KQAycpmKilfkw83pQYGUYSgWnIPftmSYe5GQrRyn3f
	F8NLBoUJPKnSRo5O/v60RIKLgUkLVhjWdMAougzMISNaf9RcDfB55eyy/3IJ8g==
X-Received: by 2002:a05:701b:230f:b0:1ab:9742:e860 with SMTP id a92af1059eb24-1ab9742e8e8mr19888719c88.20.1793731023426;
        Tue, 03 Nov 2026 10:37:03 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 9/20] thingsboard-gateway: upgrade 3.8.5 -> 3.8.6
Date: Wed,  4 Nov 2026 07:36:29 +1300
Message-ID: <20261103183640.919438-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131807
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/thingsboard/thingsboard-gateway/releases/tag/3.8.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...hingsboard-gateway_3.8.5.bb => thingsboard-gateway_3.8.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.8.5.bb => thingsboard-gateway_3.8.6.bb} (98%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.6.bb
similarity index 98%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.5.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.6.bb
index 8dc725b445..e39d69c3cc 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.5.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.6.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
 SRC_URI = "git://github.com/thingsboard/${BPN};protocol=https;branch=master;tag=${PV}"
-SRCREV = "c51e032432a1f9fe8fa47af9683e077da98e41c0"
+SRCREV = "4401209296528b6f51e6e172d3be932694e1e6b6"
 
 inherit setuptools3
 
