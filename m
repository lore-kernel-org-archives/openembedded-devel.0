Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9501F73198
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 20:27:47 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id y7so21046paa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2016 12:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=k4AddYrfibfHf7vX/EZSy4h9V5+od9c8ghsXu3ZJ9CM=;
	b=KHSWY2org1z8la1471rM3F/eTOo/j//7i3HE2491rw1MJPbhNQFIvbF8oB/c4g9mTO
	OPZ6ran4sa4gATQ/DN5uPz7UtiAAJtXsRsa/eVPmi+5K0iqURgJGmChmiCQT+4bqV+1s
	/emVEjQnyjgJioig2z5oBG2jAhD0LoDcC3qa2FBI1p6uK66hQqm0JYBh0+E7Hxmd2bhz
	aC9v5JXMAfsm0MD5Ru6cps0XHdFBfJcRAy3GHDsQ0WJT/cfzKfcdTPyPpsAcuFnpSG5r
	e/V+aQRKrRNRwGCfGV5rDcJPvm1I1dlbEHMon1e/1xxX+rjIoYszJ2KEMfMJ+cBDFzBy
	584Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=k4AddYrfibfHf7vX/EZSy4h9V5+od9c8ghsXu3ZJ9CM=;
	b=jnChQYUNGGiXv6SJuFJNZxE0fEXMqwiEMORlVpUNXvAUaFvWgxaPw/Fd9rMtg/k5jV
	mmBV8nrIsm9MPBsd/EvVmo6CO/pvzkgFY3PtzYBC9Jj33iZFnh8yCkwDuFtKu9DxAOug
	jVFO5B1gL1B6WYLIODBvjOJCZ7T9e0OC/94n54UeWU7V0yTvy3EJ2A0bgXLsL8dlTEMn
	Yx98J2KbSE6YwpDj+Thv0IgHZZYC2H2P3gVX5FM+Q28UPs9Dd3FT1JlimoDnWcHbaeCF
	5bQ67DB7/kBYFe3zHhAi+o1wRxmg4dkjY9Bu/qnAZSoocvybBQBtDYIdsP1AhuhKxCwX
	bu4w==
X-Gm-Message-State: AG10YOQ9YCouAY/JQjcKmUM97KL6cKk00DK9Z06yN6vC1uk0Sv4NXWFTd3awFynyheY0OA==
X-Received: by 10.66.141.142 with SMTP id ro14mr52453010pab.112.1455049668708; 
	Tue, 09 Feb 2016 12:27:48 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:932:7842:972b:d985?
	([2601:202:4000:1239:932:7842:972b:d985])
	by smtp.googlemail.com with ESMTPSA id
	o73sm52565790pfa.37.2016.02.09.12.27.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Feb 2016 12:27:47 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <cover.1454879225.git.akuster@mvista.com>
	<8239925181787e297b39460fc9d4dd953f9ce946.1454879225.git.akuster@mvista.com>
	<20160209180833.GA2608@jama>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56BA4BBC.6030800@gmail.com>
Date: Tue, 9 Feb 2016 12:27:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20160209180833.GA2608@jama>
Cc: otavio@ossystems.com.br
Subject: Re: [PATCH 7/7] krb5: Fix warning.
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
X-List-Received-Date: Tue, 09 Feb 2016 20:27:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 02/09/2016 10:08 AM, Martin Jansa wrote:
> On Sun, Feb 07, 2016 at 01:11:59PM -0800, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> WARNING: /tmp/work/armv5e-poky-linux-gnueabi/krb5/1.12.2-r0/krb5-1.12.2/src/ ('S') doesn't exist, please set 'S' to a proper value
>>
>> remove extra "/"
> 
> This patch isn't in master and master still has trailing /, why is this
> needed for fido only?

I only saw it occur in fido.

- armin
> 
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>  meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
>> index c492496..c19fffb 100644
>> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
>> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
>> @@ -33,7 +33,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
>>  SRC_URI[md5sum] = "357f1312b7720a0a591e22db0f7829fe"
>>  SRC_URI[sha256sum] = "09bd180107b5c2b3b7378c57c023fb02a103d4cac39d6f2dd600275d7a4f3744"
>>  
>> -S = "${WORKDIR}/${BP}/src/"
>> +S = "${WORKDIR}/${BP}/src"
>>  
>>  PACKAGECONFIG ??= "openssl"
>>  PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>> -- 
>> 2.3.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

