Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L0CoQ-0008DX-6n
	for openembedded-devel@openembedded.org; Wed, 12 Nov 2008 11:19:02 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L0CmU-0007Bs-LY
	for openembedded-devel@openembedded.org; Wed, 12 Nov 2008 10:17:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 12 Nov 2008 10:17:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Nov 2008 10:17:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 12 Nov 2008 11:16:49 +0100
Message-ID: <gfeaei$6hf$1@ger.gmane.org>
References: <1226483313.7474.5.camel@aquilonia>
	<1226484007.17085.150.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081106 Shredder/3.0b1pre
In-Reply-To: <1226484007.17085.150.camel@mill.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Moving xorg.conf to seperate .bb file/package
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
X-List-Received-Date: Wed, 12 Nov 2008 10:19:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-11-2008 11:00, Phil Blundell wrote:
> On Wed, 2008-11-12 at 09:48 +0000, Graeme Gregory wrote:
>> At the moment xorg.conf is handled within the xserver-xorg .bb file.
>>
>> As xorg.conf varies per machine this will effectively make xserver-xorg
>> machine specific which sort of defeats the purpose of a module xorg.
>>
>> My suggestion is to move xorg.conf out of xserver-xorg. Then add a
>> RRECOMMEND_${PN} = "xserver-xorg-conf" to xserver-xorg.
>>
>> Is this a sane plan?
>
> Yes, that sounds like a splendid plan.  I would even hope that some
> (maybe most) machines can cope without having an xorg.conf at all
> nowadays.

With a machine using a plain framebuffer xorg.conf shouldn't be needed 
(or empty) anymore, for other machines like omap based ones an xorg.conf 
is needed to point to xf86-video-omapfb. So, yes, most machines in OE 
can do without an xorg.conf :)

regards,

Koen



