Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0275D78170
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 12:47:47 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id x81so3008286lfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=HOARMLfmRrNk8rkrCL4PjnDkOvgGFwQQN//78O9EMSI=;
	b=bbq1ZRTxhYZwPg/w4fL+RzCZmLq8pQLZ8e+k+g1wgQHLY5phoNgAZj3oqZ1LRq5L6b
	mdoIrNgz8ZleHJTwkWumwW350OaLHLT9xAgPggxcZDolYjJp2AnTZu88eCmO9UFFnTbR
	q033ytVTrij6EBFdB/OLpUmqqZ687L9CmRw1LbalQXdgieqvC6a3oUHW3LDQt5C4lQn2
	fwjeF3GnoJHlUgSBvWMFgHzB75ex7bC/ANeaQPUmbagNUykuY0I7ortyHbErlc8ZQ29H
	XvCC45F1DlI1gp9BnrCOu8HXHSUDzsrlZjXUvXHA5z21vrfrerC0cbO1JPuEnehCFBFv
	fDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HOARMLfmRrNk8rkrCL4PjnDkOvgGFwQQN//78O9EMSI=;
	b=lRvfrbzeI8arjZg6yHvS7tOQ9oE8fuWQvZeTUAZ/TnLMhFj52kD5kiTVQB6OwTIpxS
	eq/RQzfG4aO5i2ScfXgBfXCDghdSt/nrVfjTRHdyv3+JUa7RhshKZUgBxhDXviFmGzR3
	lcdDaMMrswCFgNdS5ah3CQLnRfEI+l1ngho2I+yM4EZM5leRDEwvckBSO3+y7yPoXYux
	oqTSxksyQnRcb8pZs1/TqBhE0k+/EOp3aagcHEw2losU0iKb+TEgeFtpog/PE04yrGOB
	xIHxTwCDRYO272gL6ZU0JSoqqaj2PlJhe8x1+Fro5VQhRb2Dvkq5/45pq3gkTAxJmBbV
	bTFA==
X-Gm-Message-State: AODbwcCbZped6JOGjVCZ9TPID9bZGWhKj0loB3w+tIDCeDSjWrXHhsCO
	fX1Osn7oiecHw2Fb
X-Received: by 10.25.155.207 with SMTP id d198mr6317905lfe.74.1496926067990;
	Thu, 08 Jun 2017 05:47:47 -0700 (PDT)
Received: from [10.9.21.51] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	h83sm1025050lji.10.2017.06.08.05.47.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 05:47:46 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1496925018-5300-1-git-send-email-samuli.piippo@qt.io>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <91dc3ff5-ad3a-ff4c-163a-4b82bb721422@gmail.com>
Date: Thu, 8 Jun 2017 15:47:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1496925018-5300-1-git-send-email-samuli.piippo@qt.io>
Subject: Re: [meta-qt5][PATCH v3] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Thu, 08 Jun 2017 12:47:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Patch updated to fix build issues with qtlocation and qtremoteobjects

On 08.06.2017 15:30, Samuli Piippo wrote:
> * adapt QtWebEngine recipe to use GN instead of GYP
> * add QtRemoteObjects and QtWebView as a new Qt modules
> * update available QtBase configure arguments
> * remove obsolete patches
> * patch all .pc files to remove build paths
> * include generated QML cache files in packages
> * the patch "configure paths for target qmake properly" could not
>    be applied anymore and support must be done differently
> 
> * QtWebEngine now requires gcc-multilib to be installed
>    on the host system
> 
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---


