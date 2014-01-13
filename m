Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 435C16B269
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 20:36:31 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id g12so3375658oah.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 12:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=gKtWyJdfDlDdA0/khpqNST81Xpv82lzd1FLHOoJ4z0c=;
	b=Ed4uRWtdYpZq9HfWr02AIWKrlnCmcXcgJiwPZPMwQmWbmqM7mzVepYNdRAwFzZn29i
	hwm1XoW4xpNPBkGFQV89pY1jgDB38re6f0Gg/aGaMw1Q5yLeoaGaIbUxjWaBeX8WgSky
	3T3UjZCoUlS6c2yniPBV1eJK6tYw2P/Eu0i3DDhvJcGpHePMMTEjoX1UYXrURuMQ435e
	AwUbkRz1NbFXzpzL0GaDgRVJKTGVC30HY/CKQfmkkBOpCj/fdin5imfefsMgz7f1gvLs
	43AKXHxSdor0vjk5arSUU8g6Ak4sVqTHjZv5356RQDuZdwZFisGPEQDwuwNunJuA7Ejb
	4gkg==
MIME-Version: 1.0
X-Received: by 10.60.50.202 with SMTP id e10mr22141697oeo.39.1389645391686;
	Mon, 13 Jan 2014 12:36:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 13 Jan 2014 12:36:31 -0800 (PST)
In-Reply-To: <20140113202933.GN16995@jama>
References: <1389640209-2487-1-git-send-email-otavio@ossystems.com.br>
	<20140113202933.GN16995@jama>
Date: Mon, 13 Jan 2014 18:36:31 -0200
X-Google-Sender-Auth: 7L7h24vdyppPBFN8NXGlZx8Wv0E
Message-ID: <CAP9ODKr4BU0T6p0+xS-NvPT2xj9knQx6+Lu+wG0qgKJNBx6rew@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] gdal: Use external TIFF support
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
X-List-Received-Date: Mon, 13 Jan 2014 20:36:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 13, 2014 at 6:29 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Mon, Jan 13, 2014 at 05:10:09PM -0200, Otavio Salvador wrote:
> > The TIFF support cannot be disabled so prefer to depends on 'tiff' and
> > use external by default.
>
> I haven't looked at configure script, but isn't it only caused by
> typo in PACKAGECONFIG?
>
> --without-tiff
> instead of
> --without-libtiff (to match --with variant)?


The configure.in force it to be internal in case it does not find it. This
seems to be the safest route for it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

