Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id E511B60FDF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 14:56:54 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VKUno-0001sB-DG for openembedded-devel@lists.openembedded.org;
	Fri, 13 Sep 2013 16:56:56 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 16:56:56 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 16:56:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 13 Sep 2013 16:56:47 +0200
Message-ID: <l0v937$88j$1@ger.gmane.org>
References: <1379078574-23993-1-git-send-email-ml@communistcode.co.uk>
	<l0v6r0$a1c$1@ger.gmane.org> <52331FE8.7040401@communistcode.co.uk>
	<8899931.gqGXRCnTRZ@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
In-Reply-To: <8899931.gqGXRCnTRZ@helios>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-oe][PATCHv2] libsoc: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2013 14:56:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-09-13 16:53, Paul Eggleton schreef:
> On Friday 13 September 2013 15:23:36 Jack Mitchell wrote:
>> On 13/09/13 15:18, Koen Kooi wrote:
>>> Op 13-09-13 15:22, Jack Mitchell schreef:
>>>> From: Jack Mitchell <jack@embed.me.uk>
>>>> 
>>>> Signed-off-by: Jack Mitchell <jack@embed.me.uk> ---
>>>> 
>>>> Change from v1: added signed-off-by
>>>> 
>>>> meta-oe/recipes-support/libsoc/libsoc_0.3.bb | 18
>>>> ++++++++++++++++++ 1 file changed, 18 insertions(+) create mode
>>>> 100644 meta-oe/recipes-support/libsoc/libsoc_0.3.bb
>>>> 
>>>> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.3.bb 
>>>> b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb new file mode 100644
>>>> index 0000000..e91e152 --- /dev/null +++ 
>>>> b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb @@ -0,0 +1,18 @@
>>>> +SUMMARY = "libsoc is a C library for interfacing with common SoC
>>>> peripherals through generic kernel interfaces" +HOMEPAGE = 
>>>> "https://github.com/jackmitch/libsoc" + +LICENSE = "LGPLv2.1" 
>>>> +LIC_FILES_CHKSUM = 
>>>> "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5" + +inherit 
>>>> autotools + +DEPENDS = "libgcc"
>>> 
>>> Isn't that automatically implied with gcc-cross?
>> 
>> I wasn't sure, so I thought I would stick it in and see if anyone
>> piped up, I'll remove it in v3.
>> 
>> Also on that note I noticed that Apache2 also DEPENDS on libgcc, is
>> that also wrong?
> 
> I don't know anything about this particular recipe, but IIRC, apache
> complains if libgcc is not installed at runtime, and at least when I
> added that to the recipe it was not being installed otherwise.

But that's RDEPENDS, no?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSMyevMkyGM64RGpERAnlAAJ0aAfuIr7y4hfWWnFYZxDpO1PkEFQCfZ0Us
8RLlJNtHvW+K3PCXSPAsTFo=
=Wfci
-----END PGP SIGNATURE-----


