Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D1BC07E98
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.14766.1701215745107913332
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JMdv+J+E;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cfd04a6e49so2701105ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215744; x=1701820544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7eFlVlytxaQs+Uz6jZI/oryqAPY89Ml/l0YlSvxzu4=;
        b=JMdv+J+EqPAWwYuLuPtTbRz8kwVdcAgLQsBBKCI/CNiX7wI/t95aHc1QVC6XyopYVR
         GoxAK5iAAnAEpfogwaY6agpgEL4s0uzYIy491rHyillxyQ1cvqyAMYZpxvclkxvt1C7s
         9ff0IHW9DMaGfN4fdkfVR+fHLx+C1OliOyzM1oNrmgW/gHCJlMzxcYb5n9WS+y1juovg
         1no0GXdlQXDB9HZNdmeEQvDAlPZO9vu0VsG7Ypzv0umEHMAXsXrhHEmNez++v+NFo5I6
         QzU/NUBgq5p7/+RiYs8vKFvQx/8ePD1t9HvxDMPnIZ/QhFnHLf49uvx9FcOsRfyclcQj
         tIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215744; x=1701820544;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7eFlVlytxaQs+Uz6jZI/oryqAPY89Ml/l0YlSvxzu4=;
        b=hcnKIU8wZA+U9lNBd0Jxa5pepx5+YAUhj8sh98UsqSSls1NqiSN1vsnmqDqYqaWthC
         mlSGETdDuplb1PZelJ7sYxcbq1LkZqXsCgoDPnG3SSihgfx+wZT6BS8q1v5Bf+wi6056
         0a8rzqoFp3KI39G7m/uoUbHC2IUH5KFOsvFqTEXWwO+RSS6KjH9+syBUlTLKUDLk6zKF
         kBWw3i761R1A9UJYfIC2cgCzEHs+l/v4juevzZvlxnIbZUkpG/HPb0zbOGuetTjL8MQF
         GSfQiGqSO/kdChlw3W/MPqjX7FNon05W3l1PeNQGq5UX8GOwh/M9GIr0Mrbp7Gz28UWl
         KLPg==
X-Gm-Message-State: AOJu0YzxVVmQqzmSYHtzJcVVzXErMpQ5IkGLntwAnw3Mzmdey4MXLRe6
	kmlh+whe91c2qkTy3jO6HwzykAN0PbonQg==
X-Google-Smtp-Source: AGHT+IFQpJafOV3he6H5npNG9Z99NA7rJ3EEhEf5Lubs1FoGztVUG2VKw0aOkRoQNpyXpeHRRIWFvw==
X-Received: by 2002:a17:902:c944:b0:1cf:e19e:2509 with SMTP id i4-20020a170902c94400b001cfe19e2509mr7618325pla.25.1701215744243;
        Tue, 28 Nov 2023 15:55:44 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231127131101.1391708-1-alperyasinak1@gmail.com>
References: <20231127131101.1391708-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] msgpack-cpp: upgrade 4.1.1 -> 6.1.0
Message-Id: <170121574346.1187527.10584679604903276035.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:43 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107129


On Mon, 27 Nov 2023 16:11:01 +0300, alperak wrote:
> Changelog:
> 
> - Remove dependency on boost in chrono.hpp (#1076)
> - Add support for std::variant behavior (#1075)
> - Fix msgpack::type::variant behavior to respect MessagePack format (#1071)
> - Add rebind allocators (#1065)
> - Change CMake package name of C++ library to msgpack-cxx (#1054)
> - Unified all C++ package, library, cmake, tarball name become msgpack-cxx.
> - Change CMake package name of C++ library to msgpackc-cxx (#1045, #1048)
> - Fix config for new MSVC preprocessor (#1040)
> - Fix compile error that direct inclusion of chrono with MSGPACK_NO_BOOST (#1038)
> - Fix noexcept on zone (#1030)
> - Improve cmake support (#1028, #1032)
> - Improve CI (#1023)
> - Improve supporting platform (#1021)
> - Refine double/float packing (#1018)
> - Refine include files dependency (#1011)
> 
> [...]

Applied, thanks!

[1/1] msgpack-cpp: upgrade 4.1.1 -> 6.1.0
      commit: 3991d85383b466a4948283cfd0167213a1dd2311

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


