Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1269F7C752
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 01:22:55 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id d25so7107448pfn.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 17:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=OdQl/KEEQIwSzJh8IcjZv2emE7DRWb+SjxAmQXslCIc=;
	b=AAgsQJ52ndNEaNvrbLbSe4UHkrTGOA9gq0R8QPXCapd7zHpOyhsfHsJZDcJhefVqnK
	hTj6HtY/hYzIEf2gXHXHM7Xao4XxQEFKoGj2MjpLDKXh/I6RKITvPzrVuRgAWaV1C9Yo
	FsE5tiUps90zFlmR/596rTEL8plLuV6stTITWUjYEi41Ajd8PoS5yMtiyB++UbXV8Q6E
	htSXTizQyxDcrrdD16sdFYNJqYT9Z0VuWm9EJ0pf6C4P9UVxZpmC6huID+T+YFdwYnRR
	Q7+OB8oyW/3Bwt8TQWWkHIYwMMhVsdU/tWRrofk60Iiz1aiiwqt7nBiUz0JDIW0UwgQe
	E51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=OdQl/KEEQIwSzJh8IcjZv2emE7DRWb+SjxAmQXslCIc=;
	b=sbTxl7cqHKb6LaBQDH3yGJFes77uTY+kH7OQPl6HGu+S9hywTdo0ET5CELbe7rVDLG
	/+YQvOVCXxcmerMAdSv9HaWNEgWj9lR2gkd8ii+TUKWbVBM4VS+FFBAbD4OIdw/u3iwB
	ufAZU7JdjqGVXiXsV+bHIAXq/Tu2pLE6oKCzUcZ4Vn060FqaCUkIFzB1UJkyMdENIkCE
	yA8zNqFXmHETDO7Vq2TW3+AZ9aPABGTnDi9hL9ZJ3u9kgQApDkG7kCp8ex08f0F8Q9H2
	eDNEPyAYAq8uPaL/zpmWQIA3wJ8+ZNF2HoAEH7zpThNT1YLT3AI2X2eNdWC2AYZXwTpX
	s24A==
X-Gm-Message-State: APjAAAU8dRx+VrZBVihUUHHDYLMCg8dDdCKcr4/cbUSgKT2BC/9TpC0o
	fV1SFKklktrJvULiWZKidDo=
X-Google-Smtp-Source: APXvYqwu9US+ayMNO4HK96XVfXRJ39i4lQkMO13cmEZVnkKC4ImGbHw7Ojt+ub89EQM9TzacD2xqDQ==
X-Received: by 2002:a17:902:4081:: with SMTP id
	c1mr4217258pld.297.1551835377210; 
	Tue, 05 Mar 2019 17:22:57 -0800 (PST)
Received: from [10.20.245.5] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	y22sm287553pfn.136.2019.03.05.17.22.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 17:22:56 -0800 (PST)
To: Aditya Tayade <Aditya.Tayade@kpit.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1551758877-6519-1-git-send-email-Aditya.Tayade@kpit.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <baf81124-4114-982a-6fe1-42057613448e@gmail.com>
Date: Tue, 5 Mar 2019 17:22:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1551758877-6519-1-git-send-email-Aditya.Tayade@kpit.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [OE-core][meta-oe][sumo][PATCH] run-ptest: supplied user inputs to add_person_cpp
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
X-List-Received-Date: Wed, 06 Mar 2019 01:22:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/4/19 8:08 PM, Aditya Tayade wrote:
> During protobuf-ptest execution, add_person_cpp waits for user
> inputs to write data into test.data file. Fixed this by supplying
> dummy data through standard input.
>
> Upstream-Status: Pending
Thanks for the patch.

This needs to go into Master first, then I can backport it to Thud, then
sumo.

- armin
>
> Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf/run-ptest | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest b/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
> index 7c3a8d1..dc6c83d 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
> @@ -8,7 +8,7 @@ for write_exe_full_path in ${DIR}/add_person_*; do
>  if [ -x "${write_exe_full_path}" ]; then
>  write_exe=`basename ${write_exe_full_path}`
>  echo "Generating new test file using ${write_exe}..."
> -${write_exe_full_path} "${TEST_FILE}"
> +printf "1234\nname\nname@example.com\n" | ${write_exe_full_path} "${TEST_FILE}"
>  RETVAL=$?
>  [ $RETVAL -eq 0 ] || exit $RETVAL
>
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.


