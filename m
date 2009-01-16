Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LNvri-0003UL-QJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jan 2009 22:04:30 +0100
Received: from gandalf.denix.org ([71.255.246.155]) by vms173003.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KDL00K1B0VO2K72@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	16 Jan 2009 14:57:26 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CE5C66B83B5; Fri,
	16 Jan 2009 15:57:23 -0500 (EST)
Date: Fri, 16 Jan 2009 15:57:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <gkqrif$bjr$1@ger.gmane.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090116205723.GB24280@denix.org>
MIME-version: 1.0
References: <20090111152021.47737188463@amethyst.openembedded.net>
	<20090111170659.GC17627@excalibur.local> <gkdanl$3ht$1@ger.gmane.org>
	<20090111175759.GE17627@excalibur.local>
	<20090111180741.GF17627@excalibur.local>
	<20090116202514.GA24280@denix.org> <gkqrif$bjr$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Koen Kooi : mtd-utils: add 1.2.0+git for ubifs-support
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
X-List-Received-Date: Fri, 16 Jan 2009 21:04:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 16, 2009 at 09:43:59PM +0100, Koen Kooi wrote:
> On 16-01-09 21:25, Denys Dmytriyenko wrote:
>> On Sun, Jan 11, 2009 at 07:07:41PM +0100, Stefan Schmidt wrote:
>>> Hello.
>>>
>>> On Sun, 2009-01-11 at 18:57, Stefan Schmidt wrote:
>>>> On Sun, 2009-01-11 at 18:36, Koen Kooi wrote:
>>>>> On 11-01-09 18:06, Stefan Schmidt wrote:
>>>> Now the install of efsprogs-libs fails:
>>>>
>>>> | making install-shlibs in lib/et
>>>> | make[1]: Entering directory
>>>> `/home/stefan/Projekte/OpenEmbedded/build/openmoko/tmp/work/armv4t-angstrom-linux-gnueabi/e2fsprogs-libs-1.39-r1/e2fsprogs-libs-1.39/lib/et'
>>>> |       MKINSTALLDIRS /usr/lib /usr/lib
>>>> | make[1]: MKINSTALLDIRS@: Command not found
>>>>
>>>> Do you use e2fsprogs-libs-1.42.2 or e2fsprogs-libs-1.39?
>>> With 1.42.2 it works fine here. Bumped preferred version for the om 
>>> stuff.
>>
>> First, the correct version is 1.41.2.
>>
>> Second, it looks like e2fsprogs-libs depends on gettext-native, otherwise 
>> it
>> gives this nasty error message during do_configure:
>>
>> configure.in:545: error: possibly undefined macro: AM_GNU_GETTEXT
>>
>> Not many people see this issue, as their gettext-native is built earlly 
>> on.
>
> The gettext thing has been fixed for a few days now.

Only gettext-native was fixed.

-- 
Denys


