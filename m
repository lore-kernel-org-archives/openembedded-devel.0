Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web12.528.1630083889297175278
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Aug 2021 10:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=QgLkI2MH;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mJfHa-0004Lq-1c; Fri, 27 Aug 2021 19:04:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WHXdD4P52ycT6R9j3a+FaiIlwwsnEY+9sc9ymr2noFE=; b=QgLkI2MHmti9PNIkyuB1SqNHTZ
	qDAmuC5+uHWcZOI+rujS6wcTae6S5UUWicZe9bNTfsW1IOX05Fiap7/NAoTCLq/8E6vpDcTyAFhUc
	YCtFa0mTozgHGzz567aRZyzxEK7QvLJXNWpxI+N8a+NZqnbdFms3IssA5ACaoABW0k/mvHym092SW
	q7F1mYEhxQhG5uyTtNhdaBOM3bNAfuLpj9MoonsZc1eKWnbfzT/O0qnIyFJFEMBfor9GOFsR+Pk2s
	TWWurvbtjKxtxmqwbFrZ14ZzhWG24NOrPsZvWQMpwZGVRHYPAAdsKZPtBSaFvbimnTSrvv8wbraXm
	07ThLLzw==;
Received: from [87.242.23.58] (helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mJfHU-0004U5-8K; Fri, 27 Aug 2021 19:04:43 +0200
Subject: Re: [oe] [meta-gnome][PATCH] metacity: Use autotools-brokensep
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: zboszor@gmail.com
References: <20210827084346.2770947-1-zboszor@pr.hu>
 <f0a92ad5-1cc1-c383-7ca2-31825762c761@gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <32da7686-4098-2025-bbf4-43aab27c9f4c@pr.hu>
Date: Fri, 27 Aug 2021 19:04:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f0a92ad5-1cc1-c383-7ca2-31825762c761@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 87.242.23.58 (deferred)
X-Spam-Score: -1.0 (-)
X-Scan-Signature: c892312d2a1f02c4510de3f1761de028
X-Spam-Tracer: backend.mail.pr.hu -1.0 20210827170443Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 08. 27. 18:49 keltezéssel, Khem Raj írta:
> 
> 
> On 8/27/21 1:43 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>
>> The split build directory causes a make error because
>> build/src/core is not created during the build but generated
>> sources are moved to it which fails.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb 
>> b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
>> index a5c704740..969fe13dd 100644
>> --- a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
>> +++ b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
>> @@ -21,6 +21,8 @@ DEPENDS = " \
>>   # depends on startup-notification which depends on virtual/libx11
>>   REQUIRED_DISTRO_FEATURES = "x11"
>> +GNOMEBASEBUILDCLASS = "autotools-brokensep"
>> +
> 
> this does not fail on jenkins so I wonder what are the conditions to reproduce it.

Fedora 33 build host, master branches of oe-core and meta-oe.
I also use meta-clang and meta-intel.

The commit message says it all. metacity-3.40.0/src/core exists
because it was there in the tarball, but build/src/core does
not get created automatically for some reason here.

I can carry this assignment or the equivalent B = "${S}" in my local bbappend.

Best regards,
Zoltán Böszörményi

> 
>>   inherit gnomebase gsettings gettext upstream-version-is-even features_check
>>   SRC_URI[archive.sha256sum] = 
>> "224c1f65487eac21f0c1d9856152343768ee726c48b1a8a2835a46a8ad9015b5"
>>
>>
>>
>>
>>
> 
> 
> 
> 

