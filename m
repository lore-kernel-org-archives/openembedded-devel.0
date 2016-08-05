Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4837713E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:52:44 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id i5so45324673wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 09:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Csxxh8c6lVdVfFZHr3WBblPeK03qaAFi3CjdrcpvMfw=;
	b=f8xrH4gjiIivfdGl7jwn3SMN6CW9P2APxIA5zMP47AshMxW4RBZItDiBI0c3FymUqm
	FIxeVJ7l6rWgEzUm3dqzjshA8fZ/X9CTEfcdB1aBQuqZwkmUBTh99pw29b6hH+tjNd7K
	X4U0+3hTk0wndy1WapopCNJwyzrml7/kCLyJTEHtNBIjlz/513q8JjRYSW2RI419AMN8
	PFV7KAlDpjcGuQAjGCc7XzxAN1oEBPIGCCIE4BUclMxTOyTR6qRkY6P0viAgdMIday1h
	XOOrg7+VsZLImIB4QUX7wnEq57169keCF4Xlct2+csHDwppXR2Dm/57YOT/zcZNEcWn1
	o8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Csxxh8c6lVdVfFZHr3WBblPeK03qaAFi3CjdrcpvMfw=;
	b=D7FO9jGtlNdweXhcGpchtkKhFPKShMj0tGvZDnRXecYRVLjW2Jdc08lB4Ez7IqSuZ+
	pnWjt9j5ha2PsETcYwjGzFL+1CTqw9PlwCAEaLpw8afWdY6b5cOCMxv7uFmk48JqzFqn
	Z2KHYO2CCPBk7ngEiVLR20VPFP3trwZiafA51Rexo0XHzisaNRJnYQMx0IhPI+pSTnc+
	5qyuNzLfmduKR0aVIxfaTuYehQQ/Q66NatdOzES1ph6xDtx8o+ooMuXe9kK5FcLBd/Db
	nB4k4nV7LJ2UFO1teqVKaZ4a/Qt/LaaYEQbtjEO3ZnNDqGaUjIXTfsUzmgSyySmR7bt5
	pa8A==
X-Gm-Message-State: AEkooutpWeTUEs07BwJsREIidGq0OUP5Pjb6QrrscTsjIxAOkehq5kPz1PKe5SG3VTPqALduEeKIOjYAXhvtIw==
X-Received: by 10.194.39.3 with SMTP id l3mr83265917wjk.133.1470415965133;
	Fri, 05 Aug 2016 09:52:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Fri, 5 Aug 2016 09:52:24 -0700 (PDT)
In-Reply-To: <CAP9ODKpOJY8Nq73idC0g+dN_BK=+Yk5=Tm15hYtuCgbE5sz_nA@mail.gmail.com>
References: <1470415127-13908-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAP9ODKpOJY8Nq73idC0g+dN_BK=+Yk5=Tm15hYtuCgbE5sz_nA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 5 Aug 2016 18:52:24 +0200
Message-ID: <CAPybu_1d7pyz+TTrWJP+ajXHUM8h2e=z=d+h+BOZsnVbVu9P0g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] opencv: Fix build with gcc 6.0
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
X-List-Received-Date: Fri, 05 Aug 2016 16:52:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi Otavio

On Fri, Aug 5, 2016 at 6:44 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Fri, Aug 5, 2016 at 1:38 PM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> It seems like gcc 6.0 does not have the same behaviour as previous 5.x
>> with regards isystem flag.
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>
> Did you check if there is a new release? it may fix this error as well.

There is no new release, 3.1 is still the latest version.

The master branch from their github also fails to build and has a
patch that fixes  the OpenCVPCHSupport.cmake file but not the other.

Regards!

