Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpJwY-0006ld-Pi
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 13:51:33 +0200
Received: by yxk30 with SMTP id 30so1530819yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=lY6Ch5B1NgXiPgmvs8o4p7FjvanuKvQWyxkAS/FuGfQ=;
	b=MB5cOVc9XzOZaVk5LNel2nAHYc9zQZaG5jR2SM4n0uUHkPwStxVvU4NqJiMLzhJqwX
	zmML2lp2Ry0XHCQ81Mdly2hnyNv7pJw+9l/1BhzZPG0NxTWSDDRN+4apYwNFrVinOfiy
	O/fRob6LV3HlXL86hoSQqZHoWDnP5tXvUSPKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lj1TNUfvERbhDXy23cMDoHeipC37ay2pXQR4EwSgAimg9VZ01v+vabRD4sa4GVzXqX
	V7WtcaK0cD4l9CedF+x4q25a5RP1ImytdN3oxc4mJ6Vcct5ISgxFgA+Yn0fliF4FpEYC
	iTdnMdUcBRoxAMe0q63Fe+YynNVb0Giij7NUM=
MIME-Version: 1.0
Received: by 10.151.7.9 with SMTP id k9mr3222075ybi.46.1282996260478; Sat, 28
	Aug 2010 04:51:00 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sat, 28 Aug 2010 04:51:00 -0700 (PDT)
In-Reply-To: <i5aoas$sja$2@dough.gmane.org>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
	<i5aoas$sja$2@dough.gmane.org>
Date: Sat, 28 Aug 2010 13:51:00 +0200
Message-ID: <AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
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
X-List-Received-Date: Sat, 28 Aug 2010 11:51:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/28 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Your patch does too many things at once, to recipes I maintain, so
> please split it up per recipe and I'll ack/nack the seperate patches.
> I'm getting suck of such jumbo patches that can't be reverted cleanly.
> I'm still dealing with the fallout from the crappy deletions frans did,
> so patches like this aren't helping.

Ehm, I did not see a request to revert any of the deletions.
There have been two issues (openssl and docbook-sgml-dtd, and both
have been reverted in 16 hrs or so. (and later on one or two other
deletions have been reverted on request of the recipe owners, but
these did not cause any breakage afaik).
So I really don't know what fallout you are dealing with.
And my deletions were not exactly jumbo patches and were very easy to
revert if needed.

And as I already wrote before: dev head is bleeding edge, so sometimes
things go wrong. Can happen. No big deal if resolved quickly. That is
the risk of living on the edge. If you can't live with that use the
stable branch or create your own branch where you are in full control.
The root cause is that you do what can be considered production work
on dev head. Most seasoned software engineers will agree that that is
not very wise and

BTW apparently your perception on my work apparently is a minority
viewpoint. If I recall correctly two people complained to me and at
least 5 mentioned to me that they appreciated my activity.

Frans.


