Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7EB60401
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 10:09:01 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id s12-v6so4501097ljj.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 03:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=wDa6YQUEl39mBkea5DeucxvRjY9v6ncMAA8h4Plf3eA=;
	b=B29EpZUpQIJC1RXSTA7tlx3fdYC5y7IjVRQPnYZoddj1WgVkuZuj4ywajNIU6PRIDd
	6UN7pVFeVCiBYxZ6fAbsVzO2dpiJQsREJqHWVlUCLjRm9TteaYz417GEU/EhCvZ/IXLL
	Z76R54EclI1/sXkdYEZ58b6MXj5BKkp0GDWhbQCmaCFO1phq7gBe47p1T2bAQZ2uWaQK
	Mq4f3Z5EYXg3+6IAWRi0jpaoWCKt4ByXtDlUZjT36roMZonWxP5J4mXrzOTjq5ppAKjJ
	XMpuANeFMbDXvfspXNEXbXvUHoKLsXRrrwn/mvn4sY5dIAGjL2HjcwX06yKjhOqgcVpt
	AsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wDa6YQUEl39mBkea5DeucxvRjY9v6ncMAA8h4Plf3eA=;
	b=fLpL+9VHjDq9xtC//68M8/D1QCxTDj+Fto0k4R64Q+OW8uxuFn7BufdKyXlmO4F3fR
	o7IqXl1W5cy9EDjJmvf0a1JDfaHdzeEic2dIkXzlCyahxIexo14Sj1q2Au/XJO51WZws
	MSRMA14LBiWLit5VgwxXLI3pHH7dQxMJ8YKJmPnZyKrJo5u9jXg4Ruzm2xVF7b3fYjXN
	UmssHjbDYmYJVUjinqTicVHQVQ880zk3yLHIwIb9DHGmMbQakC2e7FULGzh6sqSIluEA
	+xnFak7QxiBs0ofGJFcmHaVehV+25hVMykwMarWFhUhsw2TbGgyBjNdX8vrR93Ae3Rsf
	7a4Q==
X-Gm-Message-State: APzg51DMFFTaPFtfbdxTrgerIsp8xkCMw0othqB0qOLmB4x3dP310jdu
	b3JYwoF4o4FYr6HrT2dPaLiKPXWoEW4=
X-Google-Smtp-Source: ANB0VdaXAGzZHzXsnfbG4Pk4WyOJmzjwM0+iVEOCKj7v2QQMaXMX/reN3tvsoRIkeJbLF2F9S1OvbQ==
X-Received: by 2002:a2e:2096:: with SMTP id
	g22-v6mr21445012lji.37.1537351741665; 
	Wed, 19 Sep 2018 03:09:01 -0700 (PDT)
Received: from [192.168.225.135] ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	i28-v6sm969510lfc.87.2018.09.19.03.09.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 03:09:00 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-devel@lists.openembedded.org
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
	<1536343810-87649-4-git-send-email-yevgenyp@pointgrab.com>
	<443986f19cf49e6d735faac8d6646a48f3ab5349.camel@andred.net>
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
Message-ID: <42aafc61-86ba-94f9-477c-3e0f4e76295f@pointgrab.com>
Date: Wed, 19 Sep 2018 13:09:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <443986f19cf49e6d735faac8d6646a48f3ab5349.camel@andred.net>
Subject: Re: [meta-java][PATCH 3/3] ca-certificates-java: Distinguish between SYSROOT and D
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
X-List-Received-Date: Wed, 19 Sep 2018 10:09:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 09/17/2018 06:00 PM, André Draszik wrote:
> On Fri, 2018-09-07 at 21:10 +0300, Yevgeny Popovych wrote:
>> This fixes ca-certificates-java-hook invocation via
>> update-ca-certificates on build host and as a native tool.
>> Provide SYSROOT variable in the postinst and consume it in the script,
>> like ca-certificates recipe does.
>>
>> SYSROOT is set whenever the script is executed on the build host
>> (do_rootfs, or as native dependency).
>> D is only set during do_rootfs.
>>
> 
> I think I'm missing something...
> It looks like this patch switches the hook script to use $SYSROOT instead of
> $D, and SYSROOT is set to $D in the postinst explicitly.
> 
> In both cases, the expansion of $SYSROOT or $D will yield the same. How is
> that fixing anything? What am I missing?

The only difference would be between usage as a native tool and on do_rootfs.
SYSROOT is always set when run on build host and it points to the files we want to modify.
D is used only on do_rootfs and is used to find the hook (jar). On do_roofs these are equal.

> 
> 
> Cheers,
> Andre'
> 
> 
>> Change-Id: Ifbf50ca705a98012e1357ebf5afa33c07ea6cd87
>> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
>> ---
>>  .../ca-certificates-java/ca-certificates-java.hook.in   | 17 ++++++++--
>> -------
>>  .../ca-certificates-java_20180516.bb                    |  2 +-
>>  2 files changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/recipes-core/ca-certificates-java/ca-certificates-java/ca-
>> certificates-java.hook.in b/recipes-core/ca-certificates-java/ca-
>> certificates-java/ca-certificates-java.hook.in
>> index 611a4ef..5e89dd9 100755
>> --- a/recipes-core/ca-certificates-java/ca-certificates-java/ca-
>> certificates-java.hook.in
>> +++ b/recipes-core/ca-certificates-java/ca-certificates-java/ca-
>> certificates-java.hook.in
>> @@ -8,20 +8,21 @@
>>  # and package update in OE, so the distinction between cases 2)
>>  # and 3) isn't perfect.
>>  
>> +# SYSROOT is set whenever the script is executed on the build host
>> +# (do_rootfs, or as native dependency).
>> +# D is only set during do_rootfs.
>> +
>>  self=$(basename $0)
>> -jvm_libdir="@@libdir_jvm@@"
>> +jvm_libdir="${JVM_LIBDIR:-@@libdir_jvm@@}"
>>  
>> -if [ -n "${D:-}" ] ; then
>> -    # called from postinst as part of image build on host
>> +if [ -n "${SYSROOT:-}" ] ; then
>> +    # called on build host - from postinst (directly or as a hook) or as
>> a native tool
>>      if [ -z "${JVM_LIBDIR:-}" ] ; then
>>          # if JVM_LIBDIR is not present - we were called as a hook
>>          echo "called as a hook of ca-certificates on do_rootfs, exiting"
>>          exit 0
>>      fi
>>  fi
>> -if [ -n "${JVM_LIBDIR:-}" ] ; then
>> -    jvm_libdir="${JVM_LIBDIR}"
>> -fi
>>  
>>  for JAVA in icedtea7-native/bin/java \
>>              openjdk-8-native/bin/java openjdk-8/bin/java openjre-
>> 8/bin/java \
>> @@ -58,6 +59,4 @@ else
>>      while read filename ; do
>>          echo "+${filename}"
>>      done
>> -fi | SYSROOT="${D:-}" ${JAVA} -Xmx64m \
>> -                              -jar ${D:-}@@datadir_java@@/@@JARFILENAME@@ 
>> \
>> -                              -storepass changeit
>> +fi | ${JAVA} -Xmx64m -jar ${D:-}@@datadir_java@@/@@JARFILENAME@@
>> -storepass changeit
>> diff --git a/recipes-core/ca-certificates-java/ca-certificates-
>> java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-
>> java_20180516.bb
>> index 7db5110..2f2536d 100644
>> --- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
>> +++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
>> @@ -100,7 +100,7 @@ pkg_postinst_${PN} () {
>>  	    fi
>>  	    JVM_LIBDIR=$NATIVE_ROOT${libdir_jvm}
>>  	fi
>> -	JVM_LIBDIR=$JVM_LIBDIR $D${sbindir}/create-ca-certificates-java
>> +	SYSROOT=$D JVM_LIBDIR=$JVM_LIBDIR $D${sbindir}/create-ca-
>> certificates-java
>>  }
>>  
>>  RDEPENDS_${PN} = "ca-certificates"
>> -- 
>> 2.7.4
>>
> 

-- 
Sincerely,
Yevgeny Popovych

