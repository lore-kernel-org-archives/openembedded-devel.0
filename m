Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 914DB7F822
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 17:42:13 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id u22so34561680qtq.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2019 09:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hfwM+tQI5s64j2xOu3HOI+kFwKLvGrHS3UajLRFDSpA=;
	b=fcupYoA/zpHUOdTDuW5wvisDACR0X+6ST0+Q/7d38vDJEYENW7GwKuWdOpN6Uw4HuP
	wGai9hIszHRU6r8FaoMx/rVwN5IhAjWEof7D4SOOtzXK/cbeJtPHinJu5sxJTYZv2bWv
	Grc95rlOYPPbj2KyAs3HNECYIhzgb43HRq23dtDZU/uCKzavHDVFimu4MDylPamMco3p
	voRVH8ASPBSB0mCxZEL4AEvBtaqSPEN8nQMRiLWw6upJ0/cqcWsn56Ays9Hj6Es4PKsH
	+jAj/u+EdrZePOKeNZ2WJUI4zybqwmeQCiA70GkuO3nSxokVsgXj95p2v+PXwvCnDfve
	0hpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hfwM+tQI5s64j2xOu3HOI+kFwKLvGrHS3UajLRFDSpA=;
	b=kHrDr3qDBDoI0ADbOsCYuPsWs36ZySPXwhZ8F/P7I4lcJirIeAJTDNZu/Iw6AOAWqX
	6NRiz9YC/u+X58iI0iDBFv6ta/xK9yzNV90fwDmBUvkFnqDEfZg7lz8BisEs1GBPPgUx
	3F7jMYLolg4KjyrolyFLutA0jlWgeTZEoMUoVjVx3hZHOJx2h6T7KOZpU4/TfF/sG4y/
	K0aoeiFbt6XE4yD2njJfO3JrO6JpeUHHHJHANLQlv9dXjcLPNZ2izxn3DnxJjbR6X5Xd
	ekCPN748T7d6uAAIgJPRveDk6IUPBWfKApLXYIg8I59ROIQvqX9kSw3cVJQrQn0ADzgD
	1sVA==
X-Gm-Message-State: APjAAAUlhDufyjXd5A+yXNrRtY2Vx6qO6aKhH7Ye19iiLV6aAb08KKoB
	6QSsy66soPnAUcjudpLtoWDD/tkdBBA1ameB3Gk=
X-Google-Smtp-Source: APXvYqy/onnnfC5obqDu4u1A2MQYyv6dJOlUgE0Kgc7ihR42OOCU6CGK9/HkGRSFO7BaKsD977UJm6uf11+lXZ3cy/0=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr3540633qtj.80.1573062134132; 
	Wed, 06 Nov 2019 09:42:14 -0800 (PST)
MIME-Version: 1.0
References: <1573042209-43148-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1573042209-43148-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Nov 2019 09:42:03 -0800
Message-ID: <CAMKF1sqQiw0VKxO+PvQ89LmiuW9p5FZmX6L=mcAvFQk2JLwjfg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ccid: upgrade 1.4.30 -> 1.4.31
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
X-List-Received-Date: Wed, 06 Nov 2019 17:42:13 -0000
Content-Type: text/plain; charset="UTF-8"

Please submit this patch upstream too

On Wed, Nov 6, 2019 at 12:33 AM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> 1) Add 0001-Add-build-rule-for-README.patch to fix do_configure error:
>    Makefile.am: required file `./README' not found
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../ccid/ccid/0001-Add-build-rule-for-README.patch | 22
> ++++++++++++++++++++++
>  .../ccid/{ccid_1.4.30.bb => ccid_1.4.31.bb}        |  5 +++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
>  rename meta-oe/recipes-support/ccid/{ccid_1.4.30.bb => ccid_1.4.31.bb}
> (71%)
>
> diff --git
> a/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
> b/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
> new file mode 100644
> index 0000000..586ff18
> --- /dev/null
> +++
> b/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
> @@ -0,0 +1,22 @@
> +Subject: [PATCH] Add build rule for README.
> +
> +fix do_configure error:
> +Makefile.am: required file `./README' not found
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 49574a3..a5a7c2a 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -26,3 +26,4 @@ libtool: $(LIBTOOL_DEPS)
> + ChangeLog:
> +       git log --stat --decorate=short > $@
> +
> ++README: README.md
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.30.bb
> b/meta-oe/recipes-support/ccid/ccid_1.4.31.bb
> similarity index 71%
> rename from meta-oe/recipes-support/ccid/ccid_1.4.30.bb
> rename to meta-oe/recipes-support/ccid/ccid_1.4.31.bb
> index 95a41d2..de07bfd 100644
> --- a/meta-oe/recipes-support/ccid/ccid_1.4.30.bb
> +++ b/meta-oe/recipes-support/ccid/ccid_1.4.31.bb
> @@ -8,10 +8,11 @@ RDEPENDS_${PN} = "pcsc-lite"
>
>  SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
>      file://no-dep-on-libfl.patch \
> +    file://0001-Add-build-rule-for-README.patch \
>  "
>
> -SRC_URI[md5sum] = "817abceef715e02cb47617621fe192e0"
> -SRC_URI[sha256sum] =
> "ac17087be08880a0cdf99a8a2799a4ef004dc6ffa08b4d9b0ad995f39a53ff7c"
> +SRC_URI[md5sum] = "e4690f3362f95adb2332fd47a2b08212"
> +SRC_URI[sha256sum] =
> "6b48d7b6e4390e038d25630f8664fe81618ab00f232d6efbe0e3cc6df28ce8f7"
>
>  inherit autotools pkgconfig
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

