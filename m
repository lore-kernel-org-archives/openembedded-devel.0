Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E2A6E7016E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 13:10:23 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id w12so30792660wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2016 06:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=GLHzf9pJIswgMusgROfMEiuPduRJVCWCXk5XzQ4Ytn0=;
	b=fe1NznU1NuIQJNKTcQK4r6uUbWP5nF9kXbtZT6fjBMdnkACp6VOm2NAXbTCyu8Zeww
	zd1DkcduaSYuDvnqIzj+ExrG+INokHfoe+kKZl4zjqr4nC1oCgvfqSsWydrXKC1bveKP
	tihXa5yGoENI0GwA8Xu/mITYPmqA8GIX5ILlKVDyOGLV4aGNmd6FjDsn8pocwSpP/iLA
	dD3cz/edUt3/0itwFpxMOkV9KCeWU3QixnUignmTmgNeuJPnsPODY1E/BfSh6CkCsN8t
	zdOq4gazpCermhDB1+V7tkCyrYCg/YpM9c6VFFgHzfWI8MpwViGEmNig53K7BeCtudGv
	oGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=GLHzf9pJIswgMusgROfMEiuPduRJVCWCXk5XzQ4Ytn0=;
	b=hy/C5552s9pYDZUg+SmviUXHed+Vd8EERNc4ghfEpHaDvsBp5UutCMJXaouwjQbhoF
	V7mMTm/iSAyTTHmPdfcN+FyVjDiLlCSdDoRweHS2p/maFJq8PvCfqnvy64vsgQJVo9YF
	KdejBgKZkH08WvudnloXxIdwu+yeKxOd/2NPYej2WcPXBHG/GW4XRklYfascKtblNTYv
	y1P6Krle/oe+GUNACFo6P5wne8in9NkdYu+ldkLuHy0/0OLa2Q4BVvK0sRG/EPuxEEtt
	p/rJWmjLziF8BRT0DyVR9Uf06rUQb4dFzMPctEt7CHX8vCju67gn20dd7CzWGLMBCGr5
	xsDg==
X-Gm-Message-State: AE9vXwOHJbUAcC1Mh0dmEgAYn492FCuBZBtj/Fj17mRkD7l5/dkqyH4brTP3l+ZPibBgL/JPhTAxNP/1nImE4w==
X-Received: by 10.28.131.208 with SMTP id f199mr2832325wmd.116.1473426623638; 
	Fri, 09 Sep 2016 06:10:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Fri, 9 Sep 2016 06:10:03 -0700 (PDT)
In-Reply-To: <1467977051.1401.9.camel@intel.com>
References: <1467977051.1401.9.camel@intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 9 Sep 2016 15:10:03 +0200
Message-ID: <CAPybu_1eaFHPHJTksdQZFqt3SGJmPKKrHsZYFPkYkRuybnu8yw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	patrick.ohly@intel.com, Henning Heinold <heinold@inf.fu-berlin.de>
Subject: Re: [meta-java] icedtea7-native - IOException constructor compile error
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
X-List-Received-Date: Fri, 09 Sep 2016 13:10:24 -0000
Content-Type: text/plain; charset=UTF-8

Hi Patrick

I am struggling with te same issue. Did you manage to fix it on your side?

Regards!



On Fri, Jul 8, 2016 at 1:24 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Hello!
>
> I'm trying to build openjdk8, using the master branches of OE and
> meta-java. Distro is Ostro, which configures:
>
> PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
> PREFERRED_PROVIDER_virtual/java-native = "cacao-native"
> PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
>
> In this configuration, cacao-initial-native ecj-initial-native
> classpath-native ecj-bootstrap-native jikes-initial-native get build
> before icedtea7-native fails to compile with:
>
>         build-bootstrap-javac:
>             [javac] Compiling 1 source file to /fast/build/ostro/x86/tmp-glibc/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/langtools/build/bootstrap/classes
>             [javac] ----------
>             [javac] 1. ERROR in /fast/build/ostro/x86/tmp-glibc/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/langtools/src/share/classes/com/sun/tools/javac/file/ZipFileIndex.java (at line 1169)
>             [javac]     super(message, cause);
>             [javac]     ^^^^^^^^^^^^^^^^^^^^^^
>             [javac] The constructor IOException(String, Throwable) is undefined
>             [javac] ----------
>             [javac] 1 problem (1 error)
>
>         BUILD FAILED
>         /fast/build/ostro/x86/tmp-glibc/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/langtools/make/build.xml:446: The following error occurred while executing this line:
>         /fast/build/ostro/x86/tmp-glibc/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/langtools/make/build.xml:789: Compile failed; see the compiler error output for details.
>
>         Total time: 2 seconds
>         Makefile:201: recipe for target 'build' failed
>
> Sure enough, classpath_0.99 only has IOException with a constructor that
> takes a single parameter
> (classpath-native/0.99-r6.0/classpath-0.99/java/io/IOException.java):
>
>         public class IOException extends Exception
>         {
>           /**
>            * Compatible with JDK 1.0+.
>            */
>           private static final long serialVersionUID = 7818375828146090155L;
>
>           /**
>            * Create an exception without a descriptive error message.
>            */
>           public IOException()
>           {
>           }
>
>           /**
>            * Create an exception with a descriptive error message.
>            *
>            * @param message the descriptive error message
>            */
>           public IOException(String message)
>           {
>             super(message);
>           }
>         } // class IOException
>
>
>
> The code which doesn't compile is
> icedtea-2.1.3/build/openjdk-boot/langtools/src/share/classes/com/sun/tools/javac/file/ZipFileIndex.java:
>
>     static final class ZipFormatException extends IOException {
>         private static final long serialVersionUID = 8000196834066748623L;
>         protected ZipFormatException(String message) {
>             super(message);
>         }
>
>         protected ZipFormatException(String message, Throwable cause) {
>             super(message, cause);
>         }
>     }
>
> So I'm not surprised that it fails; this can't work. The questions are:
> what combination does work, and when did the combination above stop
> working?
>
> [please reply also directly, I'm not receiving list emails]
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Ricardo Ribalda

