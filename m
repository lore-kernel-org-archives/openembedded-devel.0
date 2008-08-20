Received: from [64.233.170.185] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KVqAA-0007ne-PQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Aug 2008 18:03:58 +0200
Received: by rn-out-0910.google.com with SMTP id v46so265609rnb.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2008 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=Jl6v4cnLhummRg3ZdlzssTTm/noo5VfOSnbWaF64FOU=;
	b=m6F8QZQdCNQd9iSHQNu4wrOI4AqJ2OUIclpaRj65UZI5YN7HdkA/L83qxZxhZPExJ9
	TjC6CH3qAhF/93HEV97Y8pUQmPGH6IlWQla7iPn7qUs5Qy+uwsEqCI126GNoAuGg1YGm
	YbvVm6miFh5HHo+EfZ298AeD3JKGMs1BGC/Kc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=Cm8GuNS+/PYsYbcxX57xASBuvcXoc6Kgztt9y8esvtDe0YxTeTEwzho+naHsrFAP71
	u42SY1u7m/ss0wZcBQGI1ol3cdlq/QT+m/Hq7qDqqFo+mkROk2NDWg++cwlwQTz0eLSu
	2vYiTDnGc31HllYlOGv1/a5mbFhfjFKlDQ+48=
Received: by 10.114.184.7 with SMTP id h7mr338788waf.9.1219248171684;
	Wed, 20 Aug 2008 09:02:51 -0700 (PDT)
Received: by 10.114.241.11 with HTTP; Wed, 20 Aug 2008 09:02:51 -0700 (PDT)
Message-ID: <19c1b8a90808200902i4a0d448chfcd591a708717177@mail.gmail.com>
Date: Wed, 20 Aug 2008 09:02:51 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g8gmvc$cob$1@ger.gmane.org>
MIME-Version: 1.0
References: <19c1b8a90808200142y33c5baa3uee2398d7f87b4cc6@mail.gmail.com>
	<g8gmvc$cob$1@ger.gmane.org>
Subject: Re: uclibc and uclibc-locale support in gcc 4.3.1
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
X-List-Received-Date: Wed, 20 Aug 2008 16:03:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Koen

Thanks for looking at it. While I see that what you mention is
logical. The construct I have worked ok on uclibc and eglibc angstrom
builds. But I will change to what you suggested and do builds again.

Thanks

-Khem

On Wed, Aug 20, 2008 at 2:08 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Khem Raj wrote:
>>
>> Hi
>>
>> I was trying to use gcc 4.3 for some uclibc stuff and found it broken.
>> This patch fixes it.
>>
>> 1. Fix target gcc build. The earlier patch I did to fix SDK build was
>> insufficient so I enhanced it.
>>
>> 2. uclibc Locale patches needed a facelift to be able to work with gcc 4.3
>>
>> 3. Fix uclibc 0.9.29 to get build using gcc 4.3
>>
>> 4. Disable libobjc for arm uclibc. If someone really needs some
>> packages on uclibc which need objc support then you better fix gcc
>> first :)
>>
>> I intend to apply it on .dev. comments are welcome
>>
>> I have tested it on arm uclibc and arm eglibc doing bitbake gcc
>
> Your patch has
>
> +OBJC ?= ",objc"
> +OBJC_linux-uclibcgnueabi ?= ""
> +OBJC_avr ?= ""
>
> That probably needs to be:
>
> +OBJC_avr32 ?= ""
> +OBJC_linux-uclibcgnueabi ?= ""
> +OBJC ?= ",objc"
>
> Note the '32' in avr32 and the order of weak assignments.
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


