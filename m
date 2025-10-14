Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2EECCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 19:54:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.5594.1760471645233950710
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 12:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fBIs1ieU;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e52279279so41255405e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 12:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760471643; x=1761076443; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ncMGKUh1/igjG4KXo+mBXCYk7bcvNvI+BLLwHbkNJ8=;
        b=fBIs1ieUd2bC2nKxkb0+hprMOwtaEjzg7bLe2RX0heeTqtWVoADbYj5hAc/3tZV9KX
         eNc6HJM1BuU+WtrZagDwCFeXL/HeqVR9EYvuUyjo4YVeuYPUqugDeuGHDMZTos7SnSsl
         XJIdQ48lAYQWcXgRBoP25Rw1s4UJ1QpcECT44zH+QFuQHDTOgCWs+Pdc9qCjtkv3d+KQ
         T8C1KA6Y1atwrP/v2lVOiD4Ab9TOyxXokypezI/e3cgzDyfy+bBDvGke3xZJ8y0k4wDG
         rEahwntB/uIM/YDQUF9XIkDKOgC0WOH66avYQrp0G+RYyIGjndkhfrbM4pnhoWnTdZIe
         CByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760471643; x=1761076443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ncMGKUh1/igjG4KXo+mBXCYk7bcvNvI+BLLwHbkNJ8=;
        b=q9M7Tfdqe0awK7jN9n+uSWPCkv6Mwga5iKpDenmaMi/HWJxsqB3JlJInNYUch2zpjz
         DOIrK7lT0okQG2vZHwuZuHztENDPXdGLOBHfoMJnrUWAI3LwjbZpXwOMuHCnV+4NhrPk
         z/g5FEB1D0ygItgVFPBKdSlfiQqWu6jXPBJRgLhU9GkGVnMPxF+ui6Hrqlx6I3HPIwHT
         ZGm5gHZMAYhvIUn/5EKRVdexUec/uOOtj3aHB1NjLiuKEeF/HETgHMZO5tqtEvoywZ6F
         Gt/FTIdlFplTs8VVE01mtsS9HYiXazfPiIi16wR13NUymeXCU9AxbiFSHR46n6OGvfGv
         BwLg==
X-Forwarded-Encrypted: i=1; AJvYcCW/yPCmNhjYZNmXu6CtbvMyOuV9PGtpBXD0Th4soRgSgTN0tF41EXfC9BjSH8bZj4EitAzONkFjLs+LZ8sywxtaaLY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxGSg1xGJG1/bYgIeq9gxGL+4mi2VpyPZq31jdjY3Oe6BmD+Mid
	HOVbkYpdg7AaqA2ZKlEKxrEJuoPkrmpHCvaVV0m3v/w3CoUgEysnPusZ
X-Gm-Gg: ASbGncvwiGbNOq/Xq8vVUiuaNdbgsLRKEAY9tsdEOM0onG3wpa9u9Gj+N7TYC03ZdMq
	FSC3JI1eIh+VdNnS5S3Jb+NzWqzLuaoS4wpRdFKNHtRC/MoWNf7pmrROAL5qsHhIPKuUZJ4uHQc
	Ar7w4HrBdtG2GOEwsgqavf3oWX5qHJh2a1Ob91yqlep0/ACW/5F4ZucfY1AtPiqe4hqzravGc0J
	NMDysBgpAC+cOIMjo9ZAVF+AmWsZFB4rUfMRsgiKAftXjHTTgizAUTucVUe24GahQ6spzSP38+R
	5krbvkHzS3CUIR8rFVYImLCITfuEFngHns8B2TL2PE3dnCcq1Fziv+B2RXGUdpsSapH/TMhcmiA
	gJPzFpldXMKdZW9hlHEjzlycWsNgBQK6sWeZHOLUvr2VbS0NeMbYnzD8pFEkk
X-Google-Smtp-Source: AGHT+IExgTFsq5Jo56iVjHukYL2ufcdHPgdmLg7WDDtbthalpGNzc+VxqNcNpfbEPgw0+Wdj1RJFgg==
X-Received: by 2002:a05:600c:502c:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-46fa9a9f076mr158982075e9.10.1760471643482;
        Tue, 14 Oct 2025 12:54:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb49c3e54sm258901335e9.15.2025.10.14.12.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 12:54:03 -0700 (PDT)
Message-ID: <1f042aa6-cf5b-4c22-8359-a16bf34d18ab@gmail.com>
Date: Tue, 14 Oct 2025 21:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] redis: patch CVE-2025-49844
To: jakubszczudlo40@gmail.com, openembedded-devel@lists.openembedded.org
References: <d06ce7f9-f73f-46c3-aff2-ad372b04820a@gmail.com>
 <24690.1760470249095479373@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <24690.1760470249095479373@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 19:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120624

On 10/14/25 21:30, Jakub Szczudlo via lists.openembedded.org wrote:
> Do we also want to bump redis up with version on kirkstone and
> scarthgap? Or port the CVE patches?
>

Having this fixed in those branches also would be really nice.
Version bumps *may* be acceptable, in case the bump isn't too big:
normally only bugfix releases are accepted in those branches -
backported patch is a safer bet usually. (At this moment don't know
which versions are in those branches from the top of my head)



