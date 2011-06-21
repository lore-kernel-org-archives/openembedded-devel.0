Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QZ8bk-0007hW-ME
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2011 23:35:40 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QZ8YJ-0002G8-89 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2011 14:32:07 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 21 Jun 2011 14:26:52 -0700
Received: from [172.30.80.125] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 21 Jun 2011 14:32:06 -0700
Message-ID: <4E010DC1.1090600@mentor.com>
Date: Tue, 21 Jun 2011 14:31:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <201106202316.47662.schnitzeltony@gmx.de>
	<4DFFCE1D.1070507@mentor.com>
In-Reply-To: <4DFFCE1D.1070507@mentor.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 21 Jun 2011 21:26:52.0422 (UTC)
	FILETIME=[F0089A60:01CC3059]
Subject: Re: udev 171 caching working propely?
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
X-List-Received-Date: Tue, 21 Jun 2011 21:35:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/20/2011 03:47 PM, Tom Rini wrote:
> On 06/20/2011 02:16 PM, Andreas Mueller wrote:
>> Dear OE-folks,
>>
>> Working with lastest classic oe master and angstrom it seems udev caching is not 
>> working as expected. On *every* boot I get:
>>
>>> Remounting root file system...
>>> Caching udev devnodes
>>> Populating dev cachemv: can't rename '/dev/shm/uname': No such file or directory
>>
>> I don't know why this change came in but there was a change of storage location 
>> in Tom's commit few days ago [1]. To me it seems that
>>
>> 1. The files created by udev (init) get lost at remount so udev-cache (cache) is 
>> unable to find
>> 2. Since this error occures not only at first boot the recipe's 
>> pkg_postinst_udev_append() seems never being executed. To check I added a simple 
>> echo 'foo text' 
>> in this function but 'foo text' is not found in log of first boot.
>>
>> Suggestions welcome
> 
> Did udev change behaviors at some point then?  I've been using an older
> udev and didn't run into that problem.  I changed from /tmp to /dev/shm
> since we don't know that /tmp is writable at that point so we were
> instead getting errors there.  I wonder if we should just switch to
> re-creating the contents for that step?

I've gone with this change and some quick testing on a board.

-- 
Tom Rini
Mentor Graphics Corporation


