Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QTKLh-0001ad-N7 for openembedded-devel@lists.openembedded.org;
	Sun, 05 Jun 2011 22:55:05 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QTKIW-00020q-Ky for openembedded-devel@lists.openembedded.org;
	Sun, 05 Jun 2011 22:51:48 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Jun 2011 22:51:48 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Jun 2011 22:51:48 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 05 Jun 2011 22:51:36 +0200
Message-ID: <isgq8o$iro$1@dough.gmane.org>
References: <rpvmu6ufrtrll1221ama53bi.1307302406927@email.android.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <rpvmu6ufrtrll1221ama53bi.1307302406927@email.android.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] ti-wifi-utils: install calibrator ini files to rootfs
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
X-List-Received-Date: Sun, 05 Jun 2011 20:55:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-06-11 21:33, Reizer, Eyal wrote:
> Ok, I will change it to /usr/share/ti-wifi-utils...

TO be more inline with the other recipes, /usr/share/ti/wifi-utils

regards,

Koen


> 
> Best regards,
> Eyal
> 
> Koen Kooi <koen@dominion.thruhere.net> wrote:
> 
> 
> On 05-06-11 17:32, Eyal Reizer wrote:
>> In order to perform wifi calibration the calibrator needs to be
>> provided as input with a reference NVS file that matches the wifi chip
>> and the radio mudule that is being used.
> 
>> This patch install these ini files to the root file system so they can
>> be used when performing the calibration.
> 
>> Signed-off-by: Eyal Reizer <eyalr@ti.com>
>> ---
>>  recipes/ti/ti-wifi-utils_git.bb |   13 ++++++++++++-
>>  1 files changed, 12 insertions(+), 1 deletions(-)
> 
>> diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-utils_git.bb
>> index 8d10051..d5e548b 100644
>> --- a/recipes/ti/ti-wifi-utils_git.bb
>> +++ b/recipes/ti/ti-wifi-utils_git.bb
>> @@ -3,7 +3,7 @@ LICENSE = "TI-BSD"
> 
>>  DEPENDS = "libnl"
> 
>> -PR ="r2"
>> +PR ="r3"
>>  PV ="0.0"
>>  PR_append = "+gitr${SRCPV}"
> 
>> @@ -17,5 +17,16 @@ CFLAGS += " -DCONFIG_LIBNL20"
> 
>>  do_install() {
>>       install -d ${D}${bindir}
>> +     install -d ${D}${bindir}/ti-wifi-utils/ini_files/127x
>> +     install -d ${D}${bindir}/ti-wifi-utils/ini_files/128x
> 
> Ini files belong somewhere in /usr/share or maybe /etc, but not in /usr/bin.
> 
> regards,
> 
> Koen

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN6+xYMkyGM64RGpERAhXWAJ9KmVP1jKAVlRzV5KYeEbz3ZHFx7QCfa/xu
yD3VtkItpl2cu4UtY4c9X2Q=
=vcmC
-----END PGP SIGNATURE-----



