Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P37Mr-0005DP-A5
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 15:15:42 +0200
Received: by iwn2 with SMTP id 2so8267691iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 06:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=7i80ikh5LIyK/oE4aDuRynKD9FNRz+9DkuXA1Eese8M=;
	b=k3xG1X8q2Nwo/yb3jjoVOKc6DbwH138D26ciKRAEX3VgKYZQ2MKQJncejcd3AF1Rc0
	P5/2l3b3JZjDsG+OGUwPJJqXyrvgYznkloPBqV2xwcipRcCF6EmRbCR7uMpUW59eho8K
	ZHwyxMCP3x3YfgRi/uzEVFA56T0FZ6gd+BdmY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=itH18goIu1dIG7Vejy1eXI8iTijQXsy3B2ksPmAQpbeeTwp+tJmglSiGPAD6m6zqkZ
	KvH2goElyctEPd+ULjmMT3gvH5Gah+MEoIZOpnUBOA+HXc8ZLrYXvk7bW3+GYlxSHR1b
	2Z6N+a9P0U35BsbNX7MKYqEUlGPoWAL+rKYeI=
MIME-Version: 1.0
Received: by 10.231.147.131 with SMTP id l3mr12149689ibv.74.1286284520760;
	Tue, 05 Oct 2010 06:15:20 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 5 Oct 2010 06:15:20 -0700 (PDT)
In-Reply-To: <i8ev7s$ts9$1@dough.gmane.org>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
	<i8ev7s$ts9$1@dough.gmane.org>
Date: Tue, 5 Oct 2010 15:15:20 +0200
Message-ID: <AANLkTimoqe9MfvN-_GcmOnUaosvgVbXCcb4LOvxi+_KZ@mail.gmail.com>
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
Subject: Re: [PATCH 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Tue, 05 Oct 2010 13:15:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/5 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05-10-10 09:43, Khem Raj wrote:
>> Hi
>>
>> Following set of patches is intial support for getting libtool 2.4 into
>> openemebedded. I have so far built minimal-image for two machines successfully
>>
>> The big change that libtool 2.4 brings is sysroot support and I have added
>> support to use this feature. It should make our life easier.
>
> I'm a bit concerned about the way this is implemented, it seems to for
> libtool 2.4 onto everyone since it changes e.g. autotools.bbclass. Is
> that intended? If so we need signoffs from each and every distro
> maintainer *and* from the maemo-compat folks as well.
> Unless there is a way to make the new features conditional on the
> libtool version.

The procedure for making toolchain changes is outlined in
http://wiki.openembedded.net/index.php/Commit_Policy
There are no requirements that state that every distro maintainer
needs to sign off.
As it stands it is not even clear for every distro who the maintainer is.
See http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg08965.html

Having said that, I agree that this change is not to be taken lightly
and preferably there should be a migration path.
My personal preference would be not to push this change before OEDEM,
and discuss the way we are going to introduce this @ OEDEM.

BTW, I feel dev head should aim at moving forward. Production work
should be done on e.g. the stable branch.
A single distro should not be able to block progress for all others.

>
> My usecase is that I don't want to switch angstrom-2008 to a newer
> libtool, but do want to switch angstrom-2010 to a newer one and build
> *both* from .dev.

That would definitely be the ideal case. I hope that is possible.

Then again I fear that at some point we will get recipes that
expect/require/use the behaviour of the new libtool

Frans.
>
> regards,
>
> Koen


