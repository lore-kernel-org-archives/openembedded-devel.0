Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id D7ECB75C51
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 16:57:43 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id g192so64822730ywh.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=hQP9Uo9kK0/htVgjaC/R8OxauS8BIzvdCRuEQRzcghw=;
	b=rGL/3bXqMKjasjurRh3zq9XHwjaS8eZh+Y5MQswgE4x4pv0qCBXXIcJ4g2vydxTjHz
	bb3KM6fui8QKqhCu1GsUEk4WXbL+XqSPsgAujqK0Y0Axkvm5W584EvpOk8ck765AlsDZ
	54J6/w+JHeWSUfnbktKHbc6FM3Red7YPPDEAEBAiEHktBWtPphPrEQS4pvpn19vCyJbU
	hAFnmoCueb3RW8aszFcgzlIP2bRFzUiRKRdSS8rc4aIegWuRorlDxcUhn+ensgtrIYBr
	5171wLHp71X4XeuVs+dVeq9vKOZm2c9g0Fr7KDk5WEl/Pj9vUIFHwk6HjV+ew1IBWCWo
	R4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=hQP9Uo9kK0/htVgjaC/R8OxauS8BIzvdCRuEQRzcghw=;
	b=JXH0NJv/EbwceJXh8t4pY8xsL38ndDm2Uhzj0H93pNDb7R7AO0eFBPKwq0nqLqApUt
	MKcmSZZePvRjdlvU9OVnoK/R3qtwvHj6Q9OaCbZg8FDp9aQGYzPxvFpLOm5//9DwGvDy
	p2jDQlpR1yVLK3Np4e0T4aM09hUIXj9IFZbbC35X5enWdPQFfRrc29gWz88GyQHRmJWj
	uhUVfz1GQwpbvcOokrjWGY0rD8qNdW5iCHwTpkImOi3TcvZG1zS9QqzG2eXgvj18fJKM
	BmTogbukS2brbmvCKpvezPD3+1Mn7H8jP1pH1lU7rLuikCI/5knTihFPOKjxWyD9h5FB
	r/HA==
X-Gm-Message-State: AE9vXwMhvWSeqZjdNcb30m8hGdOXmVIO2OTvkIhLMM276Ql8SjmgbkdBuTDti0DEn/1MADeNP7BENnLpAXQO6Q==
X-Received: by 10.13.225.211 with SMTP id k202mr1822372ywe.322.1473958663920; 
	Thu, 15 Sep 2016 09:57:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Thu, 15 Sep 2016 09:57:43 -0700 (PDT)
In-Reply-To: <CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
	<CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
	<CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 15 Sep 2016 18:57:43 +0200
Message-ID: <CALbNGRQ92cGVmUY5Af5qGBFCzsi_kLsKB6cYgVzhtMhyxjV4kQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] samba: unblacklist and link with bfd on arm only
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
X-List-Received-Date: Thu, 15 Sep 2016 16:57:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 15, 2016 at 10:03 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
>
> is reported in every report (where samba was successfully built)
> http://www.openembedded.org/wiki/Bitbake_World_Status for more than a year
> - pam isn't in typical 'crowded' sysroot unless you have pam in
> DISTRO_FEATURES and it might be always detected when you have pam in
> DISTRO_FEATURES.
>
Just checked: libpam was in my sysroot and I received no warnings.

Andreas

