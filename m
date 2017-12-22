Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7079B7888C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 12:26:30 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id n18so15711272otd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 04:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=mS3qbjDN6s+IT0SzMygHg7Xh4an9JS30HMXrn+y8Zr4=;
	b=ctbX0GKS6J22nQdfoniqrfTUMcDDLgzYn0PfkO/Etfw9p+9e+Q8bGTwai5YX/b2EEW
	aZFu9u5SRewEeHRWQ6fR7qfdjWhyqYshFIAT1kk/neXe3EH2h3T4tS2j5lxMUZsDzXYZ
	CHvuHeazUDWmRcUyOYdT/iwmtI6nOyFmn7Sjc/Rl+iBGfA6gdnu7raai9iPtkgtQqxn5
	1RPO2lFFaiU/FjC0oqw88cqZBHCMDwib3kUkIlXCgLz+i66TlNc+Nb+Rz02ibP7mfUMa
	oD8e2JsK8YwUjbwjg16IJqtNlno46sQzS5fTzPf6+1cCFlRKXQxu4q5ttuhCIjIDT4F6
	Ofsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=mS3qbjDN6s+IT0SzMygHg7Xh4an9JS30HMXrn+y8Zr4=;
	b=fT0uMxOJpR0KvxVsjjzgnhLGx+KPZE7I1W5w0KbbrmiAcynwG+RoJJKh+8xVmjTlSH
	EDegedA5GvmT61gj3XbC3S2BQ84huRRtrMELnrXv8agAmv/4m/a2yxxpYx8dqGzCrul6
	oayDEvpUn4eQVTjb/W6KjiBUVPA2iTZxbL+VVPYDLYkYzrjSNIdkUS3qvMy7em71yjpA
	I83hZYaKQc+F6uIBsiiBzArgrzV89V0q1+U06kY81Js/JA9kPEhwr2iRr5VWiQ2QHPrs
	qqqelCcDg3OefpoBGchAGQjLvfL0gilWB8JLSdzENDnJJhXt6qpFeYfp76QQLvLr5XtC
	662w==
X-Gm-Message-State: AKGB3mLHlgHoD2Uplu/Gv6p9kHlsN31AAAwRIXnCasHNuh1/Y6syzE8G
	pkMNSSpUvapOp1iXXb6ngCBFIcGQ
X-Google-Smtp-Source: ACJfBovXbuIDxXonl+jnVAHX6rP8bjuC0YRv6NwvkDXz40MjDXNfWZ/aMCJzsRvmjqsNatXVc6WfqQ==
X-Received: by 10.157.10.72 with SMTP id 66mr3238156otg.133.1513945591030;
	Fri, 22 Dec 2017 04:26:31 -0800 (PST)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51]) by smtp.gmail.com with ESMTPSA id
	u19sm10618962otu.41.2017.12.22.04.26.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Dec 2017 04:26:29 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id j14so7622864oih.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 04:26:28 -0800 (PST)
X-Received: by 10.202.182.196 with SMTP id g187mr10601603oif.216.1513945588527;
	Fri, 22 Dec 2017 04:26:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.41.233 with HTTP; Fri, 22 Dec 2017 04:26:27 -0800 (PST)
In-Reply-To: <CAPbeDC=7U8UMCzDnL2MoQW18JMDpLPBnSbHKf=mmOk0GnSiBKw@mail.gmail.com>
References: <CAPbeDCmTsCfrCAya_XQhN+Y5tKW7QnHQjeQThh6iT5ecneLEsw@mail.gmail.com>
	<CAPbeDC=7U8UMCzDnL2MoQW18JMDpLPBnSbHKf=mmOk0GnSiBKw@mail.gmail.com>
Date: Fri, 22 Dec 2017 10:26:27 -0200
X-Gmail-Original-Message-ID: <CAP9ODKriaPa3BsT8WnM8iG69m5aMvEf=0=iYKk0ngOndsu_43w@mail.gmail.com>
Message-ID: <CAP9ODKriaPa3BsT8WnM8iG69m5aMvEf=0=iYKk0ngOndsu_43w@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] pyro, rocko and per-recipe sysroots
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
X-List-Received-Date: Fri, 22 Dec 2017 12:26:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 22, 2017 at 7:30 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> Hi,
>
> On Fri, Dec 22, 2017 at 8:55 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>> Hi all,
>>
>> I'm trying to get a recent yocto build together with meta-java up and
>> running, but ran into some problems:
>>
>> 1. For rocko, I don't see the corresponding branch in meta-java,
>> should I use "master" ?
>> 2. For pyro, there is a branch in meta-java, but the build fails
>> unless I backport the patch in commit
>> c4b9b97c7c60ad5c0c3392ccf143b2e4e6c7df24:
>>
>> "java-library.bbclass: compatibility with per-recipe sysroots"
>>
>> Could we get this patch officially backported to pyro ?
>>
>
> One more patch I needed backported for pyro to build:
>
> 2a706cd2d656a203ecb83bef1c687703c969732e
> "icedtea-native: Fix segmentation build during build"
>
> since I'm on Fedora with a recent gcc7 I assume.

I backported both for pyro; please try rocko using master ... I've
been using it without problem for few customers.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

