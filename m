Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SL6c2-0000Ed-FF for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 07:42:30 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SL6Ss-0006yS-NG for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 07:33:02 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 07:33:02 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 07:33:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 Apr 2012 07:32:57 +0200
Message-ID: <jmqsdv$ic7$1@dough.gmane.org>
References: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
	<jmmst9$r5o$1@dough.gmane.org>
	<CAGiJk9e4vZoO1d1cCbh8Lq26m6h3M5rrOOe40CS1ov2VHqh9eQ@mail.gmail.com>
	<jmomha$co7$1@dough.gmane.org>
	<CAGiJk9fy3p550fUxadQUYmahhx4DVRYeEt_GDYgjBhMVpHzBMw@mail.gmail.com>
	<jmpg5o$52s$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <jmpg5o$52s$1@dough.gmane.org>
X-Enigmail-Version: 1.4
Subject: Re: [meta-kde] Test images (was: Re: [OE-core] RFC: Porting KDE Plasma Active (WIP))
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
X-List-Received-Date: Fri, 20 Apr 2012 05:42:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-04-12 18:57, Koen Kooi schreef:
> Op 19-04-12 16:03, Samuel Stirtzel schreef:
>> 2012/4/19 Koen Kooi <koen@dominion.thruhere.net>: Op 19-04-12 11:09, 
>> Samuel Stirtzel schreef:
>>>>>>> Feel free to comment on the images.
>>>>>> 
>>>>>> Giving them a spin now :)
>>>>> 
>>>>> Thanks.
>>>>> 
>>>>> Just to let you know: Yesterday I accidentally added "inherit 
>>>>> allarch" to kde-wallpapers, this will produce an error, I want
>>>>> to push my patch for this but Gitorious seems to be down.
> 
>> Gitorious is down a lot, which is (partly) why I switched away from
>> it.
> 
>>>>> Removing allarch from kde-wallpapers will do the trick.
> 
>> I'll update the repo in a minute. Some other things I ran into:
> 
>> * rasqal needs PARALLEL_MAKE = ""
> 
>>> Done, committed it to master.
>>> (68edc1551c703bd83a60aa05edb898a7bdfa9ff9 if anyone wants to
>>> cherry-pick)
> 
>> * soprano-native is needed for the onto2something binary, I did 'yum 
>> install soprano' instead
> 
>>> Which recipe is failing with the soprano-native error? The 
>>> kdelibs4-native recipe should only optionally depend on it.
> 
> I forgot which recipe, sorry. I do managed to build the images after a
> few tries. There were some more PARALLEL_MAKE and/or missing DEPENDS
> related problems, but rerunning the build a few times made those go
> away. The buildhistory output: 
> https://github.com/Angstrom-distribution/buildhistory/commit/c4790bbe1534c8c536f6cacf509d93b14cf6050c

The
> 
binaries don't run, lots of missing symbols to SessionManagement, do I
need to build qt4-x11 differently (apart from the GLES changes I forgot)?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPkPUHAAoJEHZqAkdh1vT6dfcP/jJmlp/RlOMTuh6NTFe3Dv/3
r/TDi/vjlasQsI5PJ1e9dyLnJGvsUDXaAJBseTZWzWYJ2a9KTHIqVfuTiolvr8Jv
4cMfeKLvoCTBYDlaoTsS8R5aYiQ4TTgntRQRJpyAkitL348cGW867tbbvLg6K+IG
DVjDAZAf3hXg+DFHNnE99dxHCSAQg9ZizIcPre5VORhHlyGzJZi1yNuRm/KgiUIm
APBQbQuWd3JbREuOxLftMpARudYsi/+pINH5NQlDRJxkLeW4slT34rUhNF2zjWlR
XjRzmnADQLvQVN95x7hZiyy7yILhPfRKA6/o1H/bEAYPttPkVfxBfO/qXS67bRHB
857w/B/e+m3kVkYgVoarCuvdRZtL52t6QFXTPAEyhOFYdDi92ccHp3vZHzlMFeuv
9Whv9VRZnSLyk7Y3BBeSqRZ0pROl3XoTxHBzmYe5DJdKNAlTxJ6FeDjdQhO1p9bM
Douyg8QeS+Ai5C/vtfWjFn0Kz8z0z/yYXjqM1gLxtTvU8tXwpOpvDXe1yzMiWB1v
XN1IUjCDq5FEg4lnHwxwf5HpQehCYCmoTAx3Gieq6cqrpmqYLBH79gXvr2cjB3W+
eDwtCGK8o+oNCm/3y3c1avfV3QHrVJNx65n2f7k8AhemPd0tzg1TainmVNyJjt9M
zK3ctXBv59B2BUnAFLxc
=m4Hh
-----END PGP SIGNATURE-----



