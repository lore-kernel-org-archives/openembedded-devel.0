Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4327BFE6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Feb 2019 00:32:22 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id b8so2147594qtj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 16:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AZugSDf3TUy4uuR8y+8RqFvq3byPg1R/rykPxd/yZl8=;
	b=tWudgPEmvK5MIRQMEYlhvK0jpqZcumCWMM6Ozz17UrPTBRBdqpP22gLlmtkKVZOkjB
	LDo2wLMoW7+AFtPgWCP44s5Gk9jREamR5o1TCvl0uPDvGieM5ty7puWGcEz+aM3wn2/U
	nXhiudXL2Gyj7gZC31sed3c7PHVp8kVPwJaLgmgyXgBJLdrr9E87hNqW+quzR6tB8ktK
	QuFZktofmuq8dTGm5yp8tWz4UTKK1kjC4tZTVF0S5mAQEGmwd4+SOYB3nw1cyp0/H9/n
	eDQ5ZhYNRRkt1Nhr7LNnKWWhc7Miknkb1ECqi638zF6I0/l1whpjJHtH6RCToRcd1Tbl
	wObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AZugSDf3TUy4uuR8y+8RqFvq3byPg1R/rykPxd/yZl8=;
	b=Dygxwahgkn1GZLElsCWftYpHhW4WPvrWzbq0lZaFGMNhciAjtcbdkFi47eQuXGi6Fa
	0DRbuYqghKTnu5aWdZP/xqKm+U8671NxhElkDBkzhjHH78/+b5wY8kAI/8TaSiSut7+E
	8iDf++fVbgVJe1SVjwJZrPcVgjcqNgG/Enz5/wCJ0z04xT+TL65rTxOeYDDmmevGbvah
	W4CnKEgUXL9t+Njeh/+hdgsIII27m+0whw+aqdAAmZc/2TSvu3gePYe+8tlWrL68ACBV
	2q+kEQivqB9Re9ob0t6DFiAWxsAA9GyQNtE8wS4IFYz40RhXdi/nHZAf/KfGvH1YNH08
	xUXg==
X-Gm-Message-State: AHQUAuZWMqdHrDdufm/SI9Vty0eHrePfU62rf2O1AaydvvIcNztyI3WT
	EkMGYLiDhKFl6VJ9ywboFjWxzMm6r7gB82ChAKA=
X-Google-Smtp-Source: AHgI3Ib7Pv4M/8cgyYZCBynB3TB4GKbXxeOrL+R27//YTTVJlNZlflGWNIxRiEt0h+foDKWmQ3hQGi7SCTJFOUGIvFE=
X-Received: by 2002:a0c:9498:: with SMTP id j24mr374341qvj.194.1549326743545; 
	Mon, 04 Feb 2019 16:32:23 -0800 (PST)
MIME-Version: 1.0
References: <1549201073-6116-1-git-send-email-scott@jumpnowtek.com>
	<1549201073-6116-2-git-send-email-scott@jumpnowtek.com>
	<78a59c5f-bbf4-dcf4-e258-dc2eb53e7ef5@jumpnowtek.com>
In-Reply-To: <78a59c5f-bbf4-dcf4-e258-dc2eb53e7ef5@jumpnowtek.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Feb 2019 16:31:57 -0800
Message-ID: <CAMKF1srJY6ndy7WZWKTsWCO1_vBSunTcE97BD2qVFGDwgK6zjw@mail.gmail.com>
To: Scott Ellis <scott@jumpnowtek.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] nmap: Include additional FILES path for certs
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
X-List-Received-Date: Tue, 05 Feb 2019 00:32:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 4, 2019 at 2:11 PM Scott Ellis <scott@jumpnowtek.com> wrote:
>
> These nmap patches got applied to master, thanks.
>
> Do I need to send additional patches to get them into thud?
>
> They are both bug fixes only and should both apply cleanly. The nmap
> recipe for master and thud were the same.
> --

Yes please send a thud pull request and CC Armin who maintains the releases

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

