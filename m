Received: from [67.121.157.153] (helo=integratus.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <andy@protium.com>) id 1J46Vj-0002P0-GP
	for openembedded-devel@openembedded.org; Mon, 17 Dec 2007 04:19:20 +0100
Received: (qmail 3415 invoked from network); 17 Dec 2007 03:12:51 -0000
Received: from pool-71-116-93-90.snfcca.dsl-w.verizon.net (HELO
	?192.168.1.200?) (andy@71.116.93.90)
	by cuba.integratus.com with ESMTPA; 17 Dec 2007 03:12:51 -0000
Message-ID: <4765E992.2040805@protium.com>
Date: Sun, 16 Dec 2007 19:14:26 -0800
From: Andy Wilcox <andy@protium.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Renaming uboot-utils
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2007 03:19:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On Sat, 15 Dec 2007 14:14 "Leon Woestenberg" 
<leon.woestenberg@gmail.com> wrote:
> On Dec 14, 2007 9:16 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> > Andy Wilcox schreef:
>>     
>>> > > Since uboot-utils builds a native binary (mkImage) it should really be
>>> > > called uboot-utils-native.
>>>       
>> >
>> > That part makes sense. FWIW, we already have a uboot-mkimage-native
>> > recipe in OE.
>> >
>>     
> Also, consider u-boot-utils instead of uboot-utils. The project is
> called u-boot and I thought I saw both namespaces appear in the u-boot
> dir?
> (If I'm too late, probably forget this).
>
> Also +1 from me.
>
>   
>>> > > My motivation is (a) I'd really like to build a few tools from uboot
>>> > > which are cross-compiled
>>>       
>> >
>> > And now you're talking about uboot-utils-cross, not uboot-utils-native
>> >
>>     
> Not necessarely.
>
> Anything *-cross is a tool that is built for, and runs on one platform
> and generates output for another.
>
> Andy said a few tools which *are* cross-compiled, so he I think he
> wants to cross-compile tools, which are deployed on the target and as
> such do not generate output for another target.

Leon is exactly right.  I meant I'd use the newly-freed u-boot-utils
to build a few programs for the target - in my case, I'm interested
in fw-setenv, which allows one command-line manipulation of the
u-boot environment area in flash.

Sorry for any confusion.



