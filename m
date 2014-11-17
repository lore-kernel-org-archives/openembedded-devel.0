Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3053B714D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 15:34:43 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id nt9so17474961obb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 07:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0MB3Y1EZ/9inrpMhmo2bhhAgtznHagJ2C8wGmjR2Iy8=;
	b=MXuDR7QSAAyV5GCCKZfVdb6P2V5njnUfNz5TLzHbU0yc75zgiMoFSqYtBAdVfND+tI
	ETyoNgx0DzzDlHtZkOSzJj5ZNip2hxQBCEe9ORqmIzGix4rYc89mvr/z5axH9dtuD7bI
	+ruh4ShOHgdmuxffcw7cbItffOkXu6hTmB4up6YNUYp0INDXg7tNghxbDvlF/28mlzFe
	qJJcAMP42KWm2viX3CeX7+7Rl76IIOvqYO/t0wVDT1QEuwxSZ0giOyaG7IrumsIruYEE
	bacGxdsX70lAWJcxDqrPF8ktVD6ql9zZIiBSjbeoZJsKNtYvUFsoEdPMmQ7IepPusZsh
	052Q==
MIME-Version: 1.0
X-Received: by 10.202.49.131 with SMTP id x125mr17692006oix.17.1416238483660; 
	Mon, 17 Nov 2014 07:34:43 -0800 (PST)
Received: by 10.202.67.84 with HTTP; Mon, 17 Nov 2014 07:34:43 -0800 (PST)
In-Reply-To: <1414663463-31222-1-git-send-email-schnitzeltony@googlemail.com>
References: <1414663463-31222-1-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 17 Nov 2014 16:34:43 +0100
Message-ID: <CALbNGRQB+P=vuOkm4oJdYdpr9VQwiG8GoohP88WarcSnekRAWA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [master][dizzy][PATCH 0/2] minor fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Nov 2014 15:34:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2014 at 11:04 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> A bit too late to get into dizzy directly...
>
> Andreas M=C3=BCller (2):
>   xfce4-weather-plugin: make work properly after met.no API change
>   gvfs: replace deprecated g_memmove by memmove
>
>  ...daemonfile.c-replace-g_memmove-by-memmove.patch |  36 +++++
>  meta-gnome/recipes-gnome/gvfs/gvfs.inc             |   1 +
>  ...-ready-for-met.no-locationforecast-1.2-AP.patch | 162 +++++++++++++++=
++++++
>  ...et.no-locationforecastLTS-1.2-API-bug-109.patch |  27 ++++
>  .../weather/xfce4-weather-plugin_0.8.3.bb          |   4 +
>  5 files changed, 230 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gvfs/files/0005-client-gdaem=
onfile.c-replace-g_memmove-by-memmove.patch
>  create mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0001-Ma=
ke-plugin-ready-for-met.no-locationforecast-1.2-AP.patch
>  create mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0002-Sw=
itch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch
>
> --
> 1.8.3.1
>
ping

