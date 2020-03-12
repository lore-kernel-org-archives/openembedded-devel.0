Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id A84E961C2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 16:09:39 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f16so2847576plj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 09:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hwqO7vX/oWzIi4YjilM5rxJdIy6mbgGHnj4wIApNa3Q=;
	b=Ups7mAQ+dsnxadTdrJQlkW/93RhxMes4zfSh0+hWPwJF5OCmrmbnfhCbD4aU0J9tv+
	lewIaEg5KTMHGXdrESzPIdaland2EEzI+HDfdiXEPw7dUHJM4PSfauqw7tTOTc/lYU66
	0+kcnVq3g+z+Cc2Y8tU0WTvu86GKfBZ99/u+Y+iYhPtyW7bTJga/7iOyFxWRWRrOa4y1
	+W0Aezce+OdON+Bw2OeAiVMYnN0W0hVQgG7rWB14DB3qzOfDCXXHy5k90Y0Q5FXwVLvm
	7wDNNMVQtWPAwCNmM/nSbvWEuN2YP41KDUch25xkqKS4N5bFmJf3/l8HQE1H0Gnbqh0u
	zczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hwqO7vX/oWzIi4YjilM5rxJdIy6mbgGHnj4wIApNa3Q=;
	b=Z1wuKTDWBPuaJBPtklUtaycxvn/mgJrHgDC8yNPvTo/fotifctRLIcDgm42M+p7jun
	NCaZQ6nMOBRVyXsHvvEzC1cxsMgdlHETKs1X/9UVJeTxujapmZ02QI8//yYVTBJtWSRp
	svrYgCosZgurJSVwdIONYYzpvjrzoFl592JNWlF2ywsxrrcNHjF4f2ORJCU3dlOrS7Jh
	PP/UPgjRzyyFtRj0w/qrcASOfdtIwAZ4kQ4fqxWNnGSKSh1fW6QIn8MCrtki7PlTRAv9
	xEFrmYd/tLkLcJQJuDtzE5Z7mQDDB+ftLh+iCHRVDAuVnTsA3+xdqOc26EO1fjnhmyMn
	HE6Q==
X-Gm-Message-State: ANhLgQ0BgzXD2fpxO+tuOnodFeGWaWfbx7+e9vxiv7sXWjt3ntcZf/V4
	1HgJCWWhcdk08LblShlOwOP9K4YZk+w=
X-Google-Smtp-Source: ADFU+vtoVuKn5gMQb1WlaUkHLbNvg/k7IrC2Td72ef/RwcYak4WCpbDDuqyDbM9W36Y0acI2VhtqNQ==
X-Received: by 2002:a17:902:d684:: with SMTP id
	v4mr8750775ply.112.1584029380246; 
	Thu, 12 Mar 2020 09:09:40 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0:d558:25ee:538d:b97a?
	([2601:646:9200:4e0:d558:25ee:538d:b97a])
	by smtp.gmail.com with ESMTPSA id h6sm8856885pjk.33.2020.03.12.09.09.39
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 12 Mar 2020 09:09:39 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20200229185539.3905864-1-raj.khem@gmail.com>
	<CA+chaQfxab4+mepbvxdNkoj4h9T1T5Qq4TWwne2teiexjyuwnA@mail.gmail.com>
	<CAMKF1srZjHaeuTD0FLv0kmmn+Gwq9QThHxhGXB0+WSBSo2bEJg@mail.gmail.com>
	<CA+chaQeF7U2C+t+zugHFry2bpxiFbfa294_A_dnfmdvJ-3pw9A@mail.gmail.com>
	<CAMKF1spqvnHXTOMWX8VV4QponpKun+2tpZS4hAG5JpDDdv8xgQ@mail.gmail.com>
	<CA+chaQcTRNcXnWX67kRts_K6cBdR9gun3qdqBX5nREts0ymH-g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <f8165f06-2341-e19d-5135-cfee6cba28fe@gmail.com>
Date: Thu, 12 Mar 2020 09:09:38 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcTRNcXnWX67kRts_K6cBdR9gun3qdqBX5nREts0ymH-g@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sysdig: Upgrade to 0.26.5
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
X-List-Received-Date: Thu, 12 Mar 2020 16:09:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 3/12/20 7:14 AM, Martin Jansa wrote:
> It doesn't seem to build for aarch64 without the jit in luajit:
> 
> | DEBUG: Executing shell function do_compile
> | NOTE: VERBOSE=1 cmake --build 
> /OE/build/tmp-glibc/work/aarch64-oe-linux/sysdig/0.26.5-r0/build 
> --target all --
> | ninja: error: 'libluajit-5.1.so <http://libluajit-5.1.so>', needed by 
> 'userspace/sysdig/csysdig', missing and no known rule to make it
> | WARNING: exit code 1 from a shell command.
> | ERROR: Execution of 
> '/OE/build/tmp-glibc/work/aarch64-oe-linux/sysdig/0.26.5-r0/temp/run.do_compile.51845' 
> failed with exit code 1:
> | ninja: error: 'libluajit-5.1.so <http://libluajit-5.1.so>', needed by 
> 'userspace/sysdig/csysdig', missing and no known rule to make it
> | WARNING: exit code 1 from a shell command.
> 

luajit needs 32bit compiler on build host, so I wonder if thats the case 
here. I have not yet looked into it, but I have seen this failure on 
aarch64 as well.

> On Tue, Mar 3, 2020 at 4:27 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
> 
>     On Tue, Mar 3, 2020 at 5:53 AM Martin Jansa <martin.jansa@gmail.com
>     <mailto:martin.jansa@gmail.com>> wrote:
> 
>         Should I send the patch to move grpc from meta-networking to
>         meta-oe to fix this or do you have it already?
> 
> 
>     Please send I don’t have it ready
> 
> 
>         On Mon, Mar 2, 2020 at 6:22 PM Khem Raj <raj.khem@gmail.com
>         <mailto:raj.khem@gmail.com>> wrote:
> 
>             On Mon, Mar 2, 2020 at 4:27 AM Martin Jansa
>             <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>> wrote:
>              >
>              > Hi,
>              >
>              > added dependency on grpc exists only in meta-networking,
>             so this fails to parse now.
>              >
> 
>             I think grpc is common enough to belong to meta-oe as well.
> 
>              > Cheers,
> 

