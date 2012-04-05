Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SFwas-0002P9-63 for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2012 01:59:58 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SFwRx-0000RB-J2 for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2012 01:50:45 +0200
Received: from 50-1-53-18.dedicated.static.sonic.net ([50.1.53.18])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2012 01:50:45 +0200
Received: from koen by 50-1-53-18.dedicated.static.sonic.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2012 01:50:45 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 05 Apr 2012 16:50:32 -0700
Message-ID: <jllb47$64q$1@dough.gmane.org>
References: <20120404091720.4b743c5b@eb-e6520> <jli1uf$7nt$1@dough.gmane.org>
	<CABcZANngH2BSmSdBPkaPyJcG1RFuKLxc9DnJWhe7_b9xcSGjxA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 50-1-53-18.dedicated.static.sonic.net
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <CABcZANngH2BSmSdBPkaPyJcG1RFuKLxc9DnJWhe7_b9xcSGjxA@mail.gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: build meta-oe without systemd
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
X-List-Received-Date: Thu, 05 Apr 2012 23:59:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-04-12 11:59, Chris Larson schreef:
> On Wed, Apr 4, 2012 at 10:55 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 04-04-12 00:17, Eric Bénard schreef:
>>> Hi,
>>> 
>>> would that make sense to support systemd as a DISTRO_FEATURES ? That 
>>> would make builds using older udev (< 174) possible with meta-oe as
>>> this actually fails because of systemd.
>> 
>> We talked about this during the yocto bsp summit this week and I'm
>> working on a patchset to send as RFC later this month (post 1.2
>> release):
>> 
>> commit b98d45b1bc2d9cf9ba41629240e6c21f19ddceff Author: Koen Kooi
>> <koen@dominion.thruhere.net> Date:   Tue Apr 3 14:13:59 2012 -0700
>> 
>> meta-systemd: move over systemd from meta-oe
>> 
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> 
>> commit 59c57bd73d1f157dfada233df889852fdb4a692f Author: Koen Kooi
>> <koen@dominion.thruhere.net> Date:   Tue Apr 3 14:12:42 2012 -0700
>> 
>> meta-systemd: create layer
>> 
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> 
> Woot! We can stop using BBMASK to exclude bbappends from meta-oe when 
> this happens :)

I would appreciate people sending decent bugreports to the list, because it
is *NOT* supposed to break this way. The breakage needs to get fixed before
we merge it into oe-core.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPfi/FAAoJEHZqAkdh1vT6TaIP/Al2LXG5k5KpW7srf/MmWEai
IAg82uWC8DxHi6lDpQ/Kvu0+9YBCT2BuFEIRz3tP7j9wUPWj4/gWuYxy4XYKPW75
8NdA1espOopYIlzoBZNu2+aYICl62hcLsfrs9Xcj+RH4nNIoTyKVI/KkHLZMoVOw
hSHp0NxgbKbmnOgByJOzFpUcwQSeRAni2mfM4DNVQHce1174Hivqo6R07LSPIYCq
QlWtijgOKa6VyYQPpWdz/LdPyg43zq1Cw881r0XSdFCtNlolUunucs/Nwip8e4+t
DdmXASpNtnKThC5qkYPTrwQcCJuNk9n6Rijn2cZfZYvdkRqneDDbQpnyrj3kamwq
/OiETvi2Fl26eP8HpyacAHYV4JyoNFC1gtGM1XuDuSr5t0Aewi+kwSkPLFaV4JRm
TJ6d9EBWdBJhHzZhgj7zyI2SrCvn37/onRgGTV/HIOlkvpH/FEZ84Z1qJdj+h6xO
adWNvUaweOcKxefgT8vyP6FKx7ss+xQmyIqs2dtspD1DN4z51kH28GCaFkHYWN3u
tpIgVuM5zRI5sX7Oou1n8JzYvRd/e+k+r/hialylc5RD/+ck6j7qWuPtiKWoGU9p
xhpGVVxTHz0tlvCA1BfpCBd6xh9SosQJxPKinMRNeOeAOe94JJuKXoBVaX9pPAk9
FXgzzEi8N2WqQ7kv1vbn
=qwzz
-----END PGP SIGNATURE-----



