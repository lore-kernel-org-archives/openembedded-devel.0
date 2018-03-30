Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id EF21C74615
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 07:49:37 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id 80so7369843wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cKzAOftNKDeWcY3SVkuI9ze2XLDlg9Kb09nCEEnRDQA=;
	b=iiD8TfoHiaRG8ClMxiPsbiVTp8Y1JigFhv6D72lC7VlffD2uf2C+g1lMb7Cfn9vl4v
	PqkLTTX4ZcnJcWpJ+kCjTU1ed6yIsVWCV0sEljUd0/25dU4DE65bA2L0L36yttV91kGw
	BxMhNbRv5ngNSClOlzZhhm1LWBX6o5JR/nFXXXJ1fqf9YubzM4k0gDQBvGAea8VgS09V
	F4zvSaQiIl7ZD6BwgcnoqqGuV+H3UfdzYiDDLvqsFJSydbEPu5dw9m3rhiaOdwyauoTF
	dAiEmE+j6cXl9RIYaHQ20lln06sg6SWTliTWbb0Ef+ut5nwSEjdYMmndCYsM3bPYtBtm
	Olzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cKzAOftNKDeWcY3SVkuI9ze2XLDlg9Kb09nCEEnRDQA=;
	b=rjTCg+v3bCsRPJVxnRLJPKzso9Zgl0I04bXFKzxVO8WSGLrL/BdaqXrA3k0Oszlnhv
	TbIiuBGFlajU2kOgQfuWqqMN1s0LwoVa93r00cIOQohUxWc8J84Brf6d5C+3Hh1eABXq
	r3UegJOZzLpMDmJ9tASPnfi6rHVxoattcyRPSKJ32jVzKqnnEAIzMRZSmgrXcl/aF7YK
	3RzMqgbW4zJnsZ11Kfy+rFtCJf3dyDIiTqNbYqUvzqc+6ytcoKTqOHgh7wpwInjSGZG0
	Epe6GmKEUahY793dQLk4Ztnjq6gFEVN/s0T3hFtmN8A7wGMKrfJkcOq0a6dlTkIDZUjQ
	/EpQ==
X-Gm-Message-State: AElRT7GpyApypecb69bRt7Tsr17u8Pqo1HOQv5CSDBHKKZHZV20L0+7R
	8jLPtHCDrbVMeswa5l9NAaDyLhlOz4oTYyN8PpI=
X-Google-Smtp-Source: AIpwx49fu/n5lefVQOmSCDNca1goimLEIX3tYB6ItpiLh35YPAthHyrdckU8hRPw1th1PPR+vIWnAOa79m2Czo7TMsY=
X-Received: by 10.223.134.4 with SMTP id 4mr8665497wrv.230.1522396178474; Fri,
	30 Mar 2018 00:49:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Fri, 30 Mar 2018 00:49:37 -0700 (PDT)
In-Reply-To: <614450b0-7ac5-afa3-a7a0-d0f0e50b34b2@mvista.com>
References: <1521641775-2171-1-git-send-email-akuster808@gmail.com>
	<1521641775-2171-3-git-send-email-akuster808@gmail.com>
	<CA+chaQc8wWibtJ1yAV3wvR5q7T85qfVpafpGVbhAzLqV9eOFww@mail.gmail.com>
	<614450b0-7ac5-afa3-a7a0-d0f0e50b34b2@mvista.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 30 Mar 2018 09:49:37 +0200
Message-ID: <CA+chaQeBmLKt3-JQbiCWjchs7=vc=PiAgWNq+rY=HHFLbiHWzQ@mail.gmail.com>
To: akuster <akuster@mvista.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/4] libxml++2: remove X11 distro check
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
X-List-Received-Date: Fri, 30 Mar 2018 07:49:38 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

looks like v1 was just merged to master.

Regards,

On Wed, Mar 21, 2018 at 9:01 PM, akuster <akuster@mvista.com> wrote:

>
>
> On 03/21/2018 08:10 AM, Martin Jansa wrote:
>
> You can remove distro_features_check inherit as well.
>
> V2 sent with change.
> thanks
>
>
> On Wed, Mar 21, 2018 at 3:16 PM, Armin Kuster <akuster808@gmail.com>
> wrote:
>
>> looks like its not needed.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta-oe/recipes-core/libxml/libxml++_2.40.1.bb | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
>> b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
>> index c3d647c..a38315c 100644
>> --- a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
>> +++ b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
>> @@ -18,8 +18,6 @@ DEPENDS = "libxml2 glibmm"
>>
>>  inherit distro_features_check autotools pkgconfig ptest
>>
>> -REQUIRED_DISTRO_FEATURES = "x11"
>> -
>>  do_compile_ptest() {
>>    oe_runmake -C examples buildtest
>>  }
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>

