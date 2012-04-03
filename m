Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1SEyYK-0001fz-Q2
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2012 09:53:20 +0200
Received: by vbbfr13 with SMTP id fr13so2455921vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2012 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Aj46kQPXBlyfEF7fc+baH3xEy/5+UoeZOmSux+71YME=;
	b=oC+n+lR2T7FGCbE6t3mDPi20WSKiYpORIpfVcvtvQEJCLARh0H9xMk+4ppm35Ai5MU
	DIbmV5r+vFoztNr3i3VbT+KtQ4jTPernhF30Dr2LJQPTji3r4FmGTr0J8EJjmlWfyZCh
	4wtciBDdzXWGcoNfwnwgcXs/2e78NoB7BHjev+rY9rxhqu9AHc8CvfBgzOgJLoyq0iRO
	C9MK/6Pc3IYXBVHBziEqqMO0bx2uzxOsc823/BQzAQkftaPUUyF6wb8rVNrXseoQI/ii
	PBWLAvRftaMLNtSBwB/XsroIRbE4D+Spp1HTNdmI+r0iiO2PkyAlx5ByQX5Sgi0tW9Xc
	rMrg==
MIME-Version: 1.0
Received: by 10.52.67.11 with SMTP id j11mr4597248vdt.40.1333439051165; Tue,
	03 Apr 2012 00:44:11 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.148.68 with HTTP; Tue, 3 Apr 2012 00:44:07 -0700 (PDT)
In-Reply-To: <4F7A1E0C.9030201@mindchasers.com>
References: <4F7A1E0C.9030201@mindchasers.com>
Date: Tue, 3 Apr 2012 09:44:07 +0200
X-Google-Sender-Auth: eYMSgdV1qSBSVemFly7eB1QRGPk
Message-ID: <CA+2YH7vBzdrHcRVJ4kxHBfsQYmjmAar+X7V997jF5H_tx-tTGg@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
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
X-List-Received-Date: Tue, 03 Apr 2012 07:53:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 2, 2012 at 11:45 PM, Bob Cochran
<openembedded@mindchasers.com> wrote:
> Hello Group,
>
> I would appreciate any thoughts about the relevancy & security of boa for=
 an
> embedded system that needs to support up to several active web requests a=
t a
> time.
>
> The code is getting old and some of the system calls are deprecated or
> obsolete (e.g., gethostbyname()).
>
> Apache appears to be overkill for what we're doing.
>
> Ultimately, our web server won't just serve static pages but also serve a
> low volume of python / django pages, too. =A0I realize that CGI performan=
ce
> with boa is bad, but it seems that there are options to increase performa=
nce
> over simply exec'ing the python scripts.

Did you already try/evaluate lighttpd? I'm using it on an arm board,
but security is not my main concern.

Enrico


