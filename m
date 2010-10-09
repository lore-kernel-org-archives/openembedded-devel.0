Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P4WoT-00061H-Vb for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 12:38:54 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P4Wo2-0006lj-9Y for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 12:37:34 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 12:37:34 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 12:37:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 09 Oct 2010 12:37:25 +0200
Message-ID: <i8pgl5$8n1$1@dough.gmane.org>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>	<i8jufe$299$1@dough.gmane.org>	<AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>	<AANLkTi=_1X_2nbgdX26Et6jd0mRxNSAKbbjkcx-iJNjC@mail.gmail.com>
	<AANLkTikLT9ZRLbnbGQ17AN5u0TiXdweP7HKH-QuLBH_E@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <AANLkTikLT9ZRLbnbGQ17AN5u0TiXdweP7HKH-QuLBH_E@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH,V2 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Sat, 09 Oct 2010 10:39:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-10-10 00:21, Chris Larson wrote:
> On Fri, Oct 8, 2010 at 1:48 PM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
> 
>> 2010/10/7 Khem Raj <raj.khem@gmail.com>:
>>> On Thu, Oct 7, 2010 at 12:56 AM, Koen Kooi <k.kooi@student.utwente.nl>
>> wrote:
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>>>> On 07-10-10 03:46, Khem Raj wrote:
>>>>> Hi
>>>>>
>>>>> Following set of patches is v2 of the patches adding support for
>> getting libtool 2.4 into
>>>>> openemebedded. I have so far built minimal-image for two machines
>> successfully using old
>>>>> and new libtool.
>>>>>
>>>>> The libtool sysroot feature knob is added through LIBTOOL_HAS_SYSROOT
>> variable. If this is
>>>>> set to "yes" then you ought to use libtool > 2.4 by default its set to
>> "no" which means
>>>>> the current behavior remains.
>>>>>
>>>>> The big change that libtool 2.4 brings is sysroot support and I have
>> added
>>>>> support to use this feature. It should make our life easier.
>>>>>
>>>>> This needs a lot of testing.
>>>>>
>>>>> Please cherry pick the patch bundle and give it a try in yout
>> environment
>>>>
>>>> Can you apply these to a branch so we can add fixes there if needed?
>>>
>>> I can do that. However now that backward compatibility is left intact I
>> think
>>> it would not be that bad to merge it into master and fix things on
>>> master. the libtool
>>> 2.4 would have DEFAULT_PREFERENCE = "-1" by default it wont be picked by
>> anyone.
>>> with the number of developers we have it will get better testing before
>> we
>>> accumulate too many changes on a branch. Secondly there might be changes
>> like
>>> gnutls one where the patch is only valid for new libtool and should be
>> tested
>>> in old and new way. If there is any breakage introduced in existing build
>> will
>>> be caught quickly. Where as on branch resources might be divided and it
>> may
>>> not progress so well. I am just weighing efforts Vs. risk here and
>>> risk seems low
>>>
>>> Thanks
>>> -Khem
>>>
>>>>
>>
>> Personally I'm in favour of merging into head. That way it gets
>> accepted easier and faster.
>>
> 
> Agreed, I am as well.  As the new libtool is opt-in, I don't see the harm,
> and it'll ensure that any issues which crop up with the compatibility get
> fixed asap.

Yeah, let's get this in!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMsEXlMkyGM64RGpERAsjyAKCc6eHVMBOfE27SW20BiCWvs7mdXACfYG6I
1zsti6PHxpCCOGHvqWBw4zI=
=4QWi
-----END PGP SIGNATURE-----



