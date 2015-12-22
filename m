Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8D8876E665
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 15:29:49 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id o11so56737325qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 07:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Hx4n5zz8z6t0JRLPKvZAXx6yseS2BG61sKCFeIVWpDI=;
	b=DZ31Yf5ZFyE5GyV34MZ+wVM3m6yoR2e+7RhNm7nJa7Fu5jKy+UMO2hUpb8p5E5qje9
	8iIlHlS7frlALMRGMTZS6Zyjz0QwxPuftwjN8o5/bo22IV6Y5nieshr/jvrKja2nf0VX
	xZ7Aq/kJqTtQg2ib1Q0zzCLKt4NT5w6gSL5GazEGyuXUz87T5ZDuRX89Ex5+eFQvINKp
	TXjVoktKJOpna+t7Jk9JG1r2bY5J9ZOXRPVpnO9PnCZO4yLz1oT8YVkXCJu4g3SuVbFZ
	9S7z9L3FpBBDM+G2+fVhlSF5HnhZl1cYyHVax2HLtLPWs+WJ2zTWfwqAw+ZOkdDYI4Kk
	tkyw==
X-Received: by 10.141.3.9 with SMTP id f9mr34889627qhd.98.1450798190680;
	Tue, 22 Dec 2015 07:29:50 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	q133sm16151214qhq.20.2015.12.22.07.29.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Dec 2015 07:29:50 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1450758431-18974-1-git-send-email-twoerner@gmail.com>
	<1450758431-18974-2-git-send-email-twoerner@gmail.com>
	<CAJ86T=X7-FxDqTZ1fJgx-sQaVUjM+Xe-E_QXe1QfXfgQMptLww@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56796C6B.9070002@gmail.com>
Date: Tue, 22 Dec 2015 10:29:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=X7-FxDqTZ1fJgx-sQaVUjM+Xe-E_QXe1QfXfgQMptLww@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3 1/1] nodejs: cleanup and update
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
X-List-Received-Date: Tue, 22 Dec 2015 15:29:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Andre,

On 12/22/15 04:35, Andre McCurdy wrote:
> Here's the link to the "official" announcement about v8 dropping
> support for ARM cores without vfp2 support:

Thanks, I'll include that in v4.

> +COMPATIBLE_MACHINE = "(-)"
> +COMPATIBLE_MACHINE_x86 = "(.*)"
> +COMPATIBLE_MACHINE_x86-64 = "(.*)"
> +COMPATIBLE_MACHINE_armv7a = "(.*)"
> Please blacklist armv4 and armv5 instead of whitelisting armv7a (armv6
> and potential future arm targets such as armv7ve are still expected to
> work. It's only armv4 and armv5 which are not).

That was what I was trying to do :-) I don't have much experience in
this, I've been asking on IRC and the mailing lists, and there aren't
many examples to copy. I think the following works:

    COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
    COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
    COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"

?

Best regards,
    Trevor

