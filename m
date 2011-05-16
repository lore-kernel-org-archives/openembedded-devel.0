Received: from 6.26.mail-out.ovh.net ([46.105.35.144] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QLvCZ-0003TL-OJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 12:39:03 +0200
Received: (qmail 31303 invoked by uid 503); 16 May 2011 09:55:59 -0000
Received: from b6.ovh.net (HELO mail94.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 16 May 2011 09:55:59 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 May 2011 12:29:34 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 May 2011 12:29:32 +0200
Message-ID: <4DD0FC8C.4040104@eukrea.com>
Date: Mon, 16 May 2011 12:29:32 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: pgsellmann@portner-elektronik.at
References: <201104291145.05479.pgsellmann@portner-elektronik.at>	<4DCEB690.1070400@eukrea.com>
	<201105161155.05490.pgsellmann@portner-elektronik.at>
In-Reply-To: <201105161155.05490.pgsellmann@portner-elektronik.at>
X-Ovh-Tracer-Id: 18197920195259051428
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux_2.6.38: update support for PcontrolG20 HW rev 2
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
X-List-Received-Date: Mon, 16 May 2011 10:39:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Peter,

On 16/05/2011 11:55, Peter Gsellmann wrote:
> Am Samstag 14 Mai 2011, 19:06:24 schrieb Eric Bénard:
>> On 29/04/2011 11:45, Peter Gsellmann wrote:
>>> All prototypes hardware rev 1 are drawn back
>>> so default should be rev 2
>>>
>>> Signed-off-by: Peter Gsellmann<pgsellmann@portner-elektronik.at>
>>> ---
>>>    recipes/linux/linux-2.6.38/pcontrolg20/defconfig   | 1761 ++++++++++++++++++++
>>>    .../pcontrolg20/pcontrolg20_2.6.38.patch           |  235 +++
>>>    recipes/linux/linux_2.6.38.bb                      |    2 +
>>>    3 files changed, 1998 insertions(+), 0 deletions(-)
>>>    create mode 100644 recipes/linux/linux-2.6.38/pcontrolg20/defconfig
>>>    create mode 100644 recipes/linux/linux-2.6.38/pcontrolg20/pcontrolg20_2.6.38.patch
>>>
>> I applied this patch and tried to build the kernel but it seems there is no
>> machine definition for pcontrolg20 : can you please resend a patch serie to
>> add the kernel support and the machine conf file.
> the machine configuration for pcontrolg20 is still not in a stable state:
> At least the kernel patch is stable, but for the at91bootstrap i have made changes for lowlevel initialization and memory detection which i have to bring in sync with mainline; right now my at91bootstrap patch looks ugly and would be rejected deservedly.
> Same is for U-boot. I patched a specific git-revision with a number of additional commands i need for factory testing.
> Even worse, the perpetual discussions about kernel relocation/decompression convinced me to evaluate alternatives like barebox.
>
good choice ;-)

> So my ToDo-list is:
> (*) commit kernel.patch
> * commit at91bootstrap.patch
> * commit U-boot or Barebox patches
> * commit conf/machine/pcontrolg20.conf
> * commit recipes/pcontrolg20-image.bb
>
> If its ok for you this would be the first commit.
>
> I could commit the pcontrolg20.conf also, but the entries for at91boosttrap and u-boot would be commented out.

yes a kernel recipe without the machine conf file can't be tested : please 
send the 2 patches (kernel + conf file), then you will be able to add entries 
for at91bootstrap & u-boot to the conf file later when you add the support for 
you board in their respective recipes.

thanks
Eric


