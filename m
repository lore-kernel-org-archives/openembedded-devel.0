Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id AA6A57579D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 17:13:37 +0000 (UTC)
Received: by ieclw1 with SMTP id lw1so102776996iec.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=cfEfhrmm34Q54ta2PakI8/wtyT4LSogNFnx6ktQh6gY=;
	b=HpEqtjkX/XU5omtIJ7E3V4PisKN3oSmrYWGdUHHWrgwYIhBxVpev2DT9gBSeGZvCj6
	DTUx8RPAyxaM8sZONBoF92xR5A2BszYSuGK1kJvd3wqifAlKnrTdEspBmeoedy09QF16
	YHzdoh6QbYM9rCF44N2bohMu7wCCSLz34e4eGbk5WB26V60w6242+aeraE5a7nMzkMm+
	S2egvPhPdFzkb5GuVo64Et5dejNmEHU9YPrbZwGuapyYUIYj0oNooXVgcKbaVArA0J1W
	ZIkE8QQq1SY0r1REUfrR6UG3mWW23HM76++7rhf7KIz421IMmfry2x5bma3quP2zxflp
	71pw==
X-Received: by 10.107.6.28 with SMTP id 28mr5266713iog.54.1433783619232; Mon,
	08 Jun 2015 10:13:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Mon, 8 Jun 2015 10:13:08 -0700 (PDT)
In-Reply-To: <20150608170503.GD2384@jama>
References: <1433782597-24380-1-git-send-email-raj.khem@gmail.com>
	<20150608170503.GD2384@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jun 2015 13:13:08 -0400
Message-ID: <CAMKF1spH5Fovxv6vp0S2T27GHt0BFqO6Tmm1ig3gJZ4+0M5peg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/2] qtbase: Fix build with musl
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
X-List-Received-Date: Mon, 08 Jun 2015 17:13:42 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 8, 2015 at 1:05 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Jun 08, 2015 at 09:56:36AM -0700, Khem Raj wrote:
>> This is a generic fix to accomodate musl which is adhering to posix
>> and doesnt have legacy to carry, so lets invert the conditional so the
>> special legacy case of glibc is checked and else part then covers rest
>> of cases which are newer glibc/uclibc and musl
>
> Can you prepare the patch in:
> https://github.com/meta-qt5/qtbase/commits/b5.4-shared
> and generate it with format-patch?
>
> This way it's hard to see what's the real change and what's just
> formating from different diff.

you are basically asking for git based workflow for generating patches
and not do
quilt based  patch refresh updates ?

I want to understand the process

>
> Thanks
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 43 ++++++++++------------
>>  1 file changed, 19 insertions(+), 24 deletions(-)
>>
>> diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
>> index 0f6bcbe..d54079c 100644
>> --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
>> +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
>> @@ -51,10 +51,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>   create mode 100644 mkspecs/linux-oe-g++/qmake.conf
>>   create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
>>
>> -diff --git a/configure b/configure
>> -index 6ce6753..0a00d6d 100755
>> ---- a/configure
>> -+++ b/configure
>> +Index: git/configure
>> +===================================================================
>> +--- git.orig/configure
>> ++++ git/configure
>>  @@ -316,6 +316,16 @@ getQMakeConf()
>>       getSingleQMakeVariable "$1" "$specvals"
>>   }
>> @@ -128,7 +128,7 @@ index 6ce6753..0a00d6d 100755
>>
>>   TEST_COMPILER=$QMAKE_CONF_COMPILER
>>
>> -@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
>> +@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]
>>           exit 1
>>       fi
>>   fi
>> @@ -152,7 +152,7 @@ index 6ce6753..0a00d6d 100755
>>   # build qmake
>>   if true; then ###[ '!' -f "$outpath/bin/qmake" ];
>>       echo "Creating qmake..."
>> -@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
>> +@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/
>>           fi
>>
>>           [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
>> @@ -175,10 +175,10 @@ index 6ce6753..0a00d6d 100755
>>
>>           if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
>>               setBootstrapVariable QMAKE_CFLAGS_RELEASE
>> -diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
>> -index 6b37a04..dcf6025 100644
>> ---- a/mkspecs/features/configure.prf
>> -+++ b/mkspecs/features/configure.prf
>> +Index: git/mkspecs/features/configure.prf
>> +===================================================================
>> +--- git.orig/mkspecs/features/configure.prf
>> ++++ git/mkspecs/features/configure.prf
>>  @@ -63,12 +63,12 @@ defineTest(qtCompileTest) {
>>       }
>>
>> @@ -194,11 +194,10 @@ index 6b37a04..dcf6025 100644
>>               log("yes$$escape_expand(\\n)")
>>               msg = "test $$1 succeeded"
>>               write_file($$QMAKE_CONFIG_LOG, msg, append)
>> -diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
>> -new file mode 100644
>> -index 0000000..2ad2810
>> +Index: git/mkspecs/linux-oe-g++/qmake.conf
>> +===================================================================
>>  --- /dev/null
>> -+++ b/mkspecs/linux-oe-g++/qmake.conf
>> ++++ git/mkspecs/linux-oe-g++/qmake.conf
>>  @@ -0,0 +1,40 @@
>>  +#
>>  +# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
>> @@ -240,11 +239,10 @@ index 0000000..2ad2810
>>  +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
>>  +
>>  +load(qt_config)
>> -diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
>> -new file mode 100644
>> -index 0000000..dd12003
>> +Index: git/mkspecs/linux-oe-g++/qplatformdefs.h
>> +===================================================================
>>  --- /dev/null
>> -+++ b/mkspecs/linux-oe-g++/qplatformdefs.h
>> ++++ git/mkspecs/linux-oe-g++/qplatformdefs.h
>>  @@ -0,0 +1,100 @@
>>  +/****************************************************************************
>>  +**
>> @@ -334,10 +332,10 @@ index 0000000..dd12003
>>  +
>>  +#undef QT_SOCKLEN_T
>>  +
>> -+#if defined(__GLIBC__) && (__GLIBC__ >= 2)
>> -+#define QT_SOCKLEN_T            socklen_t
>> -+#else
>> ++#if defined(__GLIBC__) && (__GLIBC__ < 2)
>>  +#define QT_SOCKLEN_T            int
>> ++#else
>> ++#define QT_SOCKLEN_T            socklen_t
>>  +#endif
>>  +
>>  +#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
>> @@ -346,6 +344,3 @@ index 0000000..dd12003
>>  +#endif
>>  +
>>  +#endif // QPLATFORMDEFS_H
>> ---
>> -2.4.2
>> -
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

