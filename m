Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id E0D4A78CE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 16:55:33 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id y16so20582058qki.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 08:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1DSA9+C7bjKttGxzLS8VxwTzCK6nGN+7IVsh4ZKX8G8=;
	b=TDgpETbi5wrvU6z05dGraM/qGO9qVBnGGCtWFEVImO239Yof1x6hWMiXNZLT86nyE3
	qFWhKgJRwghGAtEjMr8TQPntFH64fH1lfNQef1C1gxPyGSXhEzIEzOk/CX8a3RdtAfJH
	Z08J2dl/vVHf5OE/xr/lIcbkU0y/M9zBgQvP2tkHEWHeQou5ubdAQQ6Z+VjP6dunQmhH
	msm8FM+vHIlmMsM3aEfem9/HthanvSaxe5SVyeBWJwnEbaFZDZoFB99rGvo6qdd/NAdA
	tBceToyOfSagRjjswbtJATzwUcD/++kY0PdlI8hHOBJqEpqNWnUXrtevp0VmQaOfMlGt
	1h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1DSA9+C7bjKttGxzLS8VxwTzCK6nGN+7IVsh4ZKX8G8=;
	b=uhvjyR/wr5asdqLkZMxt7cHarWLGVmtpejzsHoZLFFNhziGMzUWBJLAB27qRHMvTr9
	4UIgB7p5K6zmw3tXxHAkHiHb3Sp1Zca6Nr2ilVzkMDgH3echYGZME93YiiTnuvDNeRkW
	vRUSKfGSFf0BWvWp0GDU3ThmHmPy3j2ghcAkcnSMCGA4MroFA4bVccshqnqwj0Lzb8D6
	kfrWefDFcmgUPni8/C6kYwA4hHhMeGuRqZuM7iOV39Vl3JSXtwvPt0lPXru1QL66WOLg
	YjHTVIuGxHoM62uYPjX24z3I5ncf/95KZoB0kgVe9CfDGs5Zpw5ByaCslAJQ53qQ+fKH
	yACA==
X-Gm-Message-State: AGRZ1gJurLi3owoVHTRUYqQda+GFKVT53ZlGHb8MnRmw8l1K2SBwX0Uu
	j7kWTnv3plAdT3uaVKDnk4Qc1F/+HvQEmlt/xqs=
X-Google-Smtp-Source: AJdET5c9eIp1CEqKsSkdnBB1GiqCHqH1yK3yCmlat9II56zDyS2tW983ZnMyi7Liy7WPl/SSRfabNwwmJua02kaa0+o=
X-Received: by 2002:a37:91c2:: with SMTP id
	t185-v6mr911649qkd.223.1541609734536; 
	Wed, 07 Nov 2018 08:55:34 -0800 (PST)
MIME-Version: 1.0
References: <1541608802-6985-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1541608802-6985-1-git-send-email-mark.asselstine@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Nov 2018 08:55:08 -0800
Message-ID: <CAMKF1soCQASpY7U-Vd1jVsN8-6+TtgzSnyg5H+Xsf30hdF46FA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] meta-xfce: xfconf: fixup installed-vs-shipped QA issue
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
X-List-Received-Date: Wed, 07 Nov 2018 16:55:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 7, 2018 at 8:40 AM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> Since the xfconf uprev, commit 4222cac97678 [xfconf: 4.13.5 ->
> 4.13.6], we are getting a QA issue:
>
>   ERROR: xfconf-4.13.6-r0 do_package: QA Issue: xfconf: Files/directories were installed but not shipped in any package:
>   /usr/lib64/gio/modules/libxfconfgsettingsbackend.la
>   Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
>   xfconf: 1 installed and not shipped files. [installed-vs-shipped]
>   ERROR: xfconf-4.13.6-r0 do_package: Fatal QA errors found, failing task.
>   ERROR: xfconf-4.13.6-r0 do_package: Function failed: do_package
>
> We need to include the .la file in the -dev package to avoid this.
>

can we just delete it.
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> index 191d0fd..2667ff9 100644
> --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> @@ -14,3 +14,5 @@ SRC_URI[sha256sum] = "d1a3d442dae188b5a7380b5815377e5488578cdafb03ae363e9426e3b0
>  FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
>                  ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
>                  ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
> +
> +FILES_${PN}-dev += "${libdir}/gio/modules/libxfconfgsettingsbackend.la"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

