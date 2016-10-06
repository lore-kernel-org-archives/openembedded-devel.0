Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3A21B60557
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 16:53:07 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id r64so23094430uar.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2016 09:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iq+PJilYY7s8aVwkTdEqqw6kAy7i2R8aRj1FxuA5RUs=;
	b=hEmnb8VOoLjdZU+5G8nm3xxd6ONuc0n4oe1LHUuXnt679ZuJo2I/1VPUwQCUS0lm1R
	4C9Uo+tS4U5YHvEzXUT3izSpd00axn4MmVt/s9XlY6+7Vsop/2S/ULfY3F2c3HZrNtGE
	Gh8KAKtC7ItcDPpBqgBzmRZtGfuKeea07fgyevDqt6avrIHoGLSoStKNaLHLA9FpPAWM
	QeAaMYxR3skkURvrQBoCv3wTCFyF+nZp1CR/vLYuF4rE2BBMa1cMRGM3mz3yBfiNMg34
	CXuhFtPMwKPM2hhIfuqNWEIzhTLozRsija3Sdc2gtVO1lfTpHcpzsSeViJpbAhspdOrL
	e64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iq+PJilYY7s8aVwkTdEqqw6kAy7i2R8aRj1FxuA5RUs=;
	b=BYl4cdR3p8A5e88x9axbxWgDP+r7J5Fciz6ouwGSXi2kXDxNM3oXYG1aZMEYHTKKPO
	T/ejUaK5GfTxZ9I8aKIgSnHQC/ICJ1VqlUKzsJbb9VaNlatWW/mFDwdf2qDwunyomQdG
	o0Gl57czybApAFmDYObyx3rfEZTUNA4FSBg6JpSxMmgiUG4wPh1O8OHZ0KDMuARCK7fk
	d8qFY5luNApYFMm8Qw81qgAbz87vJWcEEDQ/qS1/e5EBMpNJQ1D4ShRrGSQFjPqhGE+M
	yGYt/fMTZd/5NoGd6Fbqy2itZVUQ5g+bZuFUnmSVstsO92+sHOjEydInNdcONB5XCro8
	KrCA==
X-Gm-Message-State: AA6/9Rlq/olrrS+TXIz5QtiMB9pWcQROgf+T02XifHk9z6LNjf+uR+5M+Lg//WgWIfdYxct7WtYqKDWy8Oq6jg==
X-Received: by 10.176.82.220 with SMTP id w28mr10013619uaw.65.1475772788909;
	Thu, 06 Oct 2016 09:53:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Thu, 6 Oct 2016 09:53:08 -0700 (PDT)
In-Reply-To: <1475771979-17364-1-git-send-email-akuster808@gmail.com>
References: <1475771979-17364-1-git-send-email-akuster808@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 6 Oct 2016 18:53:08 +0200
Message-ID: <CALbNGRQTUGqBep6kfzrhx9c-TyvYOD7N=H-B0s=rzv8UAru1bw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: akuster <akuster@mvista.com>
Subject: Re: [meta-gnome][PATCH] gvfs: fix fetch error
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
X-List-Received-Date: Thu, 06 Oct 2016 16:53:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 6, 2016 at 6:39 PM, Armin Kuster <akuster808@gmail.com> wrote:
> ERROR: gvfs-1.28.3-r0 do_fetch: Function failed: Fetcher failure for URL: 'http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.28/gvfs-1.28.3.tar.xz;name=archive'. Unable to fetch URL from any source.
>
> change SRC_URI
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
> index fde57c1..746d73c 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
> @@ -6,6 +6,8 @@ inherit gnome bash-completion
>
>  DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2"
>
> +SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
> +
>  SRC_URI[archive.md5sum] = "d2399a1a217dd5030e8830c7e7c813c2"
>  SRC_URI[archive.sha256sum] = "458c4cb68570f6ef4a9e152995c62d0057c3e0a07ed64d84c7200cdd22f0bd17"
>
> --
> 2.3.5
>
I that a gvfs-only or a gnome common issue?

Andreas

