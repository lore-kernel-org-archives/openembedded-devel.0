Received: from exprod5og114.obsmtp.com ([64.18.0.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Np2Et-0000m4-Lv
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 17:25:00 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob114.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5Z1qwucQ5BCQszFiFylgvzMMcWL4+vj@postini.com;
	Tue, 09 Mar 2010 08:22:05 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Alpmlip08.e2k.ad.ge.com with ESMTP; 09 Mar 2010 11:06:19 -0500
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 09 Mar 2010 11:06:16 -0500
Message-ID: <4B9672B7.2030204@ge.com>
Date: Tue, 09 Mar 2010 16:09:27 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B8E618C.2080604@dresearch.de> <4B94AA93.4070709@dresearch.de>
	<1268071514.16526.6.camel@trini-m4400>
In-Reply-To: <1268071514.16526.6.camel@trini-m4400>
X-SA-Exim-Connect-IP: 64.18.0.28
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: u-boot ready initrds
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
X-List-Received-Date: Tue, 09 Mar 2010 16:25:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> On Mon, 2010-03-08 at 08:43 +0100, Steffen Sledz wrote:
>   
>> Steffen Sledz wrote:
>>     
>>> Initrds need to be prepared with mkimage to be usable from u-boot.
>>> The following patch introduces an additional IMAGE_FSTYPE .cpio.gz.u-boot
>>> for this (at the moment just for hipox machine).
>>>
>>> Is this the way it should be done?
>>>
>>> Should this better become part of conf/bitbake.conf?
>>>       
>> Ping
>>     
>
> I don't know why patchwork didn't see this.  That said, mkimage -A arm
> is bad.  UBOOT_ARCH is right, and comes from kernel-arch.bbclass.  So, I
> think a full patch would need to add in changes to image.bbclass to
> inherit kernel-arch so that UBOOT_ARCH will be evaluated.
>
> And yes, this I think should be in bitbake.conf with the rest of the
> image magics
>   

We'd like to see this as well. We have a class which we inherit to do
the same thing that I have been meaning to try and push, but this is a
much better way of doing it.

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



