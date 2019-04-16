Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id BCD307CF88
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 03:47:44 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id a71so11315835qkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 20:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hhIYGcJgHUby+uMPzCMijiuRKyKd7R96NfeFQOxBZkg=;
	b=sbaANWz78Xbu+g6SJsWrP0hHTN/wLHBR9+dUl73WV1wa+4gilk5kRxeWBNuY9iiK4h
	5Se2e21iWUXI9JgOuuK/TtesjNjWhxBHT5JCZ5SqUKt7XzUcvRbQYsPUKD2z/lG9tpuF
	mi0eRmECY+H5fAQ1ksN3YVzP56TC4LKCjbHCSjeAGp/CXYCc/k4Yo4PxHEwOCXIEP/8i
	Zw1QE5rM8fcTB0AV7Z5IOz8jXn1kuKK+h+WloofttJfm/mFzmV1u/tB0aRM4ENBktu0A
	FFf7VztxXHtNPSC2iA2dXXA9kQxHtbBwjQ4FLTJWasAe53024HQu4r371sjcaE4D5iON
	ec7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hhIYGcJgHUby+uMPzCMijiuRKyKd7R96NfeFQOxBZkg=;
	b=o7zlclL70ZXYY/B5JepVVfZBNflAHqEFC3jKhRD/Ro2S1CkrPq/EdOtXjJlvkSFcLH
	C/dDkwNgwzVwo1CsTGhM95wLEG7uPNfAxwiVX9RMRk/FJ6ISbmXGxMwfr37GAihlFW9c
	mjm/NpCCUuekuJc1NxaqRRytDbHoRQqJP1Gxn4a5Up8heyyeCLttMpF2XMzFing4WGdu
	n6vYWxWv8FXqxl53uxHETmX0LycSMlWBILm6zZsM6Md3IhR5v5ecUWk0Il8BLUxfedUi
	jo2qc+emFToV1QJs+sPCaNxw1wRJbZt221+e9/DYk1HPHHXdGOXAnZ0MlStNQfAD6S9R
	T0Yw==
X-Gm-Message-State: APjAAAXXZrmKnyszPldzytzsnoCKyZCoRfuXzRkZUM1NdkgSVoHHFzv/
	pJ3pM9AHW9YHxdRgMMP3fiqo6JSxuQ8UcOgQWyES4Cjb
X-Google-Smtp-Source: APXvYqz9Nlvn0LKJQy4wAf85adS49C6yEMx26a92mJc4gbdZTmSsvqZOP5Xy8IydbB29/QL6Hi2p5FOVBXdd/CVxYRs=
X-Received: by 2002:a37:b587:: with SMTP id
	e129mr60920268qkf.145.1555386465251; 
	Mon, 15 Apr 2019 20:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190414161725.21617-1-robert.joslyn@redrectangle.org>
	<20190414161725.21617-4-robert.joslyn@redrectangle.org>
	<CAMKF1sp2+DGg32W415-om0Y10zwJQEL54YARNBkWBskckYaRnw@mail.gmail.com>
	<5c1d0aa631564af5cde6565a70fd54a58a46c97b.camel@redrectangle.org>
In-Reply-To: <5c1d0aa631564af5cde6565a70fd54a58a46c97b.camel@redrectangle.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Apr 2019 20:47:34 -0700
Message-ID: <CAMKF1spnJxe1axA=zZnTrGsErt3oA2DUThtE9gh6+_YmfBMYvw@mail.gmail.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/5] gpm: Remove duplicate definition of _GNU_SOURCE
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
X-List-Received-Date: Tue, 16 Apr 2019 03:47:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 15, 2019 at 8:37 PM Robert Joslyn <
robert.joslyn@redrectangle.org> wrote:

> On Sun, 2019-04-14 at 11:15 -0700, Khem Raj wrote:
> >
> >
> > On Sun, Apr 14, 2019 at 11:09 AM Robert Joslyn <
> > robert.joslyn@redrectangle.org> wrote:
> > > The Makefile already sets -D_GNU_SOURCE in CPPFLAGS, no need to
> > > patch it
> > > in again.
> >
> > Have you build tested it with musl ?
>
> Was able to do a musl build and confirmed it builds and runs on my x86
> boards.
>

Thanks


> Thanks,
> Robert
>
>

