Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 548696ACE5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 16:26:53 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id q9so2288703ykb.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 09:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=YjXfyql7JeA/VqbUeJ3kjIrczqdgwKsLuHdkay22vHY=;
	b=t7/I+tO2g2b4akLJJgugp5tj2Is3L3eTYIN8XJySwpieuLvUGXkDD9WcNSaQmnWGxu
	6CzR9cf/SAgtORHTQB53S9rN9PLlr4MeAWb8lFUpStT6LK783VBNmvXa3lTB06/D6MTX
	PL7pnLIntROyupDcwHAaElkSJ13Kje4jGtYCkpUNN81vbPl1MVNfzi34hWL95dQFDdep
	ynTXEdk6XkQJOaTeMtULmB5uegNck13iPfeTGVh4O3DBcNtsg9lks41mOdwuDHDXYqkI
	Gti8BRyi9aQ9H+duzJR6Yq1ZCR+IXgrEe6y3ANo9UyJUGuavodZwXjrQrItYg2GkDdY3
	jg8Q==
MIME-Version: 1.0
X-Received: by 10.236.28.44 with SMTP id f32mr8843921yha.148.1405700814332;
	Fri, 18 Jul 2014 09:26:54 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Fri, 18 Jul 2014 09:26:54 -0700 (PDT)
In-Reply-To: <CAOd_LFzaYUmCQB0vq_bxi0bWDRvEX8mGb7gFV7YQfRckTzKacQ@mail.gmail.com>
References: <CAOd_LFzaYUmCQB0vq_bxi0bWDRvEX8mGb7gFV7YQfRckTzKacQ@mail.gmail.com>
Date: Fri, 18 Jul 2014 13:26:54 -0300
X-Google-Sender-Auth: RORWO37NKTArce3WHQo2KIB3_Ho
Message-ID: <CAP9ODKoq4Qb6novXBgH4JB=c=-V04n5smkWp-464xqLRoDm9nQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][diasy] pull request, cpuburn-neon, v4l-utils, zeroc-ice
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
X-List-Received-Date: Fri, 18 Jul 2014 16:26:55 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Wed, Jul 16, 2014 at 4:32 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> The following changes since commit ee24939c4c70b63a9fb7e93a58889a3231d3d367:
>
>   rng-tools: Update rng-tools version to 4 (2014-07-01 15:08:41 -0400)
>
> are available in the git repository at:
>
>   https://github.com/cbrake/meta-openembedded.git 2014-07-16_merge-to-daisy
>
> for you to fetch changes up to d85b01997ce8cc354ccc53f97fdffc79cf2277d5:
>
>   v4l-utils: Add virtual/libx11 dependency only if X11 is available
> (2014-07-16 15:28:40 -0400)
>
> ----------------------------------------------------------------
> Lauren Post (1):
>       cpuburn-neon: Upgrade to version 20140626
>
> Otavio Salvador (1):
>       v4l-utils: Add virtual/libx11 dependency only if X11 is available
>
> Philip Balister (1):
>       zeroc-ice : Add recipe.
>
>  .../cpuburn/{cpuburn-neon_20120610.bb => cpuburn-neon_20140626.bb}  |   9 +-
>  .../zeroc-ice-3.5.1/0002-Modify-Makefile-for-cross-compile.patch    |
> 292 ++++++++++++++++++++++++++++++
>  meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb           |
>  77 ++++++++
>  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb              |   3 +-
>  4 files changed, 376 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-benchmark/cpuburn/{cpuburn-neon_20120610.bb =>
> cpuburn-neon_20140626.bb} (69%)
>  create mode 100644
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice-3.5.1/0002-Modify-Makefile-for-cross-compile.patch
>  create mode 100644 meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
>
> --
> =================
> http://bec-systems.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

