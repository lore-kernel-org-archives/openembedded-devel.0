Return-Path: <andrei@gherzan.ro>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0D368745BC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 May 2018 15:52:48 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id j7-v6so14988012vkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2018 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=paaRRxTYxQb2XgSVDOUdYMiuEDYfQvVysF58Fog1Yik=;
	b=0NIRrSHCOiVvj89GiyB8ZriqSxBTeBL2NbiBDMNZTP2dPZi4dsffb95ycx/ydv3T7c
	FNKjZHH0Q/BnlEQdhDgwJ0X6r617vX2ZqeZwKA2Ft9Pty46SlBwVy3kWCS/zj7HIRQKT
	5Q/f1P9MzRmCdQ4mJBXyllolH589kMMmmaiL0to8RIl9KX0yflr0r3xkYT5FoB/XD/1m
	l1HIDNBDNu2dZN0AyYqImCCTufgfORuVWhkqrVH19dtsPHtiFimrrhbkjg8uyB4qvqEb
	ch4XVQ3oRhHfFb0zl2EyktYhf7ChsnFJQuU8mNOT1o51dwFMmE5rrKXTo/bEvLAwu1se
	gXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=paaRRxTYxQb2XgSVDOUdYMiuEDYfQvVysF58Fog1Yik=;
	b=tT7WCd03/jodj7/lobstf+aJvs2TOdAMqAjqvsDyCOGkmS3+LbXVa/UZp9J12om0dF
	+JJWS7ho6Kz/JoCnzwJGUY9GvTjN7AUGnE3dpzb70DthsTeKZp6vBwU8Hj+7s6jEWPeo
	wnSII8NVc33LHePJzellIBH86pD5uCPJyqv5BqcrnoaYb5VWnuAZfghl2cILKxh9rA9L
	+XtaX1lFgyoz1xoCIU2LXgFRVAVXTZxPoLA/YodOYmtqTtQ4OjlvTGhkccR6I6hXS7Nf
	z43uw7roUTgl920b/qw+zcUIcfE2qfRw9pUYEGNrWAvUf1YucHcOY3DNgw9YcaE7hipo
	BKvQ==
X-Gm-Message-State: ALQs6tBjP5qWD4D4abpCNhRWRwN39/+QDLAVmKBuxseJ9qutXycUpsIF
	SSO2vuXi9Yrdso0yjrc25clmeMJL6LhRS8xdWjKhsYIf
X-Google-Smtp-Source: AB8JxZosqJt6ktPruoSOdtLsMt83FY8urDt0NpyYvETvtRXGFsRX5ExySrwNEc4ISQGSwwLnMGoCf4Mm8NYOu6IW0u8=
X-Received: by 2002:a1f:20f:: with SMTP id
	15-v6mr26706100vkc.143.1525535569555; 
	Sat, 05 May 2018 08:52:49 -0700 (PDT)
MIME-Version: 1.0
Sender: andrei@gherzan.ro
Received: by 10.176.4.108 with HTTP; Sat, 5 May 2018 08:52:09 -0700 (PDT)
X-Originating-IP: [90.152.4.98]
In-Reply-To: <20180505075846.2cc93c8d@host0.betafive.co.uk>
References: <20180505075846.2cc93c8d@host0.betafive.co.uk>
From: Andrei Gherzan <andrei@gherzan.com>
Date: Sat, 5 May 2018 16:52:09 +0100
X-Google-Sender-Auth: QRD6uKX25xyt_dbFKsVcF5lnyNQ
Message-ID: <CAK18fxFfdUnqC7OuyFDh14Q0rc=+5VQ3aLqtBbrq6WGV9BwArQ@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded] Sumo branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 May 2018 15:52:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 5, 2018 at 7:58 AM, Paul Barker <paul@betafive.co.uk> wrote:

> In openembedded-core, master has now diverged from sumo and now
> contains some major upgrades. Could we get a sumo branch in
> meta-openembedded to align with sumo on oe-core?
>

I subscribe to the same request.
--
Andrei Gherzan

