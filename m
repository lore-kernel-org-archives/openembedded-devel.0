Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SNmvl-0001yh-Sh
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 17:17:58 +0200
Received: by pbbrq2 with SMTP id rq2so958928pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=DvEZA3rNPsO5OldKth2xpcHDgixbgDeWKILTyezlGR8=;
	b=DNyUu0/rXxNFPr10jHeTHblaiB7bbvoCATILtO/0Wvk7J7H7DV3JqFQY24CizQpqWc
	mE16XRXoPfzcy1SeQwTS09ZL8lGnnHCfJCTVScYBTM5z3D7mGCiwS3nBkLiwww91R+vW
	stHJxHZd72+Y/cmjVPMb07rq8n3nYqsr1GtrDpc22dc1R3uSBi0BNKaK8NwNVqWiW9Uj
	TO23fGkRaEH6s7ob2Y2dAxbLXFdzY1SwJdg5ID20lMNVXmSE5USU3VHdCu+lIeCKteUt
	YrDwRKnvFSBHJMZ3phKrpu1kMA0DUF/yWCZOqt1ojEvvF1PlVylHsZTE8YpYGTINtymR
	h8tA==
Received: by 10.68.132.197 with SMTP id ow5mr342711pbb.165.1335539298927;
	Fri, 27 Apr 2012 08:08:18 -0700 (PDT)
Received: from [192.168.1.104] ([37.191.128.59])
	by mx.google.com with ESMTPS id no7sm5856193pbc.13.2012.04.27.08.08.16
	(version=SSLv3 cipher=OTHER); Fri, 27 Apr 2012 08:08:17 -0700 (PDT)
Message-ID: <4F9AB65E.1040708@gmail.com>
Date: Fri, 27 Apr 2012 17:08:14 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120324 Thunderbird/10.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F9A932F.1020400@gmail.com> <4F9AB570.4090906@windriver.com>
In-Reply-To: <4F9AB570.4090906@windriver.com>
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Fri, 27 Apr 2012 15:17:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 04/27/12 17:04, Mark Hatle wrote:
> On 4/27/12 7:38 AM, Martin Ertsås wrote:
>> Hi.
>>
>> I'm working on a pandaboard with OMAP4460. Were trying to use the newest
>> PVR drivers, which conforms to the result that arose from
>> https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012
>>
>> We have applied the patch at the bottom of that page gcc, and also a
>> patch for making eglibc make ld-linux-armhf, and load ld-linux-armhf
>> instead of ld-linux. Problem is, this gives us a kernel panic when it
>> tries to run init. Linking ld-linux.so.3 to ld-linux-armhf.so.3 does not
>> work, and we're kind of in the dark as to what is missing.
>>
>> We tried fixing this by renaming the toolchain to be
>> arm-none-linux-gnueabihf instead of arm-none-linux-gnueabi, as we heard
>> this might be a problem with hardfloats, but this needed a lot of extra
>> patches, and some patchwork on other packages like openssl and shadow.
>>
>> My question is, are there any ongoing plans to fix this, and make sure
>> that if we have set hard float we make ld-linux-armhf in openembedded?
>>
>> For the record we are using eglibc2.15 and gcc4.6 from 
>> openembedded-core.
>
> The ARM EABI + HF isn't well tested (to my knowledge) of oe-core.  I 
> was under the impressions a few people did use it, and it was working 
> successfully for them.  (Generally speaking people seem to agree that 
> there is a place for ARM EABI + HF, but the performance increase to 
> the couple of items where it helps is generally not worth the pain of 
> incompatibility with the core ARM EABI.  Thus it's not used very much 
> in OE.)
>
> Could you verify that the stock configuration (without any of the 
> changes you described above) is working and will boot w/o a kernel 
> panic at init?
>
> If so then it'll be easier to help you track down the particulars of 
> the ld.so name change and related items.
>
> --Mark
It does work without the said changes, but did see an error in my patch, 
which resulted in gcc linking to /lib/lib/ld-linux-armhf.so.3. I'm 
currently compiling with the fixed patch, but at work so I won't be able 
to see if that was the issue before I get to work on monday.

The problem with calling the toolchain arm-none-linux-gnueabihf will not 
be resolved by this though, but first thing for me now is to be able to 
use the ld-linux-armhf.

-- Martin
>
>> Best regards
>> Martin Ertsaas
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



