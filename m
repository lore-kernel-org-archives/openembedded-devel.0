Received: from exprod5og109.obsmtp.com ([64.18.0.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NpOhg-0002gp-Ko
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 17:24:14 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob109.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5fG+yVhZao6ngkBFXLpeMiEnCgqVohP@postini.com;
	Wed, 10 Mar 2010 08:21:17 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip08.e2k.ad.ge.com with ESMTP; 10 Mar 2010 11:05:45 -0500
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 10 Mar 2010 11:05:45 -0500
Message-ID: <4B97C419.2070606@ge.com>
Date: Wed, 10 Mar 2010 16:08:57 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100310135425.31263.61632.stgit@ES-J7S4D2J.amer.consind.ge.com>	<1268234994.16526.170.camel@trini-m4400>
	<4B97C0BB.2060104@ge.com>
In-Reply-To: <4B97C0BB.2060104@ge.com>
X-SA-Exim-Connect-IP: 64.18.0.188
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale P2020DS Demo Board
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
X-List-Received-Date: Wed, 10 Mar 2010 16:24:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Martyn Welch wrote:
> Tom Rini wrote:
>   
>> On Wed, 2010-03-10 at 13:54 +0000, Martyn Welch wrote:
>>> +
>>> +KERNEL_IMAGETYPE = "uImage"
>>> +UBOOT_ENTRYPOINT = "0"
>>> +
>>> +UBOOT_MACHINE = "P2020DS_config"
>>> +
>>> +# Need to create jffs2 images with the correct endianess
>>> +EXTRA_IMAGECMD_jffs2 = " --big-endian -e 0x40000"
>>>    
>>>       
>> A guess, --no-cleanmarkers as well?
>>   
>>     
> Huh, didn't know about them, so I guess so.
>   
Actually, reading up on this, isn't that option just for NAND?

This board has both NAND and NOR, but we tend to use the NOR for the OS.

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



