Return-Path: <tom@harbortronics.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id CBD1A72FB3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:16:18 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id i17so3415391wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 07:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=harbortronics.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AxLtawoNjv9SHVH+vYbR7v59cfPefTgllkCjkcmLAFs=;
	b=hlx4+EOHQcoo/TiYcq9f6BVMcdryXehjNcKRpU1lB5zCpqLpJf1+w7IEhB8YPFIWx0
	oQlZ+vP4j80C+SABr4if/VU9oIA8nt7xPsAgoESGP2jc1F0nwj/rrAt8Fu88uctnCxyJ
	oT5epSn2XNy9ZLrvGd05ec0XQkGTZvjryJUGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AxLtawoNjv9SHVH+vYbR7v59cfPefTgllkCjkcmLAFs=;
	b=adm1uCUH29EKd50Lf2+y/qk2zboLaEm9N05IeVB4ADKDJ74jRsfVe6KyEx0VGqMAox
	knjE/TjOQ9VIKjsmKQFlOaskiJWHlrQILJw6q1zPLz727blj7Bf3QBvpAXaR3dAgzEEa
	BUVFzClHTKj2lM3h8HHhiGaX/B7FKhfKYZuBldrM9eZDZ+5OyUuK2Ec1bCpkglg0MCPg
	xq45Xu/KhlnkpBXC2Hn9Tx8ceaiauj5OmAUXN/pwV7ECijlwG/CWx4L7n77D5E7qtyHa
	XDoj849Xm/R8ryygusKd4qvvZeEIuF2vQfnZRRK7XugNASmCDeE7zyHvUFBEP9/BJh9b
	9Xxg==
X-Gm-Message-State: AMke39lXuv1fk+B9Yx7+EvqDYNRbKxDn9G7xK7vIciV2KKu7YtLS2giJe6B6xv2ffSyKcfHPMMkd9kH/yhcXvw==
X-Received: by 10.28.234.147 with SMTP id g19mr6754772wmi.102.1488294979157;
	Tue, 28 Feb 2017 07:16:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.196.74 with HTTP; Tue, 28 Feb 2017 07:15:48 -0800 (PST)
X-Originating-IP: [174.21.50.42]
In-Reply-To: <20170228113814.GA3275@jama>
References: <1488234393-129769-1-git-send-email-tom@harbortronics.com>
	<20170228113814.GA3275@jama>
From: Tom Hayward <tom@harbortronics.com>
Date: Tue, 28 Feb 2017 07:15:48 -0800
Message-ID: <CAGJSJkKnKmycCgSbdWenPRhmYor-t6tObaoM1QzEpbxLYEqWgA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] usb-modeswitch and usb-modeswitch-data: update to 2.5.0 and 20170205 respectively.
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
X-List-Received-Date: Tue, 28 Feb 2017 15:16:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 28, 2017 at 3:38 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> You cannot just remove PNBLACKLISTs without fixing the issues in the
> recipe.

I never was able to reproduce the issue, so I figured they must have
been fixed elsewhere or otherwise not applicable.

> Luckily Derek already sent fix for this in:
> [meta-oe][PATCH] usb-modeswitch: update inherit to work correctly with RSS
>
> and I've merged it to master today, so you just need to rebase your
> change, retest it and send as PATCHv2.

On the way...

Tom

