Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id B8152606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 16:21:19 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id x3so34386715pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=gotJBJ/jGNHGVv54t/Hoc5hlNxD3n5EQLaVDes7trVo=;
	b=OkBE4Fq886XtoaRK/JAl0TDL2x3TyLECHfzLweXmE28BOhU3ze/5zxpGC41qPmmIpv
	bxau//Zj4nERIHOqgzOkYhisYhIbLeeHBYTxzh+CDzUwv4JNAZtFq9OneqZHjRreZ20X
	O7nPEZkdTeG83FmDioLYjK4B3pYRFber8I3Yj7SpJ0ogWPyDgPJ5p4SyLfZATeZZLExm
	Sx80MR/NAqiSuxHkp72Oy8yazVAKr+xoick5qHErSk17Enu1jHF0F2IpBSnNxw8ZEBGm
	qYE2Ro6H6P/JIPiD0HClYIGcimLGD+67H/YW1Y3kMxLh6giKfLNPCy+rIGmq1h8LniRl
	zc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=gotJBJ/jGNHGVv54t/Hoc5hlNxD3n5EQLaVDes7trVo=;
	b=mIMgaT9PZ+R24nIZLj8Eg8/6oclzN/XLD4A7utGcFuZT4yFzY5mklSLGUs4Rf4h1DV
	O+vWIWjp3Aq7qDymg2e6ktjq9CX7H+ZcFMQzCt5AjWNcx2MEBH3XvlWLe5ry7cmOQtfp
	3rdgRcu+xKIMCb7EvDuQ01QM+/7G73TQ/NgOuzQh392rEPDgyDQ9OsmTC0c3gni6fT8+
	b8pr2iRij/yxmXM9y3piPr3axEMDbW1yhqKZUJTTBClx6mSLZHIkgx8ZpV8MMKjyBq/h
	eKrodDvJ+VvCVwBs3rE/sKXZ2nphA8PDH+h4plLGX/izUAkW5bvfyQrWBj/1/2uwYWok
	KTnw==
X-Gm-Message-State: AD7BkJI7NRjgSSqKtGGfHSlojWIjS123V1XEierfwrV39k0tzImdb3C0wqr3ImoujAEqGg==
X-Received: by 10.67.7.1 with SMTP id cy1mr5508489pad.123.1458750080301;
	Wed, 23 Mar 2016 09:21:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:4df:d6eb:1e52:fc5f?
	([2601:202:4000:1239:4df:d6eb:1e52:fc5f])
	by smtp.googlemail.com with ESMTPSA id
	yx1sm5264707pac.29.2016.03.23.09.21.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2016 09:21:19 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20160309195049.GJ2542@jama> <20160317214927.GK2553@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56F2C274.8070105@gmail.com>
Date: Wed, 23 Mar 2016 09:21:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160317214927.GK2553@jama>
Cc: akuster@mvista.com
Subject: Re: python-cryptography failing to build since openssl upgrade
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
X-List-Received-Date: Wed, 23 Mar 2016 16:21:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 03/17/2016 02:49 PM, Martin Jansa wrote:
> On Wed, Mar 09, 2016 at 08:50:49PM +0100, Martin Jansa wrote:
>> Do we really need to use that version script for openssl?
>>
>> Here is another failure:
>> http://errors.yoctoproject.org/Errors/Details/54984/
>>
>> in our local builds we use couple prebuild binaries from 3rdparty, which
>> now aren't compatible with openssl ABI (possibly because of
>> version-script update:
>> http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118433.html
>> )
> 
> Still failing:
> http://errors.yoctoproject.org/Errors/Details/56595/

will look into it today.

- armin
> 
> 
> 

