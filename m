Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DBEC46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.6824.1702967253325917591
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h4xOV7Xl;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d045097b4cso15986115ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967253; x=1703572053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STI0aU8tCpOTETNngVvCdRCvV4GAQ/gZR079W0Cgm+8=;
        b=h4xOV7XlGGGA8SfLiD4kXhaiqWs59vYoi+q8Efq1rOHPx1h5R6qwYaNNxi3AGDHbJh
         ZsDo5K8FFT86ilI+uE/jxe3He/5vg8eoYwOj3VQGrjznC+/MkhFfKe0eLbZdduUx5HOy
         pA8TcFeg89hdx7F4VL/gKGrZIN/Urp1YuwbwtcpWH8H1huDMRtsrYvP/VW3ndqql9ZJw
         l4Ma8le1pgdIAmEIQnNBX87KamyOG15xyS45TOSxMz8sWoiD/l37Y1U3zvACNhx0zVM1
         k0DkSjrKNrvg2mVQYR4Pw/yoaLY0Ma6E40PIgAocl0jvMZhm1HyXqTYyY4D2/jrlFfNs
         PxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967253; x=1703572053;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STI0aU8tCpOTETNngVvCdRCvV4GAQ/gZR079W0Cgm+8=;
        b=JgxZpR47vw0lBu8ifE3DGkHjbt2DuVekiRwCKqYNYez+riNxdekGrvltb6tvt4CLzd
         I5lSov5bYuD+emvCFIIEXIcg500ERYVJ4DKgJ+XpFHT2GfNSWylF9vVKiPCsNMCU3+v3
         IvS0mWMQ/wF2EEmfkbMPC5VRGNe1lPiCE2W4CkBb8gzYoxuf8CB7/zTs+h4fDu6NvCQq
         ltD/SAJtJgo8xEk1DWat/H27m8C1YHEzNaB1p+Qmq32jcQsLJM8atS5rj9I71AYA/fRD
         qLgWlTPe9SKFrifVdswFwVK6pIuDRP0lgJzfcdUqHiACz2CeXt2ToOX4FUux+QjYn3KS
         gODA==
X-Gm-Message-State: AOJu0YzSuMZq17HtQre9pgGGUocA47cBBsCUoO/IOUvfIm4QNBwSc37C
	0hkrbeT3sykRHnDQV04TnDXPyqK3prw=
X-Google-Smtp-Source: AGHT+IF2gSXEqdrWI+5qdjpjgyim3Pji66tKNK/rBHOyru4dQG4JVJnBccRqCHqklhB4TjmWDF+hNg==
X-Received: by 2002:a17:902:e808:b0:1d0:826b:d87a with SMTP id u8-20020a170902e80800b001d0826bd87amr10885022plg.7.1702967252770;
        Mon, 18 Dec 2023 22:27:32 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, mingli.yu@windriver.com
In-Reply-To: <20231214101349.3413535-1-mingli.yu@windriver.com>
References: <20231214101349.3413535-1-mingli.yu@windriver.com>
Subject: Re: [meta-oe][PATCH] mariadb: Upgrade to 10.11.6
Message-Id: <170296725198.1627685.11160984586879255962.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:31 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107592


On Thu, 14 Dec 2023 18:13:49 +0800, mingli.yu@windriver.com wrote:
> Remove one patch as the logic is included in the new version [1] [2].
> 
> Upgrade mariadb to 10.11.6 [3].
> 
> [1] https://github.com/MariaDB/server/commit/f4cec369a392c8a6056207012992ad4a5639965a
> [2] https://github.com/MariaDB/server/commit/cd5808eb8da13c5626d4bdeb452cef6ada29cb1d
> [3] https://mariadb.com/kb/en/mariadb-10-11-6-release-notes/
> 
> [...]

Applied, thanks!

[1/1] mariadb: Upgrade to 10.11.6
      commit: 702cf1dc114d7c65cde4fe1d3f19a3314fccb7ff

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


