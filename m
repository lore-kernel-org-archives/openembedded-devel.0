Return-Path: <gary.robertson@linaro.org>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id D7F536AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2015 04:19:33 +0000 (UTC)
Received: by qkx62 with SMTP id 62so217852478qkx.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 21:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lOapr+SLx9aiaezv/+7BNZRz6hHQ9QNko96PLvyNc0c=;
	b=FcyKAV4oBt4aSDfxXDQ9zJmI02Yr49cdwHrk+g5xJGJ694pFfUxqAfwFnBwIxd5rfA
	KdO6xs83o2ZYA/ORCyuVjYNFzObOtzdmSQDeOBVQL0FXyISkEgkyxcPqPOP8BGecEkfY
	j2cCGN6ynfVukCeFqYgoqUd50negNRYcwjE7W2BM0+MTHuzkC05gmGJqMBLzog39h3c7
	A1h2wN4YNHc1ofW4USLvN9CTq+9NtSKMD3YMreDvxJtPpjSrPxnTH9WNewUJOPM4NcxV
	pyErTNjmYzbPKnYy81lBdF3VT1H+koHRxQzrfpfrmM3EeqpYCzI/+LOqFIrOoIusL4fY
	a2GA==
X-Gm-Message-State: ALoCoQnS7/HNi1g+fFuodvPsW5ZCdKyzfgRUWWoxLgjbavOXQYuOCUL8xaH/1IyMZ9Ao2R4HixKS
X-Received: by 10.182.24.97 with SMTP id t1mr14536009obf.77.1428985173287;
	Mon, 13 Apr 2015 21:19:33 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114]) by mx.google.com with ESMTPSA id
	l140sm5714238oig.20.2015.04.13.21.19.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 21:19:32 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Apr 2015 23:18:59 -0500
Message-Id: <1428985140-4170-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20150413134540.GG2330@jama>
References: <20150413134540.GG2330@jama>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libhugetlbfs: x86 - don't link against host libs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Apr 2015 04:19:34 -0000

The x86 build linker scripts were still searching hard-coded paths on the
build host for libraries.  As it happens, the libraries needed for
linking the failing executable are present on my build host, so the build
succeeds here despite the erroneous linker paths.  Consequently I had
stupidly assumed the resulting QA warning was a fairly benign error
until your test build in a pristine environment demonstrated otherwise.

I'm unclear as to the exact behavior shown by your log of the failed build,
but since it is a linker error I am for now assuming it is precipitated
somehow by the flawed library search paths.  In any case with the
hard-coded host paths commented out I get a clean build without the QA
warning and see no similar logs in my local builds - so I hope this will
also fix the build failures on your end.

Regards,

Gary Robertson


