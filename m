Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8sGQ-0002YT-Bz
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 12:20:50 +0200
Received: by gxk19 with SMTP id 19so322780gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 03:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=bg8C5FWNFs3JFGTkrGYvieqD73qOjN2T1Z2AET1wZUw=;
	b=TxgT1xunAzWArhq0wri5MPRxzvgTLkesW1ReUx6fOjlbMVyiZMQpE/5e9dvyEt+Srb
	uf4nqKTSx/sbUEriMIYG/kYV9W1RBFis840GA9eEXidQx9jGXfev9M/Qt8NA6mRTUFK0
	m9k7r0PBjPYR32czRR95pGKzCSkaapw942mvc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HtrE7K4l7qwYRqYToe+JTR31DpK5MyegtNXaTwAVM6XJVPiSmzi6R0SSZv1HN6b6Cg
	YTbfQ3w0bwuaG6Eii73ABv1s2qONW5OYIiPqlM4K5TIFSF41FXzRhvdMcgAPDMYvoi3m
	ZOFdGRxsjWbDO/NhPLYBbix1Q/JgVKcEIftiA=
MIME-Version: 1.0
Received: by 10.42.174.73 with SMTP id u9mr471809icz.79.1287656405203; Thu, 21
	Oct 2010 03:20:05 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 21 Oct 2010 03:20:05 -0700 (PDT)
In-Reply-To: <4CC0104B.4070108@xora.org.uk>
References: <i9p1d0$7q4$1@dough.gmane.org> <4CC00D57.4070601@xora.org.uk>
	<i9p2uf$f40$1@dough.gmane.org> <4CC0104B.4070108@xora.org.uk>
Date: Thu, 21 Oct 2010 12:20:05 +0200
Message-ID: <AANLkTi=74mwvxLLwCjEhV3OMCyOdpfRZeU0Z-bf6TM+P@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 10:20:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/21 Graeme Gregory <dp@xora.org.uk>:

>>
> Such a pity git doesnt have increasing rev numbers, a cool adition would
> be a flag in layer that showed the last rev of core it was tested with.
>
> Layer was tested with core 1 but core is now 999 would give an
> indication on drift between layers and core.
>
> Graeme

Triggered by this (and apologies if I am drifting off-topic).
It would be nice if with amend.inc you could specify the PR of the
underlying recipe that this amend is for (and get a warning or error
if there is a mismatch)

Frans.


