Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 49079731AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 09:58:56 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f206so163198730wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2016 01:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=elfin-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=Y2NsZLGkG7Z2CsZzUm4AM7446FoKflylHwyOxAl662g=;
	b=ve96NuOs6IXjCcBn8OV5Im5IpkcI7+bbPrXwU4wSjZe6hwU3JKB2lLrh5xWi1kZnTL
	ka3Lb9ZTv0By60n1Szw96ZnrSZZcNXBxZ7HRzndaoyolyiuGooxA2d2JI2oiGsgGg2gh
	jkBjsZVrHAKbHVHpeTl/Xz+b3/Zlwd36kb0KIlBWhtSoKFejIJxspoq5Xd4DHrYSleJU
	7RBxzCa2h1UzQtT0kgf/3Urh0dlcarSOpUWM6mmpAE98+cLd7h7SA1CA80vcFFO/kiYD
	futrvdhIjXHEP+j7PDsyKmTfCbIXh6yGzgcHGGuoMvayBJmknQscRtAFOqGjYF+0XdoX
	HBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Y2NsZLGkG7Z2CsZzUm4AM7446FoKflylHwyOxAl662g=;
	b=k11yJu/7f68TJamrA+/PJMWZC0ZJiTi0bC8ngqk7rE4XUDh8xoLdFogQBQYtdQbvv0
	a/jrobCOscbYpSEL6hZ8+JzvS3Fnf0yY9KqAVDHcRxFb4NPs5sXhfntgYM99w4V3V2l6
	5+W8xQgx9ja5TebIY4lYSI7prcln9Nx0Af8cEv5iLMo7gD7nV2818VyFhUvgHIv6oIq+
	A93YhSQfHkqM07I7AmeOKIrGfuetPQX5YHSDfQjOQl9mWfLhgFXvoJXiPgKlaC7Ls4Jm
	Ed5YGO70lZ7q+XlKu7UL9jObnPk8l0pFDcayY+YZKOFRmaa0PFccYUxBeoJ8M4hRIXcI
	wlNA==
X-Gm-Message-State: ALoCoQkPbOuvbahIxbYigpx9QypAYVTqGImP4SnOyo0HH7rClCChDtj+f0H+0OR9ommXJGsqkpnJ5EHJrdO4tf42Xo1N9rSmdw==
X-Received: by 10.28.47.213 with SMTP id v204mr20916253wmv.69.1452247137185;
	Fri, 08 Jan 2016 01:58:57 -0800 (PST)
Received: from [192.168.2.181] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	wx2sm16366634wjc.27.2016.01.08.01.58.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jan 2016 01:58:56 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <568F8037.4050902@elfin.de>
	<CA+chaQfSnmR2MtpUvprHjDBFQ_6ifhA_cNtDW_ZzSY_H+NADjw@mail.gmail.com>
From: Piotr Lewicki <piotr.lewicki@elfin.de>
Message-ID: <568F885F.2040206@elfin.de>
Date: Fri, 8 Jan 2016 10:58:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfSnmR2MtpUvprHjDBFQ_6ifhA_cNtDW_ZzSY_H+NADjw@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Unblacklisting package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jan 2016 09:58:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Thank you.
Can I do it in my image recipe?
Once I added it to local.conf - it worked, but the same line in my image 
recipe - doesn't.

BR,
Piotr Lewicki

On 08.01.2016 10:46, Martin Jansa wrote:
> set it to empty value.
>
> On Fri, Jan 8, 2016 at 10:24 AM, Piotr Lewicki <piotr.lewicki@elfin.de>
> wrote:
>
>> Dear Paul and oe-devel list,
>> I've found as a part of this tread
>> http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098410.html
>> that you know how do "unblacklist" a package from my conf file.
>>
>> /You can still disable that PNBLACKLIST in your local.conf or distro.conf.
>>> /
>>>
>> I was trying to find out how to disable it but my research failed.
>> Could you share this knowledge with me?
>> I'm trying to unblacklist modphp package.
>>
>> Best regards,
>> Piotr Lewicki
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


