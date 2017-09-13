Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9967C77E35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:24:55 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id c27so1732449uah.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NXiON7PF+rMnpYdGvfg8O+C4thxBdiQgpvLUy4zAcvU=;
	b=LFjJJUnZBRCQVB8DguvT5SK4RoorKAv/tb0bpbyau8IWQLmTefWQE0vx3hxmBPLaYb
	7dki4a0Fe6cr1jpqZIckd7loSoZAzKKRgt5+d2wS1onAScr6cGKmpsEUQH0EROeoTe6a
	fXDlUOyNy+9kr+g0oXX8BYDaUWI5GcKmic3UDDli1+99467pVvlLeKlkYtNgGpF9/fWx
	kRQ1LrdutcPGNES2the5kv2CYzmlKBV7bkSg/U2IenSkbi2fUjf8z4u6JjQUNFuVsl9k
	5raA0mcl1/9jiq9QmMJjv9/MdOmytrA+eHxbPLyRi0R+LaitrgLZ4cz+uBubXDDrUrOg
	AXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NXiON7PF+rMnpYdGvfg8O+C4thxBdiQgpvLUy4zAcvU=;
	b=fqM80ET7/t7EgI/4iL6H0eNbYqc5yXC0PUYDq+jQPhWHkJWh/0rrBivM5MYzJ6+rYk
	kcyVmObyldQZGqtbdpZB05xmFizg4HsBI9EZY0/azUB3cM6SG3655YORCp+R6DIGQpj6
	JsMCQh31qtYTji+Y7v0s1U7I9+kZJPn0GmOIVMVKu7fS+XmiapeJqALDN4QeamrCZ9Q5
	4uJEwVteduKThGuBJ/CpqxMyAGG2ikV6IXTL2MRWLT4JfBfsVX73L1b3ev6+AWEeUzpP
	AWTu+f/7x3SNEKH6pS3PZlfgwyet7QkdWBJVEqv9IuF73jUJRRZV2MILPRozAnpXEaXW
	Nk2Q==
X-Gm-Message-State: AHPjjUh+wvR9UxiTVOlav63gGy3eysNxzVPN9MpVZmoUfnHFIh0vwo9N
	Srv+JqOyRiC2l+OHTVXk5Z7POiPzVnmON5YnN4I=
X-Google-Smtp-Source: AOwi7QA0E7duCFi/t5Yj3AQ42WbBY8CcDoBodlgrsEyUtcX6ob5VFLJXLwf3koWB1ZR0Bjygj/SPDDOXfb6keelPdCg=
X-Received: by 10.176.2.5 with SMTP id 5mr16304558uas.160.1505334296705; Wed,
	13 Sep 2017 13:24:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 13:24:56 -0700 (PDT)
In-Reply-To: <1505303130-14127-1-git-send-email-pascal.bach@siemens.com>
References: <1505303130-14127-1-git-send-email-pascal.bach@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 22:24:56 +0200
Message-ID: <CA+chaQdWbo1-8MJUmS766eM2d9-+ZkeG3Lh3CAZumKukS=Kgug@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] capnproto: add version 0.6.1
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
X-List-Received-Date: Wed, 13 Sep 2017 20:24:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have fixed some indentation and style issues in both of these, please
check them in master-next and next time follow the styleguide.

e.g. we (most layers except oe-core) use 4 spaces for indentation, not mix
of tabs and various number of spaces


On Wed, Sep 13, 2017 at 1:45 PM, Pascal Bach <pascal.bach@siemens.com>
wrote:

> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../recipes-devtools/capnproto/capnproto_0.6.1.bb  | 28
> ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
>
> diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
> b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
> new file mode 100644
> index 0000000..d900fae
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "Cap'n Proto serialization/RPC system"
> +DESCRIPTION =3D "Cap=E2=80=99n Proto is an insanely fast data interchang=
e format
> and capability-based RPC system. "
> +HOMEPAGE =3D "https://github.com/sandstorm-io/capnproto"
> +SECTION =3D "console/tools"
> +LICENSE =3D "MIT"
> +
> +PACKAGE_BEFORE_PN =3D "${PN}-compiler"
> +
> +RDEPENDS_${PN}-dev +=3D "${PN}-compiler"
> +
> +LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D0a5b5b742baf10cc1c158579eb=
a7fb
> 1d"
> +
> +SRCREV =3D "c949a18da5f041a36cc218c5c4b79c7705999b4f"
> +
> +SRC_URI =3D "git://github.com/sandstorm-io/capnproto.git;branch=3D
> release-${PV}"
> +
> +EXTRA_OECMAKE +=3D "\
> +       -DBUILD_TESTING=3DOFF \
> +  "
> +
> +inherit cmake
> +
> +S =3D "${WORKDIR}/git/c++"
> +
> +FILES_${PN}-dev +=3D "${libdir}/cmake"
> +FILES_${PN}-compiler =3D "${bindir}"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

