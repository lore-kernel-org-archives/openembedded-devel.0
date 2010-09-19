Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxL9A-0006Jh-A8
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Sep 2010 16:45:40 +0200
Received: by iwn2 with SMTP id 2so3527309iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Sep 2010 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ww60VQ8recnaZG4F2UJp3Eh517uUN1yZcvHTpodX04o=;
	b=oEIeyybhDfnAC3X6vYFgqPtMZlQ8cq+lj4fp9Mhl/Xi+QMHB/1x13CaGslpusBnl5d
	k/N/DRJJYjDOBmg6vGbxVcx17nT0fr7CxQaMxQP2FkznJNjJ8Yc8I2YnocPLYI4micIk
	WE+g1GUdX2FJ+ahHi3I9R2WN/bVCyRyMVUypg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RLYb/GgLtd7Fac9ECnsF2gXWovueg7UvvNu07ZqdjOYYm1nvr//NDHwrRVVp/9shfR
	t7ZxycEJVmO4q3agmOUhTcDj7YT55MUUB9vqo1IVYhya/4RQb+OG9UvEZ+NxYBS3etHr
	kDnVxoKZOMfVcnndQgv2CQXuJNbTZhx3yot7I=
MIME-Version: 1.0
Received: by 10.231.193.11 with SMTP id ds11mr7719029ibb.192.1284907488322;
	Sun, 19 Sep 2010 07:44:48 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 19 Sep 2010 07:44:48 -0700 (PDT)
In-Reply-To: <i754o1$jk1$1@dough.gmane.org>
References: <AANLkTikymYraWDKtHZ0AFrhg5pFFCRuH9pPS1PQRsdCA@mail.gmail.com>
	<i754o1$jk1$1@dough.gmane.org>
Date: Sun, 19 Sep 2010 16:44:48 +0200
Message-ID: <AANLkTi=-GfscP__9g1QW-wTLF55m5F6VTz4BEbMT_8we@mail.gmail.com>
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
Subject: Re: COMPATIBLE_MACHINE and no buildable providers
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
X-List-Received-Date: Sun, 19 Sep 2010 14:45:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/19 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-09-10 13:53, Frans Meulenbroeks wrote:
>
>> Or should COMPATIBLE_MACHINE be allowed to trickle up so when building
>> a recipe that depends on another recipe that is not for that MACHINE
>> one only gets a warning.
>
> It should. COMPATIBLE_MACHINE should only be added to recipes that are
> built for a certain arch/machine, not to the dependants.
>

How can we arrange this?
It is way out of my league to implement this.
Any takers?

Frans


