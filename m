Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1M5bf5-0006FW-6y
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 May 2009 10:23:59 +0200
Received: by ewy20 with SMTP id 20so3330250ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2009 01:16:48 -0700 (PDT)
Received: by 10.210.116.14 with SMTP id o14mr6280162ebc.32.1242548208601;
	Sun, 17 May 2009 01:16:48 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 10sm4240563eyd.32.2009.05.17.01.16.47
	(version=SSLv3 cipher=RC4-MD5); Sun, 17 May 2009 01:16:47 -0700 (PDT)
Message-ID: <4A0FC7EE.6090903@xora.org.uk>
Date: Sun, 17 May 2009 09:16:46 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>	<200905160931.25224.marcin@juszkiewicz.com.pl>	<200905161121.55689.g.eismann@gmx.net>	<f96d234e0905161438u2bd28611lb3041e4dc5d0afe8@mail.gmail.com>	<guoe44$ff1$1@ger.gmane.org>
	<fce2a370905170058r407d6b02qa9116bad2d64d292@mail.gmail.com>
In-Reply-To: <fce2a370905170058r407d6b02qa9116bad2d64d292@mail.gmail.com>
X-Enigmail-Version: 0.95.0
Subject: Re: Kernel modules
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
X-List-Received-Date: Sun, 17 May 2009 08:23:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ihar Hrachyshka wrote:
> On Sun, May 17, 2009 at 10:24 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>   
>> On 16-05-09 23:38, Cliff Brake wrote:
>>     
>>> On Sat, May 16, 2009 at 5:21 AM, G. Eismann<g.eismann@gmx.net>  wrote:
>>>
>>>       
>>>> BTW, is there any way to install the modules but not the kernel image?
>>>> I have the kernel in a separate partition, so I don't need it into the
>>>> rootfs.
>>>>         
>>> One way is to put the following in the kernel recipe:
>>>
>>> FILES_kernel-image_<machine_name>  = ""
>>>       
>> Please don't do that, it breaks all sorts of things, one of which is field
>> upgrades.
>>     
>
> Your suggestion?
>
>   
As nothing depends on kernel-image other than kernel I would suggest
breaking this dependency. Then if you want the image of the kernel on
your rootfs you can explicitly depend on kernel-image in a task.

Graeme



