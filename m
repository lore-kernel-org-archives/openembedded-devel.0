Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qz3fJ-00031T-DK for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 11:34:29 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qz3aa-00068P-0y for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 11:29:36 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 11:29:36 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 11:29:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 01 Sep 2011 11:29:21 +0200
Message-ID: <j3nj9h$skv$1@dough.gmane.org>
References: <1314812479-17337-1-git-send-email-tasskjapp@gmail.com>
	<1314866951.20962.4.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1314866951.20962.4.camel@mattotaupa>
X-Enigmail-Version: 1.3.1
Subject: Re: [PATCH v2] linux-omap_2.6.39: remove patch that prevented board from resuming from suspend.
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
X-List-Received-Date: Thu, 01 Sep 2011 09:34:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-09-11 10:48, Paul Menzel schreef:
> Dear Tasslehoff,
> 
> 
> Am Mittwoch, den 31.08.2011, 19:41 +0200 schrieb Tasslehoff Kjappfot:
>> From: Tasslehoff Kjappfot tasskjapp@gmail.com>
>> 
>> Running on a board similar to Beagleboard C3 (but without NAND) I could
>> not resume from suspend with the patch. The console output when
>> suspending was as expected, but neither console input nor a timer would
>> wake the board. Without the patch, everything works as it should.
>> 
>> Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
> 
> Tasslehoff thank you for sending this iteration (no full stop at the end 
> of the summary please next time) and thank you Koen for pushing this 
> [1].
> 
>> ---
> 
> Next time, please add below the »---« what you changed in v2 or other 
> iterations.
> 
>> recipes/linux/linux-omap_2.6.39.bb |    1 - 1 files changed, 0
>> insertions(+), 1 deletions(-)
>> 
>> diff --git a/recipes/linux/linux-omap_2.6.39.bb
>> b/recipes/linux/linux-omap_2.6.39.bb index 8370e58..3880aa1 100644 ---
>> a/recipes/linux/linux-omap_2.6.39.bb +++
>> b/recipes/linux/linux-omap_2.6.39.bb @@ -27,7 +27,6 @@ SRC_URI_append =
>> " \ file://sakoman/0010-Revert-omap2_mcspi-Flush-posted-writes.patch \ 
>> file://sakoman/0011-Revert-omap_hsmmc-improve-interrupt-synchronisation.patch
>> \ 
>> file://sakoman/0012-Don-t-turn-SDIO-cards-off-to-save-power.-Doing-so-wi.patch
>> \ -
>> file://sakoman/0013-Enable-the-use-of-SDIO-card-interrupts.patch \ 
>> file://sakoman/0014-soc-codecs-Enable-audio-capture-by-default-for-twl40.patch
>> \ 
>> file://sakoman/0015-soc-codecs-twl4030-Turn-on-mic-bias-by-default.patch
>> \ file://sakoman/0016-RTC-add-support-for-backup-battery-recharge.patch
>> \
> 
> Koen, do you know why that patch breaks resume? I guess when applying 
> those you had tested suspend and resume and it worked for you. Maybe we 
> should contact the patch author [2]?

I stopped testing suspend/resume when dynamic ticks become good enough to
use, which was a few years ago :)

On a more serious note, s/r had never worked on omap3 when using usb
devices, only recently it started working (.37-ish) on mainline kernels with
the right defconfig. So I was suprised that Tasslehoff reported it to work
at all!

But for omap2+: take a serious look at dyntick and cpuidle, it isn't hard to
make it idle to suspend like powerlevels without actually suspending.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOX1BxMkyGM64RGpERAuf0AKCwDXiPOkUSXLqwZfF+/SAhbOH8PgCfbIXl
1fpTUc9QpGodmuHGd7VsYW8=
=LgCa
-----END PGP SIGNATURE-----



