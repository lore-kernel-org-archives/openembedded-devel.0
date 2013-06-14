Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 86CEA61957
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 17:38:05 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id un1so784939pbc.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 10:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=JmkcJyJOBQKWERHfAx3JrkTOSJJPDnYaxbO2qfJw4+A=;
	b=u4kxqhO7voMWT4KjBgSM0lB+Hpber0HZ7UOEN2T82TfR3ZrisVjBFP191ZUWLb1JBm
	wNkDqSFMNpLC1A52psAZMpuSJaks5xt8EokDqRyWoo1ZvU4TrJ3XmyBKuQidioONUK2O
	/MpXEh1effgiee3ZrEwbn0DO7S5/lKvOm4GHLQUhIGTTB/jNwAoNelsXqSPCF6bNZmFU
	GCXkW6UH+dEAMUUNWlCUnpq2P6+m0LZV9uVj0XDPjAXzr6t7DBEy5owl9fAoTc5ZOHsd
	8Quc+UsYnbmYQ9Wmq/TGCdVsuwTPNG83NvBs6YrNyj4VhUEoeehsSZqFZYkNc262f8Ew
	dhiA==
X-Received: by 10.68.227.170 with SMTP id sb10mr3478131pbc.81.1371231486541;
	Fri, 14 Jun 2013 10:38:06 -0700 (PDT)
Received: from [172.24.240.69] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id wi6sm3018373pbc.22.2013.06.14.10.38.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 10:38:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1371230436-10343-1-git-send-email-paul@paulbarker.me.uk>
Date: Fri, 14 Jun 2013 10:38:05 -0700
Message-Id: <961DCC52-526C-4A17-9951-9C56FC51C2AE@gmail.com>
References: <1371230436-10343-1-git-send-email-paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Subject: Re: [meta-networking][PATCH 1/2] ipsec-tools: updated to 0.8.1
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
X-List-Received-Date: Fri, 14 Jun 2013 17:38:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Paul

There should be already fixed see
=
http://git.openembedded.org/meta-openembedded/commit/?id=3D4136f35d5bcdd4e=
386ea8f105540c64e2cff0cf7

On Jun 14, 2013, at 10:20 AM, Paul Barker <paul@paulbarker.me.uk> wrote:

> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
> .../ipsec-tools/files/ipsec-tools-install.patch        | 18 =
------------------
> .../recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb   |  7 -------
> .../recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb   |  6 ++++++
> 3 files changed, 6 insertions(+), 25 deletions(-)
> delete mode 100644 =
meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patc=
h
> delete mode 100644 =
meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
> create mode 100644 =
meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
>=20
> diff --git =
a/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.pa=
tch =
b/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.pa=
tch
> deleted file mode 100644
> index 85035b1..0000000
> --- =
a/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.pa=
tch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Avoid attempting to install vmbuf.h twice
> -
> -Upstream-Status: Accepted
> -
> -Taken from pld-linux.org:
> =
-http://cvs.pld-linux.org/cgi-bin/cvsweb.cgi/packages/ipsec-tools/ipsec-to=
ols-install.patch
> -
> ---- ipsec-tools-0.7.2/src/racoon/Makefile.am~	2008-07-23 =
13:48:40.000000000 +0200
> -+++ ipsec-tools-0.7.2/src/racoon/Makefile.am	2009-07-04 =
01:43:48.148433975 +0200
> -@@ -3,7 +3,7 @@
> - sbin_PROGRAMS =3D racoon racoonctl plainrsa-gen
> - noinst_PROGRAMS =3D eaytest
> - include_racoon_HEADERS =3D racoonctl.h var.h vmbuf.h misc.h =
gcmalloc.h admin.h \
> --	schedule.h sockmisc.h vmbuf.h isakmp_var.h isakmp.h =
isakmp_xauth.h \
> -+	schedule.h sockmisc.h isakmp_var.h isakmp.h isakmp_xauth.h \
> - 	isakmp_cfg.h isakmp_unity.h ipsec_doi.h evt.h
> - lib_LTLIBRARIES =3D libracoon.la
> -=20
> diff --git =
a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb =
b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
> deleted file mode 100644
> index 255246e..0000000
> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require ipsec-tools.inc
> -
> -LIC_FILES_CHKSUM =3D =
"file://src/libipsec/pfkey.c;beginline=3D6;endline=3D31;md5=3Dbc9b7ff40bef=
f19fe6bc6aef26bd2b24"
> -
> -SRC_URI +=3D "file://ipsec-tools-install.patch"
> -SRC_URI[ipsec-tools-0.7.2.md5sum] =3D =
"72861f005746ee27984b2ee715ecc629"
> -SRC_URI[ipsec-tools-0.7.2.sha256sum] =3D =
"08722ff6c62de3e042fef337454f03622a79053108d6dcc686c9c854f9f9e031"
> diff --git =
a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb =
b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> new file mode 100644
> index 0000000..e8178ce
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> @@ -0,0 +1,6 @@
> +require ipsec-tools.inc
> +
> +LIC_FILES_CHKSUM =3D =
"file://src/libipsec/pfkey.c;beginline=3D6;endline=3D31;md5=3Dbc9b7ff40bef=
f19fe6bc6aef26bd2b24"
> +
> +SRC_URI[ipsec-tools-0.8.1.md5sum] =3D =
"d38b39f291ba2962387c3232e7335dd8"
> +SRC_URI[ipsec-tools-0.8.1.sha256sum] =3D =
"fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc830a881d63abe8153dd4"
> --=20
> 1.8.3
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


