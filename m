Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id AF2CD71633
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 17:29:27 +0000 (UTC)
Received: by wicfv10 with SMTP id fv10so13619702wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 10:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=cNEBXZ7MqcF2QeWHCaWd4Gc60/a8vSIPsed2H2HJ0oc=;
	b=JW79Mp1DZqrsZLS9uuEOZsChyM8Lz9C7PM/xz2Cdi5vHuWRDLAMnIwcPIIkVkOVpkf
	ElB0/yRR8kxhKaYooYLeYBD8Yv96WjXfjMPOV38oYKaPVlcjQmUhRkFA0FO3/DPdh3Z2
	cnaShB2WJVPVI9TEPsa1fVLbtAr/fE6iD3u3QtDZ4kcsMBR5oNk3w++OXyVBgb85Gy+w
	sD6NspOM/XRfFikGctf9kDWw5L/xYtWD8zShf63ZJxk/732CAJWm6EUeyxikq39EAASa
	q3hhYD2PL0KzHcXNRsmep4NAk2lT45bgd9QIiUrSRdglV/3xmZgnJFc+oVCTRz1nG/kt
	TX9g==
X-Gm-Message-State: ALoCoQkyR2jnDpCEe57g7X8I5e8OJ63toaXK7f5p9AIlGNjkRuO6VWOlfg8STVrVu08u3jrK8xYn
X-Received: by 10.195.11.74 with SMTP id eg10mr12101269wjd.33.1440782967058;
	Fri, 28 Aug 2015 10:29:27 -0700 (PDT)
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com.
	[209.85.212.169])
	by smtp.gmail.com with ESMTPSA id 4sm8940000wjt.46.2015.08.28.10.29.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 10:29:25 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wicfv10 with SMTP id fv10so18143893wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 10:29:25 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.37.7 with SMTP id u7mr5567864wij.79.1440782965464; Fri,
	28 Aug 2015 10:29:25 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Fri, 28 Aug 2015 10:29:25 -0700 (PDT)
In-Reply-To: <55E009D2.6010106@skidata.com>
References: <1440724441-692-1-git-send-email-vinay.k.awasthi@intel.com>
	<55E009D2.6010106@skidata.com>
Date: Fri, 28 Aug 2015 14:29:25 -0300
Message-ID: <CAP9ODKrt7jhFtN6JWFqqbSnJxyX4kAc77CkigOCChkV4gz=-Cw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
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
X-List-Received-Date: Fri, 28 Aug 2015 17:29:30 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 28, 2015 at 4:12 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> On 08/28/2015 03:14 AM, Vinay K. Awasthi wrote:
>> Rebased it again with latest change-set and tested it on oe-core master with latest mate-openembedded.
>>
>> There is no change in recipe.
>>
>> This enables OpenJDK-8 jre/jdk for x86 and ARM.
>>
>> This recipe is tested for arm (zero VM) and x86 (hotspot vm).
>>
>> To build just use bitbake openjdk-8.
>
> I successfully compiled and tested it for/on an ARMv7 Cortex A9 CPU:
> # /usr/lib/jvm/java-8-openjdk/jre/bin/java -version
> openjdk version "1.8.0-internal"
> OpenJDK Runtime Environment (build 1.8.0-internal-leri_2015_08_28_08_47-b00)
> OpenJDK Zero VM (build 25.60-b23, interpreted mode)
>
> Also X11/awt/swing works fine! Only problem for me is that ZeroVM is
> running in "interpreted mode". Therefore my programs are running really
> slow.
>
> Was the "mixed mode" available/working in your tests?
>
> IMHO a working JIT (=> mixed-mode) is a must-have for merging this patch
> upstream. What do you think Otavio?

Yes, I agree. There are other people working in OpenJDK 8 here[1] (at
ml) it seems so maybe we could share some ideas on how to fix it.

1. https://github.com/rehsack/meta-java

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

