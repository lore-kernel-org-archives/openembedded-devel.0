Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id A3E8C71B23
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:20:12 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id p16so226538207qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2016 09:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=rb1yK0C1VHbR709h1ZfUNu37kJucaKl1dMsseW97ypk=;
	b=UT/YbboMQjDkjAAYyPXAKBLk6onoK9CG7+7n1PlN87+OuOcvLkjEFwR3/JwV4St7vQ
	KMaGTPxHxh8AkMU8zTw8j/q3o8sKcWFz2QaZSoimjpP3owD/ZTDsCftTE+LJsv7D9CQc
	jkX53YOcDFZJZE/Asaywx8ZvFjsK3Q7TYVZqI0gJUYXbZ+NfVu3czNuObI/SUce8QuS5
	inqXhCLdl90L/tXTORuzZF2HnhtiQiriny1M9kmFQCukG4lbkgnW/JpxaaXpesgqhsWe
	ljvXyYSXllJZOLDp2tGfSVUZrZgZ8mM+rWKr27R8gOt2NCzY+ykuSQ1fCVBiC15HlylE
	H92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=rb1yK0C1VHbR709h1ZfUNu37kJucaKl1dMsseW97ypk=;
	b=eY/sXDeXRvgcMkzh9pD5tAqXywS2AE8DJXOSoWRrVvVoNOE1KcgC9SUXAdp0nGJeQl
	keLWL/hOMioweydqC9/7UzyDffDSHyqZqIl4IvpTmfthe2eEa79EWzCqbTvJTsu9PswN
	x6NB931c929MRtVGSAy+/oAaR3jVip/jAC6QlkGIz33PXGKd7zFJk6dt4StNm3fha+3N
	khKX/wAYcIoSfKRfbqz5ql7uoOk9XOeCE+TBze8Rzf2inIhNj9RnBmTqj95JYivfBb/k
	jcnwP64DhVSsNljDs6HK9eM5xiPjxNkC2j468Vu4akxw7Tmbw8kQU1g+ZmW05+1vZuTT
	KtQw==
X-Gm-Message-State: AKaTC016Am3c+RP9/008WU71TlidowdKzcAvrsr2Qesci3q/YghNV5u3J5auNGtd5CGAEYyNO12a/qtsSvhGV2tP
X-Received: by 10.237.44.161 with SMTP id g30mr35164669qtd.144.1480612814080; 
	Thu, 01 Dec 2016 09:20:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 1 Dec 2016 09:19:53 -0800 (PST)
In-Reply-To: <8632C69E-1C6B-482D-AF15-965F55F0AF88@gmail.com>
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
	<o1jct4$pvp$1@blaine.gmane.org>
	<CAJTo0LYLgFFR+6d3SDkso6X28N00tVAnUGuJg4sPG-msMKWU6A@mail.gmail.com>
	<8632C69E-1C6B-482D-AF15-965F55F0AF88@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Dec 2016 17:19:53 +0000
Message-ID: <CAJTo0LYTYa4A42+FA9Ou=bVA6ddH8gzVBpJZJvNfa9Jyb9QQfA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Thu, 01 Dec 2016 17:20:14 -0000
Content-Type: text/plain; charset=UTF-8

On 1 December 2016 at 03:42, Khem Raj <raj.khem@gmail.com> wrote:

> >> If libva goes in, can we get libva-intel-driver in as well? Those go
> >> hand-in-glove currently.
> >>
> >
> > Khem, does the AMD BSP use that?  I'd have thought that bit was actually
> > meta-intel specific.
>
> its intel BSPs specific


So I'd endorse libva for oe-core, and the intel-driver remains in
meta-intel.

Ross

