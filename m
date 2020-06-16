Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.20.1592336634873872005
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2020 12:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=XHxJfH1v;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=tws0=75=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49mdtH2H49z43;
	Tue, 16 Jun 2020 21:43:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1592336631;
	bh=5lXBHOUEjNQBfUTahM/0yUtNxXH61+zhXmTtOhFsgMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHxJfH1vkvGEaAsndJQhoh1eafFTVtX2WK7BaHQaTWLZa+vlGgE4grQQtg0LtIkiv
	 7sCGsNxG7qig3gnybWn3C1BZS/367yfjpPcHusAIg7LNoWr1pVeYKuLnNe0R2Y9kRf
	 Hy67BWKHz5lNm2k2ozwiv0nb2gQYy7QezXYRZOL5Q1RZn+cMXkr6Tu3k8PaR+GEmCa
	 iGO2vUkarOZwpCAI9gpDJTp/4wSwe40pKqTcRc2BLl6EByfJH5o7GNe0YtGKeKzzGV
	 txRGDGxXgA0/IfwVfLh1u7AiMw27BC167rFh4+x4GrtrUFyMlHqg587EgwxxW6sCNg
	 O3RJ984prMF6QNHsKa5J0BgyWmn7fsjLwFo3EqQUDadPkNhYwrasVIWiNlm7+f5Wod
	 BkKxrQQRJqN6sgZ9bThV4eQyn4l1QDTl7JGsCJlnndtP0DR42Mry1qvdE2voAiM8qG
	 clFfvIbOBNZ7Ekbc1jEQBOt9bSgWlxNkNJdB4mQLEouoLKugu8rCGVNCyHjesQIZlW
	 vQ045x1TQqz6QtXox5mik5BVEn75ccYJDUN2XS+6cBeCZi1Mawjvf2mvwB8wKuKzxV
	 4vaJCHZWMeJs4TctqxvGAA9iviKLPWSOZ/d/YBAmAwUV0YNtpYzaS8b6XmM0nOODoe
	 WqouyodrWilztFqHJuqfz8uE=
Date: Tue, 16 Jun 2020 22:43:48 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] standardizing HOMEPAGE values in python3 recipes
Message-ID: <20200616194348.GG14969@localhost>
References: <alpine.LFD.2.21.2006160631480.7747@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2006160631480.7747@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 16, 2020 at 06:36:50AM -0400, Robert P. J. Day wrote:
> 
>   given the current flurry of python recipe cleanup, just want to
> verify a couple things that could/should be standardized.
> 
>   first, HOMEPAGE values of the form:
> 
>   https://pypi.python.org/pypi/astroid
> 
> can be adjusted to reflect the result of the redirection, as in:
> 
>   https://pypi.org/project/astroid
> 
> also, as i read it, recipe HOMEPAGE values should *not* refer to the
> pypi page, as that is already set automatically by pypi.bbclass.
> rather, the HOMEPAGE should refer to the actual source home page,
> which in the case of the astroid package would be:
> 
>   https://github.com/PyCQA/astroid
> 
> does this make sense?

When the source is on github this is supposed to be linked from PyPi.

My personal impression is that meta data like the HOMEPAGE field is 
usually poorly maintained, keeping an automatically set "good enough" 
value (the PyPi link) would IMHO be the best default option.

> rday

cu
Adrian
