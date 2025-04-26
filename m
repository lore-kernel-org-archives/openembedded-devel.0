Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A48AC369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 18:36:33 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.14089.1745692590659745356
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 11:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TiabdDpI;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7082ad1355bso30009767b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 11:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745692590; x=1746297390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1mByLN67eN0T1Z+525yMHdDW/yKNR09T8Mj68iUsbQ=;
        b=TiabdDpI515OsGvAFW01c0KKVWsRbEmmecV4wnoNWHlsBsxTKj+KJ+A4LnorgVY56x
         H2fwWyfsdXzAyxGej1GGRwx5yiPCx4SjAcPHlcTA7kiLWSUVDBl623Z/7zLNiw5FckpH
         ZcrXpHx3PwKRzAU4rKKC6LcUfl1Poh0pEkZ8Dgii7XBqt3wx9WNV+OGRvhEL+t0/1GXJ
         I6fx3jSu82ncxdRnK0AWIAQyqfBN7DHcAh8n06ukUBXjIXEvem7pKihHBT+OlvJ5ninr
         7VWSo2mHW5XFwa88gVv2JX0ZABY6wgVgqEcT7sleYawfRPEwwhLSaDXeSgsbiPtxv5Ti
         VbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745692590; x=1746297390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1mByLN67eN0T1Z+525yMHdDW/yKNR09T8Mj68iUsbQ=;
        b=fUj2+uWk4Bo03C6SXG8ByBGotvA5lOxP60bqMJ6tW90x7qpQBiLANg6pEAXpqrOCtd
         ADAHHJAyjFRy2thmaW2cwcwB7CeKuDGJqdODbtrlwRTEn3FUQlUF2GGbugmkvXpcjr7O
         2D+6ELd/MHXRg2KAJvmXb3ZrfDilquc9zg17pZ0N74FN6bk/Uit8rusfb4HV0Dqim/6l
         ZWoCEqDNT9GoCwquKydwjlpWbFXVyGn9bRoxfvPMbBQJFo7moZ/LNKY7ErfFtQ0KPZZu
         cbsbWktYIYr1gtW14XIVtbcSzqCYhoGt1BsCOBDJ8Er5citUEZHPx/Jm8LS1mbE510Ko
         D3rQ==
X-Gm-Message-State: AOJu0YzARSRE1W2amhdpF91/CVbBbz+n7zbXU0UsBqol4OM45vN2LIAl
	MSdfDMzAUx2mbdwvKQDVgkGNzxmAsGm10wxk9x+yl2TXXjQCMown
X-Gm-Gg: ASbGncsU15N/o7GhZnfpQdRCSDAIt+MwQ5PyvLIVXRS/VMc3+tMc1CfrA/gWL8SCbgb
	zyZi+6mDZMK1zu3a5YUVDIrCt6R2gsnY18MLy044AetzlGkstiCbfPaL4EvVF7MsXWOGh5TKmZ0
	nrbqx/tAAdiODJmz2fzRLIqhVh3wqpvJVesolkd0ZHIQcoF1NJPxcFTwE+nGsxT9pS/JIEQdx3O
	LgQYzPWgU/1Nr+kCQZDUs4A/D3kFlt38fsZmN1XHv2vO8XLe6p9xqT6G3nLOzZucecFxhlSU6S+
	rP2veH0tdHpJ+eJB59XrOL5KHbRhkqfI9yFbO3ozaApXXg==
X-Google-Smtp-Source: AGHT+IE2De6+pPD0fGMzpwxBZeXGI8sUy+siuk5eWX9qWD8ioO+g/Sa5orJsh0Sr5b4/5iN8uLmVpg==
X-Received: by 2002:a05:690c:b92:b0:708:100a:5797 with SMTP id 00721157ae682-708540e7924mr101882927b3.11.1745692589329;
        Sat, 26 Apr 2025 11:36:29 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70841aea976sm15311907b3.95.2025.04.26.11.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 11:36:28 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: RE: [meta-oe][PATCH] pgpool2: use gnu17 to avoid build failure with gcc-15
Date: Sat, 26 Apr 2025 14:36:26 -0400
Message-ID: <20250426183626.7502-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426170358.2557974-1-martin.jansa@gmail.com>
References: <20250426170358.2557974-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 18:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117151

Martin,

While I understand the desire to follow what gentoo is doing, would protecting the typdef in question be a better solution?

i.e. something like this : https://github.com/mirror/xmlrpc-c/pull/4/files

Thanks,
Jason Schonberg

