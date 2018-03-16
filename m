Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 966716FFF7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 16:39:42 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id d1so4283074pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 09:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=YKLxJ2zko6X8Thi677M/Drmz534nCshlYcjNPt02CQ0=;
	b=PJg5/FEY7a1+qMXIhFGEQu/4q1mLRhBMGQuA7Or7axaG+7gtFKmFRTuA6XTrq4cQu9
	/iFufe8/ZqEY4ipO6yhTaaX/f7n722sI0DhwqBqDcjc5/wY3kOIYdhV3ve/IgUlb+AlP
	9t9hjxJZidn0+prv2bCfIx4rNpXLmWQMbDHv7Dsh9jsji2fdaddXCkylFCj/Ze0X5l3c
	bhKYBMTH1b5QX4cnqM74/eySlqN946puTann21DEGHuDFlYefIun8ZbJeyybzNN1SOGY
	ua6Hyv1l9Iz4D7ep1oAPTQpDRV7PYKZgMWZW/Mi95gEMaZHkNjdlM6k/BxV3gr2Q+Jzy
	fhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=YKLxJ2zko6X8Thi677M/Drmz534nCshlYcjNPt02CQ0=;
	b=CmzqiOjRgb7DFyQXrUWqjkCCBh64lYVY4tyS+mPOlO2eu7186b8yqmEz2+86c61scz
	YAAyPjfkoN9KVrt/K6y2F4yxiYFRBxH5CLC1qEZyf+/95ulyIK/ssLZ2q2HQGYr2kOH8
	gWx7yr0hSaaBT16Hw/ecxbgWVs/gdpl+K9CSXv1fEPlZKcHlJAfx3AjMIX9FJDG9YYZo
	2yUWoCSBwpvFvCQE7JVuyQyLip7QX7covkAad1kM597rI53jgWAA6dmfvH5H0Z9BR0l3
	19yPFWptrq+6lCNkdxe7mYe4VLFJdL7QIz+q/q1SUD8dtCR6j9RHMzcDBJGcbSRg8fdX
	O9rw==
X-Gm-Message-State: AElRT7H0XBqIylFfzvDs/i4DNv5qCVU9poVm+eyRvRrDPjlDb71wp+Ud
	Kr7YwcsvXJZDiNHj/o107CxhrQ7y
X-Google-Smtp-Source: AG47ELuZV2hOR0yFQfvrGWE/x/MssSAIh/NIsNdinNN5YHXnHCN9bvQq8j2TkF2iSQjaGeoo9QQnbQ==
X-Received: by 10.99.167.66 with SMTP id w2mr1945156pgo.357.1521218383556;
	Fri, 16 Mar 2018 09:39:43 -0700 (PDT)
Received: from [192.168.6.215] (ip-64-134-134-5.public.wayport.net.
	[64.134.134.5]) by smtp.gmail.com with ESMTPSA id
	x14sm12276775pgc.13.2018.03.16.09.39.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 09:39:42 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
	<1520395408-19266-20-git-send-email-akuster808@gmail.com>
	<CA+chaQc23Fs6xdFF==qWb5Nid9hvFoFqYyL9nvURHQo_GRLqvw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <a7b63985-1e9c-f40a-f97f-1e1de23dad20@gmail.com>
Date: Fri, 16 Mar 2018 09:39:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQc23Fs6xdFF==qWb5Nid9hvFoFqYyL9nvURHQo_GRLqvw@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 20/25] libxml++: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 16 Mar 2018 16:39:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 03/12/2018 11:40 AM, Martin Jansa wrote:
> What in libxml++ requires x11? I'm building it in DISTRO without x11
> for years and never noticed any issue with that.

I was using the yocto-check-layer on meta-openembedded to clean it up
and most likely got the recipe name wrong as we had a lot of cleanup.
I send out a patch to remove this check as it appears to not be needed.
thanks for catching this.

- armin
>
> On Wed, Mar 7, 2018 at 5:03 AM, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      meta-oe/recipes-core/libxml/libxml++_2.40.1.bb <http://2.40.1.bb>
>     | 4 +++-
>      1 file changed, 3 insertions(+), 1 deletion(-)
>
>     diff --git a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
>     <http://2.40.1.bb>
>     b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb <http://2.40.1.bb>
>     index c001c18..c3d647c 100644
>     --- a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
>     <http://2.40.1.bb>
>     +++ b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
>     <http://2.40.1.bb>
>     @@ -16,7 +16,9 @@ SRC_URI[sha256sum] =
>     "4ad4abdd3258874f61c2e2a41d08e9930677976d303653cd1670d3e9f3
>
>      DEPENDS = "libxml2 glibmm"
>
>     -inherit autotools pkgconfig ptest
>     +inherit distro_features_check autotools pkgconfig ptest
>     +
>     +REQUIRED_DISTRO_FEATURES = "x11"
>
>      do_compile_ptest() {
>        oe_runmake -C examples buildtest
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


