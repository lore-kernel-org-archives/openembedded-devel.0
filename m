Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SF1RB-0004nL-PS
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2012 12:58:09 +0200
Received: by wibhj13 with SMTP id hj13so3339227wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2012 03:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Q6Q93edEfgAiOmqZTVOrd5TTLt7haS1LYHcWp9ku5I4=;
	b=h9j0LvlZke4iYigA9/JHtspmdXyBLknAJCr1Q8s0qELYe25T1EpmGMWd7dmXVwlB/U
	J6cNHRAND4p/MuWioJUCEZd/PYbAGYD0Vxp9hpOeJWWfkZFE9Za0ZGpM9kqB1x+wJ14d
	rMjcsHxZPzY2nkUm+fwL2sbrSH2OMy0Cw2NQFVtpZV/qclMAwgnCKgj4dHmhjXYiYeiU
	6YnPOHWUcs1Ww/xJFruYKlJMsXTNGmjIvHYpw2Ua3gas1dVjRwSin278z26Xbtn64CDh
	sanWqHX/oN5Jp2yr1TlP1nbLn1pZOXCspQ8zRQqXz20+9ImIVIpJmUp++Y1dYWFcoVct
	kKQg==
MIME-Version: 1.0
Received: by 10.180.92.130 with SMTP id cm2mr35299726wib.4.1333450140722; Tue,
	03 Apr 2012 03:49:00 -0700 (PDT)
Received: by 10.223.89.83 with HTTP; Tue, 3 Apr 2012 03:49:00 -0700 (PDT)
In-Reply-To: <4F7A1E0C.9030201@mindchasers.com>
References: <4F7A1E0C.9030201@mindchasers.com>
Date: Tue, 3 Apr 2012 12:49:00 +0200
Message-ID: <CAGiJk9exshoDYHjgU=1853zpdwcw-QhrK3FUgBTit83mimfEUQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Is boa still a decent choice for an embedded web server?
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
X-List-Received-Date: Tue, 03 Apr 2012 10:58:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/2 Bob Cochran <openembedded@mindchasers.com>:
> *** apologies: I accidentally sent this out the first time on the wrong O=
E
> (commits) list ****
>
>
>
> Hello Group,
>
> I would appreciate any thoughts about the relevancy & security of boa for=
 an
> embedded system that needs to support up to several active web requests a=
t a
> time.

You can be almost sure that it will not meet (any) security
anticipation, if Wikipedia is correct about the last release date.

>
> The code is getting old and some of the system calls are deprecated or
> obsolete (e.g., gethostbyname()).
>
> Apache appears to be overkill for what we're doing.
>
> Ultimately, our web server won't just serve static pages but also serve a
> low volume of python / django pages, too. =C2=A0I realize that CGI perfor=
mance
> with boa is bad, but it seems that there are options to increase performa=
nce
> over simply exec'ing the python scripts.
>
>
> Thanks,
>
> Bob
>


Maybe Cherokee is worth a try.
It looks simple to configure,  don't know how secure it is.
But I also don't know your expectations of "how secure it has to be" anyway=
s.


--=20
Regards
Samuel


