Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id C30B87FD83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 22:50:00 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id t6so601822qvs.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 14:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SKfIw+tW3iLnsecuUd+2nxRbsYxOli/8YgMJA/Rq13U=;
	b=mSG2PdMGLWcl3IGa3wZkeDXR1+mRaYAPxD9ZxiBM2Ox0r2zcNV2IxSwS1TUfRaFN3C
	9CxZ+nPWYJoVgGuSqQiWUJw6WgZCKYLoK8GRAxbWIOO8F3ncTK3pyIEz9wkr4xkicGj6
	/LQGMhTxcxxcOhoMl8OTu3bxqJaEDT5+mtB+R2dBXIT0RmIK3TDbMqeMZu552iM6Q2D3
	cvb3uPNzjfIFTsifltzGb4sX0W0gpi4DKHZ5JOFRTwcPR3JixUCEqTmTHkEgdA7rxya+
	aIt3wu44Qc0uE1XI6RsvBBDb6BAhblwUMdj/aD2k1p8Ejob6QDcBP5a3UEPMIhypAkDW
	IxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SKfIw+tW3iLnsecuUd+2nxRbsYxOli/8YgMJA/Rq13U=;
	b=dkwOB0WcnoET1fNAC3g/62bRdQGXNjeu4+wpWewG8vW7ayePR33SX4lfPgGciMMuH7
	c55NHmTMXmMS/pDbe+a0/oUqJFkZNQlM9MOsfvT6uj+zekky4QcUxXS5scv+78mIiLps
	vxZ9f0ONe5J9u0+zxUWlFdUWIRvoNMKdRmqxO3ysz+cSNA2aGuJoqIj+X3B3MYxZ41YO
	1sieyvd80FPf7U4SNE4neBBG+Oky3djDwQ+8no3VFr89A8Xo8XBlc+5v1tfUiMED/Nv4
	WSOFgNkIRlYnpsyYOgtvfVrOK7FsA5h6/mEPbcnViQ12QQvhfEZy1qRFX5BcG14zs6nY
	oCpQ==
X-Gm-Message-State: APjAAAXWt6tDEuXE13tncufbusWKNwqujUJL9r9rVIqlRgFOX6OU1PPz
	NkZqlrAhK/lOlXPRCAg+k8GwbiC1VVS/h4EPrcc=
X-Google-Smtp-Source: APXvYqyzmxZWMT3QhN+/2GBCGMSZILgWwwpEKazS20kynjdyEr06mRwC4gacSTGB6LKt6OgdcjyhQ8pMA/BBg7GvCpw=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr13186772qvm.206.1579733401349;
	Wed, 22 Jan 2020 14:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20200122063823.242098-1-raj.khem@gmail.com>
	<CANx9H-AzLAHLqNeTQppafuVFpjZCMWjjt2D7n7SeJxn5mGUzVQ@mail.gmail.com>
In-Reply-To: <CANx9H-AzLAHLqNeTQppafuVFpjZCMWjjt2D7n7SeJxn5mGUzVQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jan 2020 14:49:34 -0800
Message-ID: <CAMKF1spU=mxEzaCcO=djf+ZkY9eJ-18=DiKTbpc6uozhn=Hvww@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 01/12] python-m2crypto: Use PYTHON_PN instead of hardcoding python name
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
X-List-Received-Date: Wed, 22 Jan 2020 22:50:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 22, 2020 at 6:15 AM Tim Orling <ticotimo@gmail.com> wrote:
>
> We should start merging the inc and bb files now that we do not need to support more than one python version.
>

certainly, a good idea, before they decide to do py4 :), I am knee
deep in ensuring py2 is not needed on meta-openembedded layers but if
you are cooking patches  for this cleanup thats good.

> On Tue, Jan 21, 2020 at 10:38 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Lets this inc file become usable for py3 module as well
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-python/recipes-devtools/python/python-m2crypto.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
>> index 5f5444f37e..76dd58ce04 100644
>> --- a/meta-python/recipes-devtools/python/python-m2crypto.inc
>> +++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
>> @@ -17,7 +17,7 @@ PYPI_PACKAGE = "M2Crypto"
>>  inherit pypi siteinfo
>>
>>  DEPENDS += "openssl swig-native"
>> -RDEPENDS_${PN} += "python-typing"
>> +RDEPENDS_${PN} += "${PYTHON_PN}-typing"
>>
>>  DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
>>  DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
>> --
>> 2.25.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

