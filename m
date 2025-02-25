Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9904AC021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 13:37:11 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.8002.1740490629135517038
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 05:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iLMqoOSm;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so10029602a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 05:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740490627; x=1741095427; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CCx2kioOS13F7WaX+srV4xD4R/5e+rCAp+2OXzI9oNw=;
        b=iLMqoOSmAOkLR0eF7BbkN4/X9c+xK+la7P+zWtP2jDfa1/bMJF65qG6OonSOYPL1Hv
         qjYqz3OtetUCVyOwkuP/+lYVxaS3py8Bfh/9cGHmyF86tLeA0trsXabN9X5qJUzOvIvh
         C/ennPEOkNJx6X0enm0HV3CeC6nHBAYz1Z5LSAMomKkSFFvViBQAIEemMFOnTFnZ6O0B
         pobaaCgxsBk1eHp+EMVziQW5HKmYUTcjcTUUdHkis/Wk7/M0LOiVlFIF6qX2XTRjcKNw
         6TmyE+s7zxnJ6GVn+5M4RpabFEpLGkYzMtfuFkwKPLljoui01K1S4yDGuSOxx+9Ck8dY
         S48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490627; x=1741095427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CCx2kioOS13F7WaX+srV4xD4R/5e+rCAp+2OXzI9oNw=;
        b=t1HfyJu+J/IosD4hUZ8nSTS0DDj9k8PQEkyLAhZPIfunEkrKbEncTtfaSdgmJJC0Od
         8+ssLDKS8CsEEIpi7qFZsugGJt35+WzSkhlskpnigIbyWsRxuL4LCJqxy4S04kYhE7c3
         aXroDaw2RDZPzopmilU5WWPUVw8PjIfIX5uCVc54ua5x7VKK8RQm6VLcQ+0RpTpVnwTU
         UncXIM76xcI+Pz51O1s3RQDBF0uaMJrT7vY/Ff/eKZg7iPhnEmLMyLtfVFM3a6hf7vKM
         OvcRNNRFDe/e9/R/D+PwLfotTXEZdBtXqUj858CRCTFn9NTq8XrPQS5WYg2ITEwsZJ/f
         wYgg==
X-Forwarded-Encrypted: i=1; AJvYcCWwae8ecMdegbfXG5gOcMpBWz7LeCCySYBAqPNNuMdK8aeq+78Q13JIl/KSjdMHFmN7WtOzWcrUEIXcpcgQycnC1/s=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKix22e2GCg+RC84x0byKsC2N0jwz++Nldz2CDyAu7XJC2RmDT
	mFihRDUeYknNEM9crD3Yqbyl3yx9D/gwUHPI6pC55xIirUaq+zWmWaWz7A==
X-Gm-Gg: ASbGncvkbibJdFYBnmtNPjbtTJlfFARgde1qeXDSz45K+nlpJC2hqBXmBeMfZjEHjJW
	7QbdKLptWb6i3zlQNTyJZPeJY4f/0w625Tkmi7WJF+JZ6RK6qEW3fMb/rtmamDFOcChAWvCV2RF
	1Waaekpb5FMimgRgm+m3geDCZOOTpta3szGWjO7WTMKijdQwvQPkBasscaU3IpIGkpIfQ/4fR0X
	bp0dGS2YVgvdpddXEFU2dLbNrZ9I5irt/YLfYPZkgVJ/6/4B47zvbf9ky7JBsNqAR2MCtDTQxHW
	fIU26Rvjz3edsV1idx4iiFm9xx7C0G6Qtg==
X-Google-Smtp-Source: AGHT+IFB/KBufWNCVGZ5AEYGYB02Xw4mHcD/qlHMh8QHGjzIBAhHafY82TlU06fpLbpLNU5hPkuMpQ==
X-Received: by 2002:a05:6402:2791:b0:5dc:8fb1:d43e with SMTP id 4fb4d7f45d1cf-5e4457abc8dmr3270667a12.12.1740490627327;
        Tue, 25 Feb 2025 05:37:07 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e459c3fa2fsm1226383a12.5.2025.02.25.05.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:37:06 -0800 (PST)
Message-ID: <184545a8-1f4c-49c5-b1aa-51bf62cd0a42@gmail.com>
Date: Tue, 25 Feb 2025 14:37:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] capnproto: remove binaries from
 target-build, add bbclass
To: Thomas Schlien <ts@ferncast.de>, openembedded-devel@lists.openembedded.org
References: <1820B183AA0ABC96.15786@lists.openembedded.org>
 <b74c1960-4f13-4758-8a80-22f025577c79@gmail.com>
 <7258a928-31f9-43ec-af76-26af4e331bd5@ferncast.de>
 <8c1f9454-f0f1-4d4c-a3a9-3757694b8c4c@gmail.com>
 <85a846dd-3b22-46e6-9f3c-6d014268e46f@ferncast.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <85a846dd-3b22-46e6-9f3c-6d014268e46f@ferncast.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 13:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115572

On 25.02.25 11:24, Thomas Schlien wrote:
> I like the idea of the class-target, but we were not able to get it 
> running in our environment for now, even when removing the patch file. 
> Everything looks correct, but the "find_package..." in cmake is not able 
> to find the capnp binaries. It would be nice to have this working since 
> when then could remove our ugly hack. ;-)
>
I have submitted a new version, please feel free to give it a go.
The relevant capnproto binaries should be installed now for both
class-native and class-target also (but only on the actual
target-machine of course, not in RECIPE_SYSROOT).

Though I couldn't try to use the generated cmake files on a target
machine, I think it will need the same cmake arguments (with the correct
value) that you can find specified in capnproto.bbclass also.

