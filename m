Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OmWW1-0005LQ-EH
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 20:40:36 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OmWVb-0006hC-5r from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 11:40:07 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 20 Aug 2010 11:40:07 -0700
Received: from [172.30.80.198] ([172.30.80.198]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 20 Aug 2010 12:40:05 -0600
Message-ID: <4C6ECC03.3010904@mentor.com>
Date: Fri, 20 Aug 2010 11:40:03 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282313977-31805-1-git-send-email-fransmeulenbroeks@gmail.com>	<1282315196.13038.44.camel@mill.internal.reciva.com>	<AANLkTin4OrsobbFpGe-vaTfUCdbjAi=XF65VfJzYjrWm@mail.gmail.com>	<AANLkTi=T03QKXLOxx11BtG0=LcAGuzVqaqXx7yF+jTjV@mail.gmail.com>
	<AANLkTik2H4eiDukh5gYJyQEJ=sDv+hu5eajQLy6HAvVw@mail.gmail.com>
In-Reply-To: <AANLkTik2H4eiDukh5gYJyQEJ=sDv+hu5eajQLy6HAvVw@mail.gmail.com>
X-OriginalArrivalTime: 20 Aug 2010 18:40:06.0024 (UTC)
	FILETIME=[1BC3B080:01CB4097]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] native.bbclass: add (re)definitions for TARGET_SYS and HOST_SYS
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
X-List-Received-Date: Fri, 20 Aug 2010 18:40:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/8/20 Khem Raj <raj.khem@gmail.com>:
>> On Fri, Aug 20, 2010 at 8:34 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Fri, Aug 20, 2010 at 7:39 AM, Phil Blundell <philb@gnu.org> wrote:
>>>> On Fri, 2010-08-20 at 16:19 +0200, Frans Meulenbroeks wrote:
>>>>> @@ -23,6 +23,7 @@ TARGET_VENDOR = "${BUILD_VENDOR}"
>>>>>  TARGET_PREFIX = "${BUILD_PREFIX}"
>>>>>  TARGET_CC_ARCH = "${BUILD_CC_ARCH}"
>>>>>  TARGET_EXEEXT = "${BUILD_EXEEXT}"
>>>>> +TARGET_SYS = "${BUILD_SYS}"
>>> bitbake.conf already has
>>>
>>> TARGET_SYS=${TARGET_ARCH}${TARGET_VENDOR}${@['-' +
>>> bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d,
>>> 1) == ('' or 'custom')]}
>>>
>>> so once you have TARGET_OS set correctly this should work well for native too.
>>
>> hmm _local ok if you override TARGET_OS locally then lot of other
>> things will change
>> because now TARGET_OS will not be reset to whatever native wants. even if you
>> redefine TARGET_SYS may not be sufficient. Somehow if you can make
>> native.bbclass
>> to stubbornly ignore TARGET_OS override that might work.
>>
> I don't want to override TARGET_OS (and in fact this could be done in
> the machine definition).
> 
> The hardware I am working with is a powerpc system quite similar to
> calamari. It is an e500v2 which supports/needs spe.
> For calamari/angstrom things work by the grace of the following code
> in angstrom.eglibc.inc:

In essence, Angstrom needs the logic 
compute_os_portion_of_target_triplet() in sane-toolchain.inc has, for 
doing -gnuspe if it's going to support PPC more widely.

-- 
Tom Rini
Mentor Graphics Corporation


