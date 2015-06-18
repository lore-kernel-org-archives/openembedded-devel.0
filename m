Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2E46973306
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 09:26:18 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so16689091wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=JtqGFjHUtdcg677sleZ5zgMyuxQci3mVQhHBYp8MDd8=;
	b=HUpdGbt0OTgPdwxELGukK5HlaRWN/CO7ZxTIRF5MafmScIDpScrUqXc1FPacPj0djs
	Ky/EkEyDXPKzZFw7C7Ry3wJtH713nWWnXeHjrVJ3xo3f1yhxx36QRbKm4ohgsRFVqaVx
	J8dCgCqu+xQ5cUTKIanTUrX92Mio851AGj8cIebc67MuBiM4PlHZKWCMxfVLDKpAXxTu
	ALb8AjrgSGPqd5dVtYnUK16+AyqN6NDqdiYWmgqgLm81TEnMuQ5ALJz0kp+QB56JrvPT
	NzHIwuN8tbmqf0Jx+boTsDebyJq/G+GT8F4JfX19tiHhBaIbWeL1sltRzTeDQRZy8MiG
	0gYw==
MIME-Version: 1.0
X-Received: by 10.194.71.226 with SMTP id y2mr13685720wju.34.1434619579374;
	Thu, 18 Jun 2015 02:26:19 -0700 (PDT)
Received: by 10.28.167.2 with HTTP; Thu, 18 Jun 2015 02:26:19 -0700 (PDT)
In-Reply-To: <CAJ86T=VZuuxxBJtRHzMQHtFXGZz6yoUjoPaqU6Mp2NnH7EAdsA@mail.gmail.com>
References: <CAJ86T=VZuuxxBJtRHzMQHtFXGZz6yoUjoPaqU6Mp2NnH7EAdsA@mail.gmail.com>
Date: Thu, 18 Jun 2015 11:26:19 +0200
Message-ID: <CA+chaQdtM6a6HShP0B+VvKVAQtk1tX8QxN8rdk93NAzvGPu9Sg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: qtwebkit doesn't use system leveldb
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
X-List-Received-Date: Thu, 18 Jun 2015 09:26:21 -0000
Content-Type: text/plain; charset=UTF-8

I don't know what exactly memenv library is, but if it means that we just
need to upgrade leveldb in meta-oe, then I would prefer this solution.

On Thu, Jun 18, 2015 at 7:18 AM, Andre McCurdy <armccurdy@gmail.com> wrote:

> Hi all,
>
> The qtwebkit configure test for leveldb tries to include
> <helpers/memenv/memenv.h> and link with -lmemenv, however the current
> meta-oe leveldb package doesn't provide them and so qtwebkit always
> falls back to using it's internal copy of leveldb.
>
> I can work on a patch, but I'm not sure what the best approach is -
> either rework leveldb so that it builds and installs a memenv library
> + memenv.h or just remove the leveldb dependency from qtwebkit and let
> qtwebkit continue to always rely on it's internal leveldb?
>
> Andre
> --
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

