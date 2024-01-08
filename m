Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FEAC47422
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:17 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.31451.1704682032144057286
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M0RTu6Gz;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bbc648bed4so1690049b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682031; x=1705286831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSB+ZhSk1l/fQxEena9dcKr7tSihDE6O/AEsLnJwDWk=;
        b=M0RTu6GzzOeAzkA91Zg2/UPkU+oGKluaU6N+DRzfoOQJ1UHQZJWnGCK0Ov+v8wO1Kn
         cE55EUByFm5ziJnOH3pF1MDf3irjMCMVtJDnZqt/q5O8Mj28tGAd8sIH9tv6O8oy7lHN
         T+uHtWn3bk1mf9NClwIcPMLCfcpZPBYxktuzBuQPqE7KWmsu/jSk3HQIyrXgQntrl73j
         eYUx4uV43zPkqBMjAwyjAQB3hhBrNA+vEMTT8WqV4WLHP/aYSTFDiSUzipu+kEMn7B8H
         Y0JJIDOmWGot9Qp//x0pOb+dLQG5ScGM3VnZlfohBPQ97SP+UzyvLe5IViHxZCDuJFFy
         f9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682031; x=1705286831;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSB+ZhSk1l/fQxEena9dcKr7tSihDE6O/AEsLnJwDWk=;
        b=tTBMH6DwiDzXTAL8lxxZDTUtc6z2hCrEsoYSBo4cFiNnJwIPIt8+ciDwLaVKOcf4L/
         yXPiJBt1tYbD7r0lihcphDhtyV5XgwypRyPCeCaWBnAek3l7xhznoVF/VLRwNd/fd5b3
         myo0W0W7elAgr/HDaAmrdd8MMT/dvIC95JThFSBoTX7dc/K530AS2tBJ93q1yUl4bA+h
         fuEdMoQRlonie+BGxJUYzZpOvp1k2KOd4+Z7knlNqUZV7CgRPutLM+nYQ76MYHoizZPj
         b06Xt7hZZt7Voa/c1LM6R+1GDtdFRWhWYwIrNA2uBiwdKHlKn6FPWVVwojrnIoBPE1H0
         aviA==
X-Gm-Message-State: AOJu0YwLaLr14J4KCJfNS5ZNCSg8nO0hnkNFjrspAcK5PbhDQ+8Eb4+G
	t9ftsJ6Zu92VR/KopL16HVYOL5TOyXM=
X-Google-Smtp-Source: AGHT+IEDIfZg1q5fP+h8N5gJjHOXRuffc9/AcbDzM9O00AwHDl0SeIc0nIy7CysEXWO4CNGwOcBwvA==
X-Received: by 2002:a05:6808:2086:b0:3bc:1fd4:4ba7 with SMTP id s6-20020a056808208600b003bc1fd44ba7mr3758611oiw.78.1704682031398;
        Sun, 07 Jan 2024 18:47:11 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Richard Leitner <dev@g0hl1n.net>
In-Reply-To: <20240103095602.2737711-1-dev@g0hl1n.net>
References: <20240103095602.2737711-1-dev@g0hl1n.net>
Subject: Re: [meta-python][PATCH] python3-pytest-cov: add missing
 python3-coverage dependency
Message-Id: <170468202896.912276.243218147597829225.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:08 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108115


On Wed, 03 Jan 2024 10:56:02 +0100, Richard Leitner wrote:
> As reported by "pip3 check" python3-pytest-cov depends on
> python3-coverage:
> 
> 	$ pip3 check
> 	pytest-cov 4.1.0 requires coverage, which is not installed.
> 
> This patch fixes this problem by adding python3-coverage to RDEPENDS
> 
> [...]

Applied, thanks!

[1/1] python3-pytest-cov: add missing python3-coverage dependency
      commit: b56ab3d10999f77cb429881b73b52fe2991ad4e3

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


