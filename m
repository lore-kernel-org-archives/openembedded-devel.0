Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f179.google.com (mail-yb0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9A59C77FB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 21:44:22 +0000 (UTC)
Received: by mail-yb0-f179.google.com with SMTP id 132so41268437ybq.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ONLx3YpVcSS4/Tw5YDkFJ01GOYNtiTfMJkKeIjyYkWM=;
	b=ZaUx4zaUDJtlQri5bq5A/Q7UybVSiFx+HWPDVI58OEerY/KTr0j9XgrAW9ycr3Z55j
	H1ixZGxR1rjlrEfE2cfWfFahhFb3r8YFxSLat/edLG30PGJWLqlUFqNt6H+6MH3I626R
	WKJCDqvOzOrmCjbmzqmVIvTShMv0WyPDJA3awh/Nj/B0F8stEb0JbP2749sXxNLwa2lB
	F7npZPFvWar0vc95E/2GF7Mhw8L9gAo8q4FrgBlLgfqszTGi2dciqJ3M2QJE9S2mL7l9
	CG0mR0HKKhB73V3r0K5JanpLUZI10ibmGxQRcYeykLbhKbnc5Bc2TNW2Nam5lV/pz+6/
	LzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ONLx3YpVcSS4/Tw5YDkFJ01GOYNtiTfMJkKeIjyYkWM=;
	b=KycoiFm79AhPSOLA3mNyaaH3YcQIzBVhb52SDJisn9Rvr+0DwXDgfo1hNCJliBsKaK
	ErMLMTdgnP4vB/GymfPU9nzqRF8cPF7Ilo2ktFjc3crg2lwVSDQ3WB0jGKXr0ZoH59Vf
	ehJtkL0mDXo82tG2o409SToNnok6Y2Bwg9LhP7ykbE9uPMFh0NQIWfzREkgWNFvlPt3F
	R33MUfu4Xo8ZdoJU4mKgRSW3HQk6RGIQjmL5DZZBJMiUA3yEbZSRjG5a6CJTXupWAIis
	YF27AWPXNFLqvVG2cH0oCFi7pwBB0IzrZDP+Cq0n/rypT7aKUaUI36NvX/1wTVLwzf5/
	QM+w==
X-Gm-Message-State: AODbwcCPvKyLr3Y5iFYiS3PDzcil93hY2UM81IXyO462f/aAdTDPEAQu
	p7B/2fry+LANM62shvtXfICyhCYhdA==
X-Received: by 10.37.85.139 with SMTP id j133mr25148537ybb.160.1495575863455; 
	Tue, 23 May 2017 14:44:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Tue, 23 May 2017 14:44:22 -0700 (PDT)
In-Reply-To: <c548dc49-a1c6-2323-4c73-e7812b70ebfc@gmail.com>
References: <1495430748-34054-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<c548dc49-a1c6-2323-4c73-e7812b70ebfc@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 23 May 2017 23:44:22 +0200
Message-ID: <CA+chaQdo+woo4H6ppJHD=F5+3=AtiU28g+SZfXof6JX286anug@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 23 May 2017 21:44:22 -0000
Content-Type: text/plain; charset="UTF-8"

Also all 3 fail to build:
http://errors.yoctoproject.org/Errors/Details/143047/
http://errors.yoctoproject.org/Errors/Details/143045/
http://errors.yoctoproject.org/Errors/Details/143044/

On Mon, May 22, 2017 at 8:40 AM, Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> Since the code seems to be copy-pasted as is to several modules, it really
> should be moved to a new .bbclass or .inc and inherited/included in the
> modules that support it.
>
> -samuli
>
>
> On 22.05.2017 08:25, Huang Qiyu wrote:
>
>> Add ptest for qtxmlpatterns by using provided testsuite.
>>
>> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> ---
>>   recipes-qt/qt5/qtxmlpatterns/run-ptest |  5 +++++
>>   recipes-qt/qt5/qtxmlpatterns_git.bb    | 24 ++++++++++++++++++++++++
>>   2 files changed, 29 insertions(+)
>>   create mode 100644 recipes-qt/qt5/qtxmlpatterns/run-ptest
>>
>> diff --git a/recipes-qt/qt5/qtxmlpatterns/run-ptest
>> b/recipes-qt/qt5/qtxmlpatterns/run-ptest
>> new file mode 100644
>> index 0000000..6c3f522
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtxmlpatterns/run-ptest
>> @@ -0,0 +1,5 @@
>> +#!/bin/sh
>> +
>> +for x in ` awk '{print $1}' tst_list `;do
>> +    ./${x};
>> +done
>> diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/
>> qtxmlpatterns_git.bb
>> index c7efaf3..bc863de 100644
>> --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
>> +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
>> @@ -14,8 +14,32 @@ LIC_FILES_CHKSUM = " \
>>       file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>>   "
>>   +inherit ptest
>> +
>>   DEPENDS += "qtbase"
>>     SRCREV = "9f7e01b582b1bd83cc6b8a854c510871335e2e74"
>>     BBCLASSEXTEND =+ "native nativesdk"
>> +
>> +addtask do_populate_sysroot after do_install before do_compile_ptest_base
>> +deltask do_compile_ptest_base
>> +addtask do_compile_ptest_base after do_populate_sysroot before
>> do_install_ptest
>> +addtask do_install_ptest after do_compile_ptest_base before do_package
>> +
>> +do_compile_ptest() {
>> +    cd ${S}/tests
>> +    qmake -o Makefile tests.pro
>> +    oe_runmake
>> +}
>> +
>> +fakeroot do_install_ptest() {
>> +    mkdir -p ${D}${PTEST_PATH}
>> +    t=${D}${PTEST_PATH}
>> +    for var in ` find ${S}/tests/auto/ -name tst_*`; do
>> +        if [ not ` echo ${var##*/} | grep '\.'` ]; then
>> +            echo ${var##*/} >> ${t}/tst_list
>> +            install -m 0644 ${var} ${t}
>> +        fi
>> +    done
>> +}
>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

