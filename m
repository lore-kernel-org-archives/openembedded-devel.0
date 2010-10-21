Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8sRo-00008Z-5Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 12:32:36 +0200
Received: by iwn35 with SMTP id 35so2079617iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 03:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Z8O3Gt1ze8umohoEdrJOi+w8zcDneftq2yFHHkq0nNw=;
	b=UiligQmXEeflvc9Z4rRztx8lQ/KlLGsX/5Zb40MbKzmMx7MqEh3AQ9jGu5UV38H4+K
	buVXKVnY1WOApXnuTWR81yy15Kyhb/R1TcokkWbVxHIFmsa8r1aCHGYLHYc/DZWDH7Tg
	e9ZGAPeFscJEoqTvAr93WIo3lpSgpeBWsqiOc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UXq9xARnO1I5D3o5E2+CBeW1Px/uA7aEbV6uSqvqouJam2LTO+uPvs8nyPeY8txWgM
	zKPotQacwexBFfSDG9fG9OE3whxKfcNU+NyjVyJSCbt0PfEs9FrP7QeoXdS4xsGHTSzy
	zCJjPbVy7r9w3XaqGEHwWhsBwpCd4yZ0xeVVg=
MIME-Version: 1.0
Received: by 10.231.37.197 with SMTP id y5mr667353ibd.151.1287657118133; Thu,
	21 Oct 2010 03:31:58 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 21 Oct 2010 03:31:58 -0700 (PDT)
In-Reply-To: <i9p1gp$7q4$2@dough.gmane.org>
References: <i9p1gp$7q4$2@dough.gmane.org>
Date: Thu, 21 Oct 2010 12:31:58 +0200
Message-ID: <AANLkTikjqoyX4kJ+RMARq+mv8TrV37C4fMqbCuev8r38@mail.gmail.com>
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
Subject: Re: [RFC] splitting the metadata into multiple bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 10:32:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/21 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> Please discuss splitting the metadata here and not in the conf/machine
> thread :)
>
> Have a look at http://git.pokylinux.org/cgit/cgit.cgi/poky/tree/meta/ to
> see how RP has done it.
>
> regards,
>
> Koen

Looks good to me.
We might need some other and additional categories (e.g. recipes-opie).
I can also imagine images and tasks becoming a separate group.

What would be nice is if there is a mechanism or description what
subtrees require what, so it becomes easier to set up a BBPATH that
e.g. leaves out the qt recipes if you are not interested in those.
Guess ideally the relations between the subtrees should be a directed
graph (without cycles). Not fully sure if this is feasible though.

Frans


