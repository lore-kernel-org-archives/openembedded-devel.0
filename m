Received: from [212.227.126.179] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>) id 1K8rhv-0004yS-LS
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jun 2008 09:03:51 +0200
Received: from [10.0.0.9] (Mbd5c.m.pppool.de [89.49.189.92])
	by mrelayeu.kundenserver.de (node=mrelayeu5) with ESMTP (Nemesis)
	id 0ML25U-1K8rgB2ODU-0000iW; Wed, 18 Jun 2008 09:02:04 +0200
Message-ID: <4858B2EB.7080807@linuxdevelopment.de>
Date: Wed, 18 Jun 2008 09:02:03 +0200
From: =?ISO-8859-15?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.14 (X11/20080421)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Provags-ID: V01U2FsdGVkX19QHyzGGpX1F15kaYZxzqMOWXmOn2FCD+t/y8w
	ylMmtqchvzGi7tHFxhwx+KWBGPpmUSCCJ7eAbLUKW7upenZGdt
	ddHUkIzdXCsiUwULLPefm+ClmQlz1N+zNFokXZ1NDs=
Subject: glibc-intermediate: undefined reference to `__sync_fetch_and_add_4 -> FIXED
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 18 Jun 2008 07:03:51 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

I am trying to get good stable i686 images now for a long time.

Using .stable tree i tryed again yesterday and i got stuck on 
glibc-intermediate with that error
undefined reference to `__sync_fetch_and_add_4
i think that was an issue for me for a long time and  found that
conf/machine/include/tune-pentiumpro.inc uses still -mcpu switch

replacing this with
TARGET_CC_ARCH = "-march=i586" (maybe i should use i686 ?? )

fixed the issue and glibc builds. Also the rest now build like a charm !!

Cheers Robert



