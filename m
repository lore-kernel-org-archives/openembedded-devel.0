Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PsATd-0000tm-CL
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 09:53:41 +0100
Received: (qmail 8489 invoked by uid 503); 23 Feb 2011 09:35:54 -0000
Received: from b9.ovh.net (HELO mail187.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 23 Feb 2011 09:35:53 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Feb 2011 10:52:20 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 23 Feb 2011 10:52:18 +0200
Message-ID: <4D64CAC1.8050100@eukrea.com>
Date: Wed, 23 Feb 2011 09:52:17 +0100
From: Eric Benard <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>	<1297709209-6602-1-git-send-email-filip.zyzniewski@gmail.com>	<ik29om$8m7$1@dough.gmane.org>
	<AANLkTimvzFij9bx0J8PbaWv1+_9TG4p4+vHPQH2DZnvV@mail.gmail.com>
In-Reply-To: <AANLkTimvzFij9bx0J8PbaWv1+_9TG4p4+vHPQH2DZnvV@mail.gmail.com>
X-Ovh-Tracer-Id: 14610240142889626953
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCHv2] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Wed, 23 Feb 2011 08:53:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Filip,

On 23/02/2011 08:12, Filip Zyzniewski wrote:
> On 2/23/11, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>
>> The wl12xx files need to go into /lib/firmware, not
>> /lib/firmware/ti-connectivity
>
> This layout is copied verbatim from the linux-firmware git repository.
> Maybe I'll just report it upstream?
>
I'm not sure the linux-firmare repo is intendeed to be used as is.
Original goal was just to collect the firmwares :
http://lwn.net/Articles/294308/

As already said before, there is an other version of this recipe in
recipes/firmwares/linux-firmware.inc
which is already splitted in small packages for some firmware such as :
firmware-atheros-ar9271.bb
firmware-marvell-sd8688_10.38.1-p25.bb

Eric


