Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8278979A61
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 16:00:26 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u12-v6so2152298pfn.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2018 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=oMxw76RmA2ULS0ijNoJKjqKmOCLDLu20IUMtQG/KwCI=;
	b=jUf7XDzNpxE632fEGMpekTvrgnOWxo1H+OskPvB9dGS5wK8cFVaokNhsAiQyyTkQq0
	2R1hnfgKmIFiJ11m0o6hxFV1gCToYP2qN8pDaK6M3aPQ6459Et2GrSAMikWrUdTOFgjm
	MqhyAHsSYsaOZ/Gb/HoBxHc2byjjRPquzwZRXsJbDwAoQ3NUPRaOOy2lyb1R4YG4OTFa
	I776Msam6O0b3l8kxwymOdUT21HljFr3xUC56xPu9eZ7Lv7M/4Zj1ABzhu7n5edeLQoo
	5YAtIX8Z1CxWg6fr0udqiVfLPsLbNtPrzZQtn4KI/3o7QRC/tcSMOdcNRw+FJGXeBmnM
	wv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=oMxw76RmA2ULS0ijNoJKjqKmOCLDLu20IUMtQG/KwCI=;
	b=Kva0Pzkj3xlpc29ezD2CgfsIK5V9YaFFKdfjyKveWXgNTdrAbcY9zCZbtEBzlRRxbx
	UHmje20coYI/tZKDugCqIbWRTqtVtIm9jA9eYCx+16NAFPCEG8d6RjDrRWBaGNWKyJo4
	QHNh0oGkC7TxLylcXi4kqZujbJJwdcSL2W9u3zunQHdsZn4ju/6jsNbojMcprxpKg/tE
	PqxvTCPaDpcswXHhnNBz2h7eNTRvcoZSqimBw5k+9SzN7VKhokkwx8Oud1kcvsSnN7dg
	Yu0/GKKPU138H7bQMLSjfih+NcMdBOiZ51T9TRyP99o0d970D4kXKyjyQzzIYWQH+JZY
	MAfA==
X-Gm-Message-State: ABuFfojV7G+5JEQKNP1v1gScig/Dw0pfQ30WISO0Cc6B53vMX64oJGLP
	ETGiptpy27qK9oGhtTsstfouYkxw
X-Google-Smtp-Source: ACcGV61vIiZ0G5WTn476RN6apLWF3b8x9Rjx0YBaiC7E3p094RJkNpBVQuQcpoZvp5xeRLhdpRElOQ==
X-Received: by 2002:a63:d60a:: with SMTP id
	q10-v6mr10656195pgg.175.1538755227252; 
	Fri, 05 Oct 2018 09:00:27 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:438:4dd8:f9b2:5a9?
	([2601:202:4180:c33:438:4dd8:f9b2:5a9])
	by smtp.gmail.com with ESMTPSA id
	m15-v6sm10710072pgt.28.2018.10.05.09.00.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 09:00:26 -0700 (PDT)
To: Sinan Kaya <okaya@kernel.org>, Bruce Ashfield <bruce.ashfield@gmail.com>
References: <fe502ba2-ec63-285a-9e43-1a72d8e9365d@kernel.org>
	<CADkTA4MXWfH=TY4hDro=33nvoPBYNx3P-4uEY2k=Li+xsadhfQ@mail.gmail.com>
	<5e0741fc-371c-16ac-ae02-0c5a02167a91@kernel.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <728619d5-f5bc-f0ed-a1ac-bc1ef905ae68@gmail.com>
Date: Fri, 5 Oct 2018 09:00:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5e0741fc-371c-16ac-ae02-0c5a02167a91@kernel.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [sumo] [meta-virtualization] [PATCH v1] docker: CVE-2018-10892
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
X-List-Received-Date: Fri, 05 Oct 2018 16:00:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Sinan,


On 10/05/2018 08:55 AM, Sinan Kaya wrote:
> On 10/5/2018 11:41 AM, Bruce Ashfield wrote:
>> Wrong list.
>>
>> This needs to go to the meta-virtualization mailing list.
>
> Thanks for the heads up. Is there a document somewhere saying which
> patch needs to go to which list?

Every Layer should have  a README. That README should include where to
send patches.

|Maintenance ----------- Send pull requests, patches, comments or
questions to meta-virtualization@yoctoproject.org Maintainer: Bruce
Ashfield <bruce.ashfield@gmail.com> When sending single patches, please
using something like: $ git send-email -1 -M --to
meta-virtualization@yoctoproject.org
--subject-prefix='meta-virtualization][PATCH' The mailing list you will
need to subscribe to Hope this helps. - Armin |

>
> This is the second time I screwed up.


