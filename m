Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NeTuA-0005xn-Ju for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 14:44:01 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NeTrd-0004Nb-5K for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 14:41:21 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 14:41:21 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 14:41:21 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 08 Feb 2010 14:39:45 +0100
Message-ID: <hkp46v$tv8$1@ger.gmane.org>
References: <hkm5j4$fib$2@ger.gmane.org>	<ac9c93b11002070821x6d5ac559sd8bb519b902b0af0@mail.gmail.com>	<hkmqif$i2t$1@ger.gmane.org>
	<ac9c93b11002080525l4399ea54h23d387c8ce2f9024@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
In-Reply-To: <ac9c93b11002080525l4399ea54h23d387c8ce2f9024@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: TSC meeting minutes 20100204
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
X-List-Received-Date: Mon, 08 Feb 2010 13:44:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-02-10 14:25, Frans Meulenbroeks wrote:
> 2010/2/7 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 07-02-10 17:21, Frans Meulenbroeks wrote:
>>
>>> The last two items discussed were new-style staging and packaged
>>> staging. The TSC would like to *strongly* encourage people to move their
>>> recipes to new style staging. If you are using packaged-staging with a
>>> big TMPDIR (e.g. a few machines with big images built) legacy staging
>>> will easily take more than 15 minutes per recipe because it scans
>>> through the complete staging looking for changes.
>>>
>>>> Maybe I missed a thing, but can someone provide a pointer to how a
>>>> good recipe with new style staging  should look like?
>>>> I'll happily modify the recipes I touch regularly, but don't exactly
>>>> know what to do.
>>
>> New-style staging means it has no do_stage method defined anymore (and
>> not getting one thru things like autotools_stage.bbclass as well).
>> It will re-use the output of do_install() to populate staging and run QA
>> checks on.
>>
>> You can check it building it and and looking for messages like "Legacy
>> staging enabled", which would tell you it's still using the old, slow
>> method.
>>
>> regards,
>>
>> Koen
> 
> Did a quick grep, there are still some 1400+ recipes that have a
> do_stage. Now some of them are older versions (e.g. there are 6
> xorg-lib/pixman recipes).
> I'm more than happy to do my part of the cleaning but....
> Almost most of the packages are things I don't know too much about.
> What I can do (with packaged staging) remove do_stage, build, build a
> package that depends on it and if that builds commit my work. Is that
> considered to be good enough?

You can compare the contents of the packaged-staging packages to see
differences between then. That's what I do as a first check. Building
something against it is the second check :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLcBQhMkyGM64RGpERAot+AJ0fcQaGsHWHk107ChvoVnSO2saQ3wCeMZ/O
/jHZMEcEaVKXoqMRPa/Jg0U=
=V1gH
-----END PGP SIGNATURE-----



