Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUntm-0006Oc-CD
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 00:40:23 +0200
Received: by pxj1 with SMTP id 1so1367822pxj.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2011 15:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=O8HHT4p6KJGklWgeJArs0XW6HJ8CsOCR2+aOHKclDac=;
	b=FMhyNJaBGY+m9L02NGe+ittG7hf0N/0Xtm6z6zhfPHHcTUYs5N7EzJ5nYtizvb2FS2
	+GoiKtVSys4ih59OAphEHOXhWJdNSmshEBopm56s7Okgu4H2QCVvQo+B9VnkVHPcjkr/
	B9GQJvTNSQF/NOaHK57J/9U0Hkg/HvTrQOOy0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=MTLFmk34LGzqb6OJVt9OmUYfBFyPxc9d+ogq/1J/hdgGHaILw2S3n5i3UJqJg5ITcy
	Pftzuw0ii+0L4sQdAiZJifECH9OHug1fKqFLnZlcdvlTCJirtsVO7kUQIaKYIyZHtALR
	6AF7UnJcUPwV5eWi7W3XN9lfYKqT/+VdX9MVo=
Received: by 10.142.8.30 with SMTP id 30mr234939wfh.54.1307659020850;
	Thu, 09 Jun 2011 15:37:00 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z7sm2166450wff.5.2011.06.09.15.36.58
	(version=SSLv3 cipher=OTHER); Thu, 09 Jun 2011 15:36:59 -0700 (PDT)
Message-ID: <4DF14B08.1010404@gmail.com>
Date: Thu, 09 Jun 2011 15:36:56 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp><1307534514.2529.4780.camel@phil-desktop><0C757E680E33864AB113392C7E83F910BE5185@GSX300A.mxchg.m.corp>	<1307535707.2529.4783.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
Subject: Re: Amend recipes which do not contain a (new) target machine in COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 09 Jun 2011 22:40:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2011 08:46 AM, Hauser, Wolfgang (external) wrote:
>> I guess you might not be able to append to COMPATIBLE_MACHINE from
>> amend.inc since amend.bbclass probably doesn't get run early enough.
>> But you should be able to use COMPATIBLE_MACHINE_append_pn-... in your
>> layer.conf, or COMPATIBLE_MACHINE += in a .bbappend file.  Are those
> not
>> working for you?
>
> The .bbappend files don't work with bitbake version 1.10.2 which is
> required by OE release 2011.03.

is something holding you off from using later version of bitbake ?

>
> I want to use linux-omap-psp_2.6.32.bb as kernel recipe, how is the
> exact format for COMPATIBLE_MACHINE_append_pn-... ?
>
> I tried COMPATIBLE_MACHINE_append_linux-omap-psp = "mymachine" and
> COMPATIBLE_MACHINE_append_pn-linux-omap-psp = "mymachine", both don't
> work for me.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



