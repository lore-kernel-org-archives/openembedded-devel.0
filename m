Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nxi1A-0003mh-Ky for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 16:38:41 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nxhy0-0000gr-Bf for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 16:35:24 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 16:35:24 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 16:35:24 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 02 Apr 2010 16:35:09 +0200
Message-ID: <hp4vat$f2l$1@dough.gmane.org>
References: <1270135981.4993.128.camel@rex> <hp4s4q$40a$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <hp4s4q$40a$1@dough.gmane.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Fri, 02 Apr 2010 14:38:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-04-10 15:40, Koen Kooi wrote:
> On 01-04-10 17:33, Richard Purdie wrote:
>> I've been aware that Poky and OE have been diverging slightly and I'd
>> like to correct this. There are some patches that I've promised for a
>> while too such as the rename from do_populate_staging ->
>> do_populate_sysroot.
> 
>> With some help from Joshua Lock, I have a branch I'd like to propose be
>> merged into OE.dev:
> 
>> http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=rpurdie/work-in-progress
> 
> While testing (rebased on top of this mornings OE, bitbake master) I'm
> getting messages like this:
> 
> //OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/python2.6/lib-dynload/strop.so:
> RPATH=/OE/angstrom-dev/sysroots/x86_64-linux/usr/lib
> //OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/python2.6/lib-dynload/strop.so:
> new RPATH: $ORIGIN/../../../../usr/lib
> open: Permission denied
> elf_open: Invalid argument
> 
> Are those messages from chrpath and can they be ignored?

And lots of:

: QA Issue with staging: libssp_nonshared.la failed sanity test
(installed) in path
/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLtgCdMkyGM64RGpERAv7sAJ9oScH3UmWw11aExUJRBxdnGDdoGACaA6jh
AmUQ3TfIfL5trAenmYXjmeo=
=u1oE
-----END PGP SIGNATURE-----



