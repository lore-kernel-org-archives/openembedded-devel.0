Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PmuoK-0005ft-Ri
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 22:09:21 +0100
Received: (qmail 8788 invoked by uid 503); 8 Feb 2011 21:11:35 -0000
Received: from b6.ovh.net (HELO mail402.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 8 Feb 2011 21:11:35 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 8 Feb 2011 23:08:19 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 8 Feb 2011 23:08:18 +0200
Message-ID: <4D51B0C1.6010505@eukrea.com>
Date: Tue, 08 Feb 2011 22:08:17 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>	<4D517D6C.3070604@mentor.com>
	<iis1mg$tj9$1@dough.gmane.org>
In-Reply-To: <iis1mg$tj9$1@dough.gmane.org>
X-Ovh-Tracer-Id: 12736742696319954249
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Tue, 08 Feb 2011 21:09:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Koen,

On 08/02/2011 19:23, Koen Kooi wrote:
> On 08-02-11 18:29, Tom Rini wrote:
>> On 02/07/2011 03:13 PM, Filip Zyzniewski wrote:
>>> This reduces amount of tasks for bootstrap-image from around 3400 to
>>> around 1600 for jlime.
>>>
>>> Signed-off-by: Filip Zyzniewski<filip.zyzniewski@gmail.com>
>>
>> Can some of the other distro folks chime in here?
>
> Yeah, this patch is wrong, since task-base is supposed to drag in bt and
> wifi when it's available which includes usb, pci, serial, etc.
>
what would be the correct way to disable inclusion of bt & wifi in the image ?

Thanks,
Eric


