Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 48A1379064
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 13:42:22 +0000 (UTC)
Received: by mail-yb0-f177.google.com with SMTP id k5-v6so1558297ybo.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 06:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=p3FcgJN1qWYiGi7lF47w2ytQIv/W3ypfHxdIJwFqCpM=;
	b=kSYgS83TBee+Xwji/JnNcRhcC8D3jyqJ8cRawPzUyDZFk4Mlbu/sizbLsRM1dGj4l6
	GlzL1oklGCw83B9jJa1u2tDUjlcdONLa0QbSJzfq5yKEFRBszMgJpY0WpPbwZkgZmJ89
	CEEfn6Ow8LXBFztZ2hvYrSCyaXvi88xt1eOCNrQFVe3ys8D1ZL3AEjxIG+cV+XZJ1ztQ
	33nkHar2i43KGpzff0EKf1tAiodtApOb1+aR9N23IY07noay5prr5nHrSKxDVwbBHY8R
	r/y4YG91d0VIkz6q4g4AkEdKH8r4AkGz+O9La8s+6Oxy+2f4t/JWin/yLmeyibTX3ZLz
	Jm2w==
X-Gm-Message-State: AOUpUlEUAXrvK3EZ/iHz+jEi2aQx0YwMQKoEJ8923QZXPMZKTpWR9zKx
	mbFW7zYYQ195Zczoat0s71vAK6pe
X-Google-Smtp-Source: AA+uWPxMkHQmRHyiyOFY/HT3EKcwYvvAYhQKEY0XLx++UP/ThJNytBwnQNmpSSlPjcSI6MKjV6apSg==
X-Received: by 2002:a5b:ac4:: with SMTP id a4-v6mr8608149ybr.23.1534772542843; 
	Mon, 20 Aug 2018 06:42:22 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z125-v6sm9166749ywg.57.2018.08.20.06.42.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Aug 2018 06:42:22 -0700 (PDT)
Message-ID: <6b18853d33e195e369de5d2184a2eb12f1abc3d6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2018 14:42:20 +0100
In-Reply-To: <69df7e62-bd10-ba0e-7441-1bb4f76940f3@skidata.com>
References: <3463e929-53ce-df98-355c-11de357fc5ae@skidata.com>
	<69df7e62-bd10-ba0e-7441-1bb4f76940f3@skidata.com>
X-Mailer: Evolution 3.28.5-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 3/3] openjdk-8: use ca-certificates-java (was: Re: Fwd: [yocto] [meta-java][PATCH 3/3] openjdk-8: use ca-certificates-java)
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
X-List-Received-Date: Mon, 20 Aug 2018 13:42:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Richard,

What package manager are (were) you using when that failed for you?


Thanks,
Andre'

On Fri, 2018-06-15 at 10:19 +0200, Richard Leitner wrote:
> fyi, as this was posted on yocto@yoctoproject.org
> 
> @Otavio/Maxin/Henning: is it OK to just force-push to
> master-next without this commit? Or should I push a
> "revert" commit?
> 
> regards;Richard.L
> 
> 
> -------- Forwarded Message --------
> Subject: Re: [yocto] [meta-java][PATCH 3/3] openjdk-8: use ca-
> certificates-java
> Date: Fri, 15 Jun 2018 10:00:38 +0200
> From: Richard Leitner <richard.leitner@skidata.com>
> To: André Draszik <git@andred.net>, yocto@yoctoproject.org
> CC: Richard Leitner <Richard.Leitner@skidata.com>
> 
> Hi,
> this commit of yours breaks the build on meta-java's current
> mater-next branch (when building an image containing openjre-8
> or openjdk-8) with following message:
> 
> ERROR: openjre-8-test-image-1.0-r0 do_rootfs: [log_check] openjre-8-test-
> image: found 1 error message in the logfile:
> [log_check] E: /yocto/meta-java-test/build/tmp/work/qemuarm-poky-linux-
> gnueabi/openjre-8-test-image/1.0-r0/rootfs/etc/ca-
> certificates/update.d/ca-certificates-java-hook exited with code 1.
> 
> ERROR: openjre-8-test-image-1.0-r0 do_rootfs: Function failed: do_rootfs
> ERROR: Logfile of failure stored in: /yocto/meta-java-
> test/build/tmp/work/qemuarm-poky-linux-gnueabi/openjre-8-test-image/1.0-
> r0/temp/log.do_rootfs.19892
> ERROR: Task (/yocto/meta-java-test/meta-java/recipes-
> images/images/openjre-8-test-image.bb:do_rootfs) failed with exit code '1'
> 
> 
> The logfile contains following error:
> 
> Running hooks in /yocto/meta-java-test/build/tmp/work/qemuarm-poky-linux-
> gnueabi/openjre-8-test-image/1.0-r0/rootfs/etc/ca-certificates/update.d...
> /yocto/meta-java-test/build/tmp/work/qemuarm-poky-linux-gnueabi/openjre-8-
> test-image/1.0-r0/rootfs/etc/ca-certificates/update.d/ca-certificates-
> java-hook: no JVM_LIBDIR specified
> E: /yocto/meta-java-test/build/tmp/work/qemuarm-poky-linux-
> gnueabi/openjre-8-test-image/1.0-r0/rootfs/etc/ca-
> certificates/update.d/ca-certificates-java-hook exited with code 1.
> done.
> 
> 
> Therefore it will be removed from master-next.
> 
> It would be great if you could send an fixed version.
> 
> Thank you!
> 
> regards;Richard.L
> 
> 
> On 03/30/2018 10:40 AM, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > The OpenJDK-8 package currently comes with a trustStore
> > that was generated at OpenJDK-8-native build time from
> > *all* certificates available in the system, not just from
> > those that are marked as trusted.
> > 
> > This isn't right...
> > 
> > openjdk-8 and openjre-8 now RDEPENDS on (and use) the CA
> > certificates as provided by the ca-certificates-java
> > package just added.
> > 
> > This makes sure that Java now uses the same trusted CA
> > certificates as the rest of the system.
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > ---
> >  recipes-core/openjdk/openjdk-8-common.inc |  2 ++
> >  recipes-core/openjdk/openjdk-8-cross.inc  | 12 +++++++++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-
> > core/openjdk/openjdk-8-common.inc
> > index b2020c3..c8d157e 100644
> > --- a/recipes-core/openjdk/openjdk-8-common.inc
> > +++ b/recipes-core/openjdk/openjdk-8-common.inc
> > @@ -254,3 +254,5 @@ def version_specific_cflags(d):
> >  CFLAGS_append = " ${@version_specific_cflags(d)}"
> >  CXXFLAGS_append = " ${@version_specific_cflags(d)}"
> >  CXX_append = " -std=gnu++98"
> > +
> > +RDEPENDS_${PN} = "ca-certificates-java"
> > diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-
> > core/openjdk/openjdk-8-cross.inc
> > index d70c946..6795c92 100644
> > --- a/recipes-core/openjdk/openjdk-8-cross.inc
> > +++ b/recipes-core/openjdk/openjdk-8-cross.inc
> > @@ -57,7 +57,6 @@ EXTRA_OECONF_append = "\
> >      --with-sys-root=${STAGING_DIR_HOST} \
> >      --with-tools-dir=${STAGING_DIR_NATIVE} \
> >      --with-boot-jdk=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native \
> > -    --with-cacerts-file=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-
> > native/jre/lib/security/cacerts \
> >      \
> >      --disable-precompiled-headers \
> >      --disable-zip-debug-info \
> > @@ -88,6 +87,17 @@ do_install_append() {
> >                pack200 --repack --effort=9 --segment-limit=-1 --
> > modification-time=latest --strip-debug "$0"'
> >        fi
> >      fi
> > +
> > +    if [ -d ${D}${JDK_HOME} ] ; then
> > +      rm ${D}${JDK_HOME}/jre/lib/security/cacerts
> > +      ln -s ${@os.path.relpath("${sysconfdir}/ssl/certs/java/cacerts",
> > "${JDK_HOME}/jre/lib/security/cacerts")} \
> > +            ${D}${JDK_HOME}/jre/lib/security/cacerts
> > +    fi
> > +    if [ -d ${D}${JRE_HOME} ] ; then
> > +      rm ${D}${JRE_HOME}/lib/security/cacerts
> > +      ln -s ${@os.path.relpath("${sysconfdir}/ssl/certs/java/cacerts",
> > "${JRE_HOME}/lib/security/cacerts")} \
> > +            ${D}${JRE_HOME}/lib/security/cacerts
> > +    fi
> >  }
> >  
> >  export MAKE_VERBOSE = "y"
> > 


