Return-Path: <uvv.mail@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 559F37E07D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:37:02 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id v7so4494621iob.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 06:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=qBGLEXD3gNQufCd5URBk6uJQI0HKrSQVDBZbOM2TI9o=;
	b=kKSyvzSiYVFg/D5B6REcsXBsphV/1EBFREYoD5umO1ys9PdNnDPtpTsXhenEceS1X8
	0UyJ8jwZGjN/HmtQmohAUYbdrSSVapHO6KSZDRkNxfT+NltzsvYCPyDUVYtN0TI6fOW1
	k3LDoflnSoa7soSo414Z9obRd06ceOf5DZ7C4yas3tmgf0FI6nuMZRzvkhxL+rBf5hKB
	CWN8hfq9Xcv1SDKkJh+paUz1CXM7rwQ80S7+jqPiU4lggTreIOcP5qkNSv8hzf0S5JTY
	8niSjw3Ns1+8Zhi7OcpweGYZqfLdBlwi8w3GUOalW5heDQ3Hjd24zCRsQW7HkcTdGf9Y
	RTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qBGLEXD3gNQufCd5URBk6uJQI0HKrSQVDBZbOM2TI9o=;
	b=Y22k92DjLKbK/1igOqP1H8SljmiGQD8mRRVB8GbQUYUrWuWPbannEgYx8HISAnwwE5
	L7bJtdKQt9q3H+kxKP3jwyxjct8tIz4N2lieBMe1/UCxvc+tC3KlVTxDKZYn0logsPq8
	bOFE42zmWN4p0BdYdtFi/WXVvKY0zpT6sV3Kg8saUxtuHV2WhDPp0nfswaCgMUqBzGWK
	oKB8CMyIIrylIE6y7XfdR2tRzashGc5Up4jmLqZKtU7xV2ectzljvQ9CBUM2hkBeYRgH
	dYPmHvjqCeLBnG8YqwbXBnPszTR+kfvxEypEhgCCguqKWfeaUZak0xLiWEAtcys6n2t8
	aa/Q==
X-Gm-Message-State: APjAAAVPsEzLra1mspQDcAtq1RdrB5fD36QlX232EtiXp0tJjI+0z1Kc
	h4B1MtcP+P00StzGMrXnf/Q5N9FiDl404w==
X-Google-Smtp-Source: APXvYqwCBEnSTbsdXx8tLrT3Ex0zwP3ugpK7WmRb9Jy7c8sctcnCBqK6Ze/vXKPWp2R7ccq6GkVyvQ==
X-Received: by 2002:a5d:8712:: with SMTP id u18mr6567000iom.18.1557495423024; 
	Fri, 10 May 2019 06:37:03 -0700 (PDT)
Received: from Vyacheslavs-MacBook-Pro.local ([67.215.13.230])
	by smtp.gmail.com with ESMTPSA id i8sm1808720ioj.26.2019.05.10.06.37.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 06:37:02 -0700 (PDT)
To: Belisko Marek <marek.belisko@gmail.com>,
	OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
References: <1551959871-9647-1-git-send-email-marek.belisko@open-nandra.com>
	<CAAfyv36SJe1D=qQA_jDdRBbv_VAJEUBvimSxc8vhVNRoZ4C=DA@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Message-ID: <2ce57835-2253-0579-c54b-bd9adde559ea@gmail.com>
Date: Fri, 10 May 2019 15:36:59 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAfyv36SJe1D=qQA_jDdRBbv_VAJEUBvimSxc8vhVNRoZ4C=DA@mail.gmail.com>
Subject: Re: [meta-java][PATCH] jamvm: Disable inlining
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
X-List-Received-Date: Fri, 10 May 2019 13:37:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Marek,
Thanks for your patch. I can confirm that this resolves the Illegal 
instruction issue for me on gcc-7.4 and Morty branch. I don't think 
there should be any difference for master branch regarding this fix, in 
other words it must be applicable to master too.

Thanks,
Vyacheslav

On 30/04/2019 09:48, Belisko Marek wrote:
> Ping. any comments on this?
>
> On Thu, Mar 7, 2019 at 12:57 PM Marek Belisko <marek.belisko@open-nandra.com>
> wrote:
>
>> This will fix crashes seen when build openjdk-8:
>>
>> ERROR: jaxp1.3-native-1.4.01-r0 do_compile: Function failed: do_compile
>> (log file is located at
>> /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894)
>> ERROR: Logfile of failure stored in:
>> /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> | Illegal instruction (core dumped)
>> | WARNING: exit code 132 from a shell command.
>> | ERROR: Function failed: do_compile (log file is located at
>> /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894)
>> ERROR: Task
>> (virtual:native:/home/jenkins/meta-java/recipes-core/xml-commons/jaxp1.3_1.4.01.bb:do_compile)
>> failed with exit code '1'
>>
>>
>> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>> ---
>>   recipes-core/jamvm/jamvm.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
>> index fc21380..8a1ed63 100644
>> --- a/recipes-core/jamvm/jamvm.inc
>> +++ b/recipes-core/jamvm/jamvm.inc
>> @@ -29,7 +29,7 @@ do_configure_append_class-native() {
>>   }
>>
>>
>> -EXTRA_OECONF = "--with-classpath-install-dir=${prefix}
>> --libdir=${libdir}/jamvm --enable-ffi"
>> +EXTRA_OECONF = "--with-classpath-install-dir=${prefix}
>> --libdir=${libdir}/jamvm --enable-ffi --disable-int-inlining"
>>
>>   # Needed for big compilation targets like OpenJDK
>>   CFLAGS_append_class-native = " -DDEFAULT_MAX_HEAP=1024*MB"
>> --
>> 2.7.4
>>
>>
> marek

