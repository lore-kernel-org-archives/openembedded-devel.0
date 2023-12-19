Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC37C46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.6768.1702967257231627838
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hX3e0RQU;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6d6d48354ccso1250653b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967257; x=1703572057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ct1DeT39aTh6txKpG4C8lS/0Abj6HHIELyB2n09EOtE=;
        b=hX3e0RQU8TyJ65nfstycNuIiI7JVQv832zRQuUxe9NtVDyURPLSg0ThdSvqzyaKqWJ
         AhNVXC4qyCDMyS2F/1sAR2NuBLggbbUSyF8OIKA9DVM7qxkLWNzdoUxCrbhgIZAo3ZN6
         mX8eM0OmQKHStjwumSIVY9R5Tfx6CjSk5g49BEfoqHNUALWpSByJPVYQpsnc9KIgKFpQ
         lP6gUyM9qxbMBxJvBXLcxXXTS9y0JrbW1Ogox5XNRoLtT42p9s8yQULdXyHPUXNDoJuy
         lnjBKG4bPXbLcrdbf00s3VVnGvqEokyVkKkSaa38gGZBiz5VkHMZzMYGlkmqso0oAAFh
         nl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967257; x=1703572057;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ct1DeT39aTh6txKpG4C8lS/0Abj6HHIELyB2n09EOtE=;
        b=fsbarrbjBe4IwTuqbGemf3xKtVME23xRL5/mY2yZcbJLJ3DYtdHcJPBCBXT4LsUgdS
         uL2IMNKLsxwW+fdLLYLmC4aBzRhFiMqn4GsVSHPFeQs0HzKqDL2xuqHAgI0vU2jVznEF
         EMrtSfJatCU/DAf+XpQm3K0QSWMbIK4acnf3B2MQSuzUont9axd+qrK/J7JD41qXV7hZ
         vkDBJpBJpkwTdyV+F8Us8Yd0ft7lL9av/yxFRG5ZlXffEZ/lwBpvtYDqklw606GAlMEM
         +wt4JiVn4oOwNkAl+oYprwPt67TpphVAo9K8zvXtX86RlvTEkS09eSNKw1fnQkQw4zw5
         Hvug==
X-Gm-Message-State: AOJu0YxEfEPJbXmHQDFVRBMaThBkmopQUUh4afNs0HPL+flKlQSsQkq2
	JqnU8EiDDc+u8+7MunUpm14=
X-Google-Smtp-Source: AGHT+IGImg5EeurZTFIl7ZITygV9+uSUPapyhu9f9wKaYHVCod7QX8XKzXHrEBlvP3aJVt1JX7EhhA==
X-Received: by 2002:a05:6a21:1f03:b0:18a:d4c3:1350 with SMTP id ry3-20020a056a211f0300b0018ad4c31350mr6878122pzb.44.1702967256654;
        Mon, 18 Dec 2023 22:27:36 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231215001017.2557084-1-derek@asterius.io>
References: <20231215001017.2557084-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-portalocker: update to version
 2.8.2
Message-Id: <170296725561.1627685.15160857661057644796.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107596


On Fri, 15 Dec 2023 00:10:17 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-portalocker: update to version 2.8.2
      commit: af57a19214fdf8adc2f9ad382f857f0f8d77d51b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


