Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nm05c-00053H-Sm
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 08:30:53 +0100
Received: by gwb15 with SMTP id 15so5849gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 23:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=MaMSo4vozJx/XLjrtg334OJts1J6NCNpcZCWNH1ozjA=;
	b=s6q4iejLTW4ZlIWhTrZznADJZpx8s626Z8kwNc5J1q7/5K3sLkL5Gzk8JcQGNWJd7t
	RNufYPHJvwO+pIegcsOoKFX4nekrxMIRNq5JxGzpCk4xqXUyEPzPPpE4qJMHd+0vYYqg
	01bss4tUxV3ts9bWvwIFtprO/O7gAlsa0Hjc0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KSnovsGzw0KmVk2eeG/XeS7qlmBnlRixd1nDFD1mhzoeSx+xtwsBtM5DMop9lbNjSe
	Ep+fkVtszYbxOwQ13jFNoxWwxKbjegHorrXUNXCeWYY5KU2zH8OYt2qhcSIoJUm8Gg4a
	TMn4BQVhaLIY1izyVyLrZIzyMCt/2KEFL5yVg=
MIME-Version: 1.0
Received: by 10.101.135.35 with SMTP id m35mr5319366ann.193.1267428482793; 
	Sun, 28 Feb 2010 23:28:02 -0800 (PST)
In-Reply-To: <20100228221056.GG30145@xora-desktop.xora.org.uk>
References: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
	<20100228221056.GG30145@xora-desktop.xora.org.uk>
Date: Mon, 1 Mar 2010 08:28:02 +0100
Message-ID: <ac9c93b11002282328l61356cc1y188b47d0f974369e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] duplicate recipes
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
X-List-Received-Date: Mon, 01 Mar 2010 07:30:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/28 Graeme Gregory <dp@xora.org.uk>:

> Now on to important issues.
>
> If people are looking for something to keep them busy then there are two
> important tasks that need to be completed in OE one of them saves hours
> on build times, the other makes parsing quicker.
>
> Convert as many -native recipes to BBCLASSEXTEND as possible. Poky has lots
> of them done already so this is as simple as copy and test.

I think BBCLASSEXTEND is very useful.
However last time I tried (2-3 weeks ago) there were still issues with
BBCLASSEXTEND and packaged staging.
Never really got the time yet to dig into it (and also it is quite
time-consuming to create a faulty situation).

Also I've no idea on how to actually verify that the change is ok and
blindly adding
BBCLASSEXTEND = "native"
and removing the -native recipe does not seem wise either.

>
> Convert recipes to new staging. There have been numerous posts on the list
> lately detailing how to do this. This one saves hours in build time.

Have you tried to do it according to the instructions?
If you want to do it according to the instructions given it takes
quite some time per recipe.

Also if you do one thing, it does not say you should not do the other.
I'd say it could be an and-and situation.

Furthermore by cleaning up the recipes it is clear where things need
to be done (so we avoid that someone wastes time on a recipe that is
outdated/obsolete anyway).
(and removing an obsolete recipe + native variant improves the parsing
time twice as much as BBCLASSEXTEND-ing it).

FM


