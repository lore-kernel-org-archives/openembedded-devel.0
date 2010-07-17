Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oa6Ij-0003eM-GE for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 14:15:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oa6Ie-00083q-HA for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 14:15:24 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 14:15:24 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 14:15:24 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 17 Jul 2010 14:15:11 +0200
Message-ID: <i1s6sg$d1j$1@dough.gmane.org>
References: <1279216536.3741.27.camel@mattotaupa>	<1279270987.4164.29.camel@mattotaupa>	<AANLkTimGrdHiLeLLsInSl9L-KS8SbvNt4ws2kDcpEEN1@mail.gmail.com>	<i1qogv$i28$2@dough.gmane.org>
	<1279355702.14848.3.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1279355702.14848.3.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-2008.1, uclibc: git-native: sysroot-destdir 6, 4 GB big, since some executables are 100 MB each
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
X-List-Received-Date: Sat, 17 Jul 2010 12:15:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-07-10 10:35, Paul Menzel wrote:
> Am Samstag, den 17.07.2010, 01:03 +0200 schrieb Koen Kooi:
>> On 16-07-10 17:23, Khem Raj wrote:
>>> On Fri, Jul 16, 2010 at 2:03 AM, Paul Menzel
>>> <paulepanter@users.sourceforge.net> wrote:
> 
>>>> Am Donnerstag, den 15.07.2010, 19:55 +0200 schrieb Paul Menzel:
>>>>
>>>>> I ran out of space and noticed
>>>>>
>>>>>     /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4
>>>>>
>>>>> is 8,1G big.
>>>>>
>>>>> Some of the executable files in
>>>>>
>>>>>     /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4/sysroot-destdir/angstrom-dev/sysroots/i686-linux/usr/libexec/git-core/
>>>>>
>>>>> are 101 MB big.
>>>
>>> its most probably the -g3/-ggdb3 bloat.
>>
>> No, it's git not creating (hard)links but copies of the same app. Run an
>> md5sum on the binaries, they will all match. I suggest you stop
>> spreading FUD about -ggdb3, it is not being appriciated.
> 
> I do not know anything about the technical background. I can only report
> that removing `-ggdb3` fixed it for me.

Are you saying that removing -ggdb3 made git create proper (hard)links?

regards.

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMQZ7PMkyGM64RGpERAilSAJ0Xh7q/84Ls1fu9SiqPiX4FcOS+9ACfRG/L
0sRjnr5z7xFxOVC7oSc1aG8=
=MEay
-----END PGP SIGNATURE-----



