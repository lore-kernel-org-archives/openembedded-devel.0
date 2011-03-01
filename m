Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PuUJo-0005ec-QB
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 19:29:08 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PuUIQ-0003SL-11 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 10:27:42 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 1 Mar 2011 10:27:41 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Tue, 1 Mar 2011 10:27:41 -0800
Message-ID: <4D6D3A8A.10904@mentor.com>
Date: Tue, 1 Mar 2011 11:27:22 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1299001532-3260-1-git-send-email-GNUtoo@no-log.org>	<1299001532-3260-2-git-send-email-GNUtoo@no-log.org>
	<1299002339.23547.117.camel@phil-desktop>
In-Reply-To: <1299002339.23547.117.camel@phil-desktop>
X-OriginalArrivalTime: 01 Mar 2011 18:27:41.0671 (UTC)
	FILETIME=[59D22F70:01CBD83E]
Subject: Re: [PATCH] netbase and opkg: reorder init scripts to make networking come up at first boot
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
X-List-Received-Date: Tue, 01 Mar 2011 18:29:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2011 10:58 AM, Phil Blundell wrote:
> On Tue, 2011-03-01 at 18:45 +0100, Denis 'GNUtoo' Carikli wrote:
>> Without that fix, usb0 doesn't come up at first boot
>>    (tested on the bug machine, with Angstrom on a console-image).
>>
>> Signed-off-by: Denis 'GNUtoo' Carikli<GNUtoo@no-log.org>
>
> That sounds like it's just papering over some kind of problem in
> netbase.  What exactly stops usb0 from working with the previous
> arrangement?

Presumably having not configured the system.  We should try and look at 
moving opkg's configure up to be as early as possible

-- 
Tom Rini
Mentor Graphics Corporation


