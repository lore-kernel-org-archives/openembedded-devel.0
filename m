Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OEmVZ-0001Yv-Cc for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 18:52:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OEmRh-0005fl-V7 for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 18:48:37 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 18:48:37 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 18:48:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 19 May 2010 18:48:26 +0200
Message-ID: <ht14oq$ok6$1@dough.gmane.org>
References: <alpine.LNX.2.00.1005181720550.21508@asterix.crazy-teaparty.dyndns.org>	<4BF3C9B8.8080501@mlbassoc.com>	<alpine.LNX.2.00.1005191335020.21508@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005191726560.21508@asterix.crazy-teaparty.dyndns.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <alpine.LNX.2.00.1005191726560.21508@asterix.crazy-teaparty.dyndns.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: powerpc-g++ 4.2.4 problem casting long long to double
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
X-List-Received-Date: Wed, 19 May 2010 16:52:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-05-10 17:46, Vitus Jensen wrote:
> On Wed, 19 May 2010, Vitus Jensen wrote:
>> On Wed, 19 May 2010, Gary Thomas wrote:
>>>  On 05/19/2010 03:38 AM, Vitus Jensen wrote:
>>> > >   We noticed a strange problem with C++ code casting long long
>>> variables
>>> >   to double, as a lot of qt-embedded code is doing.
>>> > >   =================
>>> >   double
>>> >   convert(long long l)
>>> >   {
>>> >   return (double)l; // or double(l)
>>> >   }
>>> > >   int
>>> >   main(int argc, char * argv[])
>>> >   {
>>> >   long long l = 10;
>>> >   double f;
>>> > >   f = convert(l);
>>> >   printf("convert: %lld => %f\n", l, f);
>>> >   return 0;
>>> >   }
>>> >   ====================
>>> > >   output:
>>> >   convert: 10 => 0.000000
>>> > >   C++ compiled via powerpc-angstrom-linux-g++ gives the above
>>> result.
>>> >   Compiling the same code as C using powerpc-angstrom-linux-gcc works
>>> >   fine. But when looking at the assembler code both compiler produce
>>> >   virtually identical output and both call __floatdidf to do the
>>> actual
>>> >   conversion. Very strange, has anyone ever seen similar effects?
>>>
>>>  Is this from a recent tree (i.e. post Richard Purdie's restructuring)?
>>>
>>>  I've seen similar problems with C++ code on Poky which uses the same
>>>  changes.
>>
>> No, I'm building everything from the stable branch.  There were some
>> commits cherry-picked from .dev but those only add Qt 4.5.2.
>>
>> Poky is ARM only, right?  Perhaps it would be helpfull to build a
>> compiler from .dev and for a widely used powerpc-platform?  How does
>> n1200 sound? It uses the same ppc603e.
> 
> Unfortunately .dev switched to gcc-4.3.3 in the meantime which fails for
> ppc603e platforms because of undefined references to __nldbl_fprintf and
> __nldbl_sprintf during compile.
> 
> Platform tqm8540 (ppce500, just to try some other ppc cpu) fails in
> gcc-4.3.3 compile, too.  Possible related to this:
> 
> endian.h:34:4: warning: #warning Cannot determine current byte order,
> assuming big-endian.
> 
> So currently .dev should be unbuildable for ppc users?  Without
> selecting a non-default compiler that is.

I thought I pinned powerpc at 4.1.1, but it turns out that it was only
for ppc405:

ANGSTROM_GCC_VERSION_ppc405         ?= "4.1.1"

Feel free to send patches to add that for other ppc platforms.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL9BZaMkyGM64RGpERAl2wAJ0e6b4dQByFnOVP9LH0SPUSQeEfDwCbBFFc
bX9N5oxgcwlYQQgmGQMtNTU=
=Rijq
-----END PGP SIGNATURE-----



