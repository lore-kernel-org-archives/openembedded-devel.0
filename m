Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIUcl-0000rG-FO
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:07:41 +0100
Received: by gxk2 with SMTP id 2so824296gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=uCRg/mn72aerCW9i3eLzkZ6oAANEz6afGzlyN9Y+rZI=;
	b=yG6FFjp2971PCFRLY3QRwJzEwwMCYO9bEMMWsKi/2EV978oG6D1OZaImHUQAiiFO/S
	7sQEcHpxjqeVelNA3xT0MhVi9x9m26YEOeDizuepIFdD5feJTMXnlmziW3JF8oipra5Q
	Xelekb3/9bfoiNmzR4UxCyPDTf19j5JOzQEzc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=AbRt2MTaKv/wsj3a2n+OQvDINnB6zd4wZKqAcqjcWYqdSKx6PlkMEo+YcQ7TzVh4Jl
	tO+prjNJOzOQa2Z44JqVbPSXQZrrKJe00vSW1LLlwZ2XEzc8bzhi2Q5+wnipQZdI57rB
	9VJq6WBx2fH9/k3DAUqA9Y9o2+899wewB79Oc=
Received: by 10.91.51.19 with SMTP id d19mr10406671agk.183.1289948793728; Tue,
	16 Nov 2010 15:06:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:06:13 -0800 (PST)
In-Reply-To: <AANLkTimAqPZaYRHA9xy0pOVhpdwyFKq=LWuuMZRBq0N=@mail.gmail.com>
References: <AANLkTimAqPZaYRHA9xy0pOVhpdwyFKq=LWuuMZRBq0N=@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:06:13 -0800
Message-ID: <AANLkTikNpCh_ngjsgGwUYhjX4uAZziV=5ZbkdJLk=O+5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PREFERRED_PROVIDER issue/question
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
X-List-Received-Date: Tue, 16 Nov 2010 23:07:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 16, 2010 at 1:44 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
>
> So it seems to check PREFERRED_PROVIDER_mysql5 not (what I had
> expected PREFERRED_PROVIDER_libmysqlclient)
>
> Questions:
> Is this a bug somewhere?

Usually sometimes one package provided something the other does not so
they dont behave as drop in replacement. So make sure you find the
differences between say mysql and mysql5 recipes

> What should I do to pin my libmysqlclient?

what you did is ok.

> Should we perhaps nuke the myql package ?

if its not pinned thats an option.

>
> Your opinion is appreciated!
> Frans
>


