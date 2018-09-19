Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id E32EC79309
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:48:33 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id q127-v6so4417112ljq.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=TIWxjRwt2R7ltuCkCedCqYOMl3EsSHYCnoW2xOtzKcI=;
	b=KGKM9lhu+dELjF3Lkz0TQnvQfgIqrcAwizL7l118lqFaY1YuOaQ1Z6HVuxKdcyiNAM
	6ZJ9RTWm5qXUdw5NsybZOlcqAbNpuUGzm2CVA1VbCWFx9qiPnvKW5TO0IcRqboRXCQLl
	V36q+PyIbKEgeeZ6zwpTBq9gseL1RHyPa1hHo7qvh/vViPujMR3ViJmMaQplN1NrwZWN
	ZfGn7C4CuMFb/xl0KN3Aa0Qw3Dss3pd9pDjFryc92mPo2eb4/5YEk365mERUfKp+UdR5
	EtbRB6picAhHyNyZffkeElOLZ1nJjNs7EMH7VVj8HoEB0LsWAoyI1qDJQq4eROWCtrfE
	ygsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TIWxjRwt2R7ltuCkCedCqYOMl3EsSHYCnoW2xOtzKcI=;
	b=p7uRPKHzcK9qGbOmvQqdnBiSH028jqo9femGeMQkno0kKLOOj270bcNbhXgs/ofRwE
	okacRf8ZP58Y+xMaLA3iXog8ODaeBJl9HIYRczyOdypg20yjm9fMzqdXXy05Eraig9kF
	HSV9ZwAhiKilrq9TE4lcLnLtpLvmmCeHO7Wt7OBS/+WjkaBlVAa+IGCRiEmg0dR4Kp8M
	JxXzj+f5Z/tXVXIz4agvlrn1BivO6j8cPATKjqatac+T/2/Q0lC4C/fB3PX4l/tMru38
	mjIKqpSPGQjiF+kid2kPhLV8vZlDD7+8Zwrd6pS37udxfAmgEotJZWNPwXk7ckgqHfYo
	3zxA==
X-Gm-Message-State: APzg51DufCspRPMFOhn+RWYyn4JqI6IBPrmSuLNJSdsACYFWi+qpThIH
	AWQAmNCZSF6rpdmfV3+B/IhjDMjfyd0=
X-Google-Smtp-Source: ANB0Vdb4PbVhZshscr9a8yg2nSJRgWrgUJHnTk/zg/IMiLtIt/8uoAQOJnr/byghJShfwLrTmdKnCg==
X-Received: by 2002:a2e:1bd7:: with SMTP id
	c84-v6mr21437535ljf.0.1537350514020; 
	Wed, 19 Sep 2018 02:48:34 -0700 (PDT)
Received: from [192.168.225.135] ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	o8-v6sm3687623ljg.39.2018.09.19.02.48.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 02:48:33 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-devel@lists.openembedded.org
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
	<1536343810-87649-2-git-send-email-yevgenyp@pointgrab.com>
	<a61039f1550ab18dd862f99506891423fcf28cd9.camel@andred.net>
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
Message-ID: <359ca1e3-c6f2-af6f-933a-f2f03c957d77@pointgrab.com>
Date: Wed, 19 Sep 2018 12:48:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <a61039f1550ab18dd862f99506891423fcf28cd9.camel@andred.net>
Subject: Re: [meta-java][PATCH 1/3] ca-certificates-java: Fix sysconfdir for -native recipe
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
X-List-Received-Date: Wed, 19 Sep 2018 09:48:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 09/17/2018 05:39 PM, André Draszik wrote:
> On Fri, 2018-09-07 at 21:10 +0300, Yevgeny Popovych wrote:
>> When ca-certificates-java-native is built, sysconfdir variable will
>> be set to value that includes WORKDIR.
> 
> What is your use-case for a -native version of this?

I'm glad you asked as this should answer some questions..

I am building a package that contains prebuilt ca-certificates
(including what ca-certificates itself build and JKS),
for this package I need -native version of ca-certificates-java.
We have an immutable (readonly) rootfs, so running scripts at runtime is not an option.
With patches I have recently sent it works pretty well.

The bottom line is that there is a use-case for -native version.
Even if you don't have an immutable (readonly) rootfs - you might want to use it
that way because running scripts is quite error prone.

> 
>> Avoid patching source with this value - use sysconfdir_native.
>>
>> Change-Id: I8ac79c3cd5016a8139d9d8c8d58bc2976d0b6fa3
>> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
>> ---
>>  .../ca-certificates-java/ca-certificates-java_20180516.bb        | 9
>> +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-core/ca-certificates-java/ca-certificates-
>> java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-
>> java_20180516.bb
>> index 2db1915..7db5110 100644
>> --- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
>> +++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
>> @@ -41,9 +41,14 @@ do_patch_append () {
>>      bb.build.exec_func('do_fix_sysconfdir', d)
>>  }
>>  
>> +# sysconfdir will include absolute native sysroot path in -native builds,
>> avoid this
>> +# (see 36.24 of 
>> https://www.yoctoproject.org/docs/2.5/mega-manual/mega-manual.html#faq)
>> +SYSCONFDIR_VALUE_class-target = "${sysconfdir}"
>> +SYSCONFDIR_VALUE_class-native = "${sysconfdir_native}"
>> +
>>  do_fix_sysconfdir () {
>> -	sed -e 's|/etc/ssl/certs/java|${sysconfdir}/ssl/certs/java|g' \
>> -	    -i
>> ${S}/src/main/java/org/debian/security/UpdateCertificates.java
>> +    sed -e 's|/etc/ssl/certs/java|${SYSCONFDIR_VALUE}/ssl/certs/java|g' \
>> +        -i ${S}/src/main/java/org/debian/security/UpdateCertificates.java
>>  }
>>  
> 
> No.
> 
> It's probably best to remove the BBCLASSEXTEND statement in this recipe
> instead, as it was never tested, and is unlikely to be needed.

We have a use-case for -native and this series fixes it.

> 
> The whole idea is to make this independent of the build machine paths. If
> you want a -native version of this, you still need to make sure to point
> this into the yocto sysroot. Otherwise this will try to write to the *build
> machine's* /etc/ directory!
> 
> If you really want a -native version, you need to point this into the
> sysroot, and update this dynamically because of sstate usage, too.

Ok, I suppose that ${sysconfdir_native} has mislead you -
it does _not_ resolve to an absolute path into native sysroot.
The value of ${sysconfdir_native} is always "/etc", it does not mangle in any way (that's why I have used it).
So this don't have any issue with sstate or else.


> 
> 
> Cheers,
> Andre'
> 
> 

-- 
Sincerely,
Yevgeny Popovych

