Return-Path: <andrei@gherzan.ro>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3824671AB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:48:24 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id f5so12512086ual.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 10:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=3erLWS+4x2j+zW8IIzpQdJ5vr7LyRxJgiRV83xW124k=;
	b=m+45a3Ih/QGYIlaDC3psVGAppb9kEbtXL5TeM/ogV1juzENJfq833PFu22lx0RoFXu
	/s1xJMlvKAmGRR+7hpA2f6Wpl7CJIEPhC3PwZ/KNyk+ikAHk+z5sDgjZHVPyc/YU4xA2
	r+fHCta2nI/sbUaZlxanAcNiijdMHqE1j3e/NE/86dJ53zaIxeT7NQljGULLy893Uua5
	DbDFA46ZTu8ueuSUNsWtKBm3LNUf3VGYt/qyCbUHNDH/lE+gHJo6Uj8GihhinhefoclT
	38JZYFKWj749gl5Mxs2P2E1m9CqVQQ7EBczKOXJjcMCTwskAV8hx4kTRYtP3vMmAKOqB
	nsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=3erLWS+4x2j+zW8IIzpQdJ5vr7LyRxJgiRV83xW124k=;
	b=flOTa93bQmSaKkmNYvZCdTJyfBuUqa5AP5XF4rpGleX1KE3cXib1b4o4rb6MbB4Ckm
	/a735Pq42T9nvihjAQhzKhAyIcn8dlEw1YDuNCpFuKCAlqHjbVorVOID4MPGCnkfSu3I
	GMVGGGkD8B6Z959pR6jf1cjBh4GFhBDiHN4zlOtat0iw9E52IGSaLZovTXEcmso1ok0O
	6uF7EhdPVqPKYe1MQvkPOikCMFQ79+xcdSDmWWnNHIDHZ+DqwGlSnmpgpAx4vu0ZTByK
	vTMWX4h3sOHof0L/An1+wz8PsLc9ZDU391i0RgBUKl7bRoYqB6u8IhfFOT91IPTmz8hJ
	koOg==
X-Gm-Message-State: AKwxytcVtnjy4JD+uroGUQmDZEko7BIdy7YVzR7ApOssp7ymsbM4lvr2
	1vkyf+B5rY2fDXnXX/f7M7+zOhO9OGV1mmg3hb3eYQ==
X-Google-Smtp-Source: AH8x225e2lM5N6CR55MgLF9Ns54aSTtoqEphixWkMotIRmS7hZZom5l62coFIeXxEMrsEbB9J17SAd/JrVIRS5NT1Ns=
X-Received: by 10.159.33.179 with SMTP id 48mr220927uac.182.1517510905895;
	Thu, 01 Feb 2018 10:48:25 -0800 (PST)
MIME-Version: 1.0
Sender: andrei@gherzan.ro
Received: by 10.176.48.247 with HTTP; Thu, 1 Feb 2018 10:47:45 -0800 (PST)
X-Originating-IP: [90.152.4.98]
In-Reply-To: <CAHUNapSQJoSJbexQd6_NWU=YO4ekubf5fwNeBdtrGxP_okkByQ@mail.gmail.com>
References: <20180130121432.508-1-Martin.Jansa@gmail.com>
	<ec48cca7-f05b-826c-e3a5-a23ccdc9d7dd@gmail.com>
	<CA+chaQcCkNLS49AeBALYKyiW+_Q_kAgtjqfKE+Orz-mWGMyE+w@mail.gmail.com>
	<CAHUNapSQJoSJbexQd6_NWU=YO4ekubf5fwNeBdtrGxP_okkByQ@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.com>
Date: Thu, 1 Feb 2018 18:47:45 +0000
X-Google-Sender-Auth: iREKAT11LuLxGazkTTO9FNo1gU0
Message-ID: <CAK18fxFuSkpsd4hb-9hvDSYTZGisJ73otqpxk-xW0ZYoGkU+-A@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] recipes: use oe.utils.conditional instead of deprecated base_conditional
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
X-List-Received-Date: Thu, 01 Feb 2018 18:48:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 1, 2018 at 2:22 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> On Thu, Feb 1, 2018 at 8:51 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
> > I've merged it now to unblock people doing the builds as discussed on
> > meta-oe github and also meta-raspberrypi github.
> >
>
> Thank you, it'll be nice to have a working master again
>
>
Should be fixed now.

--
Andrei Gherzan

