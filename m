Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1Kqnx0-0007fG-AT
	for openembedded-devel@openembedded.org; Fri, 17 Oct 2008 13:57:02 +0200
Received: from hostdime.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 031C2334D49;
	Fri, 17 Oct 2008 08:56:55 -0300 (BRT)
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 1F99E334B42;
	Fri, 17 Oct 2008 08:56:53 -0300 (BRT)
Received: from mail.freedom.ind.br ([201.35.65.91] helo=mail.freedom.ind.br)
	by mail.freedom.ind.br; 17 Oct 2008 08:56:53 -0300
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 0B6DB8E26FF;
	Fri, 17 Oct 2008 08:56:53 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id CEE958E26EC;
	Fri, 17 Oct 2008 08:56:52 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 17 Oct 2008 08:56:52 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id AF923C2E3;
	Fri, 17 Oct 2008 09:58:30 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 6D996610191; Fri, 17 Oct 2008 08:54:13 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1224184795.4235.133.camel@lenovo.internal.reciva.com>
	<gd8630$66f$1@ger.gmane.org>
	<87fxmwqpe5.fsf@neumann.lab.ossystems.com.br>
	<gd87ga$b9n$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Fri, 17 Oct 2008 08:54:13 -0300
In-Reply-To: <gd87ga$b9n$1@ger.gmane.org> (Koen Kooi's message of "Thu\,
	16 Oct 2008 22\:17\:14 +0200")
Message-ID: <87ej2fphcq.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: xserver-xorg rdepends
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
X-List-Received-Date: Fri, 17 Oct 2008 11:57:03 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

>>> Yes. Recent xservers need hal for various input systems to work
>>> correctly. So instead of crippling the xserver you can keep a crippled
>>> version in your personal tree or overlay.
>>
>> Fully support to keep hal as rdepends.
>
> Thinking about it some more, we should turn back the libhal split, so
> every hal apps works, instead of adding rdepends when we encounter
> broken apps.

Personally I disagree with you. Even though few applications can still
not work without the hal rdepends, some uses hal but not in a really
non dependant way and the split allows a finner selection where to
include or not it.

This allows also distros to select and change it by package.

> PS: how can I merge your xfce work into .dev? The git phrasebook isn't
> really clear on that.

I'm rebasing the branch against final repository and I'll send a
patchset for acking here before pushing it. I guess I can send those
patches later today and push it tomorrow if someone acks it before
that.

My idea is to split the patches in:

 - xfce-refactor-branch

   where the inc files are droped and the packaging improved

 - xfce-4.2-branch

   new version

There're also a number of fixes that I'll be sending here for review
and pushing together. 

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


