Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id E7877793DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:00:40 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id b19-v6so9139035qkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 08:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rff51Nr08UYuQs2IZ3Q8QdgUDg4l14Bk6nSVu13mIGw=;
	b=Ujxdw0UipXswd2LTfO1OFdYaRr02ora9tEO9cIcnAjpf0yaLa0ZetNuhjj+NeO9vac
	xxF7BspCB9SsavXkNhPX0fwiaTOSW2nZ9nIzzMnDJO+WEAc8XyJnK1wAifxo32Y6uMWN
	0vGh3PeRqFdAo97iI95LyV8GOqTQwPApFUvhe7hD8p5SINOtgQSlQtzuiQan22RMlSOU
	YHxS3H6ur/r4G4sVJhfB/7D/76m+2IUbYAsrP72MPzGpmG4I01p7uWNn2Dm6oXxOdPSE
	ux4D1F8tQPYkdiR2/URGY0dbap9nqjNVNfXpXKQhVu2JI8hziVBQTNnRP6Fy8oDETClT
	n9Ew==
X-Gm-Message-State: APzg51BYBVdxNWKCtqSmsPYBrk1fR3f6iNfB5ST3e0CjRTMsEKviL6UN
	rgG/UhuKiyWWLa5wEsDOlwQlTYBv
X-Google-Smtp-Source: ANB0VdZrM8QQVh+ke5vMrn2zROXYODOq0wUFBEA7sW1HX6i7LRPdccLcB//slQ4DIcIAulz/udXyAg==
X-Received: by 2002:a37:c845:: with SMTP id
	c66-v6mr16577527qkj.65.1537196441437; 
	Mon, 17 Sep 2018 08:00:41 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	q26-v6sm10963611qta.18.2018.09.17.08.00.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Sep 2018 08:00:40 -0700 (PDT)
Message-ID: <443986f19cf49e6d735faac8d6646a48f3ab5349.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2018 16:00:39 +0100
In-Reply-To: <1536343810-87649-4-git-send-email-yevgenyp@pointgrab.com>
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
	<1536343810-87649-4-git-send-email-yevgenyp@pointgrab.com>
User-Agent: Evolution 3.30.0-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 3/3] ca-certificates-java: Distinguish between SYSROOT and D
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
X-List-Received-Date: Mon, 17 Sep 2018 15:00:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-09-07 at 21:10 +0300, Yevgeny Popovych wrote:
> This fixes ca-certificates-java-hook invocation via
> update-ca-certificates on build host and as a native tool.
> Provide SYSROOT variable in the postinst and consume it in the script,
> like ca-certificates recipe does.
> 
> SYSROOT is set whenever the script is executed on the build host
> (do_rootfs, or as native dependency).
> D is only set during do_rootfs.
> 

I think I'm missing something...
It looks like this patch switches the hook script to use $SYSROOT instead of
$D, and SYSROOT is set to $D in the postinst explicitly.

In both cases, the expansion of $SYSROOT or $D will yield the same. How is
that fixing anything? What am I missing?


Cheers,
Andre'


> Change-Id: Ifbf50ca705a98012e1357ebf5afa33c07ea6cd87
> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
> ---
>  .../ca-certificates-java/ca-certificates-java.hook.in   | 17 ++++++++--
> -------
>  .../ca-certificates-java_20180516.bb                    |  2 +-
>  2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/recipes-core/ca-certificates-java/ca-certificates-java/ca-
> certificates-java.hook.in b/recipes-core/ca-certificates-java/ca-
> certificates-java/ca-certificates-java.hook.in
> index 611a4ef..5e89dd9 100755
> --- a/recipes-core/ca-certificates-java/ca-certificates-java/ca-
> certificates-java.hook.in
> +++ b/recipes-core/ca-certificates-java/ca-certificates-java/ca-
> certificates-java.hook.in
> @@ -8,20 +8,21 @@
>  # and package update in OE, so the distinction between cases 2)
>  # and 3) isn't perfect.
>  
> +# SYSROOT is set whenever the script is executed on the build host
> +# (do_rootfs, or as native dependency).
> +# D is only set during do_rootfs.
> +
>  self=$(basename $0)
> -jvm_libdir="@@libdir_jvm@@"
> +jvm_libdir="${JVM_LIBDIR:-@@libdir_jvm@@}"
>  
> -if [ -n "${D:-}" ] ; then
> -    # called from postinst as part of image build on host
> +if [ -n "${SYSROOT:-}" ] ; then
> +    # called on build host - from postinst (directly or as a hook) or as
> a native tool
>      if [ -z "${JVM_LIBDIR:-}" ] ; then
>          # if JVM_LIBDIR is not present - we were called as a hook
>          echo "called as a hook of ca-certificates on do_rootfs, exiting"
>          exit 0
>      fi
>  fi
> -if [ -n "${JVM_LIBDIR:-}" ] ; then
> -    jvm_libdir="${JVM_LIBDIR}"
> -fi
>  
>  for JAVA in icedtea7-native/bin/java \
>              openjdk-8-native/bin/java openjdk-8/bin/java openjre-
> 8/bin/java \
> @@ -58,6 +59,4 @@ else
>      while read filename ; do
>          echo "+${filename}"
>      done
> -fi | SYSROOT="${D:-}" ${JAVA} -Xmx64m \
> -                              -jar ${D:-}@@datadir_java@@/@@JARFILENAME@@ 
> \
> -                              -storepass changeit
> +fi | ${JAVA} -Xmx64m -jar ${D:-}@@datadir_java@@/@@JARFILENAME@@
> -storepass changeit
> diff --git a/recipes-core/ca-certificates-java/ca-certificates-
> java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-
> java_20180516.bb
> index 7db5110..2f2536d 100644
> --- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
> +++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
> @@ -100,7 +100,7 @@ pkg_postinst_${PN} () {
>  	    fi
>  	    JVM_LIBDIR=$NATIVE_ROOT${libdir_jvm}
>  	fi
> -	JVM_LIBDIR=$JVM_LIBDIR $D${sbindir}/create-ca-certificates-java
> +	SYSROOT=$D JVM_LIBDIR=$JVM_LIBDIR $D${sbindir}/create-ca-
> certificates-java
>  }
>  
>  RDEPENDS_${PN} = "ca-certificates"
> -- 
> 2.7.4
> 


