Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PrhKL-0003xr-Vc
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 02:46:10 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PrhJ6-0004La-2b from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 17:44:52 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 21 Feb 2011 17:44:51 -0800
Received: from [172.30.80.151] ([172.30.80.151]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Feb 2011 18:44:51 -0700
Message-ID: <4D631509.30602@mentor.com>
Date: Mon, 21 Feb 2011 18:44:41 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298116419-18277-1-git-send-email-schnitzeltony@gmx.de>	<4D5FB38C.3010009@eukrea.com>
	<20110220012310.GC3451@sakrah.homelinux.org>
In-Reply-To: <20110220012310.GC3451@sakrah.homelinux.org>
X-OriginalArrivalTime: 22 Feb 2011 01:44:51.0137 (UTC)
	FILETIME=[187F1310:01CBD232]
Subject: Re: [PATCH] cross.bbclass: Fix many QA RPATH errors for distros preferring libtool-2.2
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
X-List-Received-Date: Tue, 22 Feb 2011 01:46:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/19/2011 06:23 PM, Khem Raj wrote:
> On (19/02/11 13:11), Eric Benard wrote:
>> Hi Andreas,
>>
>>> index 1a6d906..50c0f63 100644
>>> --- a/classes/cross.bbclass
>>> +++ b/classes/cross.bbclass
>>> @@ -75,6 +75,6 @@ sysroot_stage_all() {
>>>
>>>   #
>>>   # Cross .la files have more path issues we have to correct only for libtool<   2.4
>>> -SYSROOTEXTRALIBDIRSED_OLD = " -e \"/^libdir=/s,.*,libdir=${STAGING_DIR_TARGET}${target_libdir},g\" -e \"/^dependency_libs=/s,\([[:space:]']\)-L${STAGING_LIBDIR_NATIVE},,g\""
>>> +SYSROOTEXTRALIBDIRSED_OLD = " -e \"/^libdir=/s,.*,libdir=${target_libdir},g\" -e \"/^dependency_libs=/s,\([[:space:]']\)-L${STAGING_LIBDIR_NATIVE},,g\""
>>>
>>>   SYSROOTEXTRALIBDIRSED = "${@["${SYSROOTEXTRALIBDIRSED_OLD}",""][("${LIBTOOL_HAS_SYSROOT}" == "yes")]}"
>>
>> I was just finishing to test a similar fix and this seems to be the
>> right direction. Now testing your fix which is cleaner.
>
> Also try meta-toolchain targets

I'm kicking off a subset of my normal matrix with this change applied 
and hope to report back results in the morning (-0700).

-- 
Tom Rini
Mentor Graphics Corporation


