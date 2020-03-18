Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id D13BC60B28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 07:50:57 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id f3so37202142qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/CLRCwVBrm3Z9AchDz+oxLRfhLvIugD9X6ynryouE1s=;
	b=uSyx7ybQqBWSxKUwxZWx7d0yCiu79eKcFUdE8M/cT6kIqjwjy71VBNAl84vlDLdk6l
	VfLbQsLcB/S8PEfJceHUL2p0qbND/PlV1AXmQtzIKA0mi/tjwoCRaGJb65iWSfqBM9xg
	ZQhl6rQQR2bMI9TJx0PPB0MWeOhQPI1bgfgQvs621HmvvvRK5fj8Wvnvu8vjDPLq0yr6
	xCqXrJmnjNe/M2XMXpgaH7tfm//EQtFZ9BF/tnhf3+XFW5YSAh5RFR+SKAArJNHGJgmy
	mQEBu3Y5aiKYtkZ1qexwqFe/j97951ufgMx5zKRW6T0Ll+iCs2GCCyqXQ80IK7r+NlV0
	DHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/CLRCwVBrm3Z9AchDz+oxLRfhLvIugD9X6ynryouE1s=;
	b=tr1f37wDjTg1dZJaxAivWt1XN08C2/RTjk0BSN24WjwFil2gZgvqd3acJ2GbH7Mu6R
	PSLMJQweJ+8o807wzyudSl+J3IgNNTNYvZn0hdJgV30NDQ8RvublMJp6uoVHc9TXmr8C
	SBLQENxAZidhAxjjRESg5oyoeKh3s3NZPbdviXvyu+FYy7ry9N1/1X8kThLsQY1OzsCr
	6nEx4XUZUMVU7uvtEjok7lYO5nz2VnQR3VPKV3Ypjk5Zr9kW0KeILPruO2Ie0pxqblkB
	Yd5PgI/P5WjNVQI7ctetrbWEuGYJzxHAoQW8dlN21sv3soxLQkd0+rRStDrUxyF7rxkS
	05rg==
X-Gm-Message-State: ANhLgQ36RHetc8eYKq24ya0j7NwYwPlJoENK1Lkit1oLdWrH5MYWeSoD
	aBCrOMAsPcT7rgxqZuTjUESXDmPz/xhidg8SblQ7QpdkDw0=
X-Google-Smtp-Source: ADFU+vuXTWXPd5O3NfFab5/feVKW+/ovOD24w/e4kiKjeOEA6ZpzTZ/HK2toXANvCuskRYh0JSGnIXWe+jvmtr5NP9A=
X-Received: by 2002:a37:b003:: with SMTP id z3mr2660998qke.431.1584517858461; 
	Wed, 18 Mar 2020 00:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
	<1584515992-22564-4-git-send-email-wangmy@cn.fujitsu.com>
	<CAMKF1sqtJsVpgiV4XUdAnhEvC5ZFS6JcyvKvTJ2KFyTYHEry4Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqtJsVpgiV4XUdAnhEvC5ZFS6JcyvKvTJ2KFyTYHEry4Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Mar 2020 00:50:32 -0700
Message-ID: <CAMKF1srcXQr2YcDzKdtQtn93gJiL-2m4Aj+MGsnwdbyCtqNTXQ@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] rocksdb: upgrade 6.5.2 -> 6.6.4
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
X-List-Received-Date: Wed, 18 Mar 2020 07:50:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

also x86/clang
https://errors.yoctoproject.org/Errors/Details/397161/

On Wed, Mar 18, 2020 at 12:48 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails on mips https://errors.yoctoproject.org/Errors/Details/397160/
>
> On Tue, Mar 17, 2020 at 6:50 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote=
:
> >
> > 0001-Fix-build-breakage-from-lock_guard-error-6161.patch
> > removed since it is included in 6.6.4
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  ...-breakage-from-lock_guard-error-6161.patch | 36 -------------------
> >  meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb    |  7 ++--
> >  2 files changed, 3 insertions(+), 40 deletions(-)
> >  delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-br=
eakage-from-lock_guard-error-6161.patch
> >
> > diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-=
from-lock_guard-error-6161.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-F=
ix-build-breakage-from-lock_guard-error-6161.patch
> > deleted file mode 100644
> > index ac87d0c60..000000000
> > --- a/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-from-lo=
ck_guard-error-6161.patch
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -From b626703de7ece507f360507e49d3ecb448b12e07 Mon Sep 17 00:00:00 2001
> > -From: Maysam Yabandeh <myabandeh@fb.com>
> > -Date: Thu, 12 Dec 2019 13:48:50 -0800
> > -Subject: [PATCH] Fix build breakage from lock_guard error (#6161)
> > -
> > -Summary:
> > -This change fixes a source issue that caused compile time error which =
breaks build for many fbcode services in that setup. The size() member func=
tion of channel is a const member, so member variables accessed within it a=
re implicitly const as well. This caused error when clang fails to resolve =
to a constructor that takes std::mutex because the suitable constructor got=
 rejected due to loss of constness for its argument. The fix is to add muta=
ble modifier to the lock_ member of channel.
> > -Pull Request resolved: https://github.com/facebook/rocksdb/pull/6161
> > -
> > -Differential Revision: D18967685
> > -
> > -Pulled By: maysamyabandeh
> > -
> > -Upstream-Status: Backport
> > -
> > -fbshipit-source-id: 698b6a5153c3c92eeacb842c467aa28cc350d432
> > ----
> > - util/channel.h | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/util/channel.h b/util/channel.h
> > -index 0225482c0..a8a47680a 100644
> > ---- a/util/channel.h
> > -+++ b/util/channel.h
> > -@@ -60,7 +60,7 @@ class channel {
> > -
> > -  private:
> > -   std::condition_variable cv_;
> > --  std::mutex lock_;
> > -+  mutable std::mutex lock_;
> > -   std::queue<T> buffer_;
> > -   bool eof_;
> > - };
> > ---
> > -2.24.1
> > -
> > diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recip=
es-dbs/rocksdb/rocksdb_git.bb
> > index 713d5bb14..e82b77e14 100644
> > --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > @@ -6,12 +6,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.Apache;md5=3D3b8=
3ef96387f14655fc854ddc3c6bd57 \
> >                      file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> >                      file://LICENSE.leveldb;md5=3Dfb04ff57a14f308f2eed4=
a9b87d45837"
> >
> > -SRCREV =3D "4cfbd87afd08a16df28436fb990ef6b154ee6114"
> > -SRCBRANCH =3D "6.5.fb"
> > -PV =3D "6.5.2"
> > +SRCREV =3D "551a110918493a19d11243f53408b97485de1411"
> > +SRCBRANCH =3D "6.6.fb"
> > +PV =3D "6.6.4"
> >
> >  SRC_URI =3D "git://github.com/facebook/${BPN}.git;branch=3D${SRCBRANCH=
} \
> > -           file://0001-Fix-build-breakage-from-lock_guard-error-6161.p=
atch \
> >             file://0001-db-write_thread.cc-Initialize-state.patch \
> >            "
> >
> > --
> > 2.17.1
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

