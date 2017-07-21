Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC0478439
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 15:33:28 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id x6so18897476ywd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 08:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=14RJIheZphErEZIqkcfb5Y4llKyGNtqcX3GW8ZOLmUo=;
	b=uzF7Qo59pALXLDmoiVCPBaYt/+oR9ucDXqaOaPkHq5LQiq8kmZTcLvr6pabL+sKSAS
	6pj5+1cNy+5WQ3hPXow4W+lp8/SHRyxcnjdIiURSIap38GMQmHvfu1x2jZ0g4wK14hTR
	1Na/FuqYFXXeBNGaxxqKzg3VCiwT6inRZfrpyipKRQa6eIBSsrIy9sFvEJRVihBQBbWS
	avJF1zir8FoJHo2nc3a+vOewYiAd283BLI2MQSM6IcHxZjdzAxr/hUm2thhCUAXTajz8
	FUVM5f9bN+9mJj24fej2c62A9Wg9jcBjV5E4ErVhyrNxe8nIp/6IlC9p6+GHmqlo89HI
	n6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=14RJIheZphErEZIqkcfb5Y4llKyGNtqcX3GW8ZOLmUo=;
	b=O3ow0ChNP96Bu9jVdEpOnQzWqJx/99YRZVI1uh43cQgUz0oh5rE6oQCN3KFzLNyABm
	EoJpkSHRfOxmn/cXgZ2WsfFLQAOYs22l1mcyANtIk5TFTroeKD6sNbSCY8xzh2bTHheX
	jguLT8P7jVDsj0TZI2eqh7RgQ6WBj7LTBe0guEhhssbyJEsjgKqNoQFYI5n5/KnNTpvh
	aUdVhyFP1kCUvaRo3TICiciO+eK+aIxo+oDG7EbFKX5j5DIomifqZs+Uy+GLva0357zv
	5Xcp3kCbOJis4vAqGm9TSMHQvWNwmp4jnJ+K2xDlaJ5vaMOelbSceCmVmQzt9zZ2o0Wh
	U2bw==
X-Gm-Message-State: AIVw112Ir3rhY5knAM9W5FIYQJlzSoaGSHrACLcDFYM70HWJYVnIj04X
	FOcKgly3O42dQ7xe0HZwPJTyM2/chA==
X-Received: by 10.13.239.69 with SMTP id y66mr5508695ywe.231.1500631823746;
	Fri, 21 Jul 2017 03:10:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Fri, 21 Jul 2017 03:10:23 -0700 (PDT)
In-Reply-To: <20170720075651.16444-1-romain.bazile@ubiant.com>
References: <20170720075651.16444-1-romain.bazile@ubiant.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Jul 2017 12:10:23 +0200
Message-ID: <CA+chaQcxonLLDyWLUpfeKHAd2qfWbdKxJQw3rdYMHtOhJKUzgQ@mail.gmail.com>
To: Romain Bazile <romain.bazile@ubiant.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-pytun: addition of recipe for python and python3 using pipy
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
X-List-Received-Date: Fri, 21 Jul 2017 15:33:29 -0000
Content-Type: text/plain; charset="UTF-8"

unparsed line: ' SUMMARY = "Python TUN/TAP tunnel module"'

I'll fix it, but please better test your changes before sending them.

On Thu, Jul 20, 2017 at 9:56 AM, Romain Bazile <romain.bazile@ubiant.com>
wrote:

> Signed-off-by: Romain Bazile <romain.bazile@ubiant.com>
> ---
>  meta-python/recipes-connectivity/python-pytun/python-pytun.inc | 10
> ++++++++++
>  .../recipes-connectivity/python-pytun/python-pytun_2.2.1.bb    |  2 ++
>  .../recipes-connectivity/python-pytun/python3-pytun_2.2.1.bb   |  2 ++
>  3 files changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-connectivity/python-pytun/
> python-pytun.inc
>  create mode 100644 meta-python/recipes-connectivity/python-pytun/pyth
> on-pytun_2.2.1.bb
>  create mode 100644 meta-python/recipes-connectivity/python-pytun/pyth
> on3-pytun_2.2.1.bb
>
> diff --git a/meta-python/recipes-connectivity/python-pytun/python-pytun.inc
> b/meta-python/recipes-connectivity/python-pytun/python-pytun.inc
> new file mode 100644
> index 000000000..79eddce99
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-pytun/python-pytun.inc
> @@ -0,0 +1,10 @@
> + SUMMARY = "Python TUN/TAP tunnel module"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=13f7629e8e4989b66b4a913ab05a91de"
> +
> +SRC_URI[md5sum] = "5b35b1cf80a02cca7ec72eb95d6b0192"
> +SRC_URI[sha256sum] = "07595dadf85f5176eb08c8d4d9ba5b
> 862a180e96633f670f91437c47a1bead0d"
> +
> +PYPI_PACKAGE = "python-pytun"
> +
> +inherit pypi
> diff --git a/meta-python/recipes-connectivity/python-pytun/pyth
> on-pytun_2.2.1.bb b/meta-python/recipes-connectivity/python-pytun/pyth
> on-pytun_2.2.1.bb
> new file mode 100644
> index 000000000..3fc587f3a
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-pytun/python-pytun_2.2.1.bb
> @@ -0,0 +1,2 @@
> +require python-pytun.inc
> +inherit setuptools
> diff --git a/meta-python/recipes-connectivity/python-pytun/pyth
> on3-pytun_2.2.1.bb b/meta-python/recipes-connectivity/python-pytun/pyth
> on3-pytun_2.2.1.bb
> new file mode 100644
> index 000000000..938d9d739
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.2.1.bb
> @@ -0,0 +1,2 @@
> +require python-pytun.inc
> +inherit setuptools3
> --
> 2.13.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

