Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03B4C02195
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 07:48:27 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.83016.1738568904563156465
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 23:48:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MTjar4fM;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38637614567so1736289f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 23:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738568903; x=1739173703; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJDlbYV5iPpWMlM2c00yV6+vd818bZpgA/FAxbnlhGY=;
        b=MTjar4fMbU950Q0agzNHVXsaGby0Z/qTORowd8FBp//VlKHQmrn/I0Gp01HyZ7Wv17
         psJle4x4BiPuv7m5NrpfCULUra6SOcvrB5vzmFaGfB+H7BuPANpdoQacpgV4OudiRuoj
         KdQnatnSDFsA1K5NNmHdp1V2Vwq6MFD/vn0wt/qkufzTJ7V2aFp5U2M6qB7R/e1yz+6U
         HHn3kqfACijyawc7X9x1Xo3v/QCmgwLdyHM1pU1fePoC5c5mNbfXwc7eWNkfwnEV2dlb
         iWKKkclybaUquuTjJSB+OyvXM9hJsEkWHQHYpGDSDfNRjfBaQ5QKUMyfYfoqfUxIC8iL
         HokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738568903; x=1739173703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJDlbYV5iPpWMlM2c00yV6+vd818bZpgA/FAxbnlhGY=;
        b=BqyGTE/lwsUxthgOc7BSrXiURxNBgV4p/6mEQCkwzZYgLlUuSpeMmF+T1NmCVrjyQU
         riYsiuon59cRZ7htv9esaYUKU5sOt3duSWjJ7dvGW+05DtN/wNhTBddCzifGynWr9+MY
         Qi8UkydDBmb0KzYso1DTmttLuWMLEX9Er9t0NhJjYOS9Cf8aDv747eHvQLYFmBEdpQlA
         5OuXpjLbp3QzsJxIdTaVU3D/RSEXaLvQ9/zSGZ3sfs6HTCqHDlVPjcr55v2qmmY4Nc8v
         2vyiP1/AaXEmYVPBdbHRWbYmqJQ5Iqbl4W7Q6q01MDHItA32omS4o01aoZpQkIaItPrI
         vrGA==
X-Gm-Message-State: AOJu0Yzx/LWbN5vVIgfzeKOerPDf9W5x70OzbJMIHNU50qXghpT8UuGm
	LttVLJ8CKiwWpHJFsigbb07/GSCU0WsbaqUtom0D+DXzGBSEqcYp
X-Gm-Gg: ASbGncv3WLZIf3A/uaMEW3vzWGyTWBLxv8RNGXLwXxJzniUMZbyjKR2GAjElPNwDHns
	r36ISiU1NaKqxxbxv96WkIDc7Z0qwPEQTjdhIVLhXfpaijQPyDhnEEwENpyqq6mVREdCvQhFfsH
	TT5f0/B1mo9EZ45CxYnCtPFubLGephKbZdem6I8Q8vWKel2nWMa8NOliwS0ke6Jn/qZjZmwr6xV
	mALYXc+Crv3jQWMtq/IURHmRsOjF06lbeJVZdsajvOZGLqPqC5IEAJVa8omemIWvAcj6ExWp2x6
	C7+DqeR3Brm4txwYUIsg8NE=
X-Google-Smtp-Source: AGHT+IF/Cn+91s3mCyAKbYRJRghS7GOjSzNXfQZlYukOIbus4N3CdtgfS/iPZfJi1sp/nEuY7Qmj9A==
X-Received: by 2002:a5d:5987:0:b0:38a:5122:5a07 with SMTP id ffacd0b85a97d-38c5194a22emr17256045f8f.15.1738568902629;
        Sun, 02 Feb 2025 23:48:22 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b61f1sm12182949f8f.68.2025.02.02.23.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 23:48:21 -0800 (PST)
Message-ID: <3defd464-87cd-40ad-bace-bdf12b96731a@gmail.com>
Date: Mon, 3 Feb 2025 08:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] capnproto: remove binary checking from
 target cmake file
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20250202190608.1521989-1-skandigraun@gmail.com>
 <D0A3556C-EE0D-409C-9DD1-229006AEA692@arm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <D0A3556C-EE0D-409C-9DD1-229006AEA692@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 07:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115235

On 02.02.25 21:33, Ross Burton wrote:
> On 2 Feb 2025, at 20:06, Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> wrote:
>> +do_install:append:class-target() {
>> +  # delete lines checking files in bindir, e.g. this:
>> +  # list(APPEND _cmake_import_check_files_for_CapnProto::capnp_tool "${_IMPORT_PREFIX}/bin/capnp" )
>> +  sed -i "/.*_cmake_import_check_files_for_CapnProto.*bin\/.*/d" ${D}${libdir}/cmake/CapnProto/CapnProtoTargets-noconfig.cmake
>> +}
> A sed like this is incredibly fragile and will silently stop working if the cmake files changes. I recommend using a patch instead, as they fail fast instead of silently.
>
> Ross
>
Looking into it...

