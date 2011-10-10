Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RDO88-0008Ro-De
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 00:15:28 +0200
Received: by wwf10 with SMTP id 10so3999089wwf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Oct 2011 15:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=nBselBaOw8n6tTM7LNuNHtcuqBb7mM+CuNaubEUL2xA=;
	b=hlKMkJGdWoJ0evDywaJgMdjGZAG41G4wYrihHD7sDSRj4lO1Zg3VUbT7yFyuWfEy4/
	QqiiFptsv3H1K5iF2ZOVEkeQPLqW2+yhh3+vj0yJX7VWNcvkKU+VqUJ+B6TfPauDhKcr
	cRpc6Bp1meCSyjXJpxlzsdKRRTR/RlMmW9/0A=
Received: by 10.216.230.83 with SMTP id i61mr7547277weq.54.1318284587234; Mon,
	10 Oct 2011 15:09:47 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.160.80 with HTTP; Mon, 10 Oct 2011 15:09:27 -0700 (PDT)
In-Reply-To: <4E9363B3.4020905@telia.com>
References: <4E9363B3.4020905@telia.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 10 Oct 2011 15:09:27 -0700
X-Google-Sender-Auth: mYXVRWF2hdmCNCLPgtO72ax_26E
Message-ID: <CABcZANkeEheFWKVn3HSTgvdOWeuFW7ZCHPRxkzRO-t5dcpL8Ww@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: psyco-dist not supported on 64 bit Linux - What to do?
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
X-List-Received-Date: Mon, 10 Oct 2011 22:15:28 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 10, 2011 at 2:29 PM, Ulf Samuelsson
<ulf_samuelsson@telia.com> wrote:
> psyco-dist will not run on a 64 bit linux.
> The guys behind psyco-dist recommends the use of PyPy
>
> What is the recommendation for 64 bit linux?
>
> Just run without JIT?
> Don't run on a 64 bit linux?
> Anything else?

Python works fine as is. You're welcome to attempt use of pypy, but
last time I tried there were a couple hiccups and the performance
benefit wasn't particularly substantial.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


