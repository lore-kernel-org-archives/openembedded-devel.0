Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRR02-0002yf-HJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 18:41:26 +0200
Received: by yenm3 with SMTP id m3so4380917yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=owMJjSRk94Y9585cEkw8vYxzWY9WVDiAjacjUs79MoU=;
	b=M50dz8vDJKNqyjo+J6/pSQguKup4d2bPUSHKBNok/8nj0/wKuTX1SzW/43CuSxIKjM
	wrxSEvRVws027AlXS/I+59vwPRjCrrTjS82kdpCgRipk2k98pj1uwml/DG+PrRCVK3z4
	KYcp/FgF9/t3EmsQWBa29kFKDiR+E0f40pPI7NNPzOW3wkK4Tecrp5/ER1G1OE+QkfHw
	opEF8Wm/ck1cC3IaFvPcynXkRvjsljouW3h+7L+YyBOiwzxyWLIW/xaE05FrzRTmaMfk
	ROeBkvev6qTjk5s5GHYZ67fHgtRqkK6w0dT/KkRa7GfVNJ0m3VB/XSxuQMi4jw7QCsjl
	m+qA==
MIME-Version: 1.0
Received: by 10.236.125.234 with SMTP id z70mr19998206yhh.18.1336408295593;
	Mon, 07 May 2012 09:31:35 -0700 (PDT)
Received: by 10.236.23.9 with HTTP; Mon, 7 May 2012 09:31:35 -0700 (PDT)
In-Reply-To: <92a51d2df35aea2d72186ff7c6f0d6e9c20dc504.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
	<92a51d2df35aea2d72186ff7c6f0d6e9c20dc504.1335766581.git.Martin.Jansa@gmail.com>
Date: Mon, 7 May 2012 18:31:35 +0200
Message-ID: <CA+chaQcL3MRbYXO4HPcdCmC3TNKecK=iZsTb+M2q6q60cjSfEA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-efl][PATCH 1/6] libsoup-2.4, gobject-introspection: upgraded in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2012 16:41:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 30, 2012 at 8:31 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =C2=A0.../recipes-support/libsoup/libsoup-2.4_2.37.2.bb =C2=A0| =C2=A0 25=
 --------------
> =C2=A0.../use-usr-bin-env-for-python.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 20 -----------
> =C2=A0.../gobject-introspection_0.9.10.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 32 ------------------
> =C2=A0.../gobject-introspection_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 34 --------------------
> =C2=A04 files changed, 0 insertions(+), 111 deletions(-)
> =C2=A0delete mode 100644 meta-efl/recipes-support/libsoup/libsoup-2.4_2.3=
7.2.bb
> =C2=A0delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/g=
object-introspection/use-usr-bin-env-for-python.patch
> =C2=A0delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/g=
object-introspection_0.9.10.bb
> =C2=A0delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/g=
object-introspection_git.bb

Now it's applied in oe-core, I'll send updated pull request from
jansa/pull2 with 4 more patches tonight..

Cheers,


