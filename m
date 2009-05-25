Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M8dSD-0005pa-Gn
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 18:55:13 +0200
Received: by an-out-0708.google.com with SMTP id b6so1866743ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lCld7SKVxVNIeeLVh5ojgQSjlITFWxfwzpbtio02ldk=;
	b=lZoMX3tawWr2inb35z7XGfs7xeDKPsCKeKPJ8rY6PpxZMwyuPptKXebyhOGjL+XwiZ
	Pb5cINFGKt5oZ5271PM9Nm0pQ4HV9mYwXHdh3AZH8L8aGkUOnbPVsZyHOz/Ge5BOCatX
	GnduguaUf9dyx8eM9D3+XNFsilgDyrLQjgvXc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=v96hcZZnwiQcTTfzlzh1CszaG6y38tvEiNN8GgtslbJVOQksvd9+/cSHqOrjOgstI2
	jcJ13Z9ZSE1IjIcaRPIjp5y+USkgxnnPWR2QN0RtK732uO11FkFNZzA+rnNklW62fHar
	hHewsu8pBxWcKFbCZQD3Ziaw9si57iZpSdzZ4=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.3.13 with SMTP id 13mr12790251anc.75.1243269539358; Mon, 
	25 May 2009 09:38:59 -0700 (PDT)
In-Reply-To: <20090525020608.GR23842@smtp.west.cox.net>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243192690.4869.8.camel@lenovo.internal.reciva.com>
	<20090525020608.GR23842@smtp.west.cox.net>
Date: Mon, 25 May 2009 13:38:59 -0300
X-Google-Sender-Auth: c2761f27140ae036
Message-ID: <be7a9f3d0905250938t4abdb286gee1501f1de1b536d@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] udev: fixed obsolete udevadm syntax for udev init.d script.
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
X-List-Received-Date: Mon, 25 May 2009 16:55:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Tom,

On Sun, May 24, 2009 at 11:06 PM, Tom Rini <trini@embeddedalley.com> wrote:
> I disagree. =A0There are, I assume, things that could be done on top of
> the -141 script as further enchancements/cleanups that would not apply
> to -124. =A0But keeping older files in sync, so long as (a) it works and
> (b) the older version is cared about makes future buging easier, I've
> found.

I also disagree but due different reasons. I believe we ought to drop
the old version except if there're a real reason to keep it around.
For udev 124 I think there's no reason for it to be kept (maybe I'm
missing something here).

Obviously this ought to be done in dev, not stable, but it can make
our life easier and avoid us to need to care about so many recipes.
The final result is that old versions usually has ugly and unknown
bugs that noone cares about.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


