Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.1856.1620069141157981185
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=suBzXmcG;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 103-20020a9d0d700000b02902a5baf33f37so5606275oti.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=g7oOA8xyPg5ix4qio+xAteU8r1qLOTnHd/y9kUQj7eE=;
        b=suBzXmcG2nnob/9zbkClaedI1F6Efiez23i+MOiaDGteQQRp7RwM+jYjLk4v2DXHJK
         czTvSZr7kRyOsc48lsVCmnbggttXu2xSQu7RU2k03TWq9iFUNZCWJja5ilKoMLnmav9a
         teMtpeJEMD1pcJjJdRnZklRDCJZFbOUsnnLYKu9s8jlTvzpbwuaQPMfN7q3B1Nq9SA5j
         WGJZu1Q6ad7I5G6WPR88ZM/kf0NSvyJTUrGOHwXWRWEcNu0FsOTRdbU66OP/koneayLO
         fxcHuo6ZfgsmH4/ff6lqogA6Dghhkfmm/xH10Ag1WsxKCkVS4otpb4MzE8WgU4YrnzHf
         yrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=g7oOA8xyPg5ix4qio+xAteU8r1qLOTnHd/y9kUQj7eE=;
        b=MdW8BugMJtlWfzNhLMwS68e2YNlUOUMalOEFjdYkEl8pGFJdeYobWulGzG8j1A5B1W
         WV51Bj6rzK5dF/9ycH7QID1VrLnF8t9vvTEj80soLodgkUVgB1APCkmUnoh4gjUceiCS
         PJDKn0En79OzPsH2fZNnZfTF831YBZYi3HuEDzPgTVBpZ1uWc4LL8u40OB94MnRp+ero
         GAW+pwEr8kW0QlPUlCzxJDh+9BsEOg6uvrSKz8NRYBEFv7bP9Xml/GT64izSqBfrxAvA
         T+0RL1SzL4bfmbPqYaMaCjQlJtsqzp93c29w/qSPqbPRFqPQbemcguS7mHyYuOTG7MI/
         65tw==
X-Gm-Message-State: AOAM530rtbOiDvhLktEvhY1aZWuTYiIVtgYT6t7vCNODUg3bcZxAIwfV
	TWPbtPb/IYW4/m95pDe2prbpLlv1MNCaRA==
X-Google-Smtp-Source: ABdhPJz9viVcLbzEwvFIP6o9WbcgKOn7lD810szBD324mU2h8Dig8oZkaFy0qKBRY7MRrJmMrmDcPw==
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr2120274oto.205.1620069140410;
        Mon, 03 May 2021 12:12:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:20 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 12/14] zram: add support for mem_limit
Date: Mon,  3 May 2021 12:12:05 -0700
Message-Id: <ef6adcba6f45ff84b5150c372c50f270edc3cc76.1620069042.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: Sinan Kaya <okaya@kernel.org>

Some targets might be interested in limiting how big
zram can grow. If the variable is set in /etc/default/zram file,
configure it in mem_limit sysfs attribute.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cb1cf053785bcb5670b2eca7051aa11f29ef80b1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/zram/zram/zram-swap-init | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-init b/meta-oe/recipes-extended/zram/zram/zram-swap-init
index ccc3aafe3a..28082f7ff0 100755
--- a/meta-oe/recipes-extended/zram/zram/zram-swap-init
+++ b/meta-oe/recipes-extended/zram/zram/zram-swap-init
@@ -24,3 +24,8 @@ modprobe -q zram || true
 
 zramctl -a ${ZRAM_ALGORITHM} -s ${memzram}KB $device
 mkswap -L "zram-swap" $device
+
+devname="${device##*/}"
+if [ ! -z ${ZRAM_SIZE_LIMIT+x} ]; then
+	echo ${ZRAM_SIZE_LIMIT} > /sys/block/$devname/mem_limit
+fi
-- 
2.17.1

