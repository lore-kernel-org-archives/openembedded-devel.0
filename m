Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id A2F4C72221
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 03:48:47 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so12270128pdi.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 19:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=kjNCRWJZeZd/rXw8k71I2FicgIxdFCEUTYCIHhjtxNA=;
	b=sDh8T3VQ4A+AXXKLUQTUC2tf6gqIKaj+G4OetzqSXOUC2RDm0Bfiz1o9BBHS2YCOic
	u6/Q2qk9Cy1KoTmAbZeLgI6QaD8pShbkZKYTZazBgW4j9ip9qGjS+mPPQ/dWSXyCOS/n
	sZXRKBtJK6tsH2gTfkCHGQPGZbb4zKcR/oDCK7Rzs99O5rGnJmBTc7BTRea0JbAEr9zf
	sfFDL4HpZtHO8/2dxc9lGn8F4SaXjtIm5XynLg4u4J1IVy7HSrWdlrXKtY7sQXt13Tt6
	BUw1Tt1Fh3pyc0deXpLgukbO4Bgm+l4Mf9WGNwOjqyMUY9tr97UUzksXMUKuTJ/+FQAU
	7SVw==
X-Received: by 10.70.42.98 with SMTP id n2mr106989912pdl.139.1417492128034;
	Mon, 01 Dec 2014 19:48:48 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:30ed:d4f1:6765:3ec7?
	([2601:c:9380:601:30ed:d4f1:6765:3ec7])
	by mx.google.com with ESMTPSA id y3sm18773829pbt.44.2014.12.01.19.48.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 19:48:46 -0800 (PST)
Message-ID: <547D369C.7080700@gmail.com>
Date: Mon, 01 Dec 2014 19:48:44 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1415111960-5672-1-git-send-email-ignas.anikevicius@realvnc.com>
In-Reply-To: <1415111960-5672-1-git-send-email-ignas.anikevicius@realvnc.com>
Subject: Re: [meta-oe][daisy][PATCH] Add a bitbake recipe for Python psutil v2.1.3
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
X-List-Received-Date: Tue, 02 Dec 2014 03:48:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


I don't think Daisy is taking new packages. I will defer to Martin.

- Armin

On 11/04/2014 06:39 AM, Ignas Anikevicius wrote:
> This bitbake recipe is based on the existing
> 'python-psutil_v0.6.9' bitbake recipe in the same folder.
>
> I have tested the recipe locally and it work without any issues.
>
> Signed-off-by: Ignas Anikevicius <ignas.anikevicius@realvnc.com>
> ---
>   meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb
>
> diff --git a/meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb b/meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb
> new file mode 100644
> index 0000000..76380ba
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "A cross-platform process and system utilities module for Python"
> +SECTION = "devel/python"
> +HOMEPAGE = "https://github.com/giampaolo/psutil"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
> +
> +SRC_URI = "https://pypi.python.org/packages/source/p/psutil/psutil-${PV}.tar.gz"
> +SRC_URI[md5sum] = "015a013c46bb9bc30b5c344f26dea0d3"
> +SRC_URI[sha256sum] = "b434c75f01715777391f10f456002e33d0ca14633f96fdbd9ff9139b42d9452c"
> +
> +S = "${WORKDIR}/psutil-${PV}"
> +
> +inherit setuptools
>

