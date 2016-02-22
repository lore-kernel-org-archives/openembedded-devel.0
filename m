Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 61666771B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 19:24:08 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id b67so119346879qgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 11:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Hrf9nu5bIZtVUDG91A0E1twq3i0+y8aZFnIths518VA=;
	b=Xyu5k62+C44OY2eTvg142LSivfAUNWKSBXCPoS00E9Rn1tjnhruiXoqHKUFmcIAr4r
	8RFl4w73MTy6IbZDBehZGvvwiOBSjmLCeJPObp1XcJZQJP6i5UuZ1JFwu/k1RX2tD2sI
	oTJqkyU+7SGAbPEfog0douc0bk2U6X7TWfZNmrQlpbPoVk79Pr4d/bTnkyVs0Z4714lw
	WTUS1zvRu8nNObgbI5CjN14zpdmCFQUGRvM75xPURxtXxE59UaeJJuXs2kPUiYPz/obu
	ikl5il2fRq/N/EKYQvmefz9V3MeN5NL4GQizweO94sPTl7jDpnfwlgo92oGiHUCsE0+d
	mlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Hrf9nu5bIZtVUDG91A0E1twq3i0+y8aZFnIths518VA=;
	b=eowIARf+31DImU/IAUKgyYSikd70/mH1wLljPssVIWwPnmxMSHDVswEWLYpOo5gfoo
	TkkV0ENRftnnKyQDUknJZUBo65qXPzIa1p+y6G1pNKK/j0j29TOPgCyR5/+IRXpvjadP
	OnS/d6Dol4DL/Qj+xY4cbTzDIL/uDbWBXuY4VNdSAi976UY35wX4JAVfiL3dMLIZOvH0
	ozUa3k1v5hmkLkv6fYmaisgdm1HOx9jTH7D8vZ9KjgGTFzXnolfPOf5MM+B4us5Btg+V
	XqIajcPK8KCL/KW8qMemrSOlHFOyppV6G+gzsfOhRoeZS259runS+f3h2biaxc/fCKIE
	9dVQ==
X-Gm-Message-State: AG10YOQegmsmi6s6GDfx64+g+IYqcvV4wGZzyKHBZ+tSAqefoObnSFfdIKY5PqXmFLfurCCz0SP3TYsl+GKPmQ==
X-Received: by 10.140.238.8 with SMTP id j8mr38889981qhc.76.1456169049719;
	Mon, 22 Feb 2016 11:24:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 22 Feb 2016 11:23:40 -0800 (PST)
In-Reply-To: <56CB30E7.2010700@balister.org>
References: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
	<1456146596-6976-8-git-send-email-Martin.Jansa@gmail.com>
	<56CB30E7.2010700@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Feb 2016 11:23:40 -0800
Message-ID: <CAMKF1spick+d43bJM_6yP1=oPWbCdVofb0LSZ65=HFWXEEzEdA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 08/10] zeromq, cppzmq, python-pyzmq: Blacklist, zeromq is broken
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
X-List-Received-Date: Mon, 22 Feb 2016 19:24:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 22, 2016 at 8:01 AM, Philip Balister <philip@balister.org> wrote:
> Updating zeromq to 4.1.4 resolves this problem. I'm preparing a patch.
> Thanks for catching this!

yes, I was worried about this blacklist.

>
> Philip
>
> On 02/22/2016 08:09 AM, Martin Jansa wrote:
>> * http://errors.yoctoproject.org/Errors/Details/35121/
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb          | 2 ++
>>  meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb        | 3 +++
>>  meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb | 2 ++
>>  3 files changed, 7 insertions(+)
>>
>> diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>> index 1a59716..3c1eb26 100644
>> --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>> +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>> @@ -17,3 +17,5 @@ do_install () {
>>  PACKAGES = "${PN}-dev"
>>
>>  RDEPENDS_${PN}-dev = "zeromq-dev"
>> +
>> +PNBLACKLIST[cppzmq] ?= "Depends on broken zeromq"
>> diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
>> index 5d0e2d5..bd6c1ef 100644
>> --- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
>> +++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
>> @@ -28,3 +28,6 @@ do_install_ptest () {
>>          install -d ${D}${PTEST_PATH}/tests
>>          install -m 0755 ${B}/.libs/test_* ${D}${PTEST_PATH}/tests
>>  }
>> +
>> +# http://errors.yoctoproject.org/Errors/Details/35121/
>> +PNBLACKLIST[zeromq] ?= "BROKEN: zeromq-4.1.3/src/curve_client.cpp:61:18: error: ignoring return value of 'int sodium_init()', declared with attribute warn_unused_result [-Werror=unused-result]"
>> diff --git a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
>> index b5baf82..8aeb1b6 100644
>> --- a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
>> +++ b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
>> @@ -22,3 +22,5 @@ do_compile_prepend() {
>>      echo libzmq_extension = False >> ${S}/setup.cfg
>>      echo no_libzmq_extension = True >> ${S}/setup.cfg
>>  }
>> +
>> +PNBLACKLIST[python-pyzmq] ?= "Depends on broken zeromq"
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

