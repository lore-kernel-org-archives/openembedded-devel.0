Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C6A4276DF3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 09:52:54 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id g203so171389706iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 01:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Wc9Ftkdna32jBo+Pfn07cp9oXKMIQIkExQwUF/6h+Gk=;
	b=CltJFFCXz0Hkl0dU4WSeK+fKCdBP1kLnWlRpTprCoLG5xrI0wvdEvjjkl76OsKhcij
	QqT/3f56yt5sQMs6S5sutF9kFgnd+CMpEMcjn0CbcsGJJrmXSPLRoDStclUBd4tuZaw1
	UYDouBMqPj34kSTAXrG6X4j0c77ka8KdP87JMiLe8g6KUj74AZnmBh23skV/W55Vaful
	D2q9YbOxN8q4lBE4b92jtmyHIFd6PGp+ZZeL96M4yDu4fsgHD759ZYctNLQomz0Aj5W8
	nXH++QAPoR/C8SWzUAs5Vnypco0Q6RFlAHmUQzXWipeGzN9S1lbLXoFN7uzoNf1DLsnV
	1Okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Wc9Ftkdna32jBo+Pfn07cp9oXKMIQIkExQwUF/6h+Gk=;
	b=ff7YFlgPksHhsyaPm9a7eGoOm0b9Hd9TkP4u76YYl2aHL0bWatzKTbOiVKJVFPRYoK
	h/thKPUO3QnosxSvQcADEWkOT3b29v6foNetMXojPDnkLAtoz9JETBE6Tg0jWpr1rGNo
	UbFF62OC3+0l0vM/KM5bTautrDQk62mYortXRNbUcqNkXHKX5UjRX7AujAWN60QLX28p
	JWygVvoV/1f0kc+eejx0Eh1xmVe1BGMjvg848sfYi1NbCwvJ0hnpwuMoOpXkR/ZhGlHi
	NEw3PfH5KA3Tp34QUgpdULbfDUSF+zwO6PM0fO6XEDu/UfTHmuetcmcsNIFf/0EgkAM2
	k+Ug==
X-Gm-Message-State: AG10YOTjrKoYp0tBEW48sLvmQEo/B+6aVT4xHt18NLtIpmXDfi8pp0HA88haWHBmjjO5tYvaUn8FINvcYxqXcPkX
X-Received: by 10.107.164.15 with SMTP id n15mr24880915ioe.148.1456134775689; 
	Mon, 22 Feb 2016 01:52:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 22 Feb 2016 01:52:36 -0800 (PST)
In-Reply-To: <1456094688.28376.178.camel@linuxfoundation.org>
References: <1455815945-9857-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmnO78wfOe6p05MdU_jZ-9SqrQOAzxrqejrLBU2AXUR0Q@mail.gmail.com>
	<1456050629.28376.160.camel@linuxfoundation.org>
	<CA+chaQfOYEfP=h8U1_Q7FXLUKuqvZ=o967=5vSVf3Phqag7yyA@mail.gmail.com>
	<1456094688.28376.178.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Feb 2016 09:52:36 +0000
Message-ID: <CAJTo0La0=+naQJYaoZdkKx+rvy218P5WjeZ4b9P2Kfm0KrMSMQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] fio: Remove --disable-static from EXTRA_OECONF
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
X-List-Received-Date: Mon, 22 Feb 2016 09:52:58 -0000
Content-Type: text/plain; charset=UTF-8

On 21 February 2016 at 22:44, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I'd note that if we had a way to know if a recipe was really autotools
> or just acts a bit like it, it would help a lot...
>

Something I've been meaning to do for a long time is review everything that
is using autotools but isn't really autotools, and stop them using
autotools.  For example, cmake.bbclass was inheriting autotools.bbclass and
only using the autotools_do_install function, which is a glorified "make
install".

Ross

