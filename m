Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PseNa-0003dc-NX
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 17:49:26 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PseMH-0005JE-Te from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 08:48:05 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 24 Feb 2011 08:48:05 -0800
Received: from [172.30.80.151] ([172.30.80.151]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 24 Feb 2011 09:48:04 -0700
Message-ID: <4D668BB8.1090707@mentor.com>
Date: Thu, 24 Feb 2011 09:47:52 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298337246-11794-1-git-send-email-tom_rini@mentor.com>	<1298337246-11794-2-git-send-email-tom_rini@mentor.com>	<AANLkTin-fKddL80Sn4m08AwayH4t0+EGmFMof72Rwueq@mail.gmail.com>	<20110224043707.GC17536@denix.org>
	<4D667FDF.30309@mentor.com>
In-Reply-To: <4D667FDF.30309@mentor.com>
X-OriginalArrivalTime: 24 Feb 2011 16:48:04.0732 (UTC)
	FILETIME=[9B38EBC0:01CBD442]
Subject: Re: [PATCH] bitbake.conf: Simplify TARGET_CPPFLAGS/LDFLAGS
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
X-List-Received-Date: Thu, 24 Feb 2011 16:49:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2011 08:57 AM, Tom Rini wrote:
> On 02/23/2011 09:37 PM, Denys Dmytriyenko wrote:
>> On Mon, Feb 21, 2011 at 10:21:12PM -0800, Khem Raj wrote:
>>> On Mon, Feb 21, 2011 at 5:14 PM, Tom Rini<tom_rini@mentor.com> wrote:
>>>> This is based on poky's ba2e1f4d933c37b372d6749d64614f2510ee9d7b, which
>>>> simplifies TARGET_CPPFLAGS (and thus CFLAGS) and TARGET_LDFLAGS
>>>> based on gcc any company having --sysroot
>>>>
>>>> Signed-off-by: Tom Rini<tom_rini@mentor.com>
>>>
>>> Acked-by:Khem Raj<raj.khem@gmail.com>
>>
>> Tom, Khem,
>>
>> This change seems to break external-toolchains, e.g. CodeSourcery
>> Lite, at
>> least 2009q1 (gcc-4.3 based)...
>>
>> I'm seeing issues like this in libxau:
>>
>> | ./include/X11/Xauth.h:48:31: error: X11/Xfuncproto.h: No such file
>> or directory
>> | ./include/X11/Xauth.h:49:27: error: X11/Xfuncs.h: No such file or
>> directory
>>
>> It cannot find standard X headers from OE sysroot.
>>
>> Do I need to pass an extra --sysroot to CSL? Any other pointers?
>
> I've never not had to set:
> TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
>
> And then clear it on native/etc. What's going on is that the CSL
> toolchain (and any other) was only finding stuff since we were spelling
> out where to look, and now we need to pass that information in again.

FWIW, poky has this already.

-- 
Tom Rini
Mentor Graphics Corporation


