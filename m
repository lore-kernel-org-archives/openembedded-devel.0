Return-Path: <max.oss.09@gmail.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 79EA071ADD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 22:27:01 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id 65so185678790otq.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 14:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/8FoJDDAp94FIthpvexMdxoUgkgH7BM1TlelvFtHIC8=;
	b=QT3d48d/xKfWqL8lbqujX8sKKJzX7AhiNXyy2GsFLJQ/lkZ/OwPpDL/ric/joG9Csd
	yLgYwAmyZhk0H196o5D/IQvCm9L5cGuM89Xi2sFyh1RSn2frw3Nb72mJjMOh9mNAVOCU
	oKN3LxWiV1poFzFRlOlKENiwAWYjpvt7yySVb+Vpi3ZwIpBipLe77nQdvQq2fkXxNGwk
	vyvs5I0/sf/DVsKzF8xRScbCMurVjOn/bohwg3ZmIDdLFTHb8jJL3G7DREozFwd2yqP4
	5+2QY8UiNooNw74qUd73qG0z/7ahG2XzZmL8yWdjSam0rdN60svVywT81WEZuCgd2pwa
	HgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/8FoJDDAp94FIthpvexMdxoUgkgH7BM1TlelvFtHIC8=;
	b=M23WUdiT4XcjM7p8xmD/l1nf2kb5/FA57qS3TNMIaII1xJbO6qo9Jkk54OJ+vir5Sk
	2X2UiXQONmmjswxbMBlPnlPdZdN27ZlIMsELeQuQ96vtyZd8fFdMGysQn7Vz+1w7OnGZ
	hshIKubXZiwepgFNq+TIXVPIIYj37snlNm7Eq8nnoRZviZocQM67uSL6JC2DXHYb7C4G
	GNPThFZ9r/D3GNPDOlN6t5EJQE5emzAjYcbu0MZkoDbASP1KaVU+DUQ/uze/MLvLb4ud
	xiNLkek0P/FhdggqCtVadJEzqeeMdFHO4fFBQ+Rj/GxKKBKIuPl1cPc7ajsUmdB1k2Xl
	hkcw==
X-Gm-Message-State: AIkVDXKPGfhEK+9ccjJFq4DuVX0kNidwJpnEXJyA8fkNrEjUqM54p++8sUQbJWgHekjEBQQuk18h5bS10QV7iQ==
X-Received: by 10.157.42.19 with SMTP id t19mr2330149ota.257.1485469621373;
	Thu, 26 Jan 2017 14:27:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.1.56 with HTTP; Thu, 26 Jan 2017 14:27:01 -0800 (PST)
In-Reply-To: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
References: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 26 Jan 2017 23:27:01 +0100
Message-ID: <CAEHkU3V3UUhzJEeYmNTAqzCWMnq6nbw1PNM12L6cxKmHz5HkRw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-browser][PATCH 1/2] firefox: remove nss private libs setting
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
X-List-Received-Date: Thu, 26 Jan 2017 22:27:01 -0000
Content-Type: text/plain; charset=UTF-8

ping

Any comments on this one?

Max


2017-01-17 0:09 GMT+01:00 Max Krummenacher <max.oss.09@gmail.com>:
> Commit 8cc038d uses the system's nss rather than building a private
> one. So one should remove the nss libs from PRIVATE_LIBS also.
> Otherwise bitbake does not add nss to RDEPENDS automatically resulting
> in a potentially missing nss package in an image.
> Additianlly bitbake shows the following warning:
>
> | WARNING: firefox-45.6.0esr-r0 do_package_qa: QA Issue: /usr/lib/firefox/libxul.so
> |   contained in package firefox requires libnss3.so(NSS_3.12),
> |   but no providers found in RDEPENDS_firefox? [file-rdeps]
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  recipes-mozilla/firefox/firefox_45.6.0esr.bb | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/recipes-mozilla/firefox/firefox_45.6.0esr.bb b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
> index bed50dd..31b3353 100644
> --- a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
> +++ b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
> @@ -95,15 +95,3 @@ PRIVATE_LIBS = "libmozjs.so \
>                  libmozsqlite3.so \
>                  libbrowsercomps.so \
>                  libclearkey.so"
> -
> -# mark libraries also provided by nss as private too
> -PRIVATE_LIBS += " \
> -    libfreebl3.so \
> -    libnss3.so \
> -    libnssckbi.so \
> -    libsmime3.so \
> -    libnssutil3.so \
> -    libnssdbm3.so \
> -    libssl3.so \
> -    libsoftokn3.so \
> -"
> --
> 2.6.6
>

