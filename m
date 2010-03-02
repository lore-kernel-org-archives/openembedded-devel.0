Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmZGK-0000NY-4V for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 22:04:21 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmZDa-0006jW-B3 for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 22:01:26 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 22:01:26 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 22:01:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 02 Mar 2010 22:01:11 +0100
Message-ID: <hmjuan$9v8$1@dough.gmane.org>
References: <E1Nm0HI-0004Qt-Pn@melo.openembedded.org>	<d1b08f941003011337i15e21dcx340cef502c2ea151@mail.gmail.com>	<201003012255.35738.holger+oe@freyther.de>	<hmivei$h8j$2@dough.gmane.org>
	<20100302204327.GI3206@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <20100302204327.GI3206@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Koen Kooi : angstrom: sync pango and pango-native versions
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
X-List-Received-Date: Tue, 02 Mar 2010 21:04:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-03-10 21:43, Martin Jansa wrote:
> On Tue, Mar 02, 2010 at 01:14:10PM +0100, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 01-03-10 22:55, Holger Hans Peter Freyther wrote:
>>> On Monday 01 March 2010 22:37:23 Andrea Adami wrote:
>>>> Thx, but after this patch I see
>>>>
>>>> NOTE: preferred version 1.24.4 of pango-native not available (for item
>>>> pango-module-basic-x)
>>>> NOTE: preferred version 1.24.4 of pango-native not available (for item
>>>> pango-module-basic-fc)
>>>> NOTE: preferred version 1.24.4 of pango-native not available (for item
>>>> pango-native)
>>>
>>> mea culpa, I asked koen to bump it.. and he blindly did. The fix should be to 
>>> add a pango-native of that version.
>>
>> Yes, my bad! I had an extension to pango.inc sitting in my tree that I
>> didn't commit yet, but it's in now:
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=f45f0d3495aba36aafc286d25f96d5bd9a82c7d9
>>
>> This commit also shows that using BBCLASSEXTEND isn't so hard, more
>> people should try to convert their recipes to it instead of deleting them :)
>>
>> regards,
>>
>> Koen
> 
> Thanks Koen!
> 
> small issue:
> the same .inc is also used from
> pango-native_1.22.0.bb -> pango_1.22.0.bb -> pango.inc
> 
> So then it creates native-native and says
> NOTE: multiple providers are available for pango-native (pango-native,
> pango-native-native);
> NOTE: consider defining PREFERRED_PROVIDER_pango-native
> 
> I guess that git rm -r pango-native_1.22.0.bb pango-native-1.22.0
> is right sollution in this case but didn't checked it.

I was thinking of doing that, but didn't have the motivation to RFC it.
YOu have my ack to delete it :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLjXyXMkyGM64RGpERAhqFAJ9pjnXqAEch29GXzD9PSEG3aR+TowCaA80H
2IZrIux+V/OjqftQTmHWd8E=
=2F8v
-----END PGP SIGNATURE-----



