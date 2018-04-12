Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id ED2A6746F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 09:23:38 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id x82so8385630wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6rmEwfmsUxzdRzCZXPPuGTYU6Gr1nroznU5k2fwJdZU=;
	b=ugdZ1Vwx7yLafVahUqwZ//kldjSl6a+SDpYgJPPD0hWCrbvhZ6TVferJDUcieYP5ZY
	0txwiCqcn1glA7iE1pDVTYT+iOlpcK0qswo8PlpoZ5redhEIrGDsfhhJKqiyhcQwZLO1
	iyXT9g+Tsnpj+9wZwn7p0nCJTKd7n7FnfKIvDw+1OAx0qWFT1Vt0Kw6EnIhlm/XsUmaz
	V328N6g9isx8qkY9xw27VcMOxos5mOUVzIkT5L06DidI5UUVu6lXm1oXmWo6+hOhz9pE
	Oh7I4xC/Iv2T3wrJk1QJw6ayUica7ApmknP8y9rBK/lBvX/vkfit0fDxeksXug79btzD
	0jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6rmEwfmsUxzdRzCZXPPuGTYU6Gr1nroznU5k2fwJdZU=;
	b=D+FmhCYiRPAOWIHsefr1FOEqk7Cw6omAsUZlAZqJa6BG5UxkTLkHoHSal4pV8/qtNa
	mw16yFFDg8WZUExQhEpdKhN2Y5QR02KGBEuP6rLAN9xh4YDCqDo05Rab92u0YJKe99H+
	YrCEFULeYA8Y3rRhGhM8TMRQFx0+3VRX1DMloZ1G8dQJeNLwNUcp8PazjKe5sdfXr6yy
	/F2u+5kVsUlXnAvYqOVZ+i/bE5/HmN8HdW0zyvzmciNrtnKCp2rrdUmXPqmoWRfcCXzQ
	7LGbllC7rf5p+0vA7D3fvGOV1UAOK8zMZOHVMquGqY+eKXWLyZEOaW87LHh3sGY7wwoG
	9dAg==
X-Gm-Message-State: ALQs6tC0JPEbtsn5k6R7CMr8HvbgYvL29tVNaBBV0S3kHR6XPVUHXiNy
	xOhM+eT3opBWiBgu1RC5Mi07sd7kbmlbYg8Ihug=
X-Google-Smtp-Source: AIpwx4+bYidsAw8OJXr2XkDRpwKd+m4YruayzTiz0lBTjvgnq5rrYJoifdk1vqfVoLEVw5zFKo7kXHlNM/MqqA8kbAw=
X-Received: by 10.80.184.34 with SMTP id j31mr14365068ede.103.1523525019398;
	Thu, 12 Apr 2018 02:23:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.157.197 with HTTP; Thu, 12 Apr 2018 02:23:39 -0700 (PDT)
In-Reply-To: <pan70h$v8k$1@blaine.gmane.org>
References: <1523394065-15465-1-git-send-email-andrea.adami@gmail.com>
	<pan70h$v8k$1@blaine.gmane.org>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 12 Apr 2018 11:23:39 +0200
Message-ID: <CAAQYJAtv_KyDE5YLCVB3n18E9MgkokQ78sAwy0KmTemAd+m7WA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-handheld][PATCH] zaurusd: refresh patches (using devtool)
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
X-List-Received-Date: Thu, 12 Apr 2018 09:23:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 12, 2018 at 10:59 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 10-04-18 om 23:01 schreef Andrea Adami:
>> Silence warnings about ingnored context.
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>
>
>> --- a/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
>> +++ b/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
>> @@ -1,17 +1,17 @@
>> -From 85b94bed1feab70bc529a59fb80c26da825b9abe Mon Sep 17 00:00:00 2001
>> +From 668a7bc50ca8f36df5a0eae73a5fa251aada9cc4 Mon Sep 17 00:00:00 2001
>>  From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>>  Date: Fri, 5 Aug 2011 16:00:10 +0400
>>  Subject: [PATCH] zaurusd: add support for collie
>> -Upstream-Status: Pending
> Was that change intended?

No, not really.
Let say I have spotted it and planned to read the devtool code...

I think it is tolerable in this context, because unfortunately not all
patches have Upstream-Status.
(I am wondering if there is still Upstream for zaurusd...)

So I have left the result unchanged., planning to update the
Upstream-Status soon.

Cheers
Andrea

>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

