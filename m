Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD35660675
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 07:49:02 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id w5so12355094qvp.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 00:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7Qp+f7JRiqL+VJ6LXFKRNNVGlhxjTAZ/Kk1S+xNql9A=;
	b=OUeKhqq9zItZaFkzHa2Mrs5H2wg5v2IWD2EwYvsuzL1LjWpFPeXwlSh1UnUi5sMFed
	uSD/oEcKkb/x5ySVpBgXsgjZQwn6nt8XgZXs+L3d8EKpmnib09hUo8OTo2iozBPeRzaq
	ZTCk+KzdwV5nad+oIBflYXILd2NWEBkiqly/mQWOFxFT/8u9JAZgwjHW6+hzZ9/bd2y+
	5jJNCEhvOJUnBe2sPmDQ02DUuk//mkJKaa7dpKkadFNnUBIpTFMsKftbRe99chns9FZJ
	JLHtgAfXduWIOxvSJBDTjAxVhuIlREz3LLyrOhr8MkQJG6zia8pAgY270zdNjOwX8BCU
	ysrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7Qp+f7JRiqL+VJ6LXFKRNNVGlhxjTAZ/Kk1S+xNql9A=;
	b=Dmjtb4vCEbJ105ZJu6QjU9RGEJUbR3MxuDvF8PKtDUjwJrwSNH4TA/U8oHnZoR5fBI
	Dni4xnzHXI74Vn5IOYVp3Q/RgBDe3c2AF17vy2qj07jEwJHvQZvHT/eBE+ipbecEf1q0
	LqefLhaTEeRawcqGbdQ5n17nm1rpV0ZtdqA+QUrQex14T1y//IkZwFYsp4rxFF+QSjKo
	82oUhQNZlxdbEWqGbDPx1H9QUuAKvPMhazp4TeevIu1TjR2mfr9OrQBPgNxaRmQJAapc
	mjd/u8tP+PPNJVRcohhZClXmHDth7Brq+SMy1Fo37PW4xstO+/ogTw1FPuBmW3Ln5WPy
	Xmlw==
X-Gm-Message-State: ANhLgQ0vxOqnLWH+/qEd2JW2ql/7lBkLvngZaFlQsASORndl2ETFkko4
	FeZ88hSsdngQruiukwm8XVEOnaJZwcz1ywnGtNZNstvZRSY=
X-Google-Smtp-Source: ADFU+vumsY/7ae6aUEmlT9LGv6z3z2n+18KycUggvwXZLfK8cD5cq2qVfahTJ8nAYYb7maRG7xn53kHtOZgs8yApKvM=
X-Received: by 2002:ad4:5427:: with SMTP id g7mr2936216qvt.23.1584517743314;
	Wed, 18 Mar 2020 00:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
	<1584515992-22564-4-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1584515992-22564-4-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Mar 2020 00:48:37 -0700
Message-ID: <CAMKF1sqtJsVpgiV4XUdAnhEvC5ZFS6JcyvKvTJ2KFyTYHEry4Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Mar 2020 07:49:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails on mips https://errors.yoctoproject.org/Errors/Details/397160/

On Tue, Mar 17, 2020 at 6:50 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> 0001-Fix-build-breakage-from-lock_guard-error-6161.patch
> removed since it is included in 6.6.4
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...-breakage-from-lock_guard-error-6161.patch | 36 -------------------
>  meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb    |  7 ++--
>  2 files changed, 3 insertions(+), 40 deletions(-)
>  delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-brea=
kage-from-lock_guard-error-6161.patch
>
> diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-fr=
om-lock_guard-error-6161.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-Fix=
-build-breakage-from-lock_guard-error-6161.patch
> deleted file mode 100644
> index ac87d0c60..000000000
> --- a/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-from-lock=
_guard-error-6161.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From b626703de7ece507f360507e49d3ecb448b12e07 Mon Sep 17 00:00:00 2001
> -From: Maysam Yabandeh <myabandeh@fb.com>
> -Date: Thu, 12 Dec 2019 13:48:50 -0800
> -Subject: [PATCH] Fix build breakage from lock_guard error (#6161)
> -
> -Summary:
> -This change fixes a source issue that caused compile time error which br=
eaks build for many fbcode services in that setup. The size() member functi=
on of channel is a const member, so member variables accessed within it are=
 implicitly const as well. This caused error when clang fails to resolve to=
 a constructor that takes std::mutex because the suitable constructor got r=
ejected due to loss of constness for its argument. The fix is to add mutabl=
e modifier to the lock_ member of channel.
> -Pull Request resolved: https://github.com/facebook/rocksdb/pull/6161
> -
> -Differential Revision: D18967685
> -
> -Pulled By: maysamyabandeh
> -
> -Upstream-Status: Backport
> -
> -fbshipit-source-id: 698b6a5153c3c92eeacb842c467aa28cc350d432
> ----
> - util/channel.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/util/channel.h b/util/channel.h
> -index 0225482c0..a8a47680a 100644
> ---- a/util/channel.h
> -+++ b/util/channel.h
> -@@ -60,7 +60,7 @@ class channel {
> -
> -  private:
> -   std::condition_variable cv_;
> --  std::mutex lock_;
> -+  mutable std::mutex lock_;
> -   std::queue<T> buffer_;
> -   bool eof_;
> - };
> ---
> -2.24.1
> -
> diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes=
-dbs/rocksdb/rocksdb_git.bb
> index 713d5bb14..e82b77e14 100644
> --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> @@ -6,12 +6,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.Apache;md5=3D3b83e=
f96387f14655fc854ddc3c6bd57 \
>                      file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3 \
>                      file://LICENSE.leveldb;md5=3Dfb04ff57a14f308f2eed4a9=
b87d45837"
>
> -SRCREV =3D "4cfbd87afd08a16df28436fb990ef6b154ee6114"
> -SRCBRANCH =3D "6.5.fb"
> -PV =3D "6.5.2"
> +SRCREV =3D "551a110918493a19d11243f53408b97485de1411"
> +SRCBRANCH =3D "6.6.fb"
> +PV =3D "6.6.4"
>
>  SRC_URI =3D "git://github.com/facebook/${BPN}.git;branch=3D${SRCBRANCH} =
\
> -           file://0001-Fix-build-breakage-from-lock_guard-error-6161.pat=
ch \
>             file://0001-db-write_thread.cc-Initialize-state.patch \
>            "
>
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

