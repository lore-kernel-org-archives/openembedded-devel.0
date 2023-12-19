Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD91C46CD2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:05 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.6813.1702967223635496184
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jrRM7l8z;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5c701bd98f3so1433968a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967223; x=1703572023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8fDWRzFxtFcBJ3zunUB2vsJFT/hlkUoY8LKe5QZrZc=;
        b=jrRM7l8znUJ6mVV3miRTeTq+9m6ZT+7iy3O6pEK1xlWGuvWc9njHn9lAMyW4Uh/gh4
         Qb/RFJzNRXSnoPG8V4MxrQVfob1AnTKPryL4qDHZiT/hAqvkrnpZYVuzA99zErVJsom4
         GPyvu317YgTC6e9hwD+vQKqh9Sq/Ck3SmH99pNxcXt2lX7JeoxUYaxFPmXt2HRhNnaOC
         GGba3EMLg7cgWvQjx3gnkAW4JqT+cAJsSk7IGYxao9pEuw5mDVAr9O3F8f9Wp7JJAJPf
         /gC4n6UNHXOy5/O6KYd5DKNeQBZE+p6YvxXsGGDNzSCQaKRS7hgSjFlrQYiR8ACwCAAs
         dQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967223; x=1703572023;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8fDWRzFxtFcBJ3zunUB2vsJFT/hlkUoY8LKe5QZrZc=;
        b=co2b5qJO3uXN3+JyNzEETp3DDwbu0DwChxfAvtKRlg8vziG69a+461/8iZD365+2fY
         igfVJv3ayM+aMcV6N709QzFtbrQNN8MfBp8bl3+SVK0tPDeTC7gxG6ahuX59W4BBmDkh
         sFbPAx4g7fbn0TiijAK9WnLw7O1hHrgp6OWdsKoNBWGdA75oj03G8Xsb1yRThWu7BAK5
         yEh+jDRNkKIxK7r/mnujNas/h6YU53ABR1VXa7vvJDDFdaz0/1ghPi3w0zEeP8a1X0LM
         Ns+vG2YBZNbB120KOzLMWb2FCMgSZjx1LsHfmuGylpQ9AbF2A2TJdH6LJwxC/U4jL6Q4
         oWBQ==
X-Gm-Message-State: AOJu0Yyi36whwTsQlz96mkNBMlL82t9jkg08MWII+w2dMYDgHCatiP4C
	rr28ePCg5DjX3aU+wjXZ5szitiQM3is=
X-Google-Smtp-Source: AGHT+IFM2zM6n7G9tgSerauB3OqQwbF3O6v2pkMN1B+C7/NbF4eFLBdhncA2brAdR1TA3cm20DoMDw==
X-Received: by 2002:a17:902:ced2:b0:1d3:6408:211a with SMTP id d18-20020a170902ced200b001d36408211amr5829768plg.129.1702967222872;
        Mon, 18 Dec 2023 22:27:02 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231213222157.1122628-1-derek@asterius.io>
References: <20231213222157.1122628-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-ujson: update to version 5.9.0
Message-Id: <170296722200.1627685.242667629626531552.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:02 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107557


On Wed, 13 Dec 2023 22:21:57 +0000, Derek Straka wrote:
> Changelog:
> 
> Breaking
>   - Raise TypeError if toDict() returns a non-dict instead of silently converting it to null (#615) @eltoder
>   - Use lowercase strings for bool dict keys (#614) @eltoder
> 
> Changed
>   - Speed-up and cleanup objToJSON (#615) @eltoder
>   - Use lowercase strings for bool dict keys (#614) @eltoder
> 
> [...]

Applied, thanks!

[1/1] python3-ujson: update to version 5.9.0
      commit: 666908092fd2f0dc28999efdd3289b1882951b6b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


