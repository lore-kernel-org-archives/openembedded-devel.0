Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id EA6D9786CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 18:00:08 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id d9so12611797wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mds0+5UauhH7BKimIEQ3QslB+p8VNVg5Isj8wBQM2Cg=;
	b=rgfzOVbpp2ctYJJtbMw+24G9hIoStmKlBdu4dmT/Xg8nt+nSiPRogWqWyC+dclufVA
	9WAB11AGxJhfUxCd79C3JjMlw0v9czMSg10IEMNzoJj+lqhmDUBjqVGjJnTYBvN1OuWC
	Gi/ILaEFTdqAulr2acQALM9DBfCv12DUlRC9h9HZVOGz8xL9d1IiHxRn/RYspU1fzvUI
	mZFDB9olZ4sHNh2/QSFW9qyVtviQgu1U1nh0sY5gQoKTGQRtCGtdMVDPaaOz09jw74vu
	Dcgc3pXCNuwbtAIXa1uY2lXxLuhVYHFxfdAtt+F2XdfgL/MNcHnYFh4y2m1+gz7yy3Hv
	mg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mds0+5UauhH7BKimIEQ3QslB+p8VNVg5Isj8wBQM2Cg=;
	b=nENniHWHTeyz9xcyW4WDRn9HNwoB1kuAInWtu/Np/okS8tdRDYYqz9Mfw4K4KXjZqJ
	NiJbooJ97iMgY9J7wCDdV2YwGJs42laIqWpqsoLQVm/OiAxbu0HmJW1GoT4FRBkUQRSl
	QUyAe21epsJQMa94L8rL2Fm1q8/i9If0LlccSYlesmKOhJxvgUp4rKVfuMPqPc2Rbz1Q
	HYuAR0KyXdC8tIendisohdfxcfwRgUm1ezBr7PCjCqHc6nj+Pe4tJsPT7TylQ43oG1Xa
	x7OTKnXcHGIlDBWMWOxpHM05HF5PXEXalblqUXYbqhsrsdsHb0lHSkRrEfXtqJ6jLf1i
	JV0Q==
X-Gm-Message-State: AKwxytdkgKwRvQs6fQo7un9Y5V0a4w4Ab/rRhim7F/AZhR8UyoOYh/tG
	fjKZUoPpHnaCcll4snEG8fLmmlhSs6N2em5rhiQ=
X-Google-Smtp-Source: ACJfBou2fbvNzI4I7PZtpuPXWNS3ywYF3aKZtMAad3455hamYURt86PT9VbqxHxEkSpF6WAqxMAuyVEM9HtLJrSUqx0=
X-Received: by 10.223.150.37 with SMTP id b34mr4883725wra.68.1516039209727;
	Mon, 15 Jan 2018 10:00:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Mon, 15 Jan 2018 10:00:09 -0800 (PST)
In-Reply-To: <1515635126-19293-1-git-send-email-denis@denix.org>
References: <1515635126-19293-1-git-send-email-denis@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 15 Jan 2018 19:00:09 +0100
Message-ID: <CA+chaQcvM9dwu665hiJdV3EYaOYpFa21xB5+G91T5msNvmYi9w@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>,
	Jose Lamego <jose.a.lamego@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][rocko][PATCH] qtwebengine: explicitly depend on bison-native
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
X-List-Received-Date: Mon, 15 Jan 2018 18:00:09 -0000
Content-Type: text/plain; charset="UTF-8"

Using the same e-mail thread for both patches for master and rocko, caused
the one for master being automatically marked as superseded by the rocko
one, see:
https://patchwork.openembedded.org/patch/147192/

This is a system generated Comment: Patch 147192 was automatically
marked as superseded by patch 147193.

I don't know if there is something we can change in patchwork to be
less stupid (other than replacing it with something more clever like
gerrit). This time I've noticed that there was patch for master as
well in the e-mail client, but looking just on patchwork I wouldn't
have noticed at all, not sure how many other patches are lost like
this.


On Thu, Jan 11, 2018 at 2:45 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> QtWebEngine uses bison during the build. While normally bison-native gets
> staged into sysroot indirectly by the toolchain via binutils-cross, it's
> better to have the dependency listed explicitly for deterministic builds.
> Otherwise, when using an external toolchain, it fails like this:
>
> | FAILED: gen/blink/core/XPathGrammar.cpp gen/blink/core/XPathGrammar.h
> | .../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/bin/
> python-native/python2
> |    ../../../../git/src/3rdparty/chromium/third_party/WebKit/
> Source/build/scripts/rule_bison.py
> |    ../../../../git/src/3rdparty/chromium/third_party/WebKit/Source/core/xml/XPathGrammar.y
> gen/blink/core bison
> | Traceback (most recent call last):
> |   File "../../../../git/src/3rdparty/chromium/third_party/WebKit/
> Source/build/scripts/rule_bison.py", line 83, in <module>
> |     returnCode = subprocess.call([bisonExe, '-d', '-p', prefix,
> inputFile, '-o', outputCpp])
> |   File ".../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py",
> line 168, in call
> |     return Popen(*popenargs, **kwargs).wait()
> |   File ".../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py",
> line 390, in __init__
> |     errread, errwrite)
> |   File ".../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py",
> line 1024, in _execute_child
> |     raise child_exception
> | OSError: [Errno 2] No such file or directory
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-qt/qt5/qtwebengine_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/
> qtwebengine_git.bb
> index 1f53e4a..ed179de 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = " \
>  DEPENDS += " \
>      ninja-native \
>      yasm-native \
> +    bison-native \
>      qtwebchannel \
>      qtbase qtdeclarative qtxmlpatterns qtquickcontrols qtquickcontrols2 \
>      qtlocation \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

