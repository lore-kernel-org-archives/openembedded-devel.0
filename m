Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-la0-f44.google.com (unknown [209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id B45046FAB4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 14:29:32 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id hr17so6592390lab.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 07:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=e3Jsi9VswLOo09KZ3kCc2oSICWuQuWChZUwCaB7GHY0=;
	b=nNFE3W1PLCmbuvroVYshLdVxeUd58S7QhZ84OhQDV2AiS+gviKTvj/Q3iqRKSZa1ZO
	XhCckxrurLqwOS7g5iQGjMkJv9nO0jygUXZtTIIp+KnsiqlUpZnF+pLZgrMpcP0eYKPG
	MMiyIMAJTFwo4CAuZ2g+DQsab9bAK13ZcMH5Bm21dC4jnLT4idoTf7XByzA70K9huEu3
	WUmuUqoKc/nZjIuokpmxLL02HF+3w53+ayPhka6qCouRVY9ZN6wYfm9/fG4Lu2dtR/fu
	CJomwRbl5wRFYZBrTVKPbjTcBnM+J2ztbGe0th6FEkhPKbLE5vj1V0YHUr/ty7W3rNwT
	Npxw==
X-Gm-Message-State: ALoCoQmdzeG7SNpehrNLHGgczG/4iBraEB2PB/N/hnQksp+XmYlJkyOXeNb9Yp3AvbXpMsnDSc4h
X-Received: by 10.152.43.194 with SMTP id y2mr2820969lal.72.1401200972592;
	Tue, 27 May 2014 07:29:32 -0700 (PDT)
Received: from [192.168.1.106] ([92.39.133.154])
	by mx.google.com with ESMTPSA id u4sm13334683lal.8.2014.05.27.07.29.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 May 2014 07:29:31 -0700 (PDT)
Message-ID: <5384A14C.70900@linaro.org>
Date: Tue, 27 May 2014 18:29:32 +0400
From: Maxim Uvarov <maxim.uvarov@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1401196396-2009-1-git-send-email-maxim.uvarov@linaro.org>
	<20140527142106.GB2426@jama>
In-Reply-To: <20140527142106.GB2426@jama>
Subject: Re: [PATCH] daq fix compilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 May 2014 14:29:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/27/2014 06:21 PM, Martin Jansa wrote:
> On Tue, May 27, 2014 at 05:13:16PM +0400, Maxim Uvarov wrote:
>> preset paths to remove that error:
>> /meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
>> ./config.log:cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]
>>
>> Also this patch add required libdnet dependency.
>>
>> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
>> ---
>>   meta-oe/recipes-connectivity/daq/daq_2.0.2.bb | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
>> index 4e85194..dcf38fc 100644
>> --- a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
>> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
>>   
>>   PARALLEL_MAKE = ""
>>   
>> -DEPENDS = "libpcap libpcre"
>> +DEPENDS = "libpcap libpcre libdnet"
>>   
>>   SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
>>               file://disable-run-test-program-while-cross-compiling.patch "
>> @@ -15,6 +15,9 @@ SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
>>   # daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink
>>   EXTRA_OECONF += "--disable-nfq-module --disable-ipq-module"
>>   
>> +# never look to /usr/local lib while cross compiling
>> +EXTRA_OECONF += "--includedir=/usr/include --with-libpcap-includes=/usr/lib --with-dnet-includes=/usr/lib"
> Does it look into /usr on host now?

yes and it compiles after that change.

Maxim.
>
>>   SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
>>   SRC_URI[sha256sum] = "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
>>   
>> -- 
>> 1.8.5.1.163.gd7aced9
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


