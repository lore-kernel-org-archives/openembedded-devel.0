Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LDJvQ-0006b8-VV
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Dec 2008 15:32:29 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id AA572401F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2008 10:27:14 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 1D5622254F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2008 12:26:44 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id C7204610045; Thu, 18 Dec 2008 12:23:22 -0200 (BRST)
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20081218071901.GB2135@buddha.tw.openmoko.com>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 18 Dec 2008 12:23:22 -0200
In-Reply-To: <20081218071901.GB2135@buddha.tw.openmoko.com> (John Lee's
	message of "Thu\, 18 Dec 2008 15\:19\:01 +0800")
Message-ID: <87ocz9sgth.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: openmoko-merges
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
X-List-Received-Date: Thu, 18 Dec 2008 14:32:29 -0000
Content-Type: text/plain; charset=us-ascii

John Lee <john_lee@openmoko.org> writes:

> Hi,
>
> Please review john_lee/openmoko-merges.  I started from
> holger/openmoko-merges then rebased it to oe.dev.
>
> The general principle is:
>
> 1) Minimal impact: most of the big changes apply to om distro only.
> My thought is we merge this first, then apply to the general.
>
> 2) Keep history: I did it the hard way by cherry-picking one by one
> since the history is different after the mtn->git switch.  Most of the
> commit messages are kept, but that creates a lot of commits to review.
>
> 3) PKG_TAGS, qtopia, toolchain, om-utils and opkg stuffs are left out
> for later merge.
>
> Not sure how long it's going to take.  My plan is to merge it this
> Monday if it's okay...

Personally I think that OE should have a clear history. There's no
reason  to keep commits like:

 Do foo
 Do something
 Fix foo broken in previous commit
 Really do something
 ...

A clearer and more useful history would be:

 Do something
 Do foo
 ...

And it should not be hard to merge it back into OpenMoko tree since
the 3-way merge will detect the same changes and should reduce the
conflicts a lot.

Anyway, I personally prefer to have clearer history then keep the
whole list of commits there. Others?

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


