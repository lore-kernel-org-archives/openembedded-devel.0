Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JqbkD-0004gj-Hr
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 00:22:45 +0200
Received: by an-out-0708.google.com with SMTP id b33so1211482ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=ZPm0GWQQLHlqj2xMexBrzwoq9mACUNQ1jYmI2vwWbx4=;
	b=r7vDgdmeNVleVdZvaq3uzmveBJd9sN7fLHp3FuUw4jM58SdGaq+L04+DumcQFm7KrIR06NsoR8ooTNOlQJ/oHXtZ9dKzTt0ykGhoLxwQpl06BiTOQkWjs/xHVuKeTOhZ1rniQlGyDr2ww8JYGvFm0saYlRE7Bmw/T6rgnBbsF+Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=KW0p0feKJX2cDsDUYZIqdhg9KQ/aNkJeqc735NUR0N3sQ1kn2dQDcs2jGZ7yWPSaec9HFgSymYSuxo0DR1j8HyhYcdFJbbYMxCpsMWxKh0G5XIh5VGAIeQ+XZaY9I6eueaRdzsG9zllhJePjyvKeci8P3XKB3fQzxGlYL8Yxp8E=
Received: by 10.100.41.1 with SMTP id o1mr368576ano.10.1209421339255;
	Mon, 28 Apr 2008 15:22:19 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 28 Apr 2008 15:22:19 -0700 (PDT)
Message-ID: <c384c5ea0804281522v4056d73an34566aac9474f9ad@mail.gmail.com>
Date: Tue, 29 Apr 2008 00:22:19 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <3810.194.56.133.3.1209393153.squirrel@vollmann.com>
MIME-Version: 1.0
References: <a7f8874a0804251149w4d740b1ftc40e41703de334da@mail.gmail.com>
	<3810.194.56.133.3.1209393153.squirrel@vollmann.com>
Subject: Re: OE on Ubuntu 8.04?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Apr 2008 22:22:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

On Mon, Apr 28, 2008 at 4:32 PM, Detlef Vollmann <dv@vollmann.ch> wrote:
> Hans Henry von Tresckow wrote:
>
> > Now that Ubuntu 8.04 has been released, I would like to upgrade my build
>  > laptop. I was wondering if anybody has had any experience with 8.04 and
>  > knows of any OE specific pitfalls to watch for.
>  I did some builds over the weekend (on x86-64), and apart from the
>  usual Ubuntu problem of /bin/sh -> dash (instead of bash)
>  everything worked fine.
>
Where does dash break your build?

I run my builds from dash and I think we should target for POSIX
compliance rather than bashism compliance.

Regards,

Leon.


