Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7jwh-0006eB-AN
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 09:15:49 +0200
Received: by gya1 with SMTP id 1so228537gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 00:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=iu0rwTnOn3kzt9J43UHXmfFXXG1lEJTtKhpohImEAHU=;
	b=NGaHuTC5yiq7I8r/g+yi0V69qEHCpb8QaiLDpQmJe5QItDivtEVXOlYrXwFWYLrRZ+
	ydm/beQZzOc0KWhi0U3Idse0P3aIDhbR4nOFCCkAQAaA76kGOlsug5fk+PzthUqWYelI
	FS6e54Kc3Mhcf/aQIbxHcTK8s2lHCcbppP06Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=b1X4/B0Six3343p6Si0VKVQcxyvPvirPQf0mlvLyzd7UVpaw6KqSHQOiZ6nbAXtxpl
	EBOyO8t36FU82tqlTZZxLUBEsAsJKC9nak3PlWTbTB+G/rgqLHeXLZrXEv77yBBUQqd3
	6E/hHHALmnE3tjUL3NZ2uPpoxirc/PcZ98poQ=
MIME-Version: 1.0
Received: by 10.42.215.66 with SMTP id hd2mr2721194icb.323.1287386107815; Mon,
	18 Oct 2010 00:15:07 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 18 Oct 2010 00:15:07 -0700 (PDT)
In-Reply-To: <AANLkTim=u-zVopYCjUxyv_ogxxxA3MU_FkUfh5u-LfAP@mail.gmail.com>
References: <AANLkTim=u-zVopYCjUxyv_ogxxxA3MU_FkUfh5u-LfAP@mail.gmail.com>
Date: Mon, 18 Oct 2010 09:15:07 +0200
Message-ID: <AANLkTinUi=O9604uzP_sNSxz3dG1TRn0F=5tTnTtVCz9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: lirc_0.8.6+cvs20100613: do_package hangs
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
X-List-Received-Date: Mon, 18 Oct 2010 07:15:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/18 Graham Gower <graham.gower@gmail.com>:
> This is quite reproducible, but nothing has changed in the lirc recipe
> recently (certainly not since it last built successfully for me).
>
> I'm out of my depth with this one.
>
> -Graham

I've been peeking at this last week (also bumped into it) and have
discussed it with and send email to kergoth.

Issue seems to be that there are some tasks (like package_do_package)
have an empty run file.
When this file is passed to bitbake eventually it tries to exec these
files and it seems to hang forever (I'm not too familiar with python
but my guesstimate is that when exec gets an empty file it will read
from stdin or so (and so waits forever).

I could not find whether the generated files really should be empty
(and were empty before) or when the problem was introduced (I did a
rebuild from scratch a week or two weeks ago and didn't get the
problem then, but could not spot any suspicious commits during that
time period, and didn't have the time to do a bisect on this.

Then again I noticed Khem pushed 0.8.7 a few hrs ago. Hope that that
one will solve the problem. (although we should fix the root cause)

Frans


