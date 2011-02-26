Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PtSca-0004gj-Nu
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 23:28:21 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PtSbE-0003Qn-Ar from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 14:26:52 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sat, 26 Feb 2011 14:26:52 -0800
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Sat, 26 Feb 2011 14:26:51 -0800
Message-ID: <4D697E1C.3060708@mentor.com>
Date: Sat, 26 Feb 2011 15:26:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1298742255-23389-1-git-send-email-ynezz@true.cz>	<1298745578.3818.7.camel@lenovo.internal.reciva.com>	<20110226185959.GC10042@ibawizard.net>
	<1298748041.3818.10.camel@lenovo.internal.reciva.com>
In-Reply-To: <1298748041.3818.10.camel@lenovo.internal.reciva.com>
X-OriginalArrivalTime: 26 Feb 2011 22:26:52.0152 (UTC)
	FILETIME=[44228F80:01CBD604]
Subject: Re: [PATCH 1/2] micro-uclibc: add xattr to distro features to fix build failure of libcap2
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
X-List-Received-Date: Sat, 26 Feb 2011 22:28:21 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 02/26/2011 12:20 PM, Phil Blundell wrote:
> On Sat, 2011-02-26 at 19:59 +0100, Petr Štetiar wrote:
>> Phil Blundell<philb@gnu.org>  [2011-02-26 18:39:38]:
>>
>>> On Sat, 2011-02-26 at 18:44 +0100, Petr Štetiar wrote:
>>>> cap_file.c:8:23: fatal error: sys/xattr.h: No such file or directory
>>>
>>> Are you really using POSIX.1e caps on micro?  If yes then I guess this
>>> is fine, though it would be interesting to know what the code size
>>> impact is.
>>
>> I don't use micro at all, I've just added it as another test target for
>> 2011.03 release and the build of console-image failed on libcap2 so I've tried
>> to fix it. That's all behind it.
>
> Which package in console-image depends on libcap2?  It might be worth
> exploring whether there is a way to avoid that dependency.

avahi brings in libcap2 now.  I suppose it's possible to make that xattr 
DISTRO_FEATURE spell that part out and update all of the distros.  But 
maybe that can wait until post release?

-- 
Tom Rini
Mentor Graphics Corporation


