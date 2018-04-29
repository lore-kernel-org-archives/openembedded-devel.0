Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5323060402
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 17:39:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id v63so5019276pfk.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 10:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lSQBrB4VmosWG8VMn6qrCWBpH3PMxDBI0VR49t72LDk=;
	b=j7b/MJq+szCCqjdsohY9JqHmh4r+Swws5i82/5DKYxIeX205OpaY5cttgRF3QNAmM7
	rWuBGic4R+5Mx7nR8LNN4S2Nl2Em+ohI2HNFI4KUGzRqAZesj2oh5Gw8s/pZUSeEz4Qq
	tAyMsfNk0W5fGubKiiuSGZ3z1exUQs5700una7LVMVbOa5Xg+Gox2DFdMbJDpYNeYjil
	aodsIGqlc8heT+1SyLCr/GV0OYVUXJ9uIN1Vtq5MKI2aUGtEYCapOmK0Sk9OAVMcYvRr
	K1FY7C1FNbXrDPSrjcf043f3bhf/7XFPqWrTWkSqfXnIhJXzUaXPhc13EQZ3XR9xBUtD
	KToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lSQBrB4VmosWG8VMn6qrCWBpH3PMxDBI0VR49t72LDk=;
	b=n6fnmZl96i6cnQ4W+gXyVjZaq2UOHXtv07lbAjcR3DnOBu/J9V9DpC6mzUrY7FwBVc
	78VVsgzv9DY4QB+L407Ayp2w0lkeN27SvxFekkvUhz8ueyEX44s2PZgLvZNpms0ot6At
	3hhHqdIYGKxUAJRtPww8WRNS6sUGteQica/Nk0NuYpYJQAaIx5Y6+8lA9a7hhzZPM55A
	Fyoq92vgxv0dWwFhirPF+9he3TqjdW2R3/Mi8NYLBkpTs3NTWpRBNvqS/nBusICtgzTa
	ayqPu7L61pbv54W6bRVR0ziz6g4Z47cY28DV24uinDknRSK0nL3Eb1k4UdGXu4DUuHEb
	Q5gA==
X-Gm-Message-State: ALQs6tDZLBV1oFL/54PVMFgMmYVnl81Zd+7m58YPp881ZaaBDoEJVp7O
	ED2mykhAT0OwYN/fOQfTLmYssHRiwSWa3CvvnV+CQA==
X-Google-Smtp-Source: AB8JxZq1q6vZSz5Kc9k4RUPT3FgMJfGBJOPKdQSBquZv35KdfqBbsEnph5EIlKB1yectplAt4Ac/6MdR4d5WOdckVVs=
X-Received: by 10.98.127.145 with SMTP id a139mr9414832pfd.25.1525023567886;
	Sun, 29 Apr 2018 10:39:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.141 with HTTP; Sun, 29 Apr 2018 10:38:57 -0700 (PDT)
In-Reply-To: <1525020865-2432-1-git-send-email-derek@asterius.io>
References: <1525020865-2432-1-git-send-email-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Apr 2018 10:38:57 -0700
Message-ID: <CAMKF1sqtWwomz4F+dFasJen43-qth0SG0VXof1xBAhmvOLw5ZQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 1/2] nginx: update stable version to 1.14.0
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
X-List-Received-Date: Sun, 29 Apr 2018 17:39:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 29, 2018 at 9:54 AM, Derek Straka <derek@asterius.io> wrote:
> License-Update: Update license file for latest copyright date
>

The series looks good to me.
Perhaps you could make git work harder to detect renames so its easier to just
see the changes. May be add

[diff]
        renames = copies

in your ~/.gitconfig

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb | 6 ------
>  meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb
> deleted file mode 100644
> index 85ad29b..0000000
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require nginx.inc
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
> -
> -SRC_URI[md5sum] = "4d2fc76211435f029271f1cf6d7eeae3"
> -SRC_URI[sha256sum] = "305f379da1d5fb5aefa79e45c829852ca6983c7cd2a79328f8e084a324cf0416"
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb
> new file mode 100644
> index 0000000..de22960
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb
> @@ -0,0 +1,6 @@
> +require nginx.inc
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
> +
> +SRC_URI[md5sum] = "2d856aca3dfe1d32e3c9f8c4cac0cc95"
> +SRC_URI[sha256sum] = "5d15becbf69aba1fe33f8d416d97edd95ea8919ea9ac519eff9bafebb6022cb5"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

