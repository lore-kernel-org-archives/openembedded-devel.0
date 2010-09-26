Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OzyVc-0007OU-8m
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 23:11:44 +0200
Received: (qmail 14007 invoked by uid 503); 26 Sep 2010 21:36:27 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 26 Sep 2010 21:36:26 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Sep 2010 23:11:34 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 26 Sep 2010 23:11:34 +0200
Message-ID: <4C9FB705.8040003@eukrea.com>
Date: Sun, 26 Sep 2010 23:11:33 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285365372-13498-1-git-send-email-iwamatsu@nigauri.org>	<AANLkTi=hAYRVMX9xNsPXXiuDC3536An1jX_tFmP1PLf3@mail.gmail.com>
	<AANLkTik=25UpZruyMGJ4LMm6Dd=d6p5yvt4sLcD=EO1k@mail.gmail.com>
In-Reply-To: <AANLkTik=25UpZruyMGJ4LMm6Dd=d6p5yvt4sLcD=EO1k@mail.gmail.com>
X-Ovh-Tracer-Id: 13188228559286218057
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] machine/sh7785lcr: Add new machine for Renesas SH7785 reference board
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
X-List-Received-Date: Sun, 26 Sep 2010 21:11:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 26/09/2010 22:42, Nobuhiro Iwamatsu a écrit :
> 2010/9/25 Khem Raj<raj.khem@gmail.com>:
>> On Fri, Sep 24, 2010 at 2:56 PM, Nobuhiro Iwamatsu<iwamatsu@nigauri.org>  wrote:
>>> --- a/conf/machine/include/tune-sh4.inc
>>> +++ b/conf/machine/include/tune-sh4.inc
>>> @@ -1,3 +1,5 @@
>>> +# If you want to optimize to sh4a, you need to change
>>> +# from -m4 to m4a.
>>>   TARGET_CC_ARCH = "-ml -m4"
>>>   FEED_ARCH = "sh4"
>>>   BASE_PACKAGE_ARCH = "sh4"
>>
>> you could add another tune file for sh4a called
>> tune-sh4a.inc and include that for appropriate
>> machines. rest of patch looks good to me.
>
> I want to make optimization of m4 a default.
> The reason is because there is not compatibility in m4 and m4a.
> It is a memo for the person whom it wants to optimize in m4a that I
> wrote in tune-sh4.inc.
>
> I thought that I have had better take off a memo if confusion happened
> by this memo.
> How do you think?
>
As Khem said, it's better to have tune-sh4a.inc & tune-sh4.inc in the 
include directory which let the user the possibility to include the one 
he wants in his machine configuration file (without the need to modifiy 
the include file).

Eric


