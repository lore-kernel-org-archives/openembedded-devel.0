Received: from [209.85.217.20] (helo=mail-gx0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1Kq5IW-0008N1-NB
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 14:16:16 +0200
Received: by gxk13 with SMTP id 13so6509377gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2008 05:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type:references;
	bh=rD4pl3cv0Ep8l0EdTiJ4XHyLwVGrHwvDG6FKW8rFJ/w=;
	b=B+JDsLkr4Gg9us5uX9ZocbcPzqk8fMOfF4ihfu9xB+785gFmTokTWJn0wV+C17yCU1
	S+mU2DnCLhpZXRQASIR2Tm+xK3fBbVLzkr3c1M6lbfRzl1UkQyUDHAGKZW0yaSVBw4aR
	7ZuOxTdOblb9jopMMJyutPo5e++KAh0bplxF8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:references;
	b=wlV2M31ByZN3CR/Ct+JCwRsfdNoSitC9xWxwZ7D/thp6wr3KdNhde7dQFIueaZLKn3
	8aTiB5NFoT02MMBh9cC10guqst4ISRNglgkdj6H3rZiOYSJGyrDT52pPEeygeIXj5iF8
	WggvjLK5/yAncsYq/SW56ZBZsZys0zbWjt708=
Received: by 10.142.125.9 with SMTP id x9mr455910wfc.66.1224072665487;
	Wed, 15 Oct 2008 05:11:05 -0700 (PDT)
Received: by 10.142.71.15 with HTTP; Wed, 15 Oct 2008 05:11:05 -0700 (PDT)
Message-ID: <359c5480810150511y27819388ufd52ee31b900550e@mail.gmail.com>
Date: Wed, 15 Oct 2008 14:11:05 +0200
From: "Nicola Mfb" <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <loom.20081015T114959-488@post.gmane.org>
MIME-Version: 1.0
References: <loom.20081015T114959-488@post.gmane.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: GIT server down?
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
X-List-Received-Date: Wed, 15 Oct 2008 12:16:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/10/15 Erland Lewin <erland@lewin.nu>

> I'm having trouble using the git.openembedded.org server:
>
> erl@sol:~/src/oe$ git clone git://
> git.openembedded.net/org.openembedded.dev
> Initialized empty Git repository in
> /home/erl/src/oe/org.openembedded.dev/.git/
> fatal: The remote end hung up unexpectedly
>


I had the same problem, following the proposed instructions failed for me so
I deleted the tree and recloned with:
git clone git://git.openembedded.net/openembedded org.openembedded.dev

But I'm absolutely not sure if this is correct!
Someone may illume?

   Nicola

