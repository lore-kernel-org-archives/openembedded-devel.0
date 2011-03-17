Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Q0EZ3-0007yd-Ql
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 15:52:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 905FCA48FB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 14:50:52 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Bw0Vr6ih4e9y
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 14:50:51 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id B0866A48F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 14:50:51 +0000 (GMT)
Message-ID: <4D822021.6030808@xora.org.uk>
Date: Thu, 17 Mar 2011 14:52:17 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>	<1300180117.2522.14.camel@eha>	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha>
In-Reply-To: <1300373028.2468.8.camel@eha>
X-Enigmail-Version: 1.1.1
Subject: Re: Eliminating dependency race-conditions (was Re: [PATCH] net-snmp: disable libnl use)
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
X-List-Received-Date: Thu, 17 Mar 2011 14:52:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 17/03/2011 14:43, Esben Haabendal wrote:
> On Thu, 2011-03-17 at 11:18 +0000, Phil Blundell wrote:
>>> I am still very much interested in discussing how to move this
>>> technology from OE-lite to OE, but as it impacts all recipe metadata
>>> (build dependencies has to be redefined), OE community at a large
>> really
>>> needs to value the benefits of solving this problem.
>> The benefits of solving the problem are clearly very great, but I
>> don't think OE itself is really in a position to embrace a "big bang"
>> kind of change which would require redefining all the build
>> dependencies.  I think we need to find a technological solution which
>> will work with our current DEPENDS scheme. 
> I know that this seems to be the general consensus in OE, but I do not
> agree with it.  Sometimes architectural work requires working out the
> details on a branch, and then when it is mostly done, do the "big bang"
> which will then not really be that "big" anymore, as most of the issues
> have been resolved.
>
> Is OE really in a position to permantly settle for something suboptimal
> in such a central area?
>
I would suggest a branch of oe-core is the ideal place to do this work.
It can be proved on oe-core then rolled out to meta-oe at a later date.

Graeme



