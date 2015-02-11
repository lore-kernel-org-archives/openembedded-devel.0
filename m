Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 80EC672DAE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 01:44:26 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id a41so254615yho.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=YepmBTtewuUT2ZnOObn4pt7j0DCBmrmuZOM0UhnuZ1s=;
	b=U8vy+Pf+Fjd3Ez9JsVeiqXIyHj6wTOK+zgBVkZO4uYmbgWf1TUv5kGENz8ItLfLmK/
	Ge9mkAKzQDt0lTZrrqzbjki01nz+UmP24qF4zw67TVblA7CoDx3l8mwlV3gdVz6figTI
	3ptRH/1SXWOkxvH8LNrZKoRetoMucVKGvqFh5Hf2IdaqSiqBk7fK5ZHeN6XlDvYr4OC2
	gQ+ap2orqe4ucrWsDyZR+p27wfdRt/AGZ6OxdBMaGwglAo1WdvBfBN7noFDLXshSATXM
	KcWw5+xWKOlXCgA0ZHR1sC1ojKrywZykD1mfp88y4E/T3Y3l/dynFHYnhoYxZkf03XcI
	Z0Fg==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr9976829yho.104.1423619067894;
	Tue, 10 Feb 2015 17:44:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Tue, 10 Feb 2015 17:44:27 -0800 (PST)
In-Reply-To: <CA+chaQfduKxT=R17gcxpMamtDBRJ3_-3ZAdWNfxwaB7iFLdzgQ@mail.gmail.com>
References: <1423431280-890-1-git-send-email-otavio@ossystems.com.br>
	<1423431280-890-8-git-send-email-otavio@ossystems.com.br>
	<CA+chaQfduKxT=R17gcxpMamtDBRJ3_-3ZAdWNfxwaB7iFLdzgQ@mail.gmail.com>
Date: Tue, 10 Feb 2015 23:44:27 -0200
X-Google-Sender-Auth: 5tmIXpmE-4wgwDhMmNet3qcOxKk
Message-ID: <CAP9ODKqFtXvSKJqvBmyX+O3NRE7iLZRBuE5xm40U_QCM9P4OXg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 8/8] qt5.inc: Fix packaging of architecture independent data
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
X-List-Received-Date: Wed, 11 Feb 2015 01:44:27 -0000
Content-Type: text/plain; charset=UTF-8

Hello Martin,

Thanks for running it in your builder.

On Tue, Feb 10, 2015 at 9:52 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> This series is causing few new warnings:
>
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends on
> libgstphotography-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends on
> libgstapp-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends on
> gstreamer, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends on
> libgstpbutils-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends on
> libgstinterfaces-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on
> libgstapp-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on
> gstreamer, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on
> libgstvideo-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on
> libgstinterfaces-0.10, but it isn't a build dependency? [build-deps]

I found the error, it was a typo in the PACKAGECONFIG handling. I fixed it.

> qttools-5.4.0+gitAUTOINC+33eb6cdf93: qttools: Files/directories were
> installed but not shipped
...
>   /usr/share/qt5/phrasebooks/danish.qph
...
>   /usr/share/qt5/phrasebooks/swedish.qph [installed-vs-shipped]

I have added those to the qttools-tools subpackage.

> qttranslations-5.4.0: qttranslations: Files/directories were installed but
> not shipped
...
>   /usr/share/qt5/translations/qtquickcontrols_uk.qm [installed-vs-shipped]

This is indeed a bug and has been brought up by the change. So I made
a new subpackage for qtquickcontrols related files.

So I have sent a v2 of those patches. Please take a look on them.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

