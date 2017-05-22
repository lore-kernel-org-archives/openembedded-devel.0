Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id D38F477F69
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 06:40:07 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id 99so4390329lfu.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 May 2017 23:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=wWMrQZAaqvZFhxVHDycUkjSsgyIWrxUAoIybMvwh2zc=;
	b=nEmK3JZdrvMSFcgGh1287Ul2ly95VY42BodwFmC2D9im9Or0KtVzq0al/YdDjq9+xU
	f8gPNIpGTtqaU/IN3cEONnCpIuDJJZaaH7haJBrtliK57qAP73+h2jSeKEe4yd9dkrIM
	aXZm0Bitmz8mGNO1yTO4kutpm7DYUq9DezB4D++03RlQEyVFncSNCkMiCQkcJcRqScee
	1KYepBLltUaQWxv1ojNyv/Pa3KHKoz1mlD7rTEf/2ot/SMtRUbK4ho8wfbfhVJf+0ggi
	P4xu/fUJrEzRa+NLTNPgnvRI68rPwuJsdF8sq3etSFBcK0OMjRVnlzP2Der1VKytVdUF
	dGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wWMrQZAaqvZFhxVHDycUkjSsgyIWrxUAoIybMvwh2zc=;
	b=R0GoEJMS3X16NycUZRQZ46Y8pQsWiz2s6x2X+DDmL9JrNUi81L6TbknXu0uPj7fo4V
	l2PBPZKpMOGg7zgU/igl5ZNvMvIFmGP8tiO0Lp13ZpQ33j2xpLdIYAQKjh+xBy84endA
	rR4VKPoQJZH60AfcfMOjJj3qZwYUJti2sDbiHHjcA/IRccgkA9aslHY2CLng9W0JPWRI
	7I/K37NytZcHENUUNRKXrKCP9HGH/A01lUDDSvWRlRCdFlFkt4ZqCMzbHfMeiXH2NQun
	GbzfnVliX2L7RP7x8dqGa6wqFSLYae5jnu/VIA+DnCoSXTXqE3tz7UeUgIkZIC83B6Xz
	ULEA==
X-Gm-Message-State: AODbwcCzh9Jt3ki00/O05LerPgTIQOZUE5GctU9CrAb1gqCoo96y7fnd
	dpHcog2ybVVQc4tT
X-Received: by 10.25.19.85 with SMTP id j82mr5293220lfi.16.1495435208118;
	Sun, 21 May 2017 23:40:08 -0700 (PDT)
Received: from [10.9.21.51] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	u24sm2428004lfi.36.2017.05.21.23.40.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 23:40:07 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1495430748-34054-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <c548dc49-a1c6-2323-4c73-e7812b70ebfc@gmail.com>
Date: Mon, 22 May 2017 09:40:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1495430748-34054-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [meta-qt5] [PATCH] qtxmlpatterns: add ptest
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
X-List-Received-Date: Mon, 22 May 2017 06:40:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Since the code seems to be copy-pasted as is to several modules, it 
really should be moved to a new .bbclass or .inc and inherited/included 
in the modules that support it.

-samuli

On 22.05.2017 08:25, Huang Qiyu wrote:
> Add ptest for qtxmlpatterns by using provided testsuite.
> 
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>   recipes-qt/qt5/qtxmlpatterns/run-ptest |  5 +++++
>   recipes-qt/qt5/qtxmlpatterns_git.bb    | 24 ++++++++++++++++++++++++
>   2 files changed, 29 insertions(+)
>   create mode 100644 recipes-qt/qt5/qtxmlpatterns/run-ptest
> 
> diff --git a/recipes-qt/qt5/qtxmlpatterns/run-ptest b/recipes-qt/qt5/qtxmlpatterns/run-ptest
> new file mode 100644
> index 0000000..6c3f522
> --- /dev/null
> +++ b/recipes-qt/qt5/qtxmlpatterns/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +for x in ` awk '{print $1}' tst_list `;do
> +    ./${x};
> +done
> diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
> index c7efaf3..bc863de 100644
> --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
> +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
> @@ -14,8 +14,32 @@ LIC_FILES_CHKSUM = " \
>       file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>   "
>   
> +inherit ptest
> +
>   DEPENDS += "qtbase"
>   
>   SRCREV = "9f7e01b582b1bd83cc6b8a854c510871335e2e74"
>   
>   BBCLASSEXTEND =+ "native nativesdk"
> +
> +addtask do_populate_sysroot after do_install before do_compile_ptest_base
> +deltask do_compile_ptest_base
> +addtask do_compile_ptest_base after do_populate_sysroot before do_install_ptest
> +addtask do_install_ptest after do_compile_ptest_base before do_package
> +
> +do_compile_ptest() {
> +    cd ${S}/tests
> +    qmake -o Makefile tests.pro
> +    oe_runmake
> +}
> +
> +fakeroot do_install_ptest() {
> +    mkdir -p ${D}${PTEST_PATH}
> +    t=${D}${PTEST_PATH}
> +    for var in ` find ${S}/tests/auto/ -name tst_*`; do
> +        if [ not ` echo ${var##*/} | grep '\.'` ]; then
> +            echo ${var##*/} >> ${t}/tst_list
> +            install -m 0644 ${var} ${t}
> +        fi
> +    done
> +}
> 


