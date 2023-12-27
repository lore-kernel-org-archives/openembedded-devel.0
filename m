Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E686FC47079
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:17 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.97647.1703665273449680947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cLvYYzV7;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5c6839373f8so3088694a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665272; x=1704270072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8EIFVZxHuKOyDfl1uRaeaGSf/VUjOUBnfRB9qdcP/s=;
        b=cLvYYzV7d107OzoocMrmSrgmDCzmoOHwplyvxzX+n5APTgQM7RxpFSSkyPOQ1tTArU
         mMbpP/jvUV/U84uLXQyCcWxtMS3Dn6oKe9j68AJpFdMi3U5X1gg3iRCtVaYDgBpn+TC/
         lLnZsy7iE0iHOyOV8+ZOHJ/aUzco6YJurbAGPD6oph68ObEuJG9BCo1DPSmW9sPWO2JK
         pY+jGGUag+D+xURDSc4g+3AHLhEZ46gzyWGxkmpUI+WWIQrnuj093Z7aZSVdr1Q+Xiiz
         YbLaQdniUdDFA+qoUKkwqgdNX2IZNJVE/mjfwj155J156Q+1fzVHgeiuTyoUlR7MZGQz
         wf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665272; x=1704270072;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8EIFVZxHuKOyDfl1uRaeaGSf/VUjOUBnfRB9qdcP/s=;
        b=JOOTC3JEuV5RmIhddjIl3jXo7sdFLFv6DyksprRgVaHY6dnmcOAJec+62HhMgKI+Bh
         qB2+8Nnz98bEPqD7BU7c5QMGJKhFt9KSrQhCS6PTblvhNroB2HXR/xJ09kcRjmNRt2E/
         9+1WXe6CaZCC3Z1Ue+64wb8HDrizc5ZfgvNwCgLARduLqxJkzIdulxdex9isKHfsYXHM
         IW5AXXuKhwMt2gtunR5IJsIwNKL6535VDkED2dxJTkohRprqQyjspSOgLGWt3l9PSmkK
         ljKe9bY0rGnPlD/l49uCJx+9zlEaI3u8fy4oFo27RIWbeurH5P8NdByd3kTrobPwYp6B
         T4UA==
X-Gm-Message-State: AOJu0YxxbUpnKLPgcbtBYXYQZC2uUhbUW1D2fN5WrPGBQdYjewF3OylS
	6m7zKKQ9vLsAlNUdGMvhqDQRAd45DOs=
X-Google-Smtp-Source: AGHT+IFF/eDsKZY6vzrRVigSvqVTbLgVZLdUGtEHc/RV/S47T9i+2+iNrRDSMUEdQWMyQclKdse0lQ==
X-Received: by 2002:a17:90b:e91:b0:28b:be76:f774 with SMTP id fv17-20020a17090b0e9100b0028bbe76f774mr9929183pjb.21.1703665272462;
        Wed, 27 Dec 2023 00:21:12 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <20231220152315.27431-1-alex.kiernan@gmail.com>
References: <20231220152315.27431-1-alex.kiernan@gmail.com>
Subject: Re: [meta-networking][PATCH] mdns: Upgrade 2200.40.37.0.1 ->
 2200.60.25.0.4
Message-Id: <170366527156.1947762.13335998796682786345.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:11 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107816


On Wed, 20 Dec 2023 15:23:15 +0000, Alex Kiernan wrote:
> 


Applied, thanks!

[1/1] mdns: Upgrade 2200.40.37.0.1 -> 2200.60.25.0.4
      commit: f795f9d409219f3efba99213d75b8fd46aa41689

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


