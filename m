Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2514075534
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 17:13:08 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id f30-v6so184095uab.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 10:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CJ7p3a9Y007O5jgjMEaoFslwyam/TY2BDIW1MmqCs9Y=;
	b=CivbvaM3Bm0Ki7bFu8j3eRdlvMwlb767VqqXECArql0UHqcEKRnQu+ppPPs2Qpx4R2
	tUma66vAYBz0LbtXf9acbu6Zw2l7DlvZlYF4puqok2wfwDAOQFv4G14h92IF8R1SNXcm
	DlvduCjtg1ImCKrLTYUfhppyikS8Vqwnf+ZcHB/1Z83XGUiknRwdhU9+fWQxw85ruT22
	HNxSSJ9f7bwKPBovWceCMcgcW6noC6MhXt/jNzKXV5GsP31eDOKmJPw/cMs+lfaTXsYB
	YjYxd062gqc0jlrcZCo/NOWJiQZsULDvMkoyKHyf2TVpL8s1167WmG/peSCdFa5qBR3E
	wUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CJ7p3a9Y007O5jgjMEaoFslwyam/TY2BDIW1MmqCs9Y=;
	b=ePfMpI7/aKFamiDVDvwE7nNzqP3H40w5SvxOcKuYs8n9W00wi6yjY//42tiu/0JcRG
	/zI7mDtLcYz9t4h0xSG0I4QtjMCPxBMuDVSoaUHxKvnMXC8SxZ57yXJ3YUevKYUwI/Ey
	bC8ZdnkbCsu7DzXvM9iZqlGkAEdtWFdl1S1mh3cAMls5zUM9TArp781jTLHuRA0G2NMf
	+7ffvF+XmQqOe66eNRD7/HCGw828Bk89PNG3d6O0kpJFooDRuu9dFJqj+CvaPtE6PDe6
	RavEs1NFrV1IQFSONZDRNyTaBX5PC2AZzkLns2rQZlqPLwjVNl/KiPjM2XXWN8JB4sJD
	s8Pg==
X-Gm-Message-State: APt69E20zOBax6exxfDh7P9qPzOFXP7OCXvuOWXQFpkNN5mqh0omS1BW
	ET/g8hjoKwfOoHhZvyA2mk0zcRUKFmRHBkegLLo=
X-Google-Smtp-Source: ADUXVKKo+Ex1uSefIna0qQD6i/zpR7JDJbecC12eiSLofpXENP9NBdJjjCeJGzEnWFSkMhLYeP3lx/uLUZJBuZL4H30=
X-Received: by 2002:ab0:5851:: with SMTP id
	p17-v6mr13831727uac.164.1529514788833; 
	Wed, 20 Jun 2018 10:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <1527446036-4930-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1527446036-4930-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jun 2018 10:12:43 -0700
Message-ID: <CAMKF1spkmLzTGypQ2jcyQZschxprg1tSqaUbd5P9b1tZ1_RWdA@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] Fix confilct error in do_rootfs.
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
X-List-Received-Date: Wed, 20 Jun 2018 17:13:08 -0000
Content-Type: text/plain; charset="UTF-8"

Can you rebase it on master and send again ?
On Tue, Jun 5, 2018 at 8:43 PM Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
>
> Error: Transaction check error:
>   file /usr/bin/mailq conflicts between attempted installs of esmtp-1.2-r0.x86_64 and postfix-3.2.2-r0.x86_64
>   file /usr/bin/newaliases conflicts between attempted installs of esmtp-1.2-r0.x86_64 and postfix-3.2.2-r0.x86_64
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta-networking/recipes-daemons/postfix/postfix.inc | 7 ++++---
>  meta-networking/recipes-support/esmtp/esmtp_1.2.bb  | 6 +++---
>  2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
> index 09447d5..a5e8618 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -219,9 +219,10 @@ do_install_append_class-target() {
>      sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
>  }
>
> -ALTERNATIVE_${PN} = "sendmail"
> -ALTERNATIVE_TARGET[sendmail] = "${sbindir}/sendmail.postfix"
> -ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
> +ALTERNATIVE_${PN} += "mailq newaliases"
> +ALTERNATIVE_TARGET[mailq] = "${bindir}/mailq"
> +ALTERNATIVE_TARGET[newaliases] = "${bindir}/newaliases"
> +
>  ALTERNATIVE_PRIORITY = "120"
>
>  ALTERNATIVE_${PN}-doc += "mailq.1 newaliases.1 sendmail.1"
> diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> index 2da73e7..9fb817b 100644
> --- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> +++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> @@ -18,10 +18,10 @@ EXTRA_OECONF = "--with-libesmtp=${STAGING_EXECPREFIXDIR}"
>
>  inherit autotools update-alternatives
>
> -ALTERNATIVE_${PN} = "sendmail"
> +ALTERNATIVE_${PN} += "mailq newaliases"
> +ALTERNATIVE_TARGET[mailq] = "${bindir}/mailq"
> +ALTERNATIVE_TARGET[newaliases] = "${bindir}/newaliases"
>
> -ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
> -ALTERNATIVE_TARGET[sendmail] = "${bindir}/esmtp"
>  ALTERNATIVE_PRIORITY = "10"
>
>  ALTERNATIVE_${PN}-doc += "mailq.1 newaliases.1 sendmail.1"
> --
> 1.9.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

