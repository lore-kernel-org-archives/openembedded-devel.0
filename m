Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id A3E3760107
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 13:46:46 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id n85so178651267ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 05:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=CE/MBoXMSq7G9PJukmzExtcYxhpVHuQH9aEDWuR9OW4=;
	b=L8RFaGZQIZPImPF28GnNUf+jnZfQlicTD79TtixSnKWUiM6yktvtsxQJYtmcYMoMwO
	quMmMdZ/8Pv6bRpn3so9HLPUkyuAe53FXrDAlE7TLAMvwTcHtpu1hKKopA0VzZe5j2uw
	SlHoz56Glh62J3xXpwV8KBNVt37uPn6uWDiC0n2qtqyQjVsKIeK8/ibZCGoGcr6a5V/V
	Jyrq1W2hdCB4XuoIuEMqQNGwPRFBi9+cM1TjytFqTqrPAh50DypILAsBNDYy7KOShmHA
	g8uZTrcD0NnFT+7giI158acsoFG9GCjob0SIWN9hPXRgLysJ8tFDisxI6Ki0mMaShUbw
	hxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=CE/MBoXMSq7G9PJukmzExtcYxhpVHuQH9aEDWuR9OW4=;
	b=nXEV0BEqqONbtFs3qYJCxwdC5f7zOkyHghoXn5rCFmv38isBxyQgtgh/nkV49sBo8x
	rbOZlNzU6YKPH0PodXsmygg9lJ617QrKYJYruzsPgNm4OO4PxVKN4CXj1MHQcDN5rlJM
	77JbhooBGg0Caymc7zP80OHLtIxxjGUsRZeQ4jb3WjlL7GgKBuzOlrdlD8QGOF2SvL2x
	JxvZQU8i6HEbEVdU9ECkEldScR53qyfRrklk8dxVJGnB67CNPBJlFkQ3e156alZu4h/P
	ilm94spOACVg0lAGkOoevSXAICA1aHHPaZv2byv3MerEMUFSag0Fr5u7CMeHXLmGAZEB
	/kFQ==
X-Gm-Message-State: AIkVDXIyxWagfk1NSZxSMu6LkcIEeS9MfgntDa6F0cys7tuQ8OOObNtv/gkERYT+1qVyDj064kdeH9SAZUoCpnOY
X-Received: by 10.107.139.74 with SMTP id n71mr49861385iod.166.1483364807130; 
	Mon, 02 Jan 2017 05:46:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.144.99 with HTTP; Mon, 2 Jan 2017 05:46:26 -0800 (PST)
In-Reply-To: <CADnUhn2STGnqzDuYoAo8yLvDnPFcmm+4M+xq387oxdhwF_pFMQ@mail.gmail.com>
References: <CADnUhn2STGnqzDuYoAo8yLvDnPFcmm+4M+xq387oxdhwF_pFMQ@mail.gmail.com>
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Date: Mon, 2 Jan 2017 14:46:26 +0100
Message-ID: <CAKuJqM9sse_hCpGQBbfQrcCThtichn=WLeuA2iEEU=NP9N_nMw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: apache2_2.4.23.bb fetcher crashes
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
X-List-Received-Date: Mon, 02 Jan 2017 13:46:48 -0000
Content-Type: text/plain; charset=UTF-8

Matti -

As I have previously suggested, you can make a patch and send it to
this mailing list. Here is an instruction:
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Would you like to try to do it yourself or you actually want us to fix it?

On 2 January 2017 at 14:15, matti kaasinen <matti.kaasinen@gmail.com> wrote:
> Hi!
>
> http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2 has been removed.
> Latest/current version on http://www.apache.org/dist/httpd/ page is
> httpd-2.4.25.tar.bz2. This crashes fetcher of
> meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
> that is Krogoth recipe for apache2.
>
> Thanks,
> Matti
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

