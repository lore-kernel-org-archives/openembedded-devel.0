Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA337FCAF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Nov 2019 08:33:40 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id z10so10626593ilo.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Nov 2019 01:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6eiaekJf9zwwtPZHtsGOi48Dqy8bPw0IyZCqJIcsU+Q=;
	b=Ljvnb/eV2ZziMz1kilAlYN5AVRecTl8FyZKEcFXDfa2BAYbbAGi+3+rpccDXrThsUZ
	bO0sPTrtSarLSbFlvxz7ww7orQIWM7weeArG6atyfHx+djWoXw26BeHK1TENSBdx5jhM
	SUQwHXmQEOgT+CS7nkqwkoFJuiyH5lteDIDIyYXkrIOojcQJEdwYjxjcyUMdYRZhfTr8
	7Zu6dkscGxTUAAtEWTTdaoSap5CskOeQXoL9AExBHNmISeGr0AC/lrQblJhjYDIk8Hkq
	cw9IjdlpEFdM3Ml3gU0uB7WCBIcdBXuzSTGm76vNLgw9XBdDtNHtayaaBnZVXC9xP7/7
	RYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6eiaekJf9zwwtPZHtsGOi48Dqy8bPw0IyZCqJIcsU+Q=;
	b=RzViT8r0QCOE4yIZPEBeSI/VWTAG9hfiOp3k4cpTTU3ZUKJMnrXRTn24V3rCd3R3xe
	avkdtGzfs+AOad7Qq+sDERYb/+msQHUoiLdjmJ3X/ohAGnPr17NkJt1wSa+fRyZq/JyN
	m0DkX8BqVjlvYNhcd0vSJW0bjU8xZ/INhHXQiJ7sT5n3K4VLYRlg/2bwdpD4oqAZmnXG
	i/0+QQh/EhhhYw60ChT67XpouIxO2UpBDoOZffd3eb848Y+MEjRvAm6Mhj5eokGsS6bJ
	SDT59a90hg3Mbf0DuiaW/ogcbIJ4SXpdnubN1sOpzYIUhVYsi/bvA+fTJkTF7gXJuzjd
	NPLw==
X-Gm-Message-State: APjAAAV2We5nCxU82Wl4APvTCghTwrpaE9vN/WxhU3vVV6WKQjmNlJ96
	FvOUC9vmCU+/RYDaXowKzplX/MuPLak78eSNeLo=
X-Google-Smtp-Source: APXvYqw7XuWYN1J6T4pAkWUxbB8mmDFUdXmOpwNkV4de0QtJwW/eIHrgnZNcEA1FEbh3ubkOmLuXi2nW42r00QtfyWk=
X-Received: by 2002:a92:470d:: with SMTP id u13mr17070079ila.217.1572683622010;
	Sat, 02 Nov 2019 01:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191101055734.2056-1-alex.kiernan@gmail.com>
	<CAMKF1sqEJgqCPAxhjZPQ11XRXiJOi487gQBkPLhUy5oS6ZsLgA@mail.gmail.com>
In-Reply-To: <CAMKF1sqEJgqCPAxhjZPQ11XRXiJOi487gQBkPLhUy5oS6ZsLgA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 2 Nov 2019 08:33:31 +0000
Message-ID: <CAO5Uq5RXNBV4PjDWwQbpq3U=WjvxBBtG_3gupSQP1E2c+FXRGg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ostree: Upgrade 2019.4 -> 2019.5
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
X-List-Received-Date: Sat, 02 Nov 2019 08:33:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 1, 2019 at 7:13 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fails to patch
>
> RROR: ostree-2019.5-r0 do_patch: Command Error: 'quilt --quiltrc
> /mnt/b/yoe/build/tmp/work/aarch64-yoe-linux-musl/ostree/2019.5-r0/recipe-sysroot-native/etc/quiltrc
> push' exited with 0  Output:
> Applying patch 0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
> patching file Makefile-ostree.am
> patching file configure.ac
> Hunk #1 FAILED at 192.
> 1 out of 1 hunk FAILED -- rejects in file configure.ac
> Patch 0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
> does not apply (enforce with -f)
>

Bother... looks I failed to test with just that patch and not the
subsequent one where I threw away those patches and implemented ptest.

Will redo

> On Thu, Oct 31, 2019 at 10:57 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  .../ostree/{ostree_2019.4.bb => ostree_2019.5.bb}               | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-extended/ostree/{ostree_2019.4.bb => ostree_2019.5.bb} (99%)
> >
> > diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > similarity index 99%
> > rename from meta-oe/recipes-extended/ostree/ostree_2019.4.bb
> > rename to meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > index 505c9fcccc59..efe1b3616f23 100644
> > --- a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb
> > +++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > @@ -28,7 +28,7 @@ SRC_URI = " \
> >      file://0001-Always-enable-trivial-httpd-for-tests.patch \
> >      file://0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch \
> >  "
> > -SRCREV = "9d39e7d91e8497987cad69a3fbed5c5fc91eebdc"
> > +SRCREV = "980ca07b03b3aa7e0012729dd6c84b0878775d93"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
> >
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Alex Kiernan

