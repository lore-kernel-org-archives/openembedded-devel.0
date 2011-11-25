Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RU3zd-0001he-0f
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 23:11:37 +0100
Received: by qyk30 with SMTP id 30so754420qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 14:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gYEWx4AuyXaRiXuA4/enn0tln8p9sw4EAtsEzAeXGdI=;
	b=X4ZfTibclCBDOEIE+ebpgo3mkZ5xyNFRYGUNkeAa52MSvmSiLZeUEKmaFNOWvT7j5z
	4zW0aYr76LMcb8bWjlGb6eYjKY8njsECD9YFBz+m3mBMwDmeF4foHCu/I/guFBTVuFtc
	xRue4DuYy36lXBPWAgs7l+7TymTBzSNiLWHEY=
MIME-Version: 1.0
Received: by 10.224.189.129 with SMTP id de1mr15982489qab.18.1322258698762;
	Fri, 25 Nov 2011 14:04:58 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Fri, 25 Nov 2011 14:04:58 -0800 (PST)
In-Reply-To: <CACW_hTY9ybnax9xHb1KV4Y25J3nNRkQqCs=TqUivcBcYOT7BkA@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
	<1322134409.3391.21.camel@mattotaupa>
	<CAP9ODKrKN3m_V09j6+C1dL9P8yHtuck4P5jcdKv4Ua=mrP1E=Q@mail.gmail.com>
	<jalvr1$3bl$1@dough.gmane.org>
	<CAFU7RzM5-VAbs2-5qR-D6eo5+LsVQc+e3rGK6zZ5NvviSvUWig@mail.gmail.com>
	<CACW_hTY9ybnax9xHb1KV4Y25J3nNRkQqCs=TqUivcBcYOT7BkA@mail.gmail.com>
Date: Fri, 25 Nov 2011 15:04:58 -0700
Message-ID: <CA+M6bXkjViAHc6ADH+vyvikeOaLa1+V1uCX6S=d75Z18Z2oj8w@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Fri, 25 Nov 2011 22:11:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 25, 2011 at 12:31 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:

> After all, isn't one of the purposes of OE to promote information sharing,
> cooperation and the use of openembedded technology (and not make things
> harder).

One of the points of making master read-only would be to ensure that
changes aren't lost.

Perhaps the transition needs to be:
- master is as it is today
- master becomes oe-core backport || master-only bugfixes only
- master becomes read only.

And we go from the first step to the second step sometime sooner
rather than later.  The top of my head date would be before the
paid-developers go on end of year breaks to try and make sure all the
hobbyist folks start their hacking with oe-core+etc rather than master
and risk getting caught later.  I'm open to arguments on why that's
exactly backwards...

-- 
Tom


