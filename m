Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 00CF074535
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:30:48 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id j9so1324511itl.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RhHQ569S7jZRYxZLFq8ceKkXA1D7wTRRaK9P5GYTmL8=;
	b=tYyGJgxPQguZuu1Bum+3Fx0rQzCAQnhrSXvX8hZaL+3ix+5BIspf1obFHPTrBINlEd
	xeDnNJXWC6i3+PUyGNphWCwYCXz/N24zZAdxSYr1CQfuhMQRj4fuS7EDA1YZ85TJa4t0
	+OZC4GwvvEG9MBkqrRViRsxAmR5YAvT6Od9ooif438z3NpSj1rMO6Zyx0QrKbOzCAM16
	u3aTO3gHjWUMHPfdEwkemueZQUoNA7DdRy+SxDJHP3IjCe4J+O79lrNFIGlnmTbTh0oo
	ilKXOcUBbC+Y3ozCJwwSCQMqNALmi4yhBHTAKJbILm0pJaQd8q1Dx0edMfNP0ije1B13
	1URg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RhHQ569S7jZRYxZLFq8ceKkXA1D7wTRRaK9P5GYTmL8=;
	b=RmKUFvmjfozQI/fg7B5bPU9RPY/1hFCFAGAosTMs/TawTzeHzZ2YHbe0JQMl7L46iw
	a57KwXoDrH/7MFc2qFu3l3GVtMYnyfXCJrn3dvvxATrkRak72fIYL79WjvW8hFt56pNj
	kHI/H3GTnsNDBVCyjFNEyKmS3atgVTJbOkxP73twLBL2+ts33X8XKL9/nD03mCoHYRre
	Yg2N9kaLAF+1mXe5zQFRlV93cyq6tRqHNTmStKbC5ejoFq/3NFY0NANgE4S8UjcBOT0a
	orJFoxlMQyp6gsxx0Kru8C0EPzDLwTxkUmgRiZMyRSM+zKELnsD9Mcbf0H67fgDbRRXG
	IefQ==
X-Gm-Message-State: AGRZ1gKk6LrejKyG9+0dh4e+sC7SttlsnKrd4zbk51VdPMAmOnMQXQ6j
	5fTxFnoKDDn8YZYI0Q0+WcxCTr36mbDu321g8Vd3QQ==
X-Google-Smtp-Source: AJdET5eHqXaeJ8ArtrOtL5CnpbaM4n3n022UUki/5vYzkxGqiQyEhf5PI/5jFXM8RGlA9gH39HrMo2Tw1hgUhjoBKyw=
X-Received: by 2002:a24:9287:: with SMTP id
	l129-v6mr947796itd.26.1540899049674; 
	Tue, 30 Oct 2018 04:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<a3ce539915c9a45c2b8032260ea65d6ee5b00f6b.1540830650.git.brendank310@gmail.com>
In-Reply-To: <a3ce539915c9a45c2b8032260ea65d6ee5b00f6b.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:30:38 +0000
Message-ID: <CAJTo0LZ9SxbjYuw9OiHmP4W7SWX+0Uu3F6CyU5EaRFRpPh0wXw@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 04/16] accountsservice: add recipe for Accounts Service
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
X-List-Received-Date: Tue, 30 Oct 2018 11:30:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:42, brendank310 <brendank310@gmail.com> wrote:
> +accountsservice: Remove internationalization
> +
> +  The i18n internationalization fails within the OE
> +  environment.

Probably because you don't depend on gettext-native.

> +         context = g_option_context_new ("");
> +-        g_option_context_set_translation_domain (context, GETTEXT_PACKAGE);
> +         g_option_context_set_summary (context, _("Provides D-Bus interfaces for querying and manipulating\nuser account information."));
> +         g_option_context_add_main_entries (context, entries, NULL);
> +         if (!g_option_context_parse (context, &argc, &argv, &error)) {
> diff --git a/meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb b/meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb
> new file mode 100644
> index 000000000..a019a8c6d
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Accounts Service"
> +LICENSE = "GPLv3"
> +DEPENDS = " \
> +            glib-2.0 \
> +            gsettings-desktop-schemas \
> +            polkit \
> +            dbus \
> +          "
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI = "git://anongit.freedesktop.org/accountsservice.git;protocol=git;branch=master \

That's a mirror of
https://gitlab.freedesktop.org/accountsservice/accountsservice.

Also tarballs are at https://www.freedesktop.org/software/accountsservice/.

> +           file://0001-strip-out-intl.patch \
> +           "
> +
> +FILES_${PN} += "${systemd_system_unitdir}"

Use the systemd class instead.

> +FILES_${PN} += "${libdir}"

As discussed.

> +SRCREV="${AUTOREV}"

As discussed.

Ross

