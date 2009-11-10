Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N7uoT-0000D7-8Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 18:47:32 +0100
Received: by yxe5 with SMTP id 5so234953yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 09:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=mtfL/4YrX/t2+d8vbJsbuM0gBmHZrLqntAGD/0bU9Bo=;
	b=YL1wL/2ECIP0q1Fq7YOi3jZMYSiI5eUF9KQ6PcSw6fmivUgq4iFNFhcN00sx6EqqA5
	sZeMP0V1XTulD5BT7d1ThzPQp13kv1OPUyTSC0GRUVBO1fxeSk8o4lHVT2ZSmvoW3KA6
	d+YW7kinyPyV8RlRIPZMP8l+Eh8t4fqYpXimg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MHEsIrobKl9w51i6/OPmF2rtBC3O3S3F2Mh7F//ORv2rJ/ExIWNsxZYx/c4ZggiKuz
	LxLNrYrsTmHOLfOTFCUJpYsXjidQtyXW9irTF8+ko1VQd6M+VdEURon0I0u3jvOJvN5Z
	cB2XSO7gz1R7+hjfunL6wk5qUokl4rMtgfF38=
MIME-Version: 1.0
Received: by 10.101.27.12 with SMTP id e12mr615897anj.134.1257875171104; Tue, 
	10 Nov 2009 09:46:11 -0800 (PST)
In-Reply-To: <ac9c93b10911071237p63d19210m619afcaa914189f3@mail.gmail.com>
References: <ac9c93b10911071237p63d19210m619afcaa914189f3@mail.gmail.com>
Date: Tue, 10 Nov 2009 18:46:11 +0100
Message-ID: <ac9c93b10911100946i6da3eaect50b93beefeda4dbc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: perl/cpan issue (cpan.bbclass, perl/config.sh)
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
X-List-Received-Date: Tue, 10 Nov 2009 17:47:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/11/7 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> I was trying to make xmltv but noticed some files were missing from the recipe.
> The recipe includes cpan
>
> Apparently some of the files are in the xmltv work dir but others are
> copied to the perl work dir.
> I don't think this is good, but I am not a perl/cpan expert, so
> seeking for advice and/or a fix.
>
> Apparently cpan.bbclass invokes perl/config.sh
> This one contains things like:
> config_arg7='-Dinstallprefix=/home/frans/oe/tmp_angstrom/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r29/image'
> ..
> installbin='/home/frans/oe/tmp_angstrom/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r29/image/usr/bin'
> ...
> Guess config.sh is the bad guy
> Not sure how to fix this.
>
> Please advise (or if you are a wiz, please fix and I'll study the fix
> and learn from it :-) )

I had a fresh stab on this.
perl/config.sh gives the install dir.

config.sh is provided by the perl package but the perl recipe
substitutes the destination directory @DESTDIR@ with ${D}

So basically we can either:
a) put all packages that require perl/config.sh within recipes/perl
b) use an environment var in perl/config.sh (something that can be
replaced with ${D} during package build
c) have a config.sh with @DATADIR@ in it and let cpan.class replace it
wtih ${D} and write to a temp.sh and execute that one (or have a sed
script that replaces the vars) Note sure if that is ok, others
probably also use  perl/config.sh
d) in the target recipe hack the paths to the proper value using some
nifty sed script.
e) the recipe copies the data from the perl image dir to its own image dir.
f) something else

Not sure how to resolve this (and most of the above is beyond my
current capabilities).
Any feedback/suggestion is appreciated.

Frans

PS:  and if no-one responds to this I guess I'll go for the way that
is easiest for me: move the recipe to


