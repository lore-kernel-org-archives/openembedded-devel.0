Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1QhUeg-0007qR-Of
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 00:45:58 +0200
Received: by fxh10 with SMTP id 10so1849537fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:38:31 -0700 (PDT)
Received: by 10.223.74.139 with SMTP id u11mr3640184faj.23.1310683111272;
	Thu, 14 Jul 2011 15:38:31 -0700 (PDT)
Received: from mail-fx0-f51.google.com (mail-fx0-f51.google.com
	[209.85.161.51])
	by mx.google.com with ESMTPS id j19sm388414faa.17.2011.07.14.15.38.29
	(version=SSLv3 cipher=OTHER); Thu, 14 Jul 2011 15:38:30 -0700 (PDT)
Received: by fxh10 with SMTP id 10so1849497fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:38:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.205.80.141 with SMTP id zu13mr996555bkb.216.1310683108917;
	Thu, 14 Jul 2011 15:38:28 -0700 (PDT)
Received: by 10.204.102.139 with HTTP; Thu, 14 Jul 2011 15:38:28 -0700 (PDT)
In-Reply-To: <1310681982.20700.9.camel@mattotaupa>
References: <1310680981-2394-1-git-send-email-agnel.joel@gmail.com>
	<1310681982.20700.9.camel@mattotaupa>
Date: Thu, 14 Jul 2011 18:38:28 -0400
Message-ID: <CA+T6QPk_rF9y+mY4XOxdX8Ja6y4gNmA_AW3AtRjEdUQRL32OKA@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Cc: s-kipisz2@ti.com, joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>,
	jdk@ti.com, k-kooi@ti.com
Subject: Re: [PATCHi v2] linux-omap-psp: Added patch by Steve Sakoman to fix timeout errors
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
X-List-Received-Date: Thu, 14 Jul 2011 22:45:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2011 at 6:19 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Joel,
>
>
> Am Donnerstag, den 14.07.2011, 17:03 -0500 schrieb Joel A Fernandes:
>
> in my opinion the commit summary should be the following.
>
> Add patch to fix MMC errors due to timeouts
>
> The name of the author can go into the commit message.
>
>> This fixes MMC errors due to timeouts, and is borrowed from linux-omap-2=
.6.39 recipe (as noticed by Jason Kridner)
>
> Did somebody actually experience this problem or this this precaution?
> If the forme could you please add a link to the problem report?

The first link below this paragraph includes reference to this issue.
We've seen it on some of the BeagleBoard rev C5 boards being tested
before release on certain SD cards, but Joel was asked directly to
look at this issue rather than a post showing up on a mailing list.
Another reference to the issue, that Joel might want to include if he
does a revision, can be found at:
http://www.gossamer-threads.com/lists/maemo/users/64583.  A slightly
different fix was applied there, but the fundamental of increasing the
timeout is the same.

>
>> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
>> ---
>> Changes since earlier patch:
>> =A0* Fixed commit summary
>>
>> Some useful links shared by Jason:
>> http://www.mail-archive.com/linux-omap@vger.kernel.org/msg42214.html
>> http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/linux/li=
nux-omap-2.6.39/sakoman/0024-omap-mmc-Adjust-dto-to-eliminate-timeout-error=
s.patchRelevant links:
>
> At the end there is missing a line break.
>
>> The link to the patch in org.openembedded.dev:
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/li=
nux-omap-2.6.39/sakoman/0024-omap-mmc-Adjust-dto-to-eliminate-timeout-error=
s.patch?h=3Dorg.openembedded.dev
>
> I would like to see those information in the commit message.
>
>> =A0...mc-Adjust-dto-to-eliminate-timeout-errors.patch | =A0 22 +++++++++=
+++++++++++
>> =A0recipes/linux/linux-omap_2.6.32.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A01 +
>> =A02 files changed, 23 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/linux/linux-omap-2.6.32/0010-omap-mmc-Adju=
st-dto-to-eliminate-timeout-errors.patch
>>
>> diff --git a/recipes/linux/linux-omap-2.6.32/0010-omap-mmc-Adjust-dto-to=
-eliminate-timeout-errors.patch b/recipes/linux/linux-omap-2.6.32/0010-omap=
-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
>> new file mode 100644
>> index 0000000..ae5a7aa
>> --- /dev/null
>> +++ b/recipes/linux/linux-omap-2.6.32/0010-omap-mmc-Adjust-dto-to-elimin=
ate-timeout-errors.patch
>> @@ -0,0 +1,22 @@
>> +From 26a79f408bd41ad7b4a47f2683909d3fc1575eab Mon Sep 17 00:00:00 2001
>> +From: Steve Sakoman <steve@sakoman.com>
>> +Date: Wed, 12 Jan 2011 05:54:55 -0800
>> +Subject: [PATCH 24/31] omap: mmc: Adjust dto to eliminate timeout error=
s
>> +
>> +A number of SD card types were experiencing timeout errors. =A0This
>> +could also lead to data corruption in some cases.
>> +
>> +This fix proposed by Sukumar Ghoral of TI.
>> +---
>> +diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmm=
c.c
>> +index 9646a75..ef458d6 100644
>> +--- a/drivers/mmc/host/omap_hsmmc.c
>> ++++ b/drivers/mmc/host/omap_hsmmc.c
>> +@@ -1032,6 +1032,7 @@ static void set_data_timeout(struct omap_hsmmc_ho=
st *host,
>> + =A0 =A0 cycle_ns =3D 1000000000 / (clk_get_rate(host->fclk) / clkd);
>> + =A0 =A0 timeout =3D timeout_ns / cycle_ns;
>> + =A0 =A0 timeout +=3D timeout_clks;
>> ++ =A0 =A0timeout *=3D 2;
>> + =A0 =A0 if (timeout) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 while ((timeout & 0x80000000) =3D=3D 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dto +=3D 1;
>> diff --git a/recipes/linux/linux-omap_2.6.32.bb b/recipes/linux/linux-om=
ap_2.6.32.bb
>> index 348ec96..404387f 100644
>> --- a/recipes/linux/linux-omap_2.6.32.bb
>> +++ b/recipes/linux/linux-omap_2.6.32.bb
>> @@ -33,6 +33,7 @@ file://0005-ARM-OMAP-add-support-for-TCT-Zippy-to-Beag=
le-board.patch \
>> =A0file://0006-ARM-OMAP-Make-beagle-u-boot-partition-writable.patch \
>> =A0file://0007-ASoC-enable-audio-capture-by-default-for-twl4030.patch \
>> =A0file://0009-MTD-NAND-omap2-proper-fix-for-subpage-read-ECC-error.patc=
h \
>> +file://0010-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch \
>> =A0file://madc/0009-drivers-mfd-add-twl4030-madc-driver.patch \
>> =A0file://madc/0010-ARM-OMAP-Add-twl4030-madc-support-to-Overo.patch \
>> =A0file://madc/0011-ARM-OMAP-Add-twl4030-madc-support-to-Beagle.patch \
>
> Otherwise this looks good.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


