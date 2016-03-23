Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5CDBA6010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:06:01 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id bc4so9584355lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 06:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oDCZ4Fn6DinJMtqr2Rv0pn8G0AXL5UVI3JJlCVvF/B8=;
	b=0h9kOaSoUR7r/JdKU7WH6UssfLfcx9pczpuAYpNcWgXSDQwqfwKVjaAHexc8mukmCS
	Y7GnmVNIi8SV2j4eJnFlNaqnZ170SzB52PEYOFnGRJJQ0jV9I4vPP7sbEe+Gbcyvp28M
	I/PkbcUPxf+y2nZwZQjJjWDsu+tVDJD0bhrMk+8n3+HtdL0a4WszrR9/Nzmp6YyKhXTy
	TuI1e3hmOOGK3bb4DBRgL5ysauLe/XW4JxgP54IxyEv0JSh8BMRzQUC5IigrvGu4IQBV
	TzvT/tLDq2A2r7KPDiQRXsyMv0pa1dxOZ2HXxCr8ludp3q3PU0GqiXgb03+ppUDNJ6Dw
	r3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oDCZ4Fn6DinJMtqr2Rv0pn8G0AXL5UVI3JJlCVvF/B8=;
	b=ccwgXqd21v+kFYFhnMcUBKJbfoiNBaFykaj0J4fTBFEgio6VsPTz3iw/n0llu0ItJ7
	rU4Q7340pEsezksHPV6OWsdil/XKmjh+UKY5+uGMQBj8YSHEfjYpmlaOBZQKGWF2jQ/T
	L8SzOytbNSv2loofWMv5wMTsXyL0GS+/Xxo4X0yKWfBGn1REa57p4FY5e73Qt50qVKRG
	HwxZyxPAgPF0Oif4PaR7fJu2Yloy5I7aPw0ZvVAr5wZvJcnAlIR0hkIjkuvbMhUI2aU6
	3/75VZB1QAdhNglcoUIr6Xxl9sR5b7DH7xndvZG1t8xU7qFAhfqmswIFjW799S7la77Q
	yRFg==
X-Gm-Message-State: AD7BkJIrgiFbck05RzOJMQTFZEKG3QlMs63e8HSZnopJP0bpHxgbAW96sDXhx2oa4Z0Z7wTr0nt8x3FAjlqk2w==
X-Received: by 10.112.132.36 with SMTP id or4mr1157883lbb.71.1458738361324;
	Wed, 23 Mar 2016 06:06:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.11.40 with HTTP; Wed, 23 Mar 2016 06:05:41 -0700 (PDT)
In-Reply-To: <20160323101240.GA2565@jama>
References: <1458556296-2809-1-git-send-email-ricardo.ribalda@gmail.com>
	<20160323101240.GA2565@jama>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 23 Mar 2016 14:05:41 +0100
Message-ID: <CAPybu_1-CCqMjSRC5it6nLL+SWzP7WfJEL6S5dY=Wjn4unon3g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] opencv: Add missing dependencies
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
X-List-Received-Date: Wed, 23 Mar 2016 13:06:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin

On Wed, Mar 23, 2016 at 11:12 AM, Martin Jansa <martin.jansa@gmail.com> wrote:


> Still shows:
> WARN: opencv: libopencv-dnn rdepends on protobuf, but it isn't a build
> dependency?
>
> protobuf support in dnn probably depends on something else which is also autodetected.

if I just clone a clean version of meta-oe and meta-core and do a
bitbake opencv i cannot replicate the error.

Any idea of how to replicate it without having to do a bitbake world
before bitbake opencv?


Regards!

