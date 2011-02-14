Received: from 7.26.mail-out.ovh.net ([46.105.40.147] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pp24P-0001f5-Fw
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:18:41 +0100
Received: (qmail 8257 invoked by uid 503); 14 Feb 2011 15:45:15 -0000
Received: from b9.ovh.net (HELO mail611.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 14 Feb 2011 15:45:15 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 Feb 2011 18:17:34 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 14 Feb 2011 18:17:32 +0200
Message-ID: <4D59559C.4010301@eukrea.com>
Date: Mon, 14 Feb 2011 17:17:32 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
	<AANLkTi=XjCgstGxtHd2jTmp5Kmm8wyQzOjJrxnnAhJU9@mail.gmail.com>
In-Reply-To: <AANLkTi=XjCgstGxtHd2jTmp5Kmm8wyQzOjJrxnnAhJU9@mail.gmail.com>
X-Ovh-Tracer-Id: 6168805590944099657
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.500012/N
Subject: Re: [PATCH] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Mon, 14 Feb 2011 17:18:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/02/2011 16:58, Otavio Salvador wrote:
> On Sun, Feb 13, 2011 at 14:08, Filip Zyzniewski
> <filip.zyzniewski@gmail.com>  wrote:
>> The whole reposotiry is about 24MB in size and it's rarely needed
>> whole. It is now splitted into bus specific subpackages (and some
>> device-specific for devices on a bus like SPI or SBUS) all depended
>> on by the linux-firmware package.
>
> I agree that this ought to be split but I think that it should be done
> by vendor:
> realtek, ralink and so on.
>
also there is an other version of this recipe in
recipes/firmwares/linux-firmware.inc
which is already splitted in small packages for some firmware such as :
firmware-atheros-ar9271.bb
firmware-marvell-sd8688_10.38.1-p25.bb

Eric


