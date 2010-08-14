Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkLzT-0007Xc-BA
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 21:02:14 +0200
Received: by gwb15 with SMTP id 15so1532757gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 12:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=HoYYlAhA6C0ZYauNICGCJh6hDa6NJlq7YhJ1s1kLh5c=;
	b=cWfV/DiYWszA+uOXxrGmLoBv1l0z2IgYgwujypDxFZbAFjRef9Y4c/maQG6aWD43oA
	xhAJQtZc4O95+QXYAIU40UsYVKPJjiuZjixc/Et055+mA4gi3xauFZfxIdVej/VL+jh5
	EQWegcy+F9nClNi9/w2+qRf/aFiukQZcEPtKE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=Ru1vtPQFsvB/tE9kU50ylcvkMA0q2AweLPu5weGL7S777z1JNhUF4YTOHNwi4ModSc
	FdXcJAzMn+Nt3ecTNWABHGZN/vo75XSntSxoUACWhBHT700NfA9TxHMjWOzOgK7q0HNA
	hrvze52ZazQPBImwpU26Z9yUGBBLkn57atAwA=
MIME-Version: 1.0
Received: by 10.231.174.65 with SMTP id s1mr3470671ibz.3.1281812498488; Sat,
	14 Aug 2010 12:01:38 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sat, 14 Aug 2010 12:01:38 -0700 (PDT)
In-Reply-To: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
Date: Sat, 14 Aug 2010 21:01:38 +0200
Message-ID: <AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
Subject: Re: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Sat, 14 Aug 2010 19:02:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/14 AJ ONeal <coolaj86@gmail.com>:
> This is about the 4th time that I've `rm -rf`-d everything and started from
> scratch and never yet got a working `bitbake omap3-console-image`
>
> Every time I `git pull` it's a different set of problems. It's never the
> same package twice, but they never all compile for the basic console image
> anywhere from 4 to 20 hours in.
>
> Fortunately, I do have a machine that did build omap3-console-image a few
> weeks ago at work. But I've never been able to get it on my machine at home
> (same os) to start playing around with.
>
> What needs to happen in order for things to git checked that they work with
> at least a few common meta-tasks before being pushed out?
> And is there anything I can do to help? (Donate some machine time to run
> tests, for example)
>
>
> Obviously, we all have our day jobs and whatnot, but this is becoming really
> frustrating for me and I'd like to see things improve.
>

If you are using dev head, you're living on the edge. If you can't
stand that better use the stable branch.

As far as there are issues:
Either report them, or better fix them.
(or as a workaround you could find the commit wthat broke it and
report that and perhaps temporariy locally revert that commit if you
cannot fix it).

Having said that:
I don't really see many issues. Maybe I'm building a different set of
packages or for a different set of hw or for a different distro.

Frans


