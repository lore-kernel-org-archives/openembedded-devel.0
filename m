Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RU3m7-0000kl-GI
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 22:57:39 +0100
Received: by wwf22 with SMTP id 22so3272577wwf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 13:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=K/Mj8rKEmvVoiFIUBGJELErJycSzlaXZrZdIrQ7nSg0=;
	b=LBikI70qJpOkjcJvjtLhKAT186jifLvyVB5JaHYf9FN4ByseSu4MoH5VR/UpS4RoeG
	+U73T7l2wQjp/NSGvAgYbnxmrE4T+PXpULcttmCXXYxGtgfPI0EzpQnadQW1+qyUapOw
	qYbkOKS1e3SvKovInTM9g+bNPzp569vqP5ggc=
Received: by 10.227.207.201 with SMTP id fz9mr22878231wbb.25.1322257864854;
	Fri, 25 Nov 2011 13:51:04 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id a27sm29039966wbp.16.2011.11.25.13.51.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Nov 2011 13:51:03 -0800 (PST)
Message-ID: <4ED00DC1.3080605@googlemail.com>
Date: Fri, 25 Nov 2011 21:50:57 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EC81A85.8050704@googlemail.com>
	<CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
	<4ECE4B0D.6030401@googlemail.com> <4ECE5422.3070504@googlemail.com>
	<20111124174936.GA28767@sakrah.homelinux.org>
	<4ECE87A9.8040109@googlemail.com>
	<20111124182713.GH28767@sakrah.homelinux.org>
	<4ECEE6D8.7080802@googlemail.com>
	<20111125050922.GA30623@sakrah.homelinux.org>
	<4ECF2887.2040400@googlemail.com>
	<CAMKF1srBccnok0GsuwZxsRCpUNwT7nLz=iJi9vhNZSykxhztfA@mail.gmail.com>
In-Reply-To: <CAMKF1srBccnok0GsuwZxsRCpUNwT7nLz=iJi9vhNZSykxhztfA@mail.gmail.com>
Subject: Re: "cannot find -lppl_c" link error
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
X-List-Received-Date: Fri, 25 Nov 2011 21:57:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> I have just finished my built - the whole lot and with a lot of warnings, mainly from unpackaged files - don't know whether these are important though.
>>     
>
> they should be looked into sometimes there might be important files that
> go unpackaged
>   
I kept a log of these and can attach them separately. From what I 
remember the majority of them all were from the gcc packaging.

>> I'll probably spend the weekend fine-tuning this as my build went over 25G in size - massive! Thanks for your help Raj, much appreciated!
>>     
>
> yes its big since a lot of software is built you could use rm_work
> feature where it will try to delete the work dirs after they are
> successfully built but I would suggest not to do that unless you
> really need it.
>   
I really have to - I've expanded my "dev" partition to the limit now and 
I run a lot of other things - I didn't expect this to take so much space 
- I am executing a massive 15k+ steps task with bitbake at present and I 
am dreading the free disk space - I have "barely" 50G left.

OE is actually a very handy tool to have - I have been struggling with 
different projects mainly because of the nightmares of building and 
maintaining the toolchains needed for the various arches I have been 
using. This seems to be very streamlined in OE, so I might start 
developing some recipes soon.


