Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LNvei-0003Aq-G7
	for openembedded-devel@openembedded.org; Fri, 16 Jan 2009 21:51:05 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LNvY2-0007D8-Jh
	for openembedded-devel@openembedded.org; Fri, 16 Jan 2009 20:44:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 16 Jan 2009 20:44:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 16 Jan 2009 20:44:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 16 Jan 2009 21:43:59 +0100
Message-ID: <gkqrif$bjr$1@ger.gmane.org>
References: <20090111152021.47737188463@amethyst.openembedded.net>	<20090111170659.GC17627@excalibur.local>
	<gkdanl$3ht$1@ger.gmane.org>	<20090111175759.GE17627@excalibur.local>	<20090111180741.GF17627@excalibur.local>
	<20090116202514.GA24280@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090109 Shredder/3.0b2pre
In-Reply-To: <20090116202514.GA24280@denix.org>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Fri, 16 Jan 2009 20:51:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-01-09 21:25, Denys Dmytriyenko wrote:
> On Sun, Jan 11, 2009 at 07:07:41PM +0100, Stefan Schmidt wrote:
>> Hello.
>>
>> On Sun, 2009-01-11 at 18:57, Stefan Schmidt wrote:
>>> On Sun, 2009-01-11 at 18:36, Koen Kooi wrote:
>>>> On 11-01-09 18:06, Stefan Schmidt wrote:
>>> Now the install of efsprogs-libs fails:
>>>
>>> | making install-shlibs in lib/et
>>> | make[1]: Entering directory
>>> `/home/stefan/Projekte/OpenEmbedded/build/openmoko/tmp/work/armv4t-angstrom-linux-gnueabi/e2fsprogs-libs-1.39-r1/e2fsprogs-libs-1.39/lib/et'
>>> |       MKINSTALLDIRS /usr/lib /usr/lib
>>> | make[1]: MKINSTALLDIRS@: Command not found
>>>
>>> Do you use e2fsprogs-libs-1.42.2 or e2fsprogs-libs-1.39?
>> With 1.42.2 it works fine here. Bumped preferred version for the om stuff.
>
> First, the correct version is 1.41.2.
>
> Second, it looks like e2fsprogs-libs depends on gettext-native, otherwise it
> gives this nasty error message during do_configure:
>
> configure.in:545: error: possibly undefined macro: AM_GNU_GETTEXT
>
> Not many people see this issue, as their gettext-native is built earlly on.
>

The gettext thing has been fixed for a few days now.

regards,

Koen



