Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OY0Tk-0001dv-Gd for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 19:38:13 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OY0Ox-0003vs-VB for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 19:33:15 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 19:33:15 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 19:33:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 11 Jul 2010 19:33:07 +0200
Message-ID: <i1cv8j$446$1@dough.gmane.org>
References: <i1chst$tq5$1@dough.gmane.org>
	<1278867705.15825.94.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1278867705.15825.94.camel@lenovo.internal.reciva.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'LIBC' variable clashes with perl variable
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
X-List-Received-Date: Sun, 11 Jul 2010 17:38:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-07-10 19:01, Phil Blundell wrote:
> On Sun, 2010-07-11 at 15:45 +0200, Koen Kooi wrote:
>> Perl (among others) uses the 'LIBC' variable to point its linker to
>> libc.so.6, which fails due to OE redefing LIBC.
>>
>> Any objections to renaming LIBC to TARGET_LIBC in OE?
> 
> How is perl getting to see that variable?  I don't think it ought to be
> exported.
> 
> I don't have any problem with renaming it, though I do wonder whether it
> would be better to just abolish it altogether in favour of inspecting
> ${HOST_OS}.

LIBC is currently used to set it for bitbake, e.g.:

MACHINE=beagleboard LIBC=eglibc bitbake foo
MACHINE=beagleboard LIBC=uclibc bitbake foo

Which also means we can't use any '_', so it would be TARGETLIBC or HOSTOS.
I'm not sure what the impact would be when we would unexport it, though.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMOgBTMkyGM64RGpERAqO9AJ4lSJbHDviQjgkIK5XkTC6/9voHIQCcDSrq
CK72iQi4N6rTh7x9hXt3jpM=
=XkZF
-----END PGP SIGNATURE-----



