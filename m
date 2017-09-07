Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9179277CD8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 09:18:54 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id j189so2534305vka.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 02:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vX5ZXGj9tm7F7QyqOUTG0M/+zgnDk0DFmc2lmRYMK2A=;
	b=V/jKPGMZOmxd8Ao6TV7Sms9Nb3G2WGvbyeTKe/bxu7/1+C2HzKJJtOwUAfcsXHXtfv
	gODB1s0C9MFgz9L2uHvqU9Bq7gwhw9xxa6Zp82FB8CeiVSYnj6HXoglt3DfRVyowEdyQ
	dmxgtp25lBxhbDHV7U+QS1P1O6hPC2R2Zrj5v/uJCm6ZoaoV+oT8q4b9KavBF6Th01sC
	f6z2JIIZSOuXwH5sdq8jC+/gpr6378Za8pKW94tGqpqfYryOeRSpd8Jup0I4cQWMATA4
	pll5vHUmRkb01ROpRqHqV5lONw/tnBaD8BuruayxqoyJBu35kMuoZ3cKAP3Df6DVpI/p
	gz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vX5ZXGj9tm7F7QyqOUTG0M/+zgnDk0DFmc2lmRYMK2A=;
	b=cLXis59ZMNf+WtEj8LxTbBDat9nxzrOa/gG4cwf/9oVEVY5bINNAXoAWBAuBAu4wKV
	bGo9BlVAYk3C6vqsiPTBqDYYGVUjySQpHnyDLhwIuKcfW2RlA605VCE0zkxWen7LPFrW
	7AneoKeb7orAvNWONeVzHy4yNynw9Ei0pzfIr6/dA9c1IW/tZXv8OMFutqN4Hd2a5gCQ
	T0lExoy9vzBy7s7BrrGfs68nlZ55PvGiDwbZSmGhbx6JPq00MuLycFMfGh+2jmFJD7nE
	dacSE0FssumGh5OgnsqEIrsFlipr39/vTWJVswb1FlF9dEesev+uznuFNWPo6PCwruaB
	D9DQ==
X-Gm-Message-State: AHPjjUhSw8rR5K21mQQCYVJg6cmQUIf3UyuhRyX0Zm7GyomgiSMfPr7a
	zzQFvWNB5mNG9+tQDm9Y4f2Re+dZMQ==
X-Google-Smtp-Source: ADKCNb46HeIOwNMzytuoOsbZxT4/a+A+mQbfe0Mg95N1FOkNHIYFlqOApvu7aaLWNwdpMnnmlDyBR5IoueMY4gDSvTM=
X-Received: by 10.31.231.1 with SMTP id e1mr1245441vkh.90.1504775935671; Thu,
	07 Sep 2017 02:18:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Thu, 7 Sep 2017 02:18:55 -0700 (PDT)
In-Reply-To: <20170907091744.27071-1-willn@resin.io>
References: <20170907091744.27071-1-willn@resin.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Sep 2017 11:18:55 +0200
Message-ID: <CA+chaQc=8OV73nEFd2zhQ+7kGaEB0zAki5SJ9_342JmU0AgX4Q@mail.gmail.com>
To: Will Newton <will.newton@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Will Newton <willn@resin.io>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Thu, 07 Sep 2017 09:18:54 -0000
Content-Type: text/plain; charset="UTF-8"

Wrong ML

On Thu, Sep 7, 2017 at 11:17 AM, Will Newton <will.newton@gmail.com> wrote:

> The previous logic applied a regex to TUNE_FEATURES which could
> set the GOARM value to 7 incorrectly, for example when dealing
> with an arm1176 core. Simplify to check for the presence of
> "armv7a" instead. At the same time add a check for "armv6" and
> set GOARM to 6 in that case.
>
> Signed-off-by: Will Newton <willn@resin.io>
> ---
>  meta/classes/goarch.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 4a5b2ec..35f2987 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -38,8 +38,11 @@ def go_map_arch(a, d):
>
>  def go_map_arm(a, f, d):
>      import re
> -    if re.match('arm.*', a) and re.match('arm.*7.*', f):
> -        return '7'
> +    if re.match('arm.*', a):
> +        if 'armv7a' in f:
> +            return '7'
> +        elif 'armv6' in f:
> +            return '6'
>      return ''
>
>  def go_map_os(o, d):
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

