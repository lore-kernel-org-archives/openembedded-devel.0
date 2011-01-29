Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PjE0n-0005If-Pi for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 17:50:58 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PjDzx-0001Zy-4b for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 17:50:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 17:50:05 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 17:50:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 29 Jan 2011 17:45:13 +0100
Message-ID: <ii1g6p$n91$1@dough.gmane.org>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>	<20110129112942.GB3265@jama>	<4D44296D.6040209@mentor.com>
	<4D4437DB.40704@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D4437DB.40704@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 0/5] Relocatable perl-native and use it always
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
X-List-Received-Date: Sat, 29 Jan 2011 16:50:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-01-11 16:52, Tom Rini wrote:
> On 01/29/2011 07:51 AM, Tom Rini wrote:
>> On 01/29/2011 04:29 AM, Martin Jansa wrote:
>>> On Fri, Jan 28, 2011 at 11:52:28AM -0700, Tom Rini wrote:
>>>> Hey all,
>>>>
>>>> As I've talked about before[1] there's build reproducibility issues
>>>> depending on when perl-native is built. After talking with Mark Hatle
>>>> a little bit I started thinking about relocation in perl again and it
>>>> turns out that starting in 5.10, upstream perl supports relocation.
>>>>
>>>> This in turn makes it less painful to make perl-native be what we use
>>>> when we want perl runtime, nearly everywhere (since you can use
>>>> pstaging
>>>> to avoid it the time next time).
>>>>
>>>> This patch set drops perl 5.8.8 and bumps all of the perl stuffs PR,
>>>> switches to relocatable perl-native, and then the big switch to
>>>> using it
>>>> early.
>>>
>>> Looks good and as we're using 5.10 already then for whole series:
>>>
>>> Acked-by: Martin Jansa<Martin.Jansa@gmail.com>
>>
>> Thanks.
>>
>>> Can we also get rid of legacy staging from recipes/perl/perl_5.10.1.bb ?
>>
>> Huh? I killed legacy staging in both perls a long time ago (and then
>> Koen fixed up my thinkos).
> 
> OK, after some quick IRC, -ENOCOFFEE.  It looks like it wouldn't be too
> hard to kill legacy staging based on poky (we just need to install on
> the target Config_heavy-${TARGET_SYS}.pl.  I'll tackle that separately.

The cpan classes will need a fix as well for that, which is also in yocto :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNREQZMkyGM64RGpERAqT9AJwJiW9934LVFNN+5QDFGORGcucFtgCgvXt6
OAOCVt+ags9ynqAT9Ruu2nM=
=tEev
-----END PGP SIGNATURE-----



