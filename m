Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id D520F609B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 13:00:53 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C2F6BF811DC; Fri, 22 May 2015 07:00:54 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4D754F811DC;
	Fri, 22 May 2015 07:00:54 -0600 (MDT)
Message-ID: <555F2896.60407@mlbassoc.com>
Date: Fri, 22 May 2015 07:01:10 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1432289074-1358-1-git-send-email-thomas.perrot@tupi.fr>	<555F11B1.4060600@mlbassoc.com>
	<CAGXeWgmdmiY0eVzpBKLbxp1QCZGSQ9HuF20PRD8ew9x96+fuug@mail.gmail.com>
In-Reply-To: <CAGXeWgmdmiY0eVzpBKLbxp1QCZGSQ9HuF20PRD8ew9x96+fuug@mail.gmail.com>
Subject: Re: [meta-raspberrypi][PATCH] If SERIAL_CONSOLE is already define by another layer, this value may not be good.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 May 2015 13:00:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-22 06:49, Thomas PERROT wrote:
> Hi Gary,
>
> I know it is incorrect to define this variable in a no machine layer
> but that can be possible.
>
> For example, by using the meta-systemd layer, the recipe
> systemd-serialgetty define SERIAL_CONSOLE, so when the raspberrypi
> machine layer is applied, the SERIAL_CONSOLE isn't changed and the
> value is invalid.
>
> I know that it's incorrect for the meta-systemd layer to define this
> variable, so I have submit a another patch to fix it.
>
> But I think replace "?=" by "=" in raspberrypi machine layer is more robust.
>
> I also send this patch on the rpi mailing list.

IMO, the best solution would be to replace it totally since SERIAL_CONSOLE
is deprecated by SERIAL_CONSOLES.  It should probably be:
   SERIAL_CONSOLES ?= "115200;ttyAMA0"

> On Fri, May 22, 2015 at 1:23 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> On 2015-05-22 04:04, Thomas Perrot wrote:
>>>
>>> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
>>> ---
>>>    conf/machine/include/rpi-base.inc |    2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/conf/machine/include/rpi-base.inc
>>> b/conf/machine/include/rpi-base.inc
>>> index a26803a..1dda207 100644
>>> --- a/conf/machine/include/rpi-base.inc
>>> +++ b/conf/machine/include/rpi-base.inc
>>> @@ -7,7 +7,7 @@ include conf/machine/include/soc-family.inc
>>>
>>>    IMAGE_FSTYPES ?= "tar.bz2 ext3 rpi-sdimg"
>>>
>>> -SERIAL_CONSOLE ?= "115200 ttyAMA0"
>>> +SERIAL_CONSOLE = "115200 ttyAMA0"
>>>
>>>    XSERVER = " \
>>>        xserver-xorg \
>>>
>>
>> Firstly, this should go to the RaspberryPi list (CC'd), not here.
>>
>> How can this value, which is only ever defined in this file
>> when using MACHINE=raspberrypi* be affected by another layer?
>> Is there is another layer which is defining this variable
>> outside of the MACHINE .conf files, then that layer is incorrect,
>> not this one.
>>
>> --
>> ------------------------------------------------------------
>> Gary Thomas                 |  Consulting for the
>> MLB Associates              |    Embedded world
>> ------------------------------------------------------------
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

