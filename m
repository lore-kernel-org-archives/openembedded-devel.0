Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MHfzH-0001W9-5I
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jun 2009 17:26:43 +0200
Received: by wf-out-1314.google.com with SMTP id 25so719073wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2009 08:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=P2GSZkJ921JUNOdnY65XuaCdRSJzfDRsvnov4i1qvIA=;
	b=gS7J1wCVQR3jsTCxXN9jiJ5xqCLGIHMaCe3HkcAYG4d67knXJG5CzEo7Qkcd+B2/sc
	GSj5vm5qdi5PNCzluqsFa+pCBtOcDMJmMA03urrE/zbl53RDfw30K9K9TiAhN6UDEneU
	8z6TVYFQLGvr1RoiJgfzWuCMv+B7HSZIMApRA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=tkU+Iz3NjUnERgxivS64xW8C0huCP/QV9t39z/EvDzedpxPRgj3lBjCOpUUY+LrqhO
	U1yFJiwNt4jGNFaHWgltaWrKtwS8AG/vNQEfCrNCgS1MjN1aflZIwgl7YTtwM68GE3vH
	KHCKO3EoO1oI39dg1QAbNdV2zXXZB2fiPHjbA=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.174.20 with SMTP id w20mr1417081wfe.285.1245424563783; 
	Fri, 19 Jun 2009 08:16:03 -0700 (PDT)
In-Reply-To: <1245411198.6057.6.camel@dax.rpnet.com>
References: <1245411198.6057.6.camel@dax.rpnet.com>
Date: Fri, 19 Jun 2009 08:16:03 -0700
X-Google-Sender-Auth: d21d87e840fb8686
Message-ID: <b6ebd0a50906190816m32d2a3a1n4fe44f4ea6b66950@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake-trunk python version dependency
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
X-List-Received-Date: Fri, 19 Jun 2009 15:26:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, Jun 19, 2009 at 4:33 AM, Richard Purdie<rpurdie@rpsys.net> wrote:
> I just looked at bitbake trunk again and it appears to be broken with
> python 2.6. The reason is we made some nasty hacks to the SocketServer
> to enable idle callbacks and these have predictably broken on us.
>
> The nice thing is in 2.6 a feature was added which lets us do what we
> need as standard rather than hacking it in.
>
> The question is therefore whether we make 2.6 the minimum version and
> have no hacks or have some horrible workarounds for 2.5.
>
> Unless anyone seriously objects I'm going to go with 2.6 as the minimum
> version for bitbake trunk. By the time trunk is usable, 2.6 should be
> pretty widespread.
>
> Note this does not affect the 1.8 series which still has python 2.4 as
> its minimum version and will continue to do so.

2.6 sounds good to me for that branch, as you say, by the time it's
released it should be widespread.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


