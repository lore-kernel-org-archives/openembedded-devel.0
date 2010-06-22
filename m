Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OR8hl-0004Ye-LM for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 21:00:21 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OR8dH-0001E9-4j for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 20:55:39 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 20:55:39 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 20:55:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 22 Jun 2010 20:55:29 +0200
Message-ID: <hvr0v1$j72$1@dough.gmane.org>
References: <1276814379-13161-1-git-send-email-raj.khem@gmail.com>
	<1276814379-13161-2-git-send-email-raj.khem@gmail.com>	<AANLkTik6QLxTLQgYZaLpucQaU8etYax-invJna3D5kp_@mail.gmail.com>
	<AANLkTimOU6R6QDgQ2F2WtFRcYZy30T68TmhglN3OxIKZ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <AANLkTimOU6R6QDgQ2F2WtFRcYZy30T68TmhglN3OxIKZ@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] busybox_1.15.3.bb: Work around the gcc 4.5 ICE on thumb
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
X-List-Received-Date: Tue, 22 Jun 2010 19:00:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-06-10 16:31, Khem Raj wrote:
> On Mon, Jun 21, 2010 at 10:59 PM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>> Hello Khem,
>>
>> On Fri, Jun 18, 2010 at 12:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> +# gcc 4.5 has this bug on thumb
>>> +# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44557
>>> +# so add -fomit-frame-pointer
>>> +# this will be removed once the above bug is fixed.
>>> +
>>> +
>>> +CFLAGS_append = " -fomit-frame-pointer"
>>> +
>> Can we make this append conditional for ARM-only or even thumb-only?
> 
> Yes it should be better to restrict it to arm only I will do that.
> I dont think we have instruction set (e.g. thumb) in standard overrides
> may be it will help if we added such an override.

You do have a thumb override(s) if your machine includes tune-thumb.inc.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMIQchMkyGM64RGpERAqOxAKCDTlHB0FsQfJphVLy4GmrNcCtDiwCeP6ZM
FhCZjvjyhBJIUhRmc/5zcAg=
=1x01
-----END PGP SIGNATURE-----



