Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8FA6B6B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 17:06:56 +0000 (UTC)
Received: by lbvn10 with SMTP id n10so1132172lbv.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 09:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=emu9x/1HzQujyQsMhZmBaY+DaK8Jh7HNxJaTVNMXRbk=;
	b=010AiT4kc6Q6JNxWlhSxReWpNHftEqo8XaljGmbvozT2adicgtpR2Ri6Z2XhFHH5qI
	I56UM54Xwk5/EfKae9O5N3RYYIGRV25cnt8CVgHZx01G7z9WMAFML0cr4UFzXhu7N1qZ
	jnagJ02yInsBxzuGbk7BH+SGJRLJyrCgKBXeSfLPa3dFwYBMFMpBWXwyYbIcBfa2oGvQ
	hseCrZIhVF3sn5fjsOhxvHvNkqfT67VxJRBXMVWeZa30v2A6bFDDdxErOjw+wjacB1tJ
	FEV4DWVSpmDXD6lMQFhO1v4Fu2Vrfg6jggpEfR3+S92hTdZQaqPTBteJglZYUJaRd5NA
	Jh+A==
MIME-Version: 1.0
X-Received: by 10.152.45.100 with SMTP id l4mr4782772lam.112.1424365616691;
	Thu, 19 Feb 2015 09:06:56 -0800 (PST)
Received: by 10.112.40.11 with HTTP; Thu, 19 Feb 2015 09:06:56 -0800 (PST)
In-Reply-To: <1424300622-28832-4-git-send-email-ben.shelton@ni.com>
References: <1424300622-28832-1-git-send-email-ben.shelton@ni.com>
	<1424300622-28832-4-git-send-email-ben.shelton@ni.com>
Date: Thu, 19 Feb 2015 12:06:56 -0500
Message-ID: <CADkTA4P5C2JW+n9C0TMt7n7YHgORB0cuqEie+mYZHvKyr9LqRA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 4/4] python-requests: add recipe
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
X-List-Received-Date: Thu, 19 Feb 2015 17:06:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 18, 2015 at 6:03 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> Requests is an HTTP library for Python with a clean and succinct API.
>
> Copied from commit bc572006bfcec10523658b8675f30bf45b43a998 in
> meta-cloud-services/meta-openstack and updated to version 2.5.1.

When you do this .. you should be broadcasting to the meta-virtualization list.

Otherwise, how can we decide to drop (or keep the recipe) ? It's not hard to
send an email (like others have done), and there's no reason to leave this to
chance.

Bruce

>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  .../recipes-devtools/python/python-requests_2.5.1.bb    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-requests_2.5.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb b/meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> new file mode 100644
> index 0000000..b719dca
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Python HTTP for Humans."
> +HOMEPAGE = "http://python-requests.org"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c7869e52c8275537186de35e3cd5f9ec"
> +
> +PR = "r0"
> +SRCNAME = "requests"
> +
> +SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "c270eb5551a02e8ab7a4cbb83e22af2e"
> +SRC_URI[sha256sum] = "7b7735efd3b1e2323dc9fcef060b380d05f5f18bd0f247f5e9e74a628279de66"
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

