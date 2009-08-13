Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MbYf6-0000ph-D3 for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 13:40:05 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MbYP4-0007DC-DX for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 11:23:30 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 11:23:30 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 11:23:30 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 13 Aug 2009 13:23:16 +0200
Message-ID: <h60t34$5kl$1@ger.gmane.org>
References: <4A83BD15.7070006@atmel.com> <h60je5$992$1@ger.gmane.org>
	<4A83E5FC.2020002@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <4A83E5FC.2020002@atmel.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Ideas for scripts, to save work, when building several boards
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
X-List-Received-Date: Thu, 13 Aug 2009 11:40:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-09 12:07, Ulf Samuelsson wrote:
> Koen Kooi skrev:
>> On 13-08-09 09:13, Ulf Samuelsson wrote:
>>> Since I will need to test multiple boards,
>>> I decided to write some scripts which I will
>>> check in later today in origin/ulf/linux-2.6.30.2
>>>
>>> I generated a "MAKEALL" script which will
>>> source a file "board_list.sh" with board build commands
>>>
>>> <SOF>
>>> build_board    sam9263dfc    x11-gpe-image
>>> build_board    sam9g45ek    opie-image
>>> build_board    sam9g10df    x11-gpe-image
>>> build_board    sam9g20dfc    console-image
>>> build_board    sam9260dfc    console-image
>>> build_board    sam9261df    x11-image
>>> build_board    sam9xedfc    console-image
>>> <EOF>
>>
>> You do know that you can do that with MACHINE=foo bitbake bar, right?
>>
>
> Didn't try that.
> I assume this means that the cross compiler is not rebuilt,

Unless you poked at the gcc recipes, no, it won't get rebuilt.

> Is the root fs assembled from ipks then?

if you use rootfs_ipk.bbclass, yes.

Note that the official angstrom buildguide has mentioned that for years: 
http://www.angstrom-distribution.org/building-angstrom

regards,

Koen



