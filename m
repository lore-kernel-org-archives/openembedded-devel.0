Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CABDCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 15:05:10 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.2239.1712761500476141134
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 08:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=DKWqm1lu;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.54, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56e509baddaso3889530a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712761498; x=1713366298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZmoVKEe6xodSSpz9YfCNt//0EqfbMq8QmIXGiOvO/k=;
        b=DKWqm1luEnM/cHpQstLyFj04oSXKA3Vd/tqdT3fDt2zmDYSVr7HH/C64Kk5xdXzRMI
         1xr7K5cQw1NLE9/VvLNWTDTgsDnCW/4UkCR1VZCgCF1tZXfraR6BLyI0qthnMgaer4NB
         BLy4isGNc0iqb5/nMWEJq0f/qNnwvVdpAjICdQ7H9huEqAzmxuF06zp5ravbyYZAc7VK
         lj4XiZmW5+tpCxXRsekkz3z+6YNprBB4i0kY6OxTX3d6ww3axH5bAL3HjnT2UZoTlrEV
         gwRYSHgTEzWMch4NDBoWvQXuh4VrNfPSljPfzDA097RUhBR0Zkvc4iRPKgWSwOJoINPe
         liyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712761498; x=1713366298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZmoVKEe6xodSSpz9YfCNt//0EqfbMq8QmIXGiOvO/k=;
        b=LwYxtba26Q+MkxntKxuz/Nw5uH/pg164TQYfF38t7206UTebgjvP4rW4WdgliAmNY4
         x+bjetfc+kAUSHn4rEKqIRol++hOq8fro778eYa/NwEFS8W6eNiF7wLjQ/H/vJ0Ns3dK
         XHmujYTiKNnT6sOZBVPyVNPQDV5QgqGDeLdoRxctFO+/cyEypwVp4QGj6JE2ImoYBVUw
         0/6qtrglhpC3T3ovOqVqHYQIHfCAe02YY01bpQzziplt1OwCtLNDCvxwgwn2M1q0PkwZ
         1Hd+Jl6vtUpY0fH5MZaLN4vvAWlIFLLjl7KOk41wXmYcnFiUI1tezjgckl1V378kNlYD
         gPbA==
X-Gm-Message-State: AOJu0YwOuLflet1iBP85ASw12rl+NqNM2AvrRraYEzCquJVSDZg1Wy5F
	XYbTxtbX1s2GNUqE5PoRBGHaUd5T3YQS+km7DLAGoz/fMP1ZQsIowQQQBDxlGXOzLuccKhyspUX
	k
X-Google-Smtp-Source: AGHT+IGQCTe5eRDuKbt36wAnHJCR086hqy5KWWTzldbmSCbjs0VD/Qx3+SEzb4ZnY2eeLprydzJfuQ==
X-Received: by 2002:a50:cc8b:0:b0:56e:33fe:5e88 with SMTP id q11-20020a50cc8b000000b0056e33fe5e88mr1778400edi.34.1712761498511;
        Wed, 10 Apr 2024 08:04:58 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id ew13-20020a056402538d00b00562d908daf4sm6505480edb.84.2024.04.10.08.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:04:58 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] exiv2: Update CVE-2007-6353 status
Date: Wed, 10 Apr 2024 17:04:53 +0200
Message-ID: <20240410150453.12726-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410150453.12726-1-ninette@thehoodiefirm.com>
References: <20240410150453.12726-1-ninette@thehoodiefirm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 15:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109904

Current version 0.28.0 is not affected by the issue.
Affected version: < 0.13-r1

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
index 958810cf7..ad99d0bf4 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
@@ -10,6 +10,8 @@ SRC_URI[sha256sum] = "89af3b5ef7277753ef7a7b5374ae017c6b9e304db3b688f1948e73e103
 # inherit dos2unix
 S = "${WORKDIR}/${BP}-Source"
 
+CVE_STATUS[CVE-2007-6353] = "cpe-incorrect: Current version 0.28.0 is not affected by the issue."
+
 inherit cmake gettext
 
 do_install:append:class-target() {
-- 
2.44.0


