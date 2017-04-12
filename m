Return-Path: <fsukalia@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id B590577C29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 18:07:28 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id g204so41233348oib.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 11:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ytSukEq/B9JyDKaE/xTHYxeJUr0i8PWszMnD3ckp7D0=;
	b=qWl/MzoYRYuntyQfULlwylVEKvOHhUKL5qxn2W4jojFtTMZNrxbo6VJ7g+lPFdMk9l
	2vQyx4eUEyJukaadkG0Hmk18YW5wtX1ERvon/cWQbC41hHVhgvfD9L4qtSnqz5e/UWNd
	20MZMP+vixoK/ojlZPfRuG+d/rKzf30ddl3GGTy3pf/NGhpPH5lq62ULLnJ2BCLHFKMg
	F338ZzxR6t4TpXaF9S8lfiMS9bHPgEikJQyYN5rIgnIaOJKc1vu/vRxsO/oWFoQpEAWP
	N6vSXvQLGCbWu+Ye2qgfCAyFGxVddFz3zMfi+qEmypHFvHt1nk/gNN5bK+YPgwEJhnI+
	cIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ytSukEq/B9JyDKaE/xTHYxeJUr0i8PWszMnD3ckp7D0=;
	b=ss/OhAl5HpvkBYBJF5jptOnFkYA47LQlcdvwW0lx7pe+xGmhyAJSK2O9xuR9eFZTH3
	bNnNGbiUobNN+BVSYqo0x6HXf/dl7hdJfiFdOB2Ybj1guWLA4+NVpsaiXyvZ9WPznN12
	DJpJ94Oj+49IYen1CzT3e7qYgtcSVQpdXNdGSg7T3gWy8mHHkS4eeutoYUWUzps9xutW
	3XszshhAY04oxIpt2T/sEZkPJ6JKO+ZEY6D4pO1Hnj9xkT47RJra/E/ZSceOFW9ngn7c
	1l2JmF8tumHm08qG3Lgy9nPd9T9vUUjVp6BHn6pJmDpo+GrZxbr/rk2dIk2wCQoVZCaD
	d2lg==
X-Gm-Message-State: AN3rC/5mV7Hc4czw4ael1qzRjPEFPwL2OPGiDJQAtq2BMP2rBAjDk3ttDVG+jPeeih5q69Ty6vVy/kf1eGEmFw==
X-Received: by 10.157.32.47 with SMTP id n44mr15664264ota.177.1492020450284;
	Wed, 12 Apr 2017 11:07:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.7.135 with HTTP; Wed, 12 Apr 2017 11:07:29 -0700 (PDT)
In-Reply-To: <264f288c-7173-c1ff-c1d7-3007b03fb2c7@linux.intel.com>
References: <CAPq_R_ewQocz6eqxt+iEwd=G8g38W89JzQcnHCWRVqsURwv1jQ@mail.gmail.com>
	<264f288c-7173-c1ff-c1d7-3007b03fb2c7@linux.intel.com>
From: Fabjan Sukalia <fsukalia@gmail.com>
Date: Wed, 12 Apr 2017 20:07:29 +0200
Message-ID: <CAPq_R_fVw0y6n5ujzygz1HJLXtmq3jH8fsyo=fk3UWAu69u4zw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Full Python3 Installation
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
X-List-Received-Date: Wed, 12 Apr 2017 18:07:30 -0000
Content-Type: text/plain; charset=UTF-8

Thanks, I will try this out. How does it come that this recipe isn't listed
on https://layers.openembedded.org/ and that there seems to be no matching
receipe file?

Best regards,
Fabjan Sukalia

2017-04-12 19:21 GMT+02:00 Alexander Kanavin <
alexander.kanavin@linux.intel.com>:

> On 04/12/2017 08:19 PM, Fabjan Sukalia wrote:
>
>> How do I get a "full" python installation that is comparable with desktop
>> systems? Thanks in advance.
>>
>
> I think you need python3-modules (however try to avoid writing recipes
> that rdepend on that, and list things that are specifically needed).
>
> Alex
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

