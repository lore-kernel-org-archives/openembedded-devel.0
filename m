Received: from mail-yx0-f203.google.com ([209.85.210.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NmoDN-0003tF-KI
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 14:02:14 +0100
Received: by yxe41 with SMTP id 41so603536yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 04:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=0SKzaA03pChlv2QuiLRrBj8JkJ+pg+5dE43nUrJDy7o=;
	b=rlpYstiiAYWTdrfu56LUcEF6sTw5DGv5Ua9PVVoCaTFvZ0Iw3vJN7ZSY/z6kL51goH
	QXbEsttJ/1q2BSRi1us7iZMc9ww4GghXCX0PCuzlEJxNc1qct2cMTP4e57dkzGTuPHjr
	cWy2ljWxArJlHm+qcuVBu0+3JV8nl24LrD+PQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=cZ5fO8Pk2rE04cJEjOuw3ETVKNm5MOFwfOH1UkmFGfFd9FpMx7EJNGw1OKq/rrLgf5
	55xwuU/WxnpwU8T41TErm8hwyjzkFrZH675a2p2tehgaI6WQxGzti3HrEgwUH7dkkSzh
	xSokSx5ttMMLjnkMS5UTt92IXxEyTxjKZztRA=
MIME-Version: 1.0
Received: by 10.100.244.24 with SMTP id r24mr2637299anh.118.1267621159412; 
	Wed, 03 Mar 2010 04:59:19 -0800 (PST)
In-Reply-To: <1267616149.2259.4.camel@rex>
References: <1267616149.2259.4.camel@rex>
Date: Wed, 3 Mar 2010 13:59:19 +0100
Message-ID: <ac9c93b11003030459h499fa3ban6f6884910ef785a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.203
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meeting 2010/03/02
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
X-List-Received-Date: Wed, 03 Mar 2010 13:02:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Richard, thanks for the report.

There are some remarks I want to make, see below.

2010/3/3 Richard Purdie <rpurdie@rpsys.net>:
> TSC Meeting 2010/03/02
[...]
>
> Developer Effort
> ================
>
> Rather than discussions such as the above, how about injecting that
> energy into adopting the new staging, BBCLASSEXTEND and -nativesdk code?

Ehm. there was already a similar remark in the recent pango thread
(angstrom: sync pango and pango-native versions)

I'd say the tone in that email and in the two lines above does not
really meet the 'be considerate" and 'be respectful' as described in
the ubuntu code of conduct.
Also note that most of the work is done by
volunteers/hobbyists/whatever you want to name them.
I feel it is not really for the TSC (or for me) to say what others
should do. Suggestions could be made but I think it could be worded
more polite.

And wrt the new staging/BBCLASSEXTEND/nativesdk topic:
In my opinion it is useful to clean up the existing recipes (or move
them to 'obsolete' or whatever).
That way less recipes need to be adopted, and no energy is wasted on
adopting legacy recipes.
(apart from the fact that having lots of recipes for lots of variants
does not really give a professional and mature impression).

BTW: The recipes I feel responsible for are all converted to both new
staging and BBCLASSEXTEND.
I have considered converting some of the others to new staging.
Actually I even started it, but soon stopped with it for the following
reasons:
- the actual verification process is fairly cumbersome. (5) diff the 2
packaged-staging recipes (which I read as packaged-staging packages as
there are no packaged-staging recipes) is imho a pita)
- i have no idea what recipes are actually used and worthwhile my effort
- some people seem to be picky if you touch their recipes (although
some are a lot less considerate when it comes to recipes of others :-(
)
Together for me that has lead to the conclusion that this is work with
low satisfaction and high chance of getting negative feedback (e.g.
because despite your efforts something breaks, or because by accident
you step on someones toes), and that I'd better work on something
else.

Frans.

PS: and wrt the remark "we have been discussed this before and the
conclusion then was...": great, but if you do not document those
decisions they will pop up every once in a while (e.g. by someone who
is not aware of the decision; e.g. I for me, was unaware that angstrom
initially had its own directory).


