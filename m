Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A00D33A52
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.27829.1730831894794460780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OISzr9h1;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ea1407e978so54705157b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831894; x=1731436694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egMV2c0d0S7IIyN9gJIySMw+Zk8ynRV+DmzfmUfTdxo=;
        b=OISzr9h1YelQ//lDSQXdVPtRtR5jCf4XSNRZ3/4qxUYBKWZtKmHUAyHMQ4cqZXz+ij
         ty3dCeJ4Vi/flGDanwwr9iRTOCQi1Kq0qBTNAOy0ZBqsDh1mhyePfbZtb5JJvVY/N+Dn
         gen+AZp27NU1btPmE90IeCPh+ASf9TY68LzCzqqYsups0Y5MQg90CBVX3+ksdsHgOt3k
         aJxgTMrBNvvXbAKiIKojQgZhnjZGRgXsAm+s4+INOB/TS9ZRnioGq3z5ldSCEqtZ6CqH
         ML3xHTnPABGdcFfMLC2PjqmKJ5mImwWGDteDDS/AKcAK+hz7UaSR4QSB5p0odLNoPvvG
         ntug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831894; x=1731436694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egMV2c0d0S7IIyN9gJIySMw+Zk8ynRV+DmzfmUfTdxo=;
        b=D0JOdD0CkfGHTkv42MAs5mHMNH8cDOdDcl4jajBngSAjSvEW4WaFAH50ImpyHKE0aF
         DOtdxugx4v20kqyvdj6lVPX8fQe00UowYjPwyQZDSJBvPP6Wx0BmyEIWlI7OcMZRZbuX
         ou2X0FfhhxwcitgFCTfh77IX2qLt7/xU844aLANq1uefcl4dBg7R8BOLtp9lY8T9Y/3/
         puNCgGvnyqyAMXmkKTU0fObSBcerlybsB0/Aoob4tgjNWK+pC2NfJHMFeUz1dayhyaWO
         g+xHK8mnxxQfmnLxprJoWGI7bQZJ4TDnoZjKsGVD8MdZ9CO26xUcCYs8eGWP4ZD4cifZ
         Sp4A==
X-Gm-Message-State: AOJu0YzOi2+u+3ucqzukIbicBvNhZskzH84jrTbFs8P7LHKP3Lg8npOH
	2SQYVZs07it7hopgAlca3nzQ+v/QjyPe4g/iMX92JlWpFKN8Fh64Iqn0VMTD
X-Google-Smtp-Source: AGHT+IFX4Fy7yEjx12B78sbdX2hkOCKaj7Ikx/phpr8ZFnDUg8bfvHXz42qjG730ofSFTh8ShJsLFw==
X-Received: by 2002:a05:690c:690c:b0:6e2:a129:1623 with SMTP id 00721157ae682-6ea64be680dmr178227707b3.38.1730831893421;
        Tue, 05 Nov 2024 10:38:13 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:13 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 021/161] wvstreams: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:57 -0500
Message-ID: <20241105183658.34982-23-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113536

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 3b72e4412..4bb4c11d6 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -25,7 +25,6 @@ SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.
            file://0001-Fix-narrowing-conversion-error.patch \
            "
 
-SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
 SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"
 
 # The code.google.com/archive page is generated using Javascript from a JSON file and does not 
-- 
2.43.0


