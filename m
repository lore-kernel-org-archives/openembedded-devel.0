Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P2UOJ-0004ni-GI for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 21:38:37 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P2UO0-0007Kp-Jw for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 21:38:16 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Oct 2010 21:38:16 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Oct 2010 21:38:16 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 03 Oct 2010 21:38:07 +0200
Message-ID: <i8am2v$c76$1@dough.gmane.org>
References: <i89i90$7hp$1@dough.gmane.org>	<AANLkTi=N_zeiKZXy4W5umM=K5sb5JYvHCY5C+bFsrhL9@mail.gmail.com>
	<AANLkTimmq=tcfb_x_S5T4Jp3UXFR7hdofO7arBXvPeKL@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <AANLkTimmq=tcfb_x_S5T4Jp3UXFR7hdofO7arBXvPeKL@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gtk+ build failure after create_wrapper commit
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
X-List-Received-Date: Sun, 03 Oct 2010 19:38:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-10-10 20:39, Chris Larson wrote:
> On Sun, Oct 3, 2010 at 8:25 AM, Chris Larson <clarson@kergoth.com> wrote:
> 
>>
>>
>> On Sun, Oct 3, 2010 at 2:26 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
>>
>>> Last nights build failed with:
>>>
>>> | make[2]: Entering directory
>>>
>>> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gtk+-2.20.1-r9.3/gtk+-2.20.1/demos'
>>> | /OE/angstrom-dev/sysroots/x86_64-linux/usr/bin/gdk-pixbuf-csource
>>> - --raw --build-list          \
>>> |               apple_red  ./apple-red.png      \
>>> |                 gnome_foot ./gnome-foot.png   \
>>> |         > test-inline-pixbufs.h                               \
>>> |       || (rm -f test-inline-pixbufs.h && false)
>>> | Usage: gdk-pixbuf-csource [options] [image]
>>> |        gdk-pixbuf-csource [options] --build-list [[name image]...]
>>> |   --stream                   generate pixbuf data stream
>>> |   --struct                   generate GdkPixdata structure
>>> |   --macros                   generate image size/pixel macros
>>> |   --rle                      use one byte run-length-encoding
>>> |   --raw                      provide raw image data copy
>>> |   --extern                   generate extern symbols
>>> |   --static                   generate static symbols
>>> |   --decoder                  provide rle decoder
>>> |   --name=identifier          C macro/variable name
>>> |   --build-list               parse (name, image) pairs
>>> |   -h, --help                 show this help message
>>> |   -v, --version              print version informations
>>> |   --g-fatal-warnings         make warnings fatal (abort)
>>> | make[2]: *** [test-inline-pixbufs.h] Error 1
>>> | make[2]: Leaving directory
>>>
>>> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gtk+-2.20.1-r9.3/gtk+-2.20.1/demos'
>>> | make[1]: *** [all-recursive] Error 1
>>> | make[1]: Leaving directory
>>>
>>> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gtk+-2.20.1-r9.3/gtk+-2.20.1'
>>> | make: *** [all] Error 2
>>>
>>> I'll have a better look at work tomorrow, but if anyone has a fix ready,
>>> don't hesitate to speak up :)
>>>
>>
>> Reverted for now, working on a fix.  Sorry about that.  Must have missed
>> something obvious.
>>
> 
> Fixed, confirmed gtk+ builds with it.  Sorry for the hassle.

Thanks for the quick fix! Looking at the fix I can certainly say that it
wouldn't have occured to me to check wether the wrapper passed args or
not :)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMqNufMkyGM64RGpERAtv0AJwL6NrbJ+HhhHjgWB3bPQ7ai8biXwCgqgu6
1CtgwvTmXrx3tDhV/CNjgcA=
=27Cv
-----END PGP SIGNATURE-----



