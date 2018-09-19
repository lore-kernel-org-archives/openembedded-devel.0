Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 50B4A79799
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 14:27:23 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id l42-v6so5216984qtf.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 07:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LXgOfQiWlOdw4i3wWrbO6POtr0b8875+Lf9YzEnNzWw=;
	b=j0x4fGG8Xmy33F8FPS4IZWP5V/GpHrVPZNkhJsH3qoI4MpBCFs4bWSLKTX1RZlasQg
	1nV3mJeEC/b9itXT2vKfnlFUDUDqBQmdLe8OOROb7fdGlClXPhl7ApU5E15VDidz7qCU
	+ITjlEGJd9uSjK4FHd3sFEzlmGoZ1F7kO7bm1HdlaLkjJeW8cJCar8hPc1FKHyWlh2ZS
	q5Nh+u9RwKwlRRh4njJ+W6QgMbCyq6x7vwYimoQE0fKanhlpvSt8WuxP6BAgxCa6/N7j
	1MO2bvJhWuGvTJq3vGoSQqB7hV5D9IGAJdWqM4P1yAoygeyRX7GBTpE8cUCiYzS7qIzU
	QKxw==
X-Gm-Message-State: APzg51Du+aivF7C3BjSnw4icH23yLQspZ1HUoGWjDD6sLvAruYPEWuhg
	Mq4f81fPDNwN/UDbSH3vV4w=
X-Google-Smtp-Source: ANB0Vdatb+8zTFgwhcAd7cqL9LpaSFivHXmwA1VKjtixP+KfreUw6gOrmGKTstnu9pt+g3AVUhZo9w==
X-Received: by 2002:a0c:be01:: with SMTP id
	k1-v6mr24307025qvg.169.1537367244054; 
	Wed, 19 Sep 2018 07:27:24 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	q75-v6sm54403qki.17.2018.09.19.07.27.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Sep 2018 07:27:23 -0700 (PDT)
Message-ID: <f664097cd5b4095dd7c6bdad00049bb4f5c96b73.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Yevgeny Popovych <yevgenyp@pointgrab.com>, 
	openembedded-devel@lists.openembedded.org
Date: Wed, 19 Sep 2018 15:27:21 +0100
In-Reply-To: <359ca1e3-c6f2-af6f-933a-f2f03c957d77@pointgrab.com>
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
	<1536343810-87649-2-git-send-email-yevgenyp@pointgrab.com>
	<a61039f1550ab18dd862f99506891423fcf28cd9.camel@andred.net>
	<359ca1e3-c6f2-af6f-933a-f2f03c957d77@pointgrab.com>
User-Agent: Evolution 3.30.0-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 1/3] ca-certificates-java: Fix sysconfdir for -native recipe
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
X-List-Received-Date: Wed, 19 Sep 2018 14:27:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-09-19 at 12:48 +0300, Yevgeny Popovych wrote:
> 
> On 09/17/2018 05:39 PM, André Draszik wrote:
> > On Fri, 2018-09-07 at 21:10 +0300, Yevgeny Popovych wrote:
> > > When ca-certificates-java-native is built, sysconfdir variable will
> > > be set to value that includes WORKDIR.
> > 
> > What is your use-case for a -native version of this?
> 
> I'm glad you asked as this should answer some questions..
> 
> I am building a package that contains prebuilt ca-certificates
> (including what ca-certificates itself build and JKS),
> for this package I need -native version of ca-certificates-java.
> We have an immutable (readonly) rootfs, so running scripts at runtime is
> not an option.
> With patches I have recently sent it works pretty well.
> 
> The bottom line is that there is a use-case for -native version.
> Even if you don't have an immutable (readonly) rootfs - you might want to
> use it
> that way because running scripts is quite error prone.
> 
> > 
> > > Avoid patching source with this value - use sysconfdir_native.
> > > 
> > > Change-Id: I8ac79c3cd5016a8139d9d8c8d58bc2976d0b6fa3
> > > Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
> > > ---
> > >  .../ca-certificates-java/ca-certificates-java_20180516.bb        | 9
> > > +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/recipes-core/ca-certificates-java/ca-certificates-
> > > java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-
> > > java_20180516.bb
> > > index 2db1915..7db5110 100644
> > > --- a/recipes-core/ca-certificates-java/ca-certificates-
> > > java_20180516.bb
> > > +++ b/recipes-core/ca-certificates-java/ca-certificates-
> > > java_20180516.bb
> > > @@ -41,9 +41,14 @@ do_patch_append () {
> > >      bb.build.exec_func('do_fix_sysconfdir', d)
> > >  }
> > >  
> > > +# sysconfdir will include absolute native sysroot path in -native
> > > builds,
> > > avoid this
> > > +# (see 36.24 of 
> > > https://www.yoctoproject.org/docs/2.5/mega-manual/mega-manual.html#faq
> > > )
> > > +SYSCONFDIR_VALUE_class-target = "${sysconfdir}"
> > > +SYSCONFDIR_VALUE_class-native = "${sysconfdir_native}"
> > > +
> > >  do_fix_sysconfdir () {
> > > -	sed -e 's|/etc/ssl/certs/java|${sysconfdir}/ssl/certs/java|g' \
> > > -	    -i
> > > ${S}/src/main/java/org/debian/security/UpdateCertificates.java
> > > +    sed -e
> > > 's|/etc/ssl/certs/java|${SYSCONFDIR_VALUE}/ssl/certs/java|g' \
> > > +        -i
> > > ${S}/src/main/java/org/debian/security/UpdateCertificates.java
> > >  }
> > >  
> > 
> > No.
> > 
> > It's probably best to remove the BBCLASSEXTEND statement in this recipe
> > instead, as it was never tested, and is unlikely to be needed.
> 
> We have a use-case for -native and this series fixes it.
> 
> > 
> > The whole idea is to make this independent of the build machine paths.
> > If
> > you want a -native version of this, you still need to make sure to point
> > this into the yocto sysroot. Otherwise this will try to write to the
> > *build
> > machine's* /etc/ directory!
> > 
> > If you really want a -native version, you need to point this into the
> > sysroot, and update this dynamically because of sstate usage, too.
> 
> Ok, I suppose that ${sysconfdir_native} has mislead you -
> it does _not_ resolve to an absolute path into native sysroot.
> The value of ${sysconfdir_native} is always "/etc", it does not mangle in
> any way (that's why I have used it).

Exactly, so the code in UpdateCertificates.java will try to access
${SYSCONFDIR_VALUE}/ssl/certs/java, i.e. /etc/ssl/certs/java, which is what
your linux distro might or might not provide. It's not what yocto provides.


Cheers,
Andre'



