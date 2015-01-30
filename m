Return-Path: <net147@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id BB02065C96
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 04:01:35 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so36541336qgd.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 20:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5VkFFlyWgjrOs220DC93/S19oRmQA6d/edCuOFg663M=;
	b=qG4R1QVhwlZMlRHWmkCMLjZpfS9p0u6sqxJ0xtZH7qI6iXf5wbSGoLdVq5vhVAqQdQ
	Lodr0sDnwxXqpTekbNnpSQTPdnmTDrJQk+tSUsTPhah2x6rUueRwP+mqJBFpXwSM7m8G
	EoRK5gWaKaijK7NEdargY4FBZVWewCp3EbL+NkvOOXHNLBLen0A1O9Xj2/jq4LKE3G92
	2gOHdgivBjYkWEvE4bMzKebhxe2mPXDDRKFHtJTZqPsd6kc0U0mzeY3tRLPy5LMT8nSf
	JnxG3SO5TdmCewyhyhFFv2UAJdgXW8MsfKQPkfTynqr1pSy4WGzkm3iK/9FgwSJyr3wN
	IJ6Q==
MIME-Version: 1.0
X-Received: by 10.140.22.234 with SMTP id 97mr7999536qgn.21.1422590496782;
	Thu, 29 Jan 2015 20:01:36 -0800 (PST)
Received: by 10.96.28.129 with HTTP; Thu, 29 Jan 2015 20:01:36 -0800 (PST)
In-Reply-To: <1422459613-29410-1-git-send-email-raphael.freudiger@siemens.com>
References: <1422459613-29410-1-git-send-email-raphael.freudiger@siemens.com>
Date: Fri, 30 Jan 2015 15:01:36 +1100
Message-ID: <CANwerB0-7GuxY5Ekd6Utt=R=2eKDo2sdVqfXrQcXzWsYyW7-OQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Raphael Freudiger <raphael.freudiger@siemens.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] p7zip: new recipe
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
X-List-Received-Date: Fri, 30 Jan 2015 04:01:42 -0000
Content-Type: text/plain; charset=UTF-8

Hi Raphael,

On 29 January 2015 at 02:40, Raphael Freudiger
<raphael.freudiger@siemens.com> wrote:
> diff --git a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
> new file mode 100644
> index 0000000..b67db00
> --- /dev/null
> +++ b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "7-zip is a commandline utility handling 7z archives."
> +HOMEPAGE = "http://www.7-zip.org/"

> +LICENSE = "LGPL-2.1+"
> +LIC_FILES_CHKSUM = "file://./DOCS/copying.txt;md5=ecfc54c9e37b63ac58900061ce2eab5a"
The unRAR license is missing (it is in DOCS/unRarLicense.txt and
mentioned in DOCS/License.txt).

> +PR = "r1"

Regards,
Jonathan

