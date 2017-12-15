Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id A6F33784DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 19:08:15 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id 5so6839458ybp.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 11:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RRUfX4Fk0qeXG32CBR1lTk8ejm4zA6ZSy9ESHtyDGuQ=;
	b=b6DIqODAi6NxqJ/7uPzAGlZJ01Zi3JZc7ZGd1ISldgNmwYOyJbtmBzs8UrwEkFaVf4
	1CjqoVQWI5SdUF8ybTcXi5cZO5PlcQXtDAhZqJo64G9JgmlbJc4K+i8f1ZG2ietsN0lb
	HkxqcGUgx2p83SHAd2ih+fDcbExD6y3cGrHs9e2QF37bjUcRI1tLCkVePPPtATSsoJGE
	vk5WfV/789cRNeT0CbOJ3VVfq3Dd0EFKu/SBv/AWeq6ae4P+YwP4c9tW7dWMoDFX0v6W
	b5OMHZXfkfv9ho3wDwTD6hP29Whkt2EBnPt2wQF/sxfuPacj6tDNGRu/6COEFwHOY/mD
	PXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=RRUfX4Fk0qeXG32CBR1lTk8ejm4zA6ZSy9ESHtyDGuQ=;
	b=Km/wU8YMKl3InItahm5yA9qnI2S64i2hkN8jaImk2zm1CmtkEN2O0u4YbcOJyyuCHB
	Bv+UOw8To6BNK1GosgHBd2DQVUUGuGA14jbOA0CHm//QIpHg2jtXeMLwu6TWo50o7dcE
	nX7iRDiz33VNE0QfK14P1zegMOc05h+1byWn+iqNzegGdXwJGC6umdPBeoDOfAyBgy+X
	r1iBXm4n08w1sBygB6ICRA2BqDYz3+luU5GmWWK3Ohr9FT68xG3jnELHDde9Hcd8MlUe
	/A/bi6QperFAQfFMopfE2dKSBnmfvxfBUs7ugE7kBX+WAypWZfHWaXBHx8BfHayrYQvP
	gC9w==
X-Gm-Message-State: AKGB3mJ55xr07OLHk4/tK1nBDpYwjHYEHtDP6MYpAoZAmC+2FPZjXxQ3
	O/zna+J9ndyHkXvCAB7UvKFkz75K0G5OhwY4EJBcFQ==
X-Google-Smtp-Source: ACJfBosByOkNIMfh8p4nEkaPwHnElM/XGdCH3gVRcwf+Z4li4hIzK3bx8Eo3bAwkGaGf++5fKHBrGdxt8t3OPmt6uUY=
X-Received: by 10.129.155.209 with SMTP id s200mr7803204ywg.173.1513364896375; 
	Fri, 15 Dec 2017 11:08:16 -0800 (PST)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.56.83 with HTTP; Fri, 15 Dec 2017 11:08:15 -0800 (PST)
In-Reply-To: <CADNbA1ruiCp4u810eg9LcLXzWdAAaMY5aC-5KVyeViq4jSKxKg@mail.gmail.com>
References: <1513359926-17087-1-git-send-email-mark.asselstine@windriver.com>
	<1513359926-17087-3-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1ruiCp4u810eg9LcLXzWdAAaMY5aC-5KVyeViq4jSKxKg@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 15 Dec 2017 14:08:15 -0500
X-Google-Sender-Auth: X2_rsMMZfaS-RNgvMsT5j-byMEI
Message-ID: <CAPuovEJCQwFBiFsG5_7miubOgteakgkSzXL5H+3qLYcWqPeo+w@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][rocko][PATCH 2/2] python-twisted: restore RDEPENDS on -news for py2
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
X-List-Received-Date: Fri, 15 Dec 2017 19:08:15 -0000
Content-Type: text/plain; charset="UTF-8"

The RDEPENDS are not for core, these are RDEPENDS_${PN}, ie. if you
don't know what parts you want you install ${PN} and get everything.
We can straighten this up though if my thoughts are incorrect. I have
to send a V2 anyway as I was hasty and missed the cherrypick of a
bunch of dependencies you added for automat and others.

Mark

On Fri, Dec 15, 2017 at 1:32 PM, Derek Straka <derek@asterius.io> wrote:
> Is it actually required for core?  I thought I went through and verified
> that news was a stand alone module.
>
> On Dec 15, 2017 12:46 PM, "Mark Asselstine" <mark.asselstine@windriver.com>
> wrote:
>
>> Although this plugin has not yet been ported to py3 it is available in
>> py2. The previous commit isn't clear about what is being addressed but
>> I assume it is:
>>
>> nothing provides python3-twisted-news needed by python3-twisted-17.9.0-r0.
>> corei7_64
>>
>> For py2 this package is valid and so we should maintain the RDEPENDS,
>> restore this RDEPENDS for py2.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>  meta-python/recipes-devtools/python/python-twisted_17.9.0.bb | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>> b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>> index 2be1709..7fc8c65 100644
>> --- a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>> +++ b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>> @@ -2,3 +2,9 @@ inherit pypi setuptools
>>  require python-twisted.inc
>>
>>  RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
>> +
>> +# Not yet ported to py3 yet available in py2
>> +# See src/twisted/python/_setup.py -- notPortedModules
>> +RDEPENDS_${PN} += "\
>> +    ${PN}-news \
>> +    "
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

