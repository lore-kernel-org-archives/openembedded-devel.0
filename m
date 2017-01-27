Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id B3BB371D7F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:06:08 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id h65so25409127lfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=HY0PB3bY7mRArT0ZNAb22vxaTjlUYUJ86ZdWi+3UBe4=;
	b=P2wapRJZ5iXrgY8e2Co5nI0rk8CbhRlv10azncRmOMaZSobgxV5DQq/raXZgAc/RWY
	V8BIcV1IJ/HondgWOnpyHu5+Xp0tL+lVtufr1MqBrsXOH8xna5dd5v1PmD0NXkr+jihG
	Bal0rLt1lTVe2wnnM24uwHxAzQ1iY1oy5wd21ji+uiCrX+6ng85wf756yDcxdeXWyf3J
	3tih0gsPiyhmt+4SzuEozPWw0W0N4yK0PO5Z5r4oHCCozWJZMdlMprloBtZyGMwTMsF3
	aNkGCuBJbVMsKjVdjGVcU5KqD4wS9Ufnv3WavmkCJmCkorgAZom5b2B6vs/cO8gJmoL1
	eSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HY0PB3bY7mRArT0ZNAb22vxaTjlUYUJ86ZdWi+3UBe4=;
	b=jMkDwn+oLighephpOx7IZCaZ/eGotIw2M9ByiCw0vD5Rskw/LD79qIrjcnSce8Ym5M
	vDua4eau5mu9Cn31bCx8kKpkCv1JwkW5xwl3BgTCZxj3SZDcyse0n/dzK+c/N/7XndHd
	MEiEx337bMwYHvkuNg8mC13NGYeGsxjlvZOZPpCXtEpecZNrxNuTGTq/6PwGoPWFny5k
	WO0Svk98Y8cTsQLYqiFd/KYFXmca8208M+suTo/TFmWELzCfKX528hCz4nl4IJGNas2O
	Cjb9Og7w9Fu/xNxgOg3jyZYFctB3O1UZDcBuBq24UOHSm7i3+FYsC8EbvG9uyhpFd+PP
	aSUQ==
X-Gm-Message-State: AIkVDXLLaA8cUkzQ/KvhZLHajKz6XPP/LqKFdxgd3YL6HbCLPF9QiH5O1BXu8SaP3/+Fvw==
X-Received: by 10.25.216.93 with SMTP id p90mr2016548lfg.59.1485507967703;
	Fri, 27 Jan 2017 01:06:07 -0800 (PST)
Received: from [10.9.21.21] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	187sm1154003ljf.12.2017.01.27.01.06.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 01:06:06 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1485160227-29998-1-git-send-email-samuli.piippo@qt.io>
	<20170125160207.GF3260@jama>
	<CAHvQdo3_+YfdZN_MYmZQLOW7uDnE-=LuXUwL8SR7sXLCG8VVyA@mail.gmail.com>
	<20170126125414.GA3016@jama>
	<CAHvQdo1SNOuWuyeAQU_sC88cU_vMbd=PRWt4fVSaQAq3OhM7jw@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <fe240a61-4206-750d-c913-9073d79c1245@gmail.com>
Date: Fri, 27 Jan 2017 11:06:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAHvQdo1SNOuWuyeAQU_sC88cU_vMbd=PRWt4fVSaQAq3OhM7jw@mail.gmail.com>
Subject: Re: [meta-qt5][PATCH v5] Upgrade to Qt 5.8
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
X-List-Received-Date: Fri, 27 Jan 2017 09:06:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/26/2017 05:22 PM, Johannes Pointner wrote:
> Did you also see the issue with the QMAKE_INCDIR_EGL, QMAKE_LIBS_EGL
> and QMAKE_CFLAGS_EGL variables?

What's the target and configuration you using for the build and what's 
the actual error you are seeing?

