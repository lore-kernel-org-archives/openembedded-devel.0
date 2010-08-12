Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OjNSx-0006AU-5W
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 04:24:29 +0200
Received: by wwb34 with SMTP id 34so761540wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 19:24:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.17.135 with SMTP id j7mr6803826wej.97.1281579850457; Wed, 
	11 Aug 2010 19:24:10 -0700 (PDT)
Received: by 10.216.15.79 with HTTP; Wed, 11 Aug 2010 19:24:10 -0700 (PDT)
In-Reply-To: <i3uuur$q8t$2@dough.gmane.org>
References: <1281555209-3993-1-git-send-email-jkridner@beagleboard.org>
	<i3uuur$q8t$2@dough.gmane.org>
Date: Wed, 11 Aug 2010 22:24:10 -0400
Message-ID: <AANLkTi=MPQ=HBjRSWNWdDruEwHPjK6RXX51xCj2a4XDi@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] u-boot: beagleboard: adjusted clocks to match PSP
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
X-List-Received-Date: Thu, 12 Aug 2010 02:24:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 11, 2010 at 3:50 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 11-08-10 21:33, Jason Kridner wrote:
>>
>> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
>> ---
>> =A0...3-clocks-update-clock-setup-for-36XX-37XX.patch | =A0 =A04 ++--
>> =A0recipes/u-boot/u-boot_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A02 +-
>> =A02 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes/u-boot/u-boot-git/beagleboard/0019-OMAP3-clocks-upd=
ate-clock-setup-for-36XX-37XX.patch b/recipes/u-boot/u-boot-git/beagleboard=
/0019-OMAP3-clocks-update-clock-setup-for-36XX-37XX.patch
>> index 03da8ce..e5dbec6 100644
>> --- a/recipes/u-boot/u-boot-git/beagleboard/0019-OMAP3-clocks-update-clo=
ck-setup-for-36XX-37XX.patch
>> +++ b/recipes/u-boot/u-boot-git/beagleboard/0019-OMAP3-clocks-update-clo=
ck-setup-for-36XX-37XX.patch
>> @@ -726,9 +726,9 @@ index 73063ec..2045e4e 100644
>> =A0+per_36x_dpll_param:
>> =A0+/* =A0 =A0SYSCLK =A0 =A0M =A0 =A0 =A0 N =A0 =A0 =A0M2 =A0 =A0 =A0M3 =
=A0 =A0 =A0M4 =A0 =A0 M5 =A0 =A0 =A0M6 =A0 =A0 =A0m2DIV */
>> =A0+.word 12000, =A0 =A0360, =A0 =A04, =A0 =A0 9, =A0 =A0 =A016, =A0 =A0=
 5, =A0 =A0 4, =A0 =A0 =A03, =A0 =A0 =A01
>> -+.word 13000, =A0 1728, =A0 12, =A0 =A0 9, =A0 =A0 =A032, =A0 =A0 18, =
=A0 =A08, =A0 =A0 =A06, =A0 =A0 =A02
>> ++.word 13000, =A0 =A0864, =A0 12, =A0 =A0 9, =A0 =A0 =A016, =A0 =A0 9, =
=A0 =A0 4, =A0 =A0 =A03, =A0 =A0 =A01
>> =A0+.word 19200, =A0 =A0360, =A0 =A07, =A0 =A0 9, =A0 =A0 =A016, =A0 =A0=
 5, =A0 =A0 4, =A0 =A0 =A03, =A0 =A0 =A01
>> -+.word 26000, =A0 1728, =A0 12, =A0 =A0 9, =A0 =A0 =A032, =A0 =A0 18, =
=A0 =A08, =A0 =A0 =A06, =A0 =A0 =A02
>> ++.word 26000, =A0 =A0432, =A0 12, =A0 =A0 9, =A0 =A0 =A016, =A0 =A0 9, =
=A0 =A0 4, =A0 =A0 =A03, =A0 =A0 =A01
>> =A0+.word 38400, =A0 =A0360, =A0 15, =A0 =A0 9, =A0 =A0 =A016, =A0 =A0 5=
, =A0 =A0 4, =A0 =A0 =A03, =A0 =A0 =A01
>> =A0+
>
> Are those actually correct? Last time I looked at that bit Sakomans code
> was cleaner and better. Dunno if the PSP tree has changed to fix that.

They work for getting the S-Video and DVI displays working in u-boot
for xM testing.  It could be that the right thing is to fix some other
values, but this is what I've got.


