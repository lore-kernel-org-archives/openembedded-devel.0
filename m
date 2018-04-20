Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id EED09745AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2018 10:36:38 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id o15-v6so21674877wro.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2018 03:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L8epDS5rFTNjUIecKIxeDvlcs7etvlgx6HfrYbTLuUM=;
	b=VhKOg0fHIvPzO/9HLfBcCP8DAtQd3isKY31X1msn03Pg4PMj8qlIcscKfwSXspB1Ps
	/B9utNhzyTDyTejH2T7DVIZnZ9QnvuU34Km82VjusUnaGTXB8MEa/+IQL4cyWs0dr2H1
	uACshBfZfA3RZwBj6i+LuB8BZGMKRTkbozRUvJsHK7ypWrdMK86sJ6QZlvwu9cDAHPwi
	146wOgv7udET1R6X4B8ybvPoBIBZRZl+z7TsrGmrP0liSRNnEyfz9gEjdAvTrOcDd0kq
	kNHz4WjeW7gZr1yakG1WRQZ8+3vRQI+a7A9akc5ZaPqNgKb7JmgQjXGqFWyXTNhn8oFZ
	8jUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L8epDS5rFTNjUIecKIxeDvlcs7etvlgx6HfrYbTLuUM=;
	b=qTuDTSTBkp/Ro0ZlW6cDHJMKmB0Bis6LsmJwp5JSqzpRskhCZ5VKzjrLwirFg/qH6q
	5TEsWdGbf3Q6i4ULQx45K7Mj+UwkFJHa+0oRMO45ADAzWyfTPAVR2p/iNDS/mm+ecL/C
	99AI0+U+X0CTC+QMrMOvhod1ExFrR9g6XtUmoZj24iiyRcNMTD4VVrlRxhoeSqnfbffy
	kqipF/mOQyFN5qs2dqrWlLL4TDyJiOHfWhOqkfRSNIl6LuKH5Fpd8o3hat8UwOjFRTQS
	AaX2Vtq9U3UEyqEl8bFiWOrw9GEy+OVOdWg5vLI+y4r+n8y1oEN6lMdpS/cT0gppSwRT
	PQMA==
X-Gm-Message-State: ALQs6tCwHacwrbXFipFRNf4kcs7P+DHRS6m9PIpN6hjZn5ngU6ZYm2eZ
	zU04yHCV02H31pa62zsZEFMjDutJ+dOosp2PTwg=
X-Google-Smtp-Source: AIpwx4/LuF03/YajTNEHF+TZ/JtVTRKZwusrz2VblJtD8LsxMoz+tvtX3bsxMLwj6FRrjJn8cP4bZRb7/ueqEwtQ154=
X-Received: by 2002:adf:bd03:: with SMTP id
	j3-v6mr7163176wrh.138.1524220599392; 
	Fri, 20 Apr 2018 03:36:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Fri, 20 Apr 2018 03:36:38 -0700 (PDT)
In-Reply-To: <7888fc9d-2546-8de2-8df7-2aa62015d0de@digi.com>
References: <20180419130701.1713-1-adam.trhon@tbs-biometrics.com>
	<7888fc9d-2546-8de2-8df7-2aa62015d0de@digi.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Apr 2018 12:36:38 +0200
Message-ID: <CA+chaQe_szESH15nCLM2c8-aAGSXoBb9iscqbyit9A1-A6eZBA@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qttranslations: annihilate qttranslations-qtconfig
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
X-List-Received-Date: Fri, 20 Apr 2018 10:36:39 -0000
Content-Type: text/plain; charset="UTF-8"

Different version of this fix is now in master and rocko-next.

On Fri, Apr 20, 2018 at 12:21 PM, Javier Viguera <javier.viguera@digi.com>
wrote:

> On 19/04/18 15:07, Adam Trhon wrote:
>
>> In Qt 5.9.5 there is no qtconfig translation (see commit a6b3446cb023
>> in qttranslations upstream). But packagegroup-qt5-toolchain-target
>> RDEPENDS on qttranslations-qtconfg, which breaks SDK populating.
>>
>> Fix this issue by annihilating qttranslations-qtconfig from meta-qt5.
>>
>
> +1
>
> This is needed also in Rocko after the update to version 5.9.5.
>
> Currently Rocko fails to build a QT5 based SDK with:
>
> Error:
>  Problem: conflicting requests
>   - nothing provides qttranslations-qtconfig needed by
> packagegroup-qt5-toolchain-target-1.0-r0.0.noarch
>
> Cherry-picking this patch fixes the broken build.
>
> --
> Regards,
>
> Javier Viguera
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

