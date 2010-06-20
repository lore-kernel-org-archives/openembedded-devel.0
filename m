Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OQMgG-0004zR-Py
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 17:43:34 +0200
Received: by bwz14 with SMTP id 14so765090bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=6/2ohchUhp3yeRbm2vABZymjM+m79k/H171rRIj+BtM=;
	b=M/OMkmyeOVg/CF28k9eSc9Rz3UfOWBmSkAc7JmMoybeSqQDmNN8bhgkx4B/HUO+REU
	n2w7tI6n/7PsGuzgbDiKsa04pGz4yjqK+lLv8ND3cUhjQotKm+F5e60VZHRdWPgf1d0b
	paZTpIHfiXdopyOCfXvhefray7YE1JqiiReRk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YSgOTbO1EUNFq3D/JwwLnof8d+XNhg3RW4qANa29r/zRj2U4zknA3MUlU0MV00D+va
	tMt/QznQXmN1egXo/mZETZt2ak83u6iwMEPLbvPnOVzsvoKRZIwcUhD4aa+iR0jUQyPL
	G7X/oyG0WEAmzz5neAUo1eZ0J0A/xx9IpQGr8=
MIME-Version: 1.0
Received: by 10.204.81.129 with SMTP id x1mr1946913bkk.95.1277048339506; Sun, 
	20 Jun 2010 08:38:59 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Sun, 20 Jun 2010 08:38:59 -0700 (PDT)
In-Reply-To: <hvl1uc$bol$1@dough.gmane.org>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
	<hvl1uc$bol$1@dough.gmane.org>
Date: Sun, 20 Jun 2010 17:38:59 +0200
Message-ID: <AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a 	question)
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
X-List-Received-Date: Sun, 20 Jun 2010 15:43:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/6/20 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 20-06-10 11:58, Frans Meulenbroeks wrote:
>> Hi,
>>
>> I'm about to complete bringing a new architecture (nios2 with mmu) and
>> machine (cyclone III FPGA starter kit, and maybe also the Nios2
>> Embeddeded Evaluation Kit (aka neek)) to oe.
>> Is there a policy on on the process how to do this.
>
> Have a look at the nios2 patches Leon sent last december, they were
> reviewed on this list, but not committed.

Koen, thanks for reminding me the look at the review comments.

I'm well aware of the work of Leon and Walter (and they are well aware
of my work).
Note that what Leon posted was for a non-mmu nios2 core, whereas the
changes I have is for an mmu core.

Triggered by Koens reminder I revisited the review comments. Actually
none but one are applicable for me.
The one that is applicable is the one about pinning versions in
machine descriptions.
I have also done that, as there are simply no other versions of
binutils and gcc that can be used by this hardware.
Also I don't feel empowered to make changes in distribution specific files.

The only alternative way that I can think of is doing something like:
DEFAULT_PREFERENCE_nios2 = "1" in the recipes I need.
No idea if that overrules the distro settings or not, but I can give
it a try later today.

Have fun! Frans.


