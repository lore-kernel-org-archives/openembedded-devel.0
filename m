Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RvWl2-0001aJ-Nm
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 17:22:04 +0100
Received: by eekd41 with SMTP id d41so532950eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 08:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=1QG9kt+IioiFAlSefWHlPN00sj3lbcmgv4A4nlqRVTw=;
	b=BRUhxMCuTygM9gIFfhPk2n5hqHigrppl79MUVYnj7ttyoPG9sYRB1DkuB0OPu+gKtF
	jrsU7d2eiZS6F/k/VQItEQJA/eImpf+g125XqSP5KU67Mn17h6f1RiKEqmsgnn4xru7S
	zBsKO7QDlAASVEww2i6f2f5R8J4mVxhdB3tug=
MIME-Version: 1.0
Received: by 10.213.14.147 with SMTP id g19mr3734369eba.126.1328804040084;
	Thu, 09 Feb 2012 08:14:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Thu, 9 Feb 2012 08:14:00 -0800 (PST)
In-Reply-To: <20120209160041.GC10322@jama.jama.net>
References: <cover.1328648257.git.otavio@ossystems.com.br>
	<1cd08c798a7b335ba66ed186d6fbd3b4002d2f8a.1328648257.git.otavio@ossystems.com.br>
	<20120209160041.GC10322@jama.jama.net>
Date: Thu, 9 Feb 2012 14:14:00 -0200
X-Google-Sender-Auth: yNzQKg95SpVNkh2CvUKmiv00SQA
Message-ID: <CAP9ODKpzNm9DCkkWWr0sHaiuWZAKyd37tqFhQzmLY8Vw_qQkOg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH][meta-oe 3/3] polkit: depends on systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Thu, 09 Feb 2012 16:22:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 9, 2012 at 14:00, Martin Jansa <martin.jansa@gmail.com> wrote:

> So it's clear that systemd will always be enabled and still easy to
> override
> both with .bbappend?
>

For the current state of polkit it might be better to disable systemd on
this, completely. So passing --disable-systemd to autoconf. What do you
think?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

