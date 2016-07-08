Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id E517560119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 17:03:10 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id w130so8264705lfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=lAsHKTYj19kxW1tUS9ezZJg9zviUMidoyYFPBh87jMk=;
	b=Kb79OmUmk0JQx7E3oT7xWv4+X/qsgCSS9U5JR6k8Er/q6ITvKn+LuE0gw+b/fDOLu3
	n9QmOUfDQCtGl3rb/aQ43QoJAolpzI4NSNQM7vhk/q/QxOGeAScyOaXRJBAUJL8f6XLb
	VN/WmA/CPYRuY1VaUSf+q+JR+LpVGwl4rgzXK9Cv91eMC1eLESO/+7QEiTiW+qhDOEYl
	oKh5Q5hnaZKPdcGatMNQ9rQ5zrJBzqcQ0j8rzziKHdVQrDAPPbNkN5a2Wh0eOOymT6cT
	uZ+qV178+O1PW/tsJelYBo4HJSBxjcGGb4YM9xMMk14loe3qaTMYNLHOs0/xiKa8JB7x
	9IAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=lAsHKTYj19kxW1tUS9ezZJg9zviUMidoyYFPBh87jMk=;
	b=N3nIYFH9wBJR7c06FQPmL96h2RKoEfk+dgH6Cpt8PA4NW4Me0Vbe1ARNEdwCz0nHrc
	hRU0eCZpqjB2MUKidv2TCKykhWW6gHKPWgg5OrIXkWxlH5nkGLq+A3qM5ccbUbijlPcq
	PqzClS92gLGwmLh9q6pNDwPbHUUyyrubhg3Izc9CAprl2ptsVulPQZuDecfkZqj7aUpn
	wEeKPNjt3mbzyn9BtSQAeU2FrdvpL5EDbrEHzuR2hxKvsk3J6yr2IwBIePb+bH0rCr15
	W/Lde7bFKIzvtZRwHaeMkSRasBwEg5ZTeM7acDNkt5b5amUnhJnX6UbY+3FwWUniqFkx
	Jm3A==
X-Gm-Message-State: ALyK8tLjRIHUY9fTPR621iSG0IkgymzQIyRYFz4f3wi5NbSlwQmIKKVNFqnUyM+//Cm3MtCAdNG67iGdx1a+1w==
X-Received: by 10.25.79.18 with SMTP id d18mr1544425lfb.171.1467997390171;
	Fri, 08 Jul 2016 10:03:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.10.10 with HTTP; Fri, 8 Jul 2016 10:03:09 -0700 (PDT)
In-Reply-To: <1467619576-13899-2-git-send-email-mingli.yu@windriver.com>
References: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
	<1467619576-13899-2-git-send-email-mingli.yu@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 8 Jul 2016 10:03:09 -0700
Message-ID: <CANx9H-DiLXAuEoNrg2-R+OuSg=Bc98Odi-Xrj1KM-R7SJgU4Yw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2 1/5] python-pbr: Add python-pbr bb
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
X-List-Received-Date: Fri, 08 Jul 2016 17:03:13 -0000
Content-Type: text/plain; charset=UTF-8

Built ok for beaglebone.

NOTE: Requires Derek's pypi.bbclass patch
https://patchwork.openembedded.org/patch/125551/ or else fetcher failure.

NOTE: SUMMARY is __strongly__ recommended (it helps with the layer index)
http://www.openembedded.org/wiki/Styleguide

Acked-by: Tim Orling (Intel OpenSource Technology Center) <
ticotimo@gmail.com>



On Mon, Jul 4, 2016 at 1:06 AM, <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Add python-pbr bb file as python-mock depends on
>   python-pbr-native
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python-pbr_1.10.0.bb | 16
> ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-pbr_1.10.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
> b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
> new file mode 100644
> index 0000000..fd35197
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects
> some useful and sensible default behaviors into your setuptools run"
> +HOMEPAGE = "https://pypi.python.org/pypi/pbr"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> +
> +SRC_URI[md5sum] = "8e4968c587268f030e38329feb9c8f17"
> +SRC_URI[sha256sum] =
> "186428c270309e6fdfe2d5ab0949ab21ae5f7dea831eab96701b86bd666af39c"
> +
> +inherit pypi setuptools
> +
> +DEPENDS_class-target += " \
> +        python-pip \
> +        "
> +
> +BBCLASSEXTEND = "native"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

