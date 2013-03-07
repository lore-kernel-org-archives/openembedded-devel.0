Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UDcx2-0001LF-QT
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:41:52 +0100
Received: by mail-oa0-f46.google.com with SMTP id k1so710108oag.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=EYrF+1dSPR75GP3ilAMKI1zGPjO6zKcyX980eGnJAkc=;
	b=IAhau2F2hCrfUkXbFTlBkehJW0ApMoZmkEocOxstlUZm3+WzoDkW524+7OJnAlcdUE
	Q3HU1F44LWZv9CMA4ctOnscujd5yJf8pEuseCurDnuxzxbVNdQd8wVYbMRJ7+D0dBIz6
	HNMiq9QzX45Y/csDYUU15wHQ685N2p9sHKAaQIpWR+w74Zl61gyalRimaAEdp10gm+XT
	JAgF7zdgPo2YnvjA19BTkmruPgNSxGBrF30rKA6CQWAk72S7Brv1nb2POHY8WUyWbY5a
	FMQ9VqikwcUSxiBqYfeb47v+jG9wRbOZ71Yjrenbhody0fGzmTpSS8+pc5PrxfxzBk+d
	yGvQ==
MIME-Version: 1.0
X-Received: by 10.60.169.212 with SMTP id ag20mr25775090oec.102.1362669916191; 
	Thu, 07 Mar 2013 07:25:16 -0800 (PST)
Received: by 10.60.76.199 with HTTP; Thu, 7 Mar 2013 07:25:16 -0800 (PST)
In-Reply-To: <20130307152058.GO32228@jama.dyndns-home.com>
References: <1362668200-16189-1-git-send-email-s.stirtzel@googlemail.com>
	<20130307152058.GO32228@jama.dyndns-home.com>
Date: Thu, 7 Mar 2013 16:25:16 +0100
Message-ID: <CAGiJk9eUFuV_rMBPDwNLg2F2CN1VxAUAmiAF0BOmXHtxM+8mQQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] maliit-framework: fix for Qt based applications
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
X-List-Received-Date: Thu, 07 Mar 2013 15:41:55 -0000
Content-Type: text/plain; charset=UTF-8

2013/3/7 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, Mar 07, 2013 at 03:56:39PM +0100, Samuel Stirtzel wrote:
>> +pkg_postinst_${PN} () {
>> +#!/bin/sh
>> +#can run online and offline
>> +echo "EXPORT QT_IM_MODULE=Maliit" >> ${D}/etc/profile
>
> IIRC this needs to be $D
> otherwise it's expanded by bitbake and you get path to your ${D} on
> target.
>
> Same for postrm
>

Yes you are right, V2 is coming.


-- 
Regards
Samuel


