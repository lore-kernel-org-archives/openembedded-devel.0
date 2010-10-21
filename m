Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8sE9-0002Mc-4N
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 12:18:29 +0200
Received: by iwn35 with SMTP id 35so2067036iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 03:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=bTnHTzu7KL82WoKh0reQU0ETXJRZVLOFxQTKSbl7Aqg=;
	b=jwhyAZaefuFTjD9tUDEqI47S2klX5+UazUDNiYc2aMv24ugzrcVSo74YVbJ99oqzAM
	GVxUeq3CuYjdWPStf7Sv0HZPWlTXzzjmGsplMpKms0hmNHb+zhzXF/7uAaetpBbnR2MK
	FpH9pbI5m2QJp4wG8mupYSfmaj9lhLcHL+cHE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MOo1VBBJINhHpkOberEX6poQ3gUfbz9oEqXUZARPDLToACm+XsYDrTOu5rKllLqI8m
	4bjv3sVgA0eGPxuGHBACNEcAH9FQgikcAQqVGU/KUre88mJlOTxn3rn55VcTghfiAWK4
	MUgdywiNxvHf9COlximfaZHMNyDhzX7jX574U=
MIME-Version: 1.0
Received: by 10.231.11.9 with SMTP id r9mr706138ibr.47.1287656272530; Thu, 21
	Oct 2010 03:17:52 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 21 Oct 2010 03:17:52 -0700 (PDT)
In-Reply-To: <4CC0104B.4070108@xora.org.uk>
References: <i9p1d0$7q4$1@dough.gmane.org> <4CC00D57.4070601@xora.org.uk>
	<i9p2uf$f40$1@dough.gmane.org> <4CC0104B.4070108@xora.org.uk>
Date: Thu, 21 Oct 2010 12:17:52 +0200
Message-ID: <AANLkTimyBY9nSiSeH0xCYRJ20ah0ULp77HCqC-5tg_ya@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
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
X-List-Received-Date: Thu, 21 Oct 2010 10:18:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Some initial thoughts:

What about out-of-tree kernel modules?
No idea right away whether we have many.
I can imagine we want to keep these in one place (I doubt if they are
very machine specific).

putting the recipes in the overlay creates some duplication (and hence
potentially double maintenance).
Probably for kernel this is less of an issue as most machines seem to
have their own kernel.

There is however the case that machines like to share the same kernel.
E.g. sheevaplug/openrd client/openrd base/openrd ultimate (and perhaps
pogoplug and dockstar). These are all based upon the same soc.

The thing I do like less about the amend.inc proposal is that unless
we are very careful and strict with the contents of the linux dir we
still end up with quite some recipes in there.
(you probably end up with a base recipe for every git tree; and maybe
even for different tags in it). this is probably less desirable.

And wrt u-boot there seems to be some more commonality (although the
u-boot_git recipe is quite big).

Maybe someone could craft a usage table (don't have time to do that
right now myself).

More later....

Have fun! Frans


