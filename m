Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0F37807D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Feb 2018 03:53:17 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id l5so12786460otj.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 19:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SIUtwetyMiMOxOHSrdDJzPDJ8aqwLrzD6zHwo75v/kw=;
	b=s2H+THoxNQpb7eQUTvjJPRGCL45QPa5o2U5mKqLCz7cOfT8vrJkdMSxZh/qMHbYFO9
	aaaLK7RLY0m62w4YnubcOACcJKoYi2Aoy2It/8FK75bysQe/H+tbFxWiNHUZcNZzZmNS
	L3Y/Ww8L1aeCTfZe1z6qXJNkO54+59oIxefqBl977y25h+PqQvILk5Q7b3EL49iKc6Fl
	6yIUgaksasml81CWlW8UeYrASdyf8ZyxpTtYMbiNkJon+cNV1Z4IAycK59i/XK/Qv3+1
	DIj7L1bJt4sqDdnCDyNnirwsjd41RqHiKAhagSDwDjTk71FK7uDFJ1dCrV/2sZk8kKgv
	+PlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SIUtwetyMiMOxOHSrdDJzPDJ8aqwLrzD6zHwo75v/kw=;
	b=KGbM9jVz+VDCqQsGEtOsOOlXAmDSniI9EbDnnLky3qbWnpiTUJbI9i1tgBktBwUe4K
	HD33eAA+WWoQ88O63/apMjjBSqrZIC72MDLOF5Qcx2UAiJUhiQRWbpUBOBeM881eBHCA
	vXY0f7eHM+eLmCA+409SgTyGPHd2Z1prdvn9asqHDUhKgDIVQVaKrsDGRVBO6dJmcg7T
	XgAG4SlwE2tZ+KF7UAc+230o18WoVoqqjin83sCE5b29Fh2fnFYrFP9tS0vRWYjvYS8J
	ugU1UdxQI3h0hQH28/UtaMgB/lxGzd0uQU70IPfKYHrLhVQ//1pZ1G9YX9EFkEN98Zoq
	LcRw==
X-Gm-Message-State: APf1xPCGVsgeg8XljJPVw+013ZylHTG5T9nD9VBE9aZztFbBnomSYXAo
	Wy3jPrNnCSlUTvRnz2virmACzwn8ME0B/VHq9v0=
X-Google-Smtp-Source: AH8x226afO6QKGGLP6FqKMIWy2ZLaJTEHaxvnPLKAlKqrjDxXk9cAYHfsVfpD51wb0awYIRqX6CdhgyWFwzOy+/25Hs=
X-Received: by 10.157.48.27 with SMTP id d27mr7295367otc.94.1518407599323;
	Sun, 11 Feb 2018 19:53:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.48.29 with HTTP; Sun, 11 Feb 2018 19:53:18 -0800 (PST)
Received: by 10.157.48.29 with HTTP; Sun, 11 Feb 2018 19:53:18 -0800 (PST)
In-Reply-To: <cec3c422-d010-3292-aafd-94e77f1ac44d@windriver.com>
References: <20180211215129.9564-1-JPEWhacker@gmail.com>
	<cec3c422-d010-3292-aafd-94e77f1ac44d@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 11 Feb 2018 21:53:18 -0600
Message-ID: <CAJdd5GYE1ZkQapYyx_NrJHUGdLLT31pEHb_n8GFpcU_vuCWZLQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-networking][PATCH] waf-samba.bbclass: No longer inherit waf.bbclass
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
X-List-Received-Date: Mon, 12 Feb 2018 03:53:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Feb 11, 2018 20:29, "Robert Yang" <liezhi.yang@windriver.com> wrote:



On 02/12/2018 05:51 AM, Joshua Watt wrote:

> waf-samba.bbclass uses waf in a very different way than the "standard"
> method that waf.bbclass targets and ends getting very little useful
> functionality from that class.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta-networking/classes/waf-samba.bbclass | 29
> +++++++++++++++++++++++++++--
>   1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/classes/waf-samba.bbclass
> b/meta-networking/classes/waf-samba.bbclass
> index e49017624..4b1499fd4 100644
> --- a/meta-networking/classes/waf-samba.bbclass
> +++ b/meta-networking/classes/waf-samba.bbclass
> @@ -1,7 +1,7 @@
>   # waf is a build system which is used by samba related project.
>   # Obtain details from https://wiki.samba.org/index.php/Waf
> -#
> -inherit qemu pythonnative waf
> +#
> +inherit qemu pythonnative
>     DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native
> python"
>   @@ -21,6 +21,31 @@ CONFIGUREOPTS = " --prefix=${prefix} \
>                     ${PACKAGECONFIG_CONFARGS} \
>                   "
>   +# avoids build breaks when using no-static-libs.inc
> +DISABLE_STATIC = ""
> +
> +def get_waf_parallel_make(d):
> +    pm = d.getVar('PARALLEL_MAKE')
> +    if pm:
> +        # look for '-j' and throw other options (e.g. '-l') away
> +        # because they might have different meaning in bjam
> +        pm = pm.split()
> +        while pm:
> +            v = None
> +            opt = pm.pop(0)
> +            if opt == '-j':
> +                v = pm.pop(0)
> +            elif opt.startswith('-j'):
> +                v = opt[2:].strip()
> +            else:
> +                v = None
>

The "else:" block isn't needed ? The first line already set v to None.


True. This is a straight copy from waf.bbclass, but we can optimize. I'm
planning on proposing a or.utils.get_parallel_make(), because this code is
copied (with minor variants) several places.



// Robert


+
> +            if v:
> +                v = min(64, int(v))
> +                return '-j' + str(v)
> +
> +    return ""
> +
>   # Three methods for waf cross compile:
>   # 1. answers:
>   #    Only --cross-answers - try the cross-answers file, and if
>
>

