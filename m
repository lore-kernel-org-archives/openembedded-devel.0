Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF717E6FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 07:47:43 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id u13so34944676iop.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jul 2019 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0MsBP7mw73RLmXNMXv52E37AnbCA/NJRfXhdT6dzYxQ=;
	b=jiUfr0b/QsYMWUfMKeaGd0wn+C6VUwc1cUj+5M2axuIKmLnFcIinlzijj8pLq07THj
	0FVWBkG9aZU/n+49Wcav+sUxzTidfLPBOBMzuQHlkMT+gDZbGxx2y2ryi6cTigm4Q8Wc
	WhFF/uDcYZTOMZLhd6MOnO8CPzUeXsEYLP3VxAh2WZWF9md+Rpr8Oqs7BrrYHNU+dxwg
	zmer1EN3+voi0M0LVOmw6jfiujfSNU+Hia6CXCJYHUgb0lwu/zXjVqU3kgoEleVbpFPB
	1upGjfVpMa+M3QwgW8lC1/bfm7ZyJloGUkXlXd345khbT0HQ1gJAfdyX11YlXLJx4AVB
	Rt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0MsBP7mw73RLmXNMXv52E37AnbCA/NJRfXhdT6dzYxQ=;
	b=LdDQc8AdItemJmbqQC/rqfkfDb7fHz93CkHqL7bEkMRZbe7YgoICtGwVXXDOQKlWi3
	nKzBGEbB9ExmgvRPGiEnHvKOukr/QBvA4lyP0350PjD5xBdPd8lCHTPhlVXNNRDmP1Be
	69fHLRgzGIpKMi9nic9S1kbGxdwoSE5A3HLYFy1/bF1sli9B7pysCud5ahpxyDFFAyLp
	cbUsmx4ggj61RRbNBL2lejCtqq2xZLilYXdeccOj3aARABfnxsV+s0n/g78ZOCgR9VzG
	UahFi2ypP75saMHUjoll477WhW4LOwi8iOMVfvzHdUPSq7N3+EgEilO2f35F/R0gLQkQ
	1EVQ==
X-Gm-Message-State: APjAAAXxD0wr3L0o/beqmOhin0FeV5x4uM0D6cCT5NXGzniUvJef5P/8
	LYiNN83qnQyfKEWX7wM0uLJK1QetX8ZaVoHmdQQ=
X-Google-Smtp-Source: APXvYqwvnAZmTyiRW0+1iSXp/ocwRmwN0XKa+ieOqrSnPN1ZxpdiKaSnDGbqpR+gUA6tUCH0ak2oi8rNug79UGyJ9Vk=
X-Received: by 2002:a5e:8a05:: with SMTP id d5mr2633607iok.147.1562053664542; 
	Tue, 02 Jul 2019 00:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190702012913.7163-1-kai.kang@windriver.com>
In-Reply-To: <20190702012913.7163-1-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 2 Jul 2019 09:47:33 +0200
Message-ID: <CALbNGRRWQW24kwTwjoB=0w3MkAMa-GCKgpP5jUsYhnzsD4ajtA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][Patch 00/11] Upgrade to xfce 4.14 pre2
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
X-List-Received-Date: Tue, 02 Jul 2019 07:47:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 2, 2019 at 3:29 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Upgrade core packages of xfce to 4.14pre2
>
> Kai Kang (11):
>   thunar: 1.8.6 -> 1.8.7
>   exo: 0.12.5 -> 0.12.6
>   garcon: 0.6.2 -> 0.6.3
>   thunar-volman: 0.9.2 -> 0.9.3
>   xfce4-dev-tools: 4.12.0 -> 4.13.0
>   xfce4-panel: 4.13.5 -> 4.13.6
>   xfce4-power-manager: 1.6.2 -> 1.6.3
>   xfce4-session: 4.13.2 -> 4.13.3
>   xfdesktop: 4.13.4 -> 4.13.5
>   xfwm4: 4.13.2 -> 4.13.3
>   xfconf: 4.13.7 -> 4.13.8
First of all thanks for taking care. One suggestion/wish: Could you
please update xfce4-settings to latest upstream and move away from my
fork?

Background: The fork I created added two functionalities:
* Optionally hide mouse pointer for certain pointer devices. This
stopped working anyway (and was problematic for Qt application from
the beginning)
* Datetime-setter: I created a new project for that based on GTK3 [1].
It is not quite finished but I use it frequently and am happy to have
it (e.g on machines without RTC backup and missing network). So if
somebody wants this either it could be added later.

Unfortunately I have no time to do this myself.

Thanks

Andreas

