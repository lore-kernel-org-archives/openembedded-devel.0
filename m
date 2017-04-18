Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 79F0F71A54
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 12:20:54 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id u2so53316302wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 05:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HbltXsmy94Fy/lv5H7e4HmqPXKKWX54lYAaTMv/SOjw=;
	b=qIfYMO1Tf3AmxPn0D91Or/WI56AHi9JZGt4TfYfOh1Uoqxyjhef9DJux2Et1JU8agY
	AbRmYMgpDK0iFbUyIRujCXhMbrP3m94zBvSSZgLKdbfG8SSilg7gsZMLH1izVJoUKEMN
	7Hpu19dwX7XrZ27doHvQjEyqjgWy6Z2E8FvdC0PQErnOiaWM+aBQC9J1Qja+8M1YzWI8
	mkumQ5PeLUXi4Hbw1E7r20gH5r+23ig1jxG44Y/WNSLeZvDPO+Zz3d3Q/Xl1jSD8yXCp
	kUv8FGyGqk3eED0T0z5B5ls1p/kie0YSnv4jlgdLf5l69fR1XK3tBAJuw/Sn+86dHT36
	tWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HbltXsmy94Fy/lv5H7e4HmqPXKKWX54lYAaTMv/SOjw=;
	b=nTPSpibOnKDs8eOepsVqOseolC3AMZtKmu5zLOydAUvkvYKFZLxF3kfO/8ye4InI1b
	9yZVvIECZdxZTYlYsJKHE4ESRK/63ui9p5MH70SeXzLiU3Gom5sWaHRCc7ZNtp1TEnPj
	L+uQCW+epGvwCeDmIPZMQqEkA5+FiQL3uO6UpiJ96d23/PbQQUrQLuav6O/1L63spF57
	iis4aS8gybVtT+zWQcxOpxArbnM4JbWnsXk6y2sB5FNwJFS06Blfs/VDcNr2ASluatkH
	epqZSjCkuBt5VAQ1WoQWirpjCG+GNbVtxszvyLeZcXKw6VmtE+ap/d0yWsirxzX5qNqY
	QjLw==
X-Gm-Message-State: AN3rC/7iRKP99l8OWg5tQyTpfbUOuyjB5Gv8WenNTbR55aPgrfatyF+T
	XL6v0zM9lN3z372IVPyLEs2Grvt0bA==
X-Received: by 10.28.175.209 with SMTP id y200mr13645976wme.81.1492518055889; 
	Tue, 18 Apr 2017 05:20:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Tue, 18 Apr 2017 05:20:55 -0700 (PDT)
In-Reply-To: <1492416250-15487-2-git-send-email-yadi.hu@windriver.com>
References: <1492416250-15487-1-git-send-email-yadi.hu@windriver.com>
	<1492416250-15487-2-git-send-email-yadi.hu@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Apr 2017 14:20:55 +0200
Message-ID: <CA+chaQfsCJ1DH14kADKuM+_xico2crP19D3MdJrMB8ZVLLntzA@mail.gmail.com>
To: Yadi Hu <yadi.hu@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] drbd-utils:add denpendency for perl.
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
X-List-Received-Date: Tue, 18 Apr 2017 12:20:55 -0000
Content-Type: text/plain; charset=UTF-8

drbd-utils_8.9.3.bb was removed some 4 months ago with:

commit 8151702b66825504f9a5f076fd98d7538910830b
Author:     Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
AuthorDate: Wed Sep 14 00:51:57 2016 -0400
Commit:     Joe MacDonald <joe_macdonald@mentor.com>
CommitDate: Thu Dec 15 11:01:54 2016 -0500

    drbd-utils: 8.9.3 -> 8.9.6

You should test your changes in recent master.

On Mon, Apr 17, 2017 at 10:04 AM, Yadi Hu <yadi.hu@windriver.com> wrote:

> From: "Yadi.hu" <yadi.hu@windriver.com>
>
> Perl script drbd-overview fails to run due to perl noexists
> under small rootfs,fixing it through adding definitions both
> perl-module-strict and perl-module-warnings.
>
> Signed-off-by: Yadi.hu <yadi.hu@windriver.com>
> ---
>  meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
> b/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
> index 1d691cd1f..5aa8a88cd 100644
> --- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
> +++ b/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
> @@ -30,7 +30,7 @@ EXTRA_OECONF = " \
>                  --with-systemdunitdir=${systemd_unitdir}/system \
>                 "
>
> -RDEPENDS_${PN} += "bash perl"
> +RDEPENDS_${PN} += "bash perl perl-module-strict perl-module-warnings"
>
>  # The drbd items are explicitly put under /lib when installed.
>  #
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

