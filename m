Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1POrAx-0001R1-Va for openembedded-devel@lists.openembedded.org;
	Sat, 04 Dec 2010 13:25:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1POr9Z-00035X-CX for openembedded-devel@lists.openembedded.org;
	Sat, 04 Dec 2010 13:23:49 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Dec 2010 13:23:49 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Dec 2010 13:23:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 04 Dec 2010 13:23:37 +0100
Message-ID: <iddbs9$ufk$1@dough.gmane.org>
References: <1291390869-14422-1-git-send-email-m-watkins@ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F080329CC1EDC@dlee06.ent.ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080329CC1EDC@dlee06.ent.ti.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 6/6] defconfig: Add omapl138 defconfig file
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
X-List-Received-Date: Sat, 04 Dec 2010 12:25:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-12-10 20:43, Maupin, Chase wrote:
> My main comment here is that these patches might be better in a different order.  Currently if they were applied one at a time they would fail because of the dependency order.  I would suggest re-ordering the existing patches into the following order:
> 
> 0005
> 0006
> 0004
> 0003
> 0002
> 0001
> 
> Sorry that I didn't notice this the first time I looked at these patches.

I applied them as 6,5,4,3,2,1 to get the defconfig change in before the
PR bump.

> 
>> -----Original Message-----
>> From: Melissa Watkins [mailto:mwatkins.ti@gmail.com]
>> Sent: Friday, December 03, 2010 9:41 AM
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Watkins, Melissa; Maupin, Chase
>> Subject: [PATCH 6/6] defconfig: Add omapl138 defconfig file
>>
>> * Add defconfig file for omapl138 machines
>>
>> Signed-off-by: Melissa Watkins <m-watkins@ti.com>
>> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>> ---
>>  recipes/linux/linux-davinci/omapl138/defconfig |    8 +++++++-
>>  1 files changed, 7 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/linux/linux-davinci/omapl138/defconfig
>> b/recipes/linux/linux-davinci/omapl138/defconfig
>> index 8462139..ad52484 100644
>> --- a/recipes/linux/linux-davinci/omapl138/defconfig
>> +++ b/recipes/linux/linux-davinci/omapl138/defconfig
>> @@ -1383,6 +1383,7 @@ CONFIG_USB_MUSB_HDRC=y
>>  CONFIG_USB_MUSB_SOC=y
>>  CONFIG_USB_MUSB_HOST=y
>>  # CONFIG_USB_MUSB_PERIPHERAL is not set
>> +# CONFIG_USB_MUSB_DUAL_ROLE is not set
>>  # CONFIG_USB_MUSB_OTG is not set
>>  CONFIG_USB_MUSB_HDRC_HCD=y
>>  # CONFIG_MUSB_PIO_ONLY is not set
>> @@ -1557,7 +1558,12 @@ CONFIG_RTC_INTF_DEV=y
>>  CONFIG_RTC_DRV_OMAP=y
>>  # CONFIG_DMADEVICES is not set
>>  # CONFIG_AUXDISPLAY is not set
>> -# CONFIG_UIO is not set
>> +CONFIG_UIO=y
>> +# CONFIG_UIO_PDRV is not set
>> +# CONFIG_UIO_PDRV_GENIRQ is not set
>> +# CONFIG_UIO_SMX is not set
>> +# CONFIG_UIO_SERCOS3 is not set
>> +CONFIG_UIO_PRUSS=m
>>
>>  #
>>  # TI VLYNQ
>> --
>> 1.7.0.4

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM+jLJMkyGM64RGpERAjdCAJ98STnzUtWkWjV82UtD4nXdKz1lxACgmLST
jDoGC7W25MXAFUfua+di3QU=
=QEQv
-----END PGP SIGNATURE-----



