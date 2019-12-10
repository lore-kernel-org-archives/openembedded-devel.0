Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id CA94D7FC0B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 23:49:23 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id o18so4985577qvf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 15:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Uluy35ilFScnCpcxJOtGu8MMIf1BSAmOOL5F8QJlemU=;
	b=SpmjEHf+4E0hu7itArC/qykTnfyDk4nLgSun5796LDYJjN4kNAil/769h8osQ+XMTm
	vXgYAfToP/qQsBwY2NFciuyRQ3wNR+xjQnTG2USFZiHuAcKIVUx3iaLkLZNHD1s5kPUf
	0xBbkty6IGUaehpxuktEVZRSGsrVzDd3gFKQ+j2I/VmWjf3v5bKMB35JgZz6KJJl+pCq
	J2LSrWJDkAU4OechTqlZzimX1+ZIbxy7xq4TmClFORiHmn5vq6LcdFnBNk72a1GSMJfs
	6hQSwXR6azNn3kak6XZDmfaS/bgyoL6m/v2TWPCFuwG4OTPgPf4gC+7BfZoUB5H6F0S2
	HWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Uluy35ilFScnCpcxJOtGu8MMIf1BSAmOOL5F8QJlemU=;
	b=oId6i3LUeTlmzWVw6VpeX4n44gjRFmMnlyCAULTaYFepKFsQWw0Bm1nnNvVzSRwwcx
	1lND+Xx0beatofaKTBnI7I50CxKOjR3xg5X6zeSFTDXFZauSh656eU38xBGDSW3P/63V
	JnTr6ODPDMDm18ETsUZfoX/5SgsUp+pQAndJ2/aFGj7SrzALJ/mNM/1HA+6EUVkW2I98
	5X/NIOLhpnKsWDxLMIWjfH/nRw6F6++AyPxK9XwNG1HdyVRma0Rd979wlk6hPyxFke79
	d9zCKHNTLr2spNHLHXPYwL7zccj8FeQNfmxodQhIaXAeKdaM/1e4KDZsAz/QGqu9jkKs
	NqKQ==
X-Gm-Message-State: APjAAAUu4Q+EULkplqvr2tIaUYms74pg4vd74B5VFCqj7sgIIMv89/HG
	H/OE/kJ8e1/Bp952JN/03KEGIBIVaQ0LgygWfXk=
X-Google-Smtp-Source: APXvYqxaRm5v13EWtTlV6bUknPc6mJ1rtSCc8MiFbG92HWdVMNQqajwK+K8x0V4ifsuCqygCAYkFSvzVsbico6Erjjo=
X-Received: by 2002:a0c:8605:: with SMTP id p5mr442340qva.109.1576021764344;
	Tue, 10 Dec 2019 15:49:24 -0800 (PST)
MIME-Version: 1.0
References: <1576014699-29663-1-git-send-email-denis@denix.org>
In-Reply-To: <1576014699-29663-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2019 15:48:58 -0800
Message-ID: <CAMKF1sov90kwh_dy8UD-qob7UXTkeD2iL6=X2T+PHanFvVy7Pw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-networking][PATCH] netperf: add "intervals" and "histogram" PACKAGECONFIGs
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
X-List-Received-Date: Tue, 10 Dec 2019 23:49:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 1:52 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> From https://hewlettpackard.github.io/netperf/doc/netperf.html:
>
> Other optional configure-time settings include --enable-intervals=3Dyes t=
o give
> netperf the ability to =E2=80=9Cpace=E2=80=9D its _STREAM tests and --ena=
ble-histogram=3Dyes to
> have netperf keep a histogram of interesting times.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-networking/recipes-support/netperf/netperf_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/met=
a-networking/recipes-support/netperf/netperf_git.bb
> index 8921ea7..f1f62df 100644
> --- a/meta-networking/recipes-support/netperf/netperf_git.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_git.bb
> @@ -31,6 +31,8 @@ CFLAGS_append =3D "${@bb.utils.contains('DISTRO_FEATURE=
S', 'largefile', \
>
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[sctp] =3D "--enable-sctp,--disable-sctp,lksctp-tools,"
> +PACKAGECONFIG[intervals] =3D "--enable-intervals,--disable-intervals,,"
> +PACKAGECONFIG[histogram] =3D "--enable-histogram,--disable-histogram,,"
>

now that they are explicitly disabled, Does it change the defaults ?


>  # autotools.bbclass attends to include m4 files with path depth <=3D 2 b=
y
>  # "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

