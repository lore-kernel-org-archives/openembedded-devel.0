Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (unknown [216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id E9D2F6B6FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 15:37:06 +0000 (UTC)
Received: (qmail 21340 invoked by uid 1003); 23 May 2014 15:37:07 -0000
Received: from unknown (HELO ?192.168.1.122?) (philip@opensdr.com@108.44.91.50)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	23 May 2014 15:37:07 -0000
Message-ID: <537F6B22.8070804@balister.org>
Date: Fri, 23 May 2014 11:37:06 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Richard Cagley <rcagley@gmail.com>
References: <CAN-NoH3tU4wfadSOS4F78DQrqar9sHz_3Ecf49ENEog=P06=MQ@mail.gmail.com>	<1584812.c16lcQ9U8e@peggleto-mobl5.ger.corp.intel.com>	<CAN-NoH0xVXhEAmSx6b8XMqchp4Q_qGe9onC3Gp6wT4HDJNW3xg@mail.gmail.com>
	<1521334.KE7mPuYoZb@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1521334.KE7mPuYoZb@peggleto-mobl5.ger.corp.intel.com>
X-Enigmail-Version: 1.6
Subject: Re: how to create a new layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 May 2014 15:37:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/23/2014 03:11 AM, Paul Eggleton wrote:
> On Thursday 22 May 2014 15:46:01 Richard Cagley wrote:
>>> One other thing to note - if there are overrides for the previous machine
>>> (e.g. in bbappends you may see _zedboard-zynq7) you should change
>>> these to _me so that they still apply.
>>
>> What is the threshold for making a new machine? That is, if I just
>> have a .bbappend file I want, that should just involve creating a new
>> layer and putting the bbappend file in the correct location. I
>> shouldn't have to change anything else correct?
>>
>> For instance, if I just want to change the kernel configuration with a
>> frag file I can put linux-xlnx_3.8.bbappedn in
>> meta-me/recipes-kernel/linux and that's all I need?
> 
> Yes, that should be all that is required - no need for your own machine 
> configuration in this case.
> 
>> I guess I'm just confused at what point I actually need a new machine.
> 
> If you want to change the global configuration for the machine substantially 
> from that in the original BSP, you may need to create your own machine 
> configuration; but for the exact same hardware as the original BSP supports I 
> would have thought that in most cases it would not be necessary.

Basically, I make a machine whenever I will have hardware specific
drivers, kernel configs, and device trees.

Philip


> 
> Cheers,
> Paul
> 

