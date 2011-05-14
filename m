Received: from 1.26.mail-out.ovh.net ([46.105.43.121] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QLM5l-0002D6-9d
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 23:09:42 +0200
Received: (qmail 7645 invoked by uid 503); 14 May 2011 16:32:53 -0000
Received: from b6.ovh.net (HELO mail426.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 14 May 2011 16:32:53 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 May 2011 19:06:26 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 14 May 2011 19:06:25 +0200
Message-ID: <4DCEB690.1070400@eukrea.com>
Date: Sat, 14 May 2011 19:06:24 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: pgsellmann@portner-elektronik.at
References: <201104291145.05479.pgsellmann@portner-elektronik.at>
In-Reply-To: <201104291145.05479.pgsellmann@portner-elektronik.at>
X-Ovh-Tracer-Id: 13155295988408626596
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
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
X-List-Received-Date: Sat, 14 May 2011 21:09:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peter,

On 29/04/2011 11:45, Peter Gsellmann wrote:
> All prototypes hardware rev 1 are drawn back
> so default should be rev 2
>
> Signed-off-by: Peter Gsellmann<pgsellmann@portner-elektronik.at>
> ---
>   recipes/linux/linux-2.6.38/pcontrolg20/defconfig   | 1761 ++++++++++++++++++++
>   .../pcontrolg20/pcontrolg20_2.6.38.patch           |  235 +++
>   recipes/linux/linux_2.6.38.bb                      |    2 +
>   3 files changed, 1998 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/linux/linux-2.6.38/pcontrolg20/defconfig
>   create mode 100644 recipes/linux/linux-2.6.38/pcontrolg20/pcontrolg20_2.6.38.patch
>
I applied this patch and tried to build the kernel but it seems there is no 
machine definition for pcontrolg20 : can you please resend a patch serie to 
add the kernel support and the machine conf file.

Thanks
Eric


