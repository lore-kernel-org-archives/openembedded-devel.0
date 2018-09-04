Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 96B1C753D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 21:13:57 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id q7-v6so4073565uam.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 14:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5qniZTybbeaXndkXibmO4THwXqNxO2jiLkAHaLi2F4g=;
	b=X61NhEViR1ABD5OWjN/sZ9Lo4jyhSS7cjgCuulc/w8G9+lQQEt5sEop9q0pFqEtuq4
	GjxyAq8n0ys7sAS8QBhzTog3UuLhFRut9wT74q3pFEhq4q7VRciBXlo8Rv1JcRfpYiDy
	VwNMVA8yi0Vv2v6tUBmMmxWe9udS9p5wYdwVteU1Xhoin2BmdworbLmfvAynlfeQXTTQ
	Mkfmm0VdumT7gtj2+FoY6qo3heMoxH9B5B3GgxW0x/stW0N2BoU547nFu6E2MHxIzgcl
	YvWiVFYEVGj0mJAVzYpVVxjXHLDWCkf+RrGVx0Gyx4jPUNrRZsodcpXRzNKqDj73wD6J
	RHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5qniZTybbeaXndkXibmO4THwXqNxO2jiLkAHaLi2F4g=;
	b=FQnPEFZjKMnTtdhU8I6oE9seZFU7MChq/S+IOu2rnhhOJHhXThaGsA6kHauWKbaQNq
	rcWu+MQ/5MQaskxxDGE0eW+AyWIiDwS0AfldlnOj4OXDu+ubKGyPfmxzP15uXxDGjtwf
	/7S5PaWU7dKkzzfkf0j7bTsRoEqleFqSsRe0hqwS1oXmSRsFsiWuODRoqX7o3WUC0TZy
	FVqzmGO1J26vesb+wtrkWJ18CceN/gqyBvM3tPRjW26Gna3AeA1NbRD01EsUb/pDJHXI
	4m2VLaPetdBYI7XYGnRgrt7iLSVkXdOnbnY7xsLLsQCAjXe8Cs4VJtdXH11zd4rOqdqj
	T1Iw==
X-Gm-Message-State: APzg51AvC4l+imrtr51zOvNPb5T1o5bKAkmAClL6jvhTUX1RpiwvsEXW
	mndqlVMcW13aNYWfIoo/J6v/psqWu/aBbSLO8HY=
X-Google-Smtp-Source: ANB0VdaRUdt1UpgGD1swb+UyCj6Kd00VzVpSE8PTQUy4TPPRDlOl9+jhXgxvolVtAyV4cUj5ZYVsouBph3ebEB4b0IU=
X-Received: by 2002:a9f:3b69:: with SMTP id
	j41-v6mr18807401uah.37.1536095638439; 
	Tue, 04 Sep 2018 14:13:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 14:13:58 -0700 (PDT)
In-Reply-To: <09682179-6edc-c225-a2c8-2532c4776fd7@gmail.com>
References: <20180703092018.5018-1-ross.burton@intel.com>
	<20180703092018.5018-3-ross.burton@intel.com>
	<09682179-6edc-c225-a2c8-2532c4776fd7@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 4 Sep 2018 14:13:58 -0700
Message-ID: <CAJ86T=XfnK1wbsRAnSbHeqTXGykXjvDPQKb1a13qWFRthuQzjg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/4] php: actually enable openssl
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
X-List-Received-Date: Tue, 04 Sep 2018 21:13:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 3, 2018 at 2:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 7/3/18 2:20 AM, Ross Burton wrote:
>> The PHP recipe depends on OpenSSL but support is disabled unless you pass
>> --with-openssl.
>
> perhaps its better to turn it into a PACKAGECONFIG option while you are
> at it

It looks like both versions of this patch got merged... so there's
currently an unconditional --with-openssl in EXTRA_OECONF and a
PACKAGECONFIG option too.

>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta-oe/recipes-devtools/php/php.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
>> index f262d60d15..258b20e68c 100644
>> --- a/meta-oe/recipes-devtools/php/php.inc
>> +++ b/meta-oe/recipes-devtools/php/php.inc
>> @@ -57,7 +57,7 @@ EXTRA_OECONF = "--enable-mbstring \
>>                  --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
>>                  ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
>>                  ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
>> -                ${COMMON_EXTRA_OECONF} \
>> +                ${COMMON_EXTRA_OECONF} --with-openssl \
>>  "
>>
>>  CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=yes ac_cv_lib_dl_dlopen=yes"
>>
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

