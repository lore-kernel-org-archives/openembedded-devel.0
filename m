Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5153579C59
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:16:49 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id k206-v6so13220015ite.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HnikZEAKl4TdP4J9SiWCQfm+3XNVsmg0U+cgq1Q6Bc4=;
	b=E6FVX4QMlNQcwtNcTq+AB76MPB6l9T3dzBRy568oS9+ORC/ct8K9DdPBvFO+ty62AB
	ne9SJ5BULgZCNYFIhf7xtSjoQsX2o6EXlqFsxGTX1rVZGiCXKco3e5fTHVj/NqgrDK2k
	WtEZ8XQpwxxIRx7lFtxB4FSqY3TctZcQPV0niIzzTPZP861uDgV9TXTmvVBDgsiPTYIb
	AN+ZgSMYKqkT149F0CprtDTwK6hyi7mHEn1K8wwajjhCHx8TeJ+8vYCIlaT/or3/IaKZ
	epIJvD063DuzFbPjurrtHgk4vZ5ttKPjFvw0f0q9SuPxpOEVjuh745zOd45ZO7nagwSz
	CrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HnikZEAKl4TdP4J9SiWCQfm+3XNVsmg0U+cgq1Q6Bc4=;
	b=W/QgYs6ysspO1EgzqNz8ahIDLq8s6fEnd59d4A369ndI93omIDkvUBvmLfObr3m0iR
	+ENKgpoKGd1IVrMT4deWd2MgCzCxXX/ejBGuidI8cLlBwxZ11b+1GSjoY3cLKQ/Jn2jI
	8vm0X5RCEFzT3RX8Oas8kV8c0JRcJoKFJZq55hCM2UXrPUUpdCLrn11nUeXwFMzePC1b
	RGd+EDMjoGWmXEQKvFEBTNdL41uQYajzJOlmTon9XawJW+gt4qBFkahGFYMyME5j6QVQ
	z/wzmFVCQvdfeT8gDHy8+jIHgyYFbq1GeurOlg0bYRJ2tGvsT0seXZ8A+0neqZhLwnS+
	9W/A==
X-Gm-Message-State: AGRZ1gJlixA+u76fSQV3j5hjvrLNG9SpzXiqO+CtwgEA1kHK0uHsaM/k
	TMt0A+4Mh/cTDihOUhC2xSioszZ3byv9TRhjM149Pg==
X-Google-Smtp-Source: AJdET5f53A5AyU3RISyIWOLea/QyZJIhSNiGR/eaJbFWK+of0XL0dHsYK5ME4x+iDXeAQ9L9DluTvz/52VxpBhoe5Zo=
X-Received: by 2002:a24:9287:: with SMTP id
	l129-v6mr921398itd.26.1540898210290; 
	Tue, 30 Oct 2018 04:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<eeb685e9cefb4e85e07b1a51f4e562c03dda96b7.1540830650.git.brendank310@gmail.com>
	<CAMKF1sq17swAVLpY=fXkug3s7C4TvDxJd8JF4cQOknicmjnr-A@mail.gmail.com>
In-Reply-To: <CAMKF1sq17swAVLpY=fXkug3s7C4TvDxJd8JF4cQOknicmjnr-A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:16:39 +0000
Message-ID: <CAJTo0LYUCVUMZnPND0yA+qNCDsNoOrStvO6jZLpQVi26=nOFQA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: Re: [RFC meta-gnome][PATCH 07/16] geocode-glib: add recipe for geocode-glib library
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
X-List-Received-Date: Tue, 30 Oct 2018 11:16:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Oct 2018 at 03:43, Khem Raj <raj.khem@gmail.com> wrote:
> > +SRC_URI = "git://
> > gitlab.gnome.org/GNOME/geocode-glib.git;protocol=http;branch=master;tag=3.26.0
>
> hmm tags are floating kind of commits so they would result in checking
> remote repo on every fetch task it would be better to use a hard coded SHA

Or the tarball, https://download.gnome.org/sources/geocode-glib/3.26/

Note that gnome.bbclass pretty much sets up SRC_URI for you.

Ross

