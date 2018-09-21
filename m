Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 853CC79887
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 00:18:53 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id o15-v6so200259qtk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2018 17:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NZpmU+KdRJHSIK5e4W258h91s5jVcCNdzvzMyT01MZM=;
	b=azA4uOml4JUvx694EqPIks8h7yK67V0xqtMxW4cIQyIxmdqN8IExpmiA8niztRfeU+
	q9ROlBFA0VxWDzkaQnTfrs0qHHorf/39PgdATs8jSJdB0YlYCl24TcgbPEFetZg068TC
	Tl2KY+uYmZhTWV/l3GU69jDaypveOtjsFhjGnGoxsQKw8xZnjChbgAS8Lp89EAiJ37oo
	a9iiSBxJwq5LUCZ6sn93wJFLSm+w6YDVP83grXFKE3/Tflhs9NNrzRh0pXWz0nQ9q5HM
	AdYLSaRB0Tm6d9RZO1LIIAno3CWPqUxxOZ/n50Xb2M4SBdAeXZgAFE02WRbIexMtOHEC
	NCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NZpmU+KdRJHSIK5e4W258h91s5jVcCNdzvzMyT01MZM=;
	b=GrvKOvkthJtld9hANA7UL6lswElH7gBzT/1ae7HRTEqpJuI6NkJjg01ojSLOgTUEpc
	zI1ZNxeYyJxdSJ4A55TEiDnk5RSqJPKmsu+t89rXd0JQcxikZVy63mZz2x8edIpdkAS3
	bMN8bImYWLJ9NOvZGHNjOxVpsGhqkanLtqinWOHkXOBvXoD7Um9Z5oC05nEXbAM3dTu3
	B0H9pWW2je7FFPvsZdx3IG2Mg6jAK7EwsKQHGRR/4FnViVxvorDAdJ/FQwq/925it8hy
	xqWxL+/MeJMJLuGJXkisKWu7kWu1vAgjNAei78Od0pbETkI2AVgu4ioG1lPhTyC+GBgm
	ksCw==
X-Gm-Message-State: APzg51D14t6gQTYf2Ac/Ns+sW19Te1AFMwHf0+3Aq1+F4FLprUjQXyno
	LEAaWHDNkQ1TShJtBARdAu0YKYOwk4Q40XW/pUc=
X-Google-Smtp-Source: ANB0VdbfF+YApkSyjHDL4VZNpgpKvzoTLnaLmOUUGlpZZAwESy/KmvPDUWZHjfK0B8ZrprY88nwr8VDg7hY+BjITogM=
X-Received: by 2002:a0c:f78d:: with SMTP id
	s13-v6mr27355048qvn.194.1537489134156; 
	Thu, 20 Sep 2018 17:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20180920195929.5625-1-max+openembedded@blarg.de>
	<20180920195929.5625-2-max+openembedded@blarg.de>
In-Reply-To: <20180920195929.5625-2-max+openembedded@blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Sep 2018 17:18:27 -0700
Message-ID: <CAMKF1sqitMcnQHt73gDbsMyWpFatxOmKoH=suurNz7HmFt45CA@mail.gmail.com>
To: max+openembedded@blarg.de
Cc: max.kellermann@gmail.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mpc: new recipe
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
X-List-Received-Date: Fri, 21 Sep 2018 00:18:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 20, 2018 at 12:59 PM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> From: Max Kellermann <max.kellermann@gmail.com>
>
> Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
> ---
>  .../recipes-multimedia/musicpd/mpc_0.30.bb       | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb
> new file mode 100644
> index 000000000..777a2ab62
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "A minimalist command line interface to the Music Player Daemon"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +HOMEPAGE = "https://www.musicpd.org/clients/mpc/"
> +
> +inherit meson
> +
> +DEPENDS += " \
> +    libmpdclient \
> +"
> +
> +TAG = "v${PV}"
> +SRC_URI = " \
> +    git://github.com/MusicPlayerDaemon/mpc;tag=${TAG};nobranch=1 \
> +"

no tags please. use sha id

> +S = "${WORKDIR}/git"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

