Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 35F0D609B9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 04:49:20 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b22so4958011pls.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 20:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Rets0PTVfhCmyOKka7Nwbf8ZUjksM6FuifEFDGSuG7M=;
	b=Y2zG1sWMQoz8qbr9dyT4Ymi8rjxoMrLp59sddqV7OL3q/zr3OIWVYoISPJJp9t1IyC
	Ouo/GoftuKicR/ydMx3mnDpYsnS6KUYVDa8bYMwLGBqsTtPdqqNYer4xXoDey0TjxbTQ
	HgA15baGBi+n8mX5LEfro7r0VtJDgMjNRPCIqfWO1ZsCeu55x5VbV0W4mGKFPbvaqg0g
	xMo3I3V0LJ+Q5ElIBm4IFIXXUsfJ4tgana4uEtYi2N29qbAfIM5hnFGqGEZIV85VnGFX
	+h6lNp1zLCV+/n8byvFZBM45FhTkQy1c0GDsSc/h78pvpyJFBabOOYM0k++7XWI536Lb
	lJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Rets0PTVfhCmyOKka7Nwbf8ZUjksM6FuifEFDGSuG7M=;
	b=F3tXEaOxZAbCOtJPARln1O/MzTNlAg55G8MPrso3/Lw9tqQmMrM119n+wCeeP17M8v
	nccjUu0q9E2NTp4nB2faQ8+BeAsS+gPmlqKhRZjU63+uJZ1cRJKv9F6n3YgqLpwjwMN1
	XRWfqpDZKp5Lv1QVgb2KiFY9k6muuK2S9Zt0znsW8HbIxpJW7VIul7lGgTXQIlv7jIDQ
	/bWjv97Ph5Xx2FK0aFZ4ulxITC9V1owDfERoJmN1pqrIJI27tW05H7FAtYyLUScs4icn
	pjv/tBaKx7MOoSQk9EiCJ/z0bd4pG6LaOHdazqkpOuEdWgDHLlIepXrnoA6V7Ry+7XWu
	rhaQ==
X-Gm-Message-State: APjAAAXoHtBt40Vqo2YJrbqQi2P5kgXit3AASEE68zwFcp+F0H+Y8HlC
	H+Gfomeq4v+NzGO1f3qYucBFdHwqbnM=
X-Google-Smtp-Source: APXvYqz6DFUa9Qgq4e9yDF3CIPgMOKt/AXmfmKhmqrgOtO6K5cDPFOMB+g1WY6/iPz6yxCHHzldCrw==
X-Received: by 2002:a17:902:82c5:: with SMTP id
	u5mr52081665plz.219.1582606161400; 
	Mon, 24 Feb 2020 20:49:21 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:a81f:d24b:3e8b:cce0?
	([2601:646:9200:4e0:a81f:d24b:3e8b:cce0])
	by smtp.gmail.com with ESMTPSA id
	b12sm15021250pfr.26.2020.02.24.20.49.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 24 Feb 2020 20:49:20 -0800 (PST)
To: Changqing Li <changqing.li@windriver.com>
References: <1582544446-241334-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1so3CU_NMnOKGmUJsrgaUsAF+SKM5XeFQAoX4NrFzRv07w@mail.gmail.com>
	<fc47113c-82c7-5c17-139c-3ea747eecc26@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <23aee0bf-a9f4-b002-8277-615dfa603b04@gmail.com>
Date: Mon, 24 Feb 2020 20:49:19 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fc47113c-82c7-5c17-139c-3ea747eecc26@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH] nginx.service: sleep 0.1 after nginx start
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
X-List-Received-Date: Tue, 25 Feb 2020 04:49:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 2/24/20 7:53 PM, Changqing Li wrote:
> 
> On 2/25/20 12:40 AM, Khem Raj wrote:
>> On Mon, Feb 24, 2020 at 3:41 AM<changqing.li@windriver.com>  wrote:
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>> Fix error info:
>>> nginx.service: failed to parse pid from file /run/nginx/nginx.pid:
>>> invalid argument
>>>
>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> ---
>>>   meta-webserver/recipes-httpd/nginx/files/nginx.service | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>> index 9a6ca96..65c7752 100644
>>> --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>> @@ -7,6 +7,7 @@ Type=forking
>>>   PIDFile=/run/nginx/nginx.pid
>>>   ExecStartPre=@SBINDIR@/nginx -t
>>>   ExecStart=@SBINDIR@/nginx
>>> +ExecStartPost=/bin/sleep 0.1
>> I dont thiink we should be adding sleeps instead try to lock the dependencies
>> so it happens correctly. or perhaps change the logic in code itself if
>> dependencies
>> can not handle it.
> 
> error info: "nginx.service: failed to parse pid from file 
> /run/nginx/nginx.pid: invalid argument" is caused by race condition between
> 
> systemd and nginx.  And this error will not caused problem except scary log
> 
> This should be a known problem: 
> https://bugs.launchpad.net/ubuntu/+source/nginx/+bug/1581864
> 
> other distro like ubuntu, fedora, should also have this problem, I can 
> google people report this error on different distro.

I do not question the problem but the solution, there have been 
different solutions posted to ml e.g.

https://mailman.nginx.org/pipermail/nginx-devel/2016-February/007961.html

or ubuntu fix

https://github.com/aroth-arsoft/pkg-nginx/blob/master/debian/patches/nginx-fix-pidfile.patch

perhaps you should try one of these patches

> 
> ubuntu 16.04 use this as a workaround.
> 
>>>   ExecReload=@SBINDIR@/nginx -s reload
>>>   ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
>>>   PrivateTmp=true
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

