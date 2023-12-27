Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E9CC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:17 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.98041.1703665275454440198
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eb/lWqdm;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso1259179a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665274; x=1704270074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eTiTrNyRGuR7Fkz2f0PlnMrKGSI8lvH1eDik80KxhE=;
        b=eb/lWqdmrKGpK0Y9iGwr6MzX1jGjUxuf3w6bDQxYnvbeuOLck/oUiEeTUlZ+3lwY1E
         28lAqnIy+XJRAdUsguOX43HXbgMpiVu51Q+qCex7kPrU6iizsvslAVTbxx7CCAUgeeKH
         R5gI6StBeo2eJMNU0QkajeskWIs6W1C9PZFWuWohwi+50CtVbpyTV7mYGqP9lsGLuNv5
         hjmLPQCMV+CPhp33Xwjty1Fh6EwEOsrKalIohSr+ctTMYoDF02A48U5bx1SDo4q6fAgE
         5cC/Pawd0uy0zYd0IP5pKt5NXwYyqOooc0H6w1/AhyyjzRo83K3oGzQ+zpmpNhx4xCrp
         pdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665274; x=1704270074;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eTiTrNyRGuR7Fkz2f0PlnMrKGSI8lvH1eDik80KxhE=;
        b=g2lm6HOaePasmPU6MLtovJfXHfIlYNlVl0fSn8tG5wdsUIFaRrV93gxjoBI+yFtuOU
         UVnI4bUB7qJPko0qAk3d9jG3a/Fx5c68pLZcJ0/ctOXxk2JFbVn/ScwUv7L7b0gWg8GG
         qLlTn0KndNsQJF3THi6/YK7DoPsZcmezGAG5mFxdOXgdIsySuOrHgnavFoF2MNqC8N+q
         GkPqjYs7e3O0MW6RMaqSFYO/PKdS97tcSpFcj+v5Rfeo0kEXrcu1T/c2vJULdHI5FP0m
         ZbofH2lJtRoeqQV0SHDJmBHhY3OAuakRaGlkFvorcp1fOoRx6+ydznZ041O/U+jEU9UZ
         alaw==
X-Gm-Message-State: AOJu0Yw2snrQilKg1nzF6Pu9csrMsfs43Q4qpcepA8GIHIX4N33okxNp
	kW9ZQgeH+RqYK3e/vU2TYyb5Rlgqyug=
X-Google-Smtp-Source: AGHT+IGfvPzVwvxsdXfK3ewMpehmj/w9mVs2hg2pTqozh5HaUrWzqE57hjhLZ9IVsqA3KmUqlIEZsw==
X-Received: by 2002:a17:90b:20c:b0:28c:91fb:bc09 with SMTP id fy12-20020a17090b020c00b0028c91fbbc09mr145364pjb.20.1703665274504;
        Wed, 27 Dec 2023 00:21:14 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <20231220205518.6966-1-alex.kiernan@gmail.com>
References: <20231220205518.6966-1-alex.kiernan@gmail.com>
Subject: Re: [meta-oe][PATCH v2] c-ares: Move to tarballs, add ptest and
 static support
Message-Id: <170366527364.1947762.7603922311193207428.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107818


On Wed, 20 Dec 2023 20:55:18 +0000, Alex Kiernan wrote:
> 


Applied, thanks!

[1/1] c-ares: Move to tarballs, add ptest and static support
      commit: 0fbbc0b1cce405ec6e005d8585627b503a140a6a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


