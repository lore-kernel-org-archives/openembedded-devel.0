Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UOAIv-0002F1-36
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 19:19:58 +0200
Received: by mail-la0-f48.google.com with SMTP id fq13so3622068lab.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=piT4iM0CtPhminbDWuAk7xjNtOUXTXpv7I0HMBfmqnU=;
	b=rF9Sh1P5ST0DlosJ+ufqY4X1MU+YTXsV5TAXyxmmNKfCHJuG3+W6r4FpGS0Gjldwpe
	im9OpXeN/nQ9MXZt7areForvdrI7zISqmVFYC4s3/0mXrV2xcwcPf/iAIW8YqkuyC9QA
	FXEkwKY+iPfEW0pa2LIibhUveX+ItVNNOIfg/X7PJ2uxAERgFpbG2l8RDtDjYv7Nfdfz
	W8m83MdDF9IB3pm55GPTXe3zMh7JGrMhpHARyR281liQJXwGTE/q3mLYnqgUI1VW6b/X
	2kt5hJxoBg5AgEquf5qFz28uUCJM2hIb4gF70Pn2zat2f2XK1xAutAQY7D+jMrBQRp4c
	R/Uw==
X-Received: by 10.112.132.2 with SMTP id oq2mr6467463lbb.5.1365181362527; Fri,
	05 Apr 2013 10:02:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.125.38 with HTTP; Fri, 5 Apr 2013 10:02:22 -0700 (PDT)
In-Reply-To: <20130321140745.4a0683c8@e6520eb>
References: <1363859339-12187-1-git-send-email-ross.burton@intel.com>
	<20130321140745.4a0683c8@e6520eb>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 5 Apr 2013 10:02:22 -0700
X-Google-Sender-Auth: 9mhzveKQr52u_am1RvmWumoE5ZE
Message-ID: <CABcZANkitD_S70HFXiM+xnC73avzC-2LDjRTcezwVMe1VcW+ow@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH][for-danny] guile: remove from meta-oe, there is newer version in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 17:20:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2013 at 6:07 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:

> Le Thu, 21 Mar 2013 09:48:59 +0000,
> Ross Burton <ross.burton@intel.com> a =C3=A9crit :
>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/guile/guile-1.8.7/18.diff  | 1743
> --------------------
> >  .../guile/guile-1.8.7/configure-fix.patch          |   10 -
> >  .../guile/guile-native-1.8.7/cpp-linemarkers.patch |    8 -
> >  .../guile/guile-native-1.8.7/reloc.patch           |   22 -
> >  meta-oe/recipes-support/guile/guile-native.inc     |   13 -
> >  .../recipes-support/guile/guile-native_1.8.7.bb    |   13 -
> >  meta-oe/recipes-support/guile/guile.inc            |   47 -
> >  meta-oe/recipes-support/guile/guile_1.8.7.bb       |   14 -
> >  8 files changed, 1870 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/guile/guile-1.8.7/18.diff
> >  delete mode 100644 meta-oe/recipes-support/guile/guile
> -1.8.7/configure-fix.patch
> >  delete mode 100644 meta-oe/recipes-support/guile/guile
> -native-1.8.7/cpp-linemarkers.patch
> >  delete mode 100644 meta-oe/recipes-support/guile/guile
> -native-1.8.7/reloc.patch
> >  delete mode 100644 meta-oe/recipes-support/guile/guile-native.inc
> >  delete mode 100644 meta-oe/recipes-support/guile/guile-native_1.8.7.bb
> >  delete mode 100644 meta-oe/recipes-support/guile/guile.inc
> >  delete mode 100644 meta-oe/recipes-support/guile/guile_1.8.7.bb
> >
> pushed to danny-next
>

I'm a bit confused about why this went in. danny is a stable branch, and
this is clearly not a bugfix. Did the existence of this recipe actually
cause a problem? This just caused a temporary build break for us due to
bbappending to a removed recipe. What exactly is the policy for meta-oe's
danny branch, if it's not "bugfixes only"?
--=20
Christopher Larson

