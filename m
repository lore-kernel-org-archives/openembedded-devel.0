Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Pa8Ju-0005AZ-Ih
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 15:57:24 +0100
Received: by wwi17 with SMTP id 17so14420178wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 06:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=oCGXF8h1R0RHgo8Vz/I+HvB8FT0RaEsvqlFFEoTUzvA=;
	b=A3x63lt+VpyirV3CCXfkLhBeKO8UbtXAowKWVJ2zba1w7wHEwPno9J1Ijws0JG1lWb
	eDK0tgjqwNTj1EdjPUouup/FY9Bs7qQCAdt2df6HePKqA/SVSMm1vN6en8BhZfSszO9O
	14rggSzKwwDwrZiStebqnhiI3l3tITRPtNNIM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=cVVA2DWfeKGqgSWpFf/r6W5wARfGJ+0Dni4Pn8wNz1R9j9XndIu8pJiIobHZbqqeLW
	IGIu1Qv0h+TRUI6lZbml4JTsWLAVBu8hAKOBch5mniopGLq8cKWZFcCMcR4JlMw8drrM
	pySaog41jLM72gvQY2nkJKnshPUiOZH9k+2jw=
Received: by 10.216.154.147 with SMTP id h19mr16216312wek.42.1294152990562;
	Tue, 04 Jan 2011 06:56:30 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 4 Jan 2011 06:56:10 -0800 (PST)
In-Reply-To: <1293911357.17519.17117.camel@rex>
References: <1293763348.17519.11220.camel@rex> <1293805474.18787.366.camel@eha>
	<1293911357.17519.17117.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 4 Jan 2011 07:56:10 -0700
X-Google-Sender-Auth: QqfluSs5O0s7OYYaNpHYdafTius
Message-ID: <AANLkTi=YuEBqPtCGnutaW_-JF0F=ZwmT8OS8rCmr9886@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake Architecture, Roadmap, Maintainers and the future
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
X-List-Received-Date: Tue, 04 Jan 2011 14:57:24 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 1, 2011 at 12:49 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The split between the code in general in bitbake is in general ever
> improving in my opinion. Chris has some some really great work on
> bitbake recently, particularly making it more pythonic. Some of the
> changes just before the holidays, particularly the UI changes on the
> cooker to UI relationship make me uncomfortable, particularly if they
> mean the xmlrpc client/server code no longer works. My concern is that
> they cross the boundary into what I'd class as regressing an API
> boundary, particularly one that is only in the early stages of being
> properly established and that we very much need. I don't know if this is
> an API you use or not but its the kind of thing we need to be careful
> about. FWIW, its independent of the parallel parsing code and other
> changes which is partly why I'm so concerned it was merged as is :(.

Unless you think parallel parsing is the only work I've done on
bitbake, I fail to see what it being independent of parallel parsing
has to do with anything.  Of course it's independent.  It's entirely
different work for an entirely different purpose, done on different
branches, and trying to compare them is pointless and means nothing.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


