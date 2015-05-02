Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id F255A736BA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 May 2015 08:10:57 +0000 (UTC)
Received: by wgin8 with SMTP id n8so107976288wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 May 2015 01:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=D5zKHymKhvhyhrEZqG3IEnBH0vzKr10YzPW4M+gJA+0=;
	b=CQ0IiE+xcF4T9HuqgCJs1X71obGbGVDom80C0QyoVIjp2P/F/qqXbsq1cx5cr1rjMf
	FJUj5kvyAJQKJ6jiQDOI73CaJhmf2UA260TM6MG5aR0dhp8x+mBDRt14znQGBBD9N+HJ
	6Tr4IFAZpXCEJK7E0PeVWLbC20Lmo5P4TIgR0AmQNKE+nYqSCugxOOZ7hh4cUvdmuWUE
	C0kcz3RlDDzp0EKBx5oD1SDzjN3p+dWDbGkoOVWSvZt5MsdwlROeIPvYiIvb3pawDWoj
	9m97qxWJmKyZUmKfV8vHSUA6iOLAsvE1PEnrz141igSvr4syVm82GvLyVUvP3Wil2c7G
	NylQ==
X-Received: by 10.195.12.48 with SMTP id en16mr24768634wjd.21.1430554258198;
	Sat, 02 May 2015 01:10:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id it5sm1371231wid.3.2015.05.02.01.10.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 May 2015 01:10:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 2 May 2015 10:11:13 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150502081113.GC2366@jama>
References: <1430483441-4566-1-git-send-email-Martin.Jansa@gmail.com>
	<55441583.40907@gmail.com>
MIME-Version: 1.0
In-Reply-To: <55441583.40907@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-ruby][PATCH] ruby: explicitly disable dtrace support
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
X-List-Received-Date: Sat, 02 May 2015 08:10:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2015 at 05:08:35PM -0700, akuster808 wrote:
> Martin,
>=20
> Are you pushing in that change. As far as I know, I don't have write=20
> access for that layer. Let me know what process you want me to follow.

You mean for jansa/master or master-next, just sending v2 to list would
work for me, but if the only difference is this dtrace, then don't send
anything and I'll apply both as they are.

>=20
> - armin
>=20
> On 05/01/2015 05:30 AM, Martin Jansa wrote:
> > both 2.2.1 and 2.2.2 are failing on some hosts native builds with:
> > | linking miniruby
> > | load.o: In function `rb_f_load':
> > | load.c:(.text+0x3af): undefined reference to `RUBY_DTRACE_LOAD_ENTRY_=
ENABLED'
> > | load.c:(.text+0x428): undefined reference to `RUBY_DTRACE_LOAD_RETURN=
_ENABLED'
> > | load.c:(.text+0x452): undefined reference to `RUBY_DTRACE_LOAD_RETURN'
> > | load.c:(.text+0x492): undefined reference to `RUBY_DTRACE_LOAD_ENTRY'
> > | load.o: In function `rb_require_internal':
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb b/meta-ruby/=
recipes-devtools/ruby/ruby_2.2.2.bb
> > index c463525..78c943c 100644
> > --- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
> > +++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
> > @@ -18,6 +18,7 @@ PACKAGECONFIG[ipv6] =3D ",--enable-wide-getaddrinfo,"
> >   EXTRA_OECONF =3D "\
> >       --disable-versioned-paths \
> >       --disable-rpath \
> > +    --disable-dtrace \
> >       --enable-shared \
> >       --enable-load-relative \
> >   "
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

