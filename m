Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1B39B6011C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 17:56:51 +0000 (UTC)
Received: by lfaz4 with SMTP id z4so31148685lfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 09:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sp1uigEuhyW+4/njhU8hFjsOXdNx12JIgD5iOvthSAg=;
	b=pv0SsiUbMCMAQkDNTaD+Y5QtGGytjROKZ8ut/XlVCOgcEIvg7l9uREkGjWLA4S46Zc
	RJo24Jy9DkFjNLLciUwn2Y8i+KVRMTmz6byDFuyc6lXJH/5j3w3p0c5ClmWKMrZnMxpl
	3VRi/es0DzaorchvMza/G4XnKRiZx7AI4g5z0pb1JnWdWlRHz/FLWlOoSHRXqoo2gvlw
	hsLy7rCG9djE81Lv4IQokRriwq5bFZ/uo50bnKeRTVd1cKoI1FuNbn0ejYZbb8VYxr2O
	Fn11Z3PHuffAK0YsshXmouXVZytLRvdASPircNBzgYXGxZ6fQ4Sh+bDLEzidEByZUorK
	dnEw==
MIME-Version: 1.0
X-Received: by 10.25.146.79 with SMTP id u76mr14049590lfd.146.1448387811557;
	Tue, 24 Nov 2015 09:56:51 -0800 (PST)
Received: by 10.25.199.73 with HTTP; Tue, 24 Nov 2015 09:56:51 -0800 (PST)
In-Reply-To: <1448367278-3115-2-git-send-email-mario@ossystems.com.br>
References: <1448367278-3115-1-git-send-email-mario@ossystems.com.br>
	<1448367278-3115-2-git-send-email-mario@ossystems.com.br>
Date: Tue, 24 Nov 2015 09:56:51 -0800
Message-ID: <CANx9H-At559xwpyM-qYch3qaUu2KK=4CDdAer8Byt1hkxeLk0A@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [PATCH] python-chardet: add recipe for version 2.3.0
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
X-List-Received-Date: Tue, 24 Nov 2015 17:56:52 -0000
Content-Type: text/plain; charset=UTF-8

This package has some unmet dependencies. Just a quick look at setup.py
shows you will need python-re and  python-setuptools from oe-core.

Regards,

Tim

On Tue, Nov 24, 2015 at 4:14 AM, Mario Domenech Goulart <
mario@ossystems.com.br> wrote:

> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> ---
>  meta-python/recipes-devtools/python/python-chardet_2.3.0.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-chardet_2.3.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
> b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
> new file mode 100644
> index 0000000..25326aa
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "Universal encoding detector for Python 2 and 3"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
> +
> +SRC_URI[md5sum] = "25274d664ccb5130adae08047416e1a8"
> +SRC_URI[sha256sum] =
> "e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa"
> +
> +inherit pypi
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

