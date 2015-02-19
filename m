Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7941371F05
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 17:09:10 +0000 (UTC)
Received: by labge10 with SMTP id ge10so806252lab.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 09:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Wn/J7kbPfrr0mW/RUlNGNwGcFmoCXBfiG9wgCdV8ayY=;
	b=JR+lEgBaVIAuuB4VW71vgrsNaU+XxKDr0DAw/vYUR4R1Jw1rXhY0zrVjq/YDIasuKC
	m0UAQ4iisjayxKwGQwqSZND7EdxYl/xUKmkfLDbJKMUTFISPnkZD4d72I9n/yLfdpif0
	1YuYvUtXjobmyBMp6pCMCF9HZ4kzy1lW63GXXxY41eOJs5qxabyMdmQfegkGCu5T1u0s
	VhCG/T5SXS9ZIztLTKTLnhg8/dkx9bNVIIviPl+8KY1EY1dhwZfR8F0qn1M5Hu4Z0VWw
	ugT5aQQBtNvTjNisaguTbOzHQ/E/nXovOE0sR+6uJTH0dK0QEtkUH9HHT1DC9iEVbSCC
	cmqQ==
MIME-Version: 1.0
X-Received: by 10.152.21.100 with SMTP id u4mr4743973lae.41.1424365749943;
	Thu, 19 Feb 2015 09:09:09 -0800 (PST)
Received: by 10.112.40.11 with HTTP; Thu, 19 Feb 2015 09:09:09 -0800 (PST)
In-Reply-To: <1424300622-28832-3-git-send-email-ben.shelton@ni.com>
References: <1424300622-28832-1-git-send-email-ben.shelton@ni.com>
	<1424300622-28832-3-git-send-email-ben.shelton@ni.com>
Date: Thu, 19 Feb 2015 12:09:09 -0500
Message-ID: <CADkTA4Mi8UaK=fKfG17AC353sBxmfkr8aF4edA1btsStVbB98A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 3/4] python-msgpack: add recipe
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
X-List-Received-Date: Thu, 19 Feb 2015 17:09:13 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 18, 2015 at 6:03 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> python-msgpack implements the MessagePack binary serialization format
> for Python.
>
> Copied from commit 91ed2353847d4121e3dd8ad10ca0c24194ac9765 in
> meta-cloud-services/meta-openstack and updated to version 0.4.5.

Can you elaborate on what is the use case for these recipes being cherry
picked ?

If they are simply being moved "because they are python' .. that is annoying,
and causes pain for dependent layers that have specific version dependencies.

I'm going to have to pin nearly all versions in the openstack layers and keep
duplicate recipes around, so since I'm suffering that overhead, it would be nice
if we could elaborate on the technical gain from doing this.

Bruce

>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  .../recipes-devtools/python/python-msgpack_0.4.5.bb     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
> new file mode 100644
> index 0000000..206b03d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "MessagePack (de)serializer"
> +HOMEPAGE = "https://pypi.python.org/pypi/msgpack-python/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
> +
> +PR = "r0"
> +SRCNAME = "msgpack-python"
> +
> +SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "3b82bc542d5599896695512e7c32f42d"
> +SRC_URI[sha256sum] = "a07cd6615a6bf38cfa2f010b121c7e77b74a3e7b971ef3e475c3d33308014cbb"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> --
> 2.3.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

