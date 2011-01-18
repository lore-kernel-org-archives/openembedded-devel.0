Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfIGM-0003kJ-MU
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 21:34:49 +0100
Received: by gyh20 with SMTP id 20so11187gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 12:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=G96bmQ7kI5go76uHscVj5yCIPCZM49n6794c+3/i/hM=;
	b=GNo339+SlMWlEda0FuzPmADf8DrWYeDt0fBjKq4S+7CGtjja07h3wQi+e+Ru+J/OSo
	dhvcLLBHDSkJ5xT4NiVN8oMXZ0kqow+2Ki+M21gCs1naibIBRJcB/+0Kh6uiL/M40JTe
	nV3ETl+RFVcM33HgsNBmqp2vB1D7ViqVsB6JQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=tV1kvC056UTknTdQM3js+Oxa++b8ZlX687CqxstT5pfhFrMpFb9pPJkzU6xbMinkug
	H31IxqT8IWbxqEODXq2lOjEyg16Gc0YFcFnJBo+fmi6cvxH5Wc5udA7O1hVIGwDqp6jj
	LgAa/EhZdu8bSZ7jF9uSCNrns950uwj3RJ/Xo=
Received: by 10.90.1.2 with SMTP id 2mr6877330aga.58.1295382842929; Tue, 18
	Jan 2011 12:34:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Tue, 18 Jan 2011 12:33:38 -0800 (PST)
In-Reply-To: <87lj2im6qc.fsf@gmail.com>
References: <87lj2im6qc.fsf@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jan 2011 12:33:38 -0800
Message-ID: <AANLkTino3P3EV8BazsWGG2HYs7CFXDsLpn+eKoyiUWoK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Dealing with ttyS -> ttyO rename on OMAP3 in 2.6.37
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
X-List-Received-Date: Tue, 18 Jan 2011 20:34:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 18, 2011 at 10:01 AM, Ben Gamari <bgamari.foss@gmail.com> wrote:
> As you may know, the kernel's OMAP serial driver has been fixed in
> 2.6.37 to move away from the ttyS naming towards the OMAP-specific ttyO
> prefix. This was done in light of the fact that ttyS is apparently
> reserved for traditional PC-style serial controllers.
>
> I've spent the last day or two trying to bring my setup up to a 2.6.37
> kernel. So far this has been quite painless, although I did get hung up
> on one simple issue resulting from this name change for several
> hours. Namely, the inittab still uses the ttyS naming, resulting in no
> visible login prompt to be started. This is in addition to changing the
> kernel's console= command line argument in the u-boot
> configuration. This sort of naming mismatch could be tricky to handle,
> since openembedded users will no doubt soon be using both pre- and
> post-2.6.37 kernels. Any clever ideas for how this could be dealt with
> in an non-obtrusive way?
>

hmmm SERIAL_CONSOLE is the place where it should be set and then
shadow uses that to generate securetty etc. right now SERIAL_CONSOLE
is a machine property set in machine.conf files. So may be we can let it
emit both for omaps ? may be that will work otherwise we have to override it
in recipes which can be ugly.

> Cheers,
>
> - Ben
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


