Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2DA9F7E0A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 12:28:08 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id h20so9306359itk.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nBv9k79ZHZ/OXrnwmqWzSNMOsaSNaOFimtHm7Z+Z6OE=;
	b=cr+vrbWi6eWUhTjUv0ksC5ELryhvyiCMyJ9FsSHgKRlxMd+br+ROuhPe+Dskfnf7s0
	y91XyAWqvp0GiTb5+XX1HnN/hFjpWvqo7OP5HjBCA9gvij+m27DdJ7rHwvfFZMQ6w37E
	F+pcdALzvwlmp6Nfioseckl0zW8yPOIt01h3GrHalkCSnuU+wHxkoF1AtVPbrsFxvb2t
	IyXEgVjGhtDv4wyH4gbkR24O7j94S9nM/FkDh7ndn6oJdlhCVW+armSd2eMGJ1r8G75c
	X2O1theHq6tspHwEFSag7oP8mrqOZEN5tBow303LCVYgsd9aKqb6nlqdMOfGGTqxJhx7
	3vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nBv9k79ZHZ/OXrnwmqWzSNMOsaSNaOFimtHm7Z+Z6OE=;
	b=beH1hX3w8oZ0fgsdQkv8fcIQLvchA6dSnCdgHGzDWBqozCSMB1e+U1ly+tWG68VQNh
	BK7qKk+xTcy0Gmqi4UWPzv7qfgY3VZIDD0ZwhyLsHARAVajs+s6lq5wjnoiVVlCBpCN6
	fN6rAxXRJ0M6PlJfpjNNWyoa6AZYK+9EbZpbu4Q15E81ZLtCMgIoOuy9xwM7IVVBUSlP
	VK0o4HgHZXT9MMNiTnimnu+vds5zNitlgH5heoBAYX3o42XsuWAWHws9ptHytd1OgSev
	G9Z1NbZj/E4NytaXImxd7aXiap6zhJYpHYIbFqVMC8GWjm5uR4xm6ngqJsMkCuyufsFY
	o7og==
X-Gm-Message-State: APjAAAUOWzK8cbb2b6oOdSGsUYfm+E22Fqg/MiPvMnccuJtGO6e9K2wd
	bEeCc0ZckP9R4m+Tu7w5ZRFaM1501MMHXiYprFg=
X-Google-Smtp-Source: APXvYqzirO4hTIoUtRL9JsCUhBf6Kp7e0C4eKS8xa8KKBLB7F7UMlnbaQHdp75sYi+WZJk3KiC18RrrcwynsqyEH1Kk=
X-Received: by 2002:a24:29cd:: with SMTP id
	p196mr13965836itp.116.1558614489260; 
	Thu, 23 May 2019 05:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
	<20190523115505.18245-5-Martin.Jansa@gmail.com>
In-Reply-To: <20190523115505.18245-5-Martin.Jansa@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 23 May 2019 14:27:57 +0200
Message-ID: <CALbNGRROjygxkVYZSSzauSpkih0wNPvhW0v5aaGkD5=PbsQYBA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/8] hunspell-dictionaries: import from meta-luneos to make hunspell in meta-oe a bit more useful
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
X-List-Received-Date: Thu, 23 May 2019 12:28:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 23, 2019 at 1:56 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../hunspell/hunspell-dictionaries.bb         | 151 ++++++++++++++++++
>  1 file changed, 151 insertions(+)
>  create mode 100644 meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
>
I really like the 'bit' in the title :))

Andreas

