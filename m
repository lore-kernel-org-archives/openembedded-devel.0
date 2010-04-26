Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6Hu3-0002vL-Jz for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 08:34:48 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6HqT-0006Vi-8d for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 08:31:05 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 08:31:05 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 08:31:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Apr 2010 08:30:54 +0200
Message-ID: <hr3buu$pps$1@dough.gmane.org>
References: <1272217739.3865.546.camel@trini-m4400>	<hr254d$kkn$1@dough.gmane.org>
	<1272225464.3865.549.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <1272225464.3865.549.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The coreutils-native race...
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
X-List-Received-Date: Mon, 26 Apr 2010 06:34:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-04-10 21:57, Tom Rini wrote:
> On Sun, 2010-04-25 at 21:28 +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 25-04-10 19:48, Tom Rini wrote:
>>> Hey all.  I thought I would try and explain what Chris has been up to
>>> with at least some of the base.bbclass changes (the ones related to
>>> md5sum and cp).
>>>
>>> Right now, with a big enough BB_NUM_THREADS we can get into a race where
>>> coreutils-native is installing programs and elsewhere we are in a
>>> do_fetch and either trying to use 'cp' or 'md5sum', and blam, we try and
>>> invoke the program while it's being installed (and see things like
>>> sh: /path/to/staging/i686-linux/usr/bin/cp: Textfile is busy).
>>>
>>> There's a few ways out of this:
>>> 1) Don't rely on 'cp' and 'md5sum' anymore but use python for it.
>>> 2) Make an oe_cp and oe_md5sum to go with oe_sha256sum
>>> 3) IIRC, the big part of coreutils-native was a fully functional,
>>> always, 'install'.  We could just copy the install we build or provide
>>> an install wrapper (oe_install) or so
>>> 4) ???
>>
>> Even thought I loathe python, option 1 sounds like a nice way to go
>> since it doesn't involve butchering recipes.
> 
> I think we're OK, except in the case of when we can't rely on a built-in
> md5sum (and then the race comes back) and just need to figure out if the
> libpam-base-files recipe does things (a) optimally and (b) if that's a
> common thing.
> 
> Currently, with a quick glance at the recipe, I don't see any
> distro-specific overrides, so I'd be inclined to call it lazy recipe
> writing, until someone points out history of why that's a good thing..

I have no problem with changing the libpam-base-files SRC_URI to

file://pam.d/

or

file://foo.pam \
file://bar.pam \
...
etc

But I would like to see it documented in the OE manual that file://dir/*
can't be used, and why.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL1TMeMkyGM64RGpERApkGAJ97rdsQSb+HvBKP2xKUdyAvqyfqPgCfUEBG
h/0qC3TUbMrfO0oOvZv9mmk=
=cb0z
-----END PGP SIGNATURE-----



