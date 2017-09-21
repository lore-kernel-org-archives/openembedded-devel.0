Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 73A84781FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:59:50 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id m127so239528wmm.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u7oQAYlrOUdMxokF2bBExXHBqmdNcWc4ygpoEzp93zs=;
	b=cnJbE1ojLMwknvyX85Z8Qxpsl/JBQsrBeSPDXqizvydYANRdv7sSn4RK6uYY7ntVLG
	QepVQgfN6GY9XOUo7piB8WPud8ozJfQ0tXM5iJ9f5DKZKUH9EXd7BxTArQr36npSVb/N
	mqxvCFGltnuBfPzvldDwnaCkqcedbzrApusYOYAJtlAEYwaVD3IY9Uslx3Wj5yBV6Kxn
	IVV7tRsW83+7cVgsz8Q+aVG9j2n12Vaoh6pu//nhxVqP8Fn92xZeAuz3qnpLRRv3bzIQ
	zEgSgyLUMJuTyJzBuuYSLMU2M3wiGHY/KDKArQkSAtpObiULTJ+kT+yVm9TWD41zabMj
	ajbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u7oQAYlrOUdMxokF2bBExXHBqmdNcWc4ygpoEzp93zs=;
	b=PLCPzGlLofzmKoyrWAuwAa8QQ/IwQh+Zqu8DXQXnY4nI26Sj3xtjmM29e9kqu9MPdf
	Fvo1hoQf9w5rk2ZgkS6Xljwv1ZqAr8nh3lUgs75YOnfYKOvwYBAHBRbe8GuAnXbMdiMF
	oKJ8ZHB/Rg/Yk835lP1XV6alEMxxKchLrUFfSTMcG5BDAUpzu9cf9Q/K0nL1BA5H+PaE
	gGKkO3m4DPpYKN1BMZ3yZ0CeBWeCGE+8g0vhKpqSYLsmIaird9aNakZ2ExXAya5pfVhd
	r547JaVsg8mHBrR9/EIubQjT0OtxICOT7xBrn8iieJMzN2/OZGc0TFcQzgQa9M1jlB9b
	H93Q==
X-Gm-Message-State: AHPjjUidvAKgN6eMDG7TVtMd53lE9QH5bc1wM+uBIArROQ1NnRCPfXCy
	Kj569DyAK1WVlydi0dTMh09d+u/IBSa5ogXJ9iI=
X-Google-Smtp-Source: AOwi7QAilAXpwhz+Lo2xDvCNgu/8NY/IeC9zoDZm35dL7HDbw5SzJDqLN1GaxEjbdPVIbmBY0rDh1YUONb1BokKs1hs=
X-Received: by 10.28.128.131 with SMTP id b125mr467642wmd.1.1505987991372;
	Thu, 21 Sep 2017 02:59:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Thu, 21 Sep 2017 02:59:50 -0700 (PDT)
In-Reply-To: <7c537405-00a7-fc7f-081d-24a366e1ec52@gmail.com>
References: <7c537405-00a7-fc7f-081d-24a366e1ec52@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 21 Sep 2017 11:59:50 +0200
Message-ID: <CA+chaQctXSOCX1sShxgQNxnU4gjsR5U7_tKZJHxcOE1_JHnYWA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: please merge morty-next to morty
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
X-List-Received-Date: Thu, 21 Sep 2017 09:59:50 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

merged. I've resent 2 more changes which were pending for morty.

I've also refreshed pyro-next based on your last request.

Regards,

On Wed, Sep 20, 2017 at 6:14 AM, akuster808 <akuster808@gmail.com> wrote:

> Hello Martin,
>
> If there are no outstanding issues with what is in next, can you please
> merge it to morty?
>
> Yes, I have not addressed the vlc package issue.
>
>
> Kind regards,
>
> Armin
>
>
>
>

