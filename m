Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC506E76C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:36:30 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id vb8so490864obc.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=lZgG25LkmMpewkLmOCvt9vVSj0sa1+h2/hkkQ7aUuvM=;
	b=eBvUq4wAqODb5xRWsXKCn4rIfDmUIGa+GxyswJoELTisuRCwDq0VEE4bnMBTQEnx20
	JOOgtxsbcxt532asDJ09iIhpYYYdAQRB6BxDJGCepZsYPaQZTKbDxHicdpJnMJKQBXxQ
	+PrGmRODZGUQRkbVBs7/+eQJLDtMgsFmjzaXPRmCC7st6sAY3WvffTU91dymLVQN+UWa
	0wEQ0wJBUr9cuhrnCTSleij5i35PEE8iV8i4xw5Kalq+s9egCh3dgybQ5w0jBqKzsav5
	ygDZyuflcQegXIV8Ha2iP/S1rKX91+Jb4+RsL0uAy9bktxa7Vo9XxHmATDGtkvUpGqO8
	6EQg==
MIME-Version: 1.0
X-Received: by 10.182.113.195 with SMTP id ja3mr1589618obb.46.1390401391171;
	Wed, 22 Jan 2014 06:36:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:36:31 -0800 (PST)
In-Reply-To: <CAJTo0LZOjUDhRCN7QPHwPckvDxzbvOWwEb3iT7ZRdnWwD3zZew@mail.gmail.com>
References: <1390332748-31444-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LZOjUDhRCN7QPHwPckvDxzbvOWwEb3iT7ZRdnWwD3zZew@mail.gmail.com>
Date: Wed, 22 Jan 2014 12:36:31 -0200
X-Google-Sender-Auth: TenehAfhKn5BAVyCJ66rR3XIgMI
Message-ID: <CAP9ODKr+d8tG=XUsAR=btn3=vfetvQusu=oid-bCkPGonmGXsw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] xf86-video-ati: recommend linux-firmware
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2014 14:36:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 21, 2014 at 6:21 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 21 January 2014 19:32, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Technically it won't work without, but it's possible to build the firmware into the kernel, so use RRECOMMENDS.
>
> A blanket recommendation like that seems like you should be splitting
> the relevant firmware into a separate package first.

Agreed; this helps to reduce the footprint increase from this change.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

