Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4322F6011F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 14:07:34 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id 1so35157310wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2016 07:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dW8yztC1dXuvSQa1P/pLJYbiUSpPZS8dbtx/4dJTc+w=;
	b=m39xs2btO2sQuLenovkgwQ7nJ9a2lawS9ywap1baULZiSiWhk+7X2GemMpMA8EsIQq
	/Wv7K9UumApUUk8XpjSLAcy4ucyYKvHcflJKXR/UJU5hu0Id4c2yqPpxjjZaQzrPJBTC
	5QXUCaCohwLlLZF4ETSW1IS4MiGu/kRd489eRrMC1KijU5/Xhj6qp3rKobfVoZRPBVI9
	f/n2FTQurHfHExWrFsV4j6OgLxySamQJ4k8bzisHlEQEjwDfGqAl36mvEDnbXCvB/yXo
	53snmdgt/t0rNy2A3S2yMMEA/3KyyMLFhxNxAHQ3KCJW+TfpRViZdHYGGFdbF4BLfvKX
	5aZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dW8yztC1dXuvSQa1P/pLJYbiUSpPZS8dbtx/4dJTc+w=;
	b=Nwt+yYVt3pS+hOGFEkrK+r0rZp3hbgYYTNrYlSuT8lsI/d9JYUgo6sMuU8e+PNKxkY
	OAPtvh46+TiWyTN9ZzED8vEJtxUEdyGKSm6qOe0x+YXdgcnQIwP0hNyk+Fptr4xJIShb
	IQdOjPhlz5QzFSzhV67SCt1PljNntv5KJyKjfGc6OJcE1NjUFzxM0vxWJFTX2/zIC3tG
	rrwOpz8K2A1CVPO4mcXebxQxMoYaBTrOhoY1L/HC+SPsA3buJh/U40fOnMmtTeKXgfgX
	vtMN1CacrrZzR0plhumk/+Gw4FtaHHIJtjfFmLWVs5iFNNfqd2/lysxTwbJru+xq5SfU
	UXfw==
X-Gm-Message-State: AE9vXwMeYXn2lqD95OEUN1OrEvcgU/KXJZK3dxAM9vC4jFbdDh38z+nWawQdadJ2av30S8pIhcoSOjGAdPivQw==
X-Received: by 10.194.85.45 with SMTP id e13mr3284421wjz.5.1473430055253; Fri,
	09 Sep 2016 07:07:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Fri, 9 Sep 2016 07:07:14 -0700 (PDT)
In-Reply-To: <1473428952.20354.2.camel@intel.com>
References: <1467977051.1401.9.camel@intel.com>
	<CAPybu_1eaFHPHJTksdQZFqt3SGJmPKKrHsZYFPkYkRuybnu8yw@mail.gmail.com>
	<1473428952.20354.2.camel@intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 9 Sep 2016 16:07:14 +0200
Message-ID: <CAPybu_2kKVZHoq6uC_pqo+bDx7bEfrXPNKB4_P2Hwag27tQs1g@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Henning Heinold <heinold@inf.fu-berlin.de>
Subject: Re: [meta-java] icedtea7-native - IOException constructor compile error
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
X-List-Received-Date: Fri, 09 Sep 2016 14:07:36 -0000
Content-Type: text/plain; charset=UTF-8

Not very promising :)

Could you share your

build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/config.log
?

and the

PREFERRED_PROVIDER



Thanks!

On Fri, Sep 9, 2016 at 3:49 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Fri, 2016-09-09 at 15:10 +0200, Ricardo Ribalda Delgado wrote:
>> I am struggling with te same issue. Did you manage to fix it on your side?
>
> It hasn't happened again. So no, I haven't fixed anything, it just works
> now. No-one was able to explain how the actual bootstrapping works, i.e.
> which IOException.java is meant to be used when compiling openjdk-boot.
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>



-- 
Ricardo Ribalda

