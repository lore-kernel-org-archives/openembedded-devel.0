Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opx0D-0000cX-Ga
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 07:33:55 +0200
Received: by ywa8 with SMTP id 8so2016569ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 22:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=SxFvNDseZGWlg59tSpB8Or5j950nkQpp5DEwxzufkwQ=;
	b=LY4QId/nuwB0JfGhryZ5gQkJBlDuVsHLlFsJ6FWARYENkd2Wz7IDNkmK6QALmjX9Cw
	wdCcI0Kr4Cs/HMntc04PTXeQKiEW1IdN8Bigi8p/zXkf7mLhEIdhebOBAd3T/focmAZo
	3urv+g6FPsHhxrYe0nE+Yciqh4UlYWBiEj4NI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZU8V2UDpJpp8f1pPpOH6Za+e9vZyUjnfBKZ2oVy+NPkcrepjwYxmigmKu/3QjHpjQD
	NF+1IhqKyLa+PHiQLJ37EVq5jMD7RPdWmUhBZOeHZ6Siwq/B3bZ2XHlNM6KRfVDKaWXX
	JF2yE3RjRVd4zLsUTTNepVRQwlxcSTYsodsZ4=
MIME-Version: 1.0
Received: by 10.150.54.11 with SMTP id c11mr4879145yba.124.1283146401483; Sun,
	29 Aug 2010 22:33:21 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 22:33:21 -0700 (PDT)
In-Reply-To: <AANLkTikQHt0QdM7b+s9SyYWMRBE3gULYJ4q3_QqMdmg0@mail.gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
	<i5aoas$sja$2@dough.gmane.org>
	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
	<AANLkTinPBor3x6fYemS6h7_R-TR8Tx01exHzG+YhTAz=@mail.gmail.com>
	<4C79B2E7.6070806@mwester.net>
	<AANLkTikQHt0QdM7b+s9SyYWMRBE3gULYJ4q3_QqMdmg0@mail.gmail.com>
Date: Mon, 30 Aug 2010 07:33:21 +0200
Message-ID: <AANLkTi=CnhfkWw3JysxiaoVpknE2XP1cgGzu5FDFkM3b@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Mon, 30 Aug 2010 05:33:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

BTW forgot 2 things in the long story above.

Recipes that had a positive default preference were also kept.
But of course the actual steps do not matter that much. What I just
want to say that it was not a blind deletion action. I tried carefully
to delete only recipes that were not used by a distro, and I also
tried to stay within the criteria outlined by the TSC. But yes, better
testing would have helped

And actually there was a third issue (which I forgot to mentioned).
Khem noticed that autoconf231 or something like that also got deleted
but there were a few recipes that relied on that specific version.
Khem took care on resolving that (thanks!).

As far as I am concerned things happened the way they happened. We all
agree that it was not the best way.
My proposal is to close the topic and look forward again (but if there
is any fallout left, I'm still more than willing to repair it;
actually after the deletion I build beagleboard-demo-image from
scratch. That showed some problems but none were related to the
removal of the recipes (and meanwhile the issues encountered have been
fixed by Jason and me).

Wrt bitbake world:
At least one of the advantages of having a buildable world target is
that can be build if one wants to verify a big change. Currently for
beagleboard (armv7) things like demo-image or linux-tag provide a
reasonable coverage, but they are no good targets for ppc or nios2.

Frans


