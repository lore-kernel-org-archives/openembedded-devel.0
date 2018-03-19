Return-Path: <mirza.krak@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC747894A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 14:03:51 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id n15-v6so2530442plp.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 07:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xRMgllowHxn9OIN9R3yofX1kYWbdE3OiaY0E1WkWsmM=;
	b=cWmkVDh50kJMV71c51b9/ObqpT+LOD4ciEj5lK9sV0NJkgCpG9G56JQZ37kfttaEqp
	kTWdsN5ohoghQB7eCNczc6DEvs67aNeA7W4mmLj9wP0g1AXl6F/VMYtFXtgaCKB005Xi
	FzMPVgJiIfEnbmO6fxuiz5VxqsCrni31xqfJuQekBRxI0WvBFbduBnJ0dSOCmu4skIAm
	2Z6LK81fZk6ecuDNQr064enfA+k9+4eBvd69knbP0BrI/jFNM1EBVeDYLlQVpM43BJlO
	71TFE4FAniM3zFTCtxuvLlx+15L/znr2N8LVQ1uLtFHTrQ2ShgWCoXIkN1vDH8dlPjH4
	/O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xRMgllowHxn9OIN9R3yofX1kYWbdE3OiaY0E1WkWsmM=;
	b=PBHGZu5B0EiaPCuUGxxJk/sQ1YCYp4F2Xn3ixXP7aSXj/zfaAKzSLJfVyK4ASb76H7
	iGE0pJl5Y9cfg/1B4ao2yoc98kEebFraNLM47hBbS69EQfm1SHCXWwT4hRzFLpIlj8aN
	zNiwCd9qAwuWAMlVJQ2xqCid1Vvchi8EakSuhf+Q5ZFknLTZOLSIJrPrpt3YtdtHAool
	zATkI55byuLiJXViHxKCha8NjIWaxWVlXYiAcx2Y73esUv9SQkh20xAIrnfQ1J4yuC24
	php7wWYtm3yltdJiMeb7NQEaGNS5DBvQbjtyz6h9uqwKa0cukk3X9BhGBbNcvDPc5kTV
	zjgg==
X-Gm-Message-State: AElRT7HFDnKxSFBw+ugnEtDZm8OclE4pJCDXpbJCYMfi6+uksa5qoa1d
	7Gas2lC+XJCgeB9oLLYxy/uL9HlQz2dYJReWMx0=
X-Google-Smtp-Source: AG47ELsbvfdpeRv+Xcx+10JwaQiZV7IIe/E4ug3K55z30lmuIT44jVxK5ryIkgXLhCcqSylebonqEBORRzDn0FQmHbw=
X-Received: by 2002:a17:902:20c9:: with SMTP id
	v9-v6mr12938367plg.41.1521468232150; 
	Mon, 19 Mar 2018 07:03:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.228 with HTTP; Mon, 19 Mar 2018 07:03:51 -0700 (PDT)
In-Reply-To: <CADNbA1o5minKhZgwfG6kisd06S9t2hgJ8AmfphThdwSD-Y6FYg@mail.gmail.com>
References: <CALw8SCUwyJA29Ytmgo4rOL+cyVDDZyOePFWnVp-H2Y03BWDYkg@mail.gmail.com>
	<CADNbA1pcjD7BjF20VrXGOF5Qe7tj_kj6Jr8bGfNcKj2tSTgLwQ@mail.gmail.com>
	<CADNbA1o0SFW-QkcV8vsBTN8i9pC-MV6Ycff_j6iVgLZ_+6YHVQ@mail.gmail.com>
	<CADNbA1o5minKhZgwfG6kisd06S9t2hgJ8AmfphThdwSD-Y6FYg@mail.gmail.com>
From: Mirza Krak <mirza.krak@gmail.com>
Date: Mon, 19 Mar 2018 15:03:51 +0100
Message-ID: <CALw8SCW2SAOjiYBAj7pZQKzaQuHNQJARvLt7s4hxBMOBFCyiXg@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-python/rocko
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
X-List-Received-Date: Mon, 19 Mar 2018 14:03:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 19 March 2018 at 14:56, Derek Straka <derek@asterius.io> wrote:
> Yeah.  The python3 version wasn't there in rocko.  I'll send out a patch.
> Thanks for catching this.
>
> On Mon, Mar 19, 2018 at 9:55 AM, Derek Straka <derek@asterius.io> wrote:
>>
>> Ah, you wanted the python3 version.  I just noticed that.  Stand by

Thanks for a swift response and fix.

--=20
Med V=C3=A4nliga H=C3=A4lsningar / Best Regards

Mirza Krak

