Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id C8D5F606A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 01:38:34 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id 207so17971647pgc.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Nov 2017 17:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PYnNHWTuxMGrtTOuXuOOWg7CJah1sebDvfhr9P0idns=;
	b=U+q5AGH5iJX3CMAmwHSrm/mLuRK1Zx9pyINlccVVuN5/RW+TDS2bCOEVzbEgOX+yQN
	YS8ZhJ6Yf4ZGMcNZVfvFyv/ZF7bZBhBTWNU6M+ShfIZmPBuZVyPqdaOnE5v9Vuu/o9uz
	p5cMlPXKIpoyqNJJN2EWSbvrQ4AHfgNlqr7jGs95IsOvgauBqKb/oOUN6lempJzz2Uzi
	U6a2oV7oKi12TBMKCrdqou3pD7RRyc1Xr0slv62ZwNqFuLKCNWbc6URMSnYXhkEP3Lqg
	Oo7t3mu7KRj4pe43IbAr9SrNMWiWB9GDYQnTn99POr2171rVMrfsxm0IEfiRQH4JBHfQ
	Os+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PYnNHWTuxMGrtTOuXuOOWg7CJah1sebDvfhr9P0idns=;
	b=iFYYr1LHJYzfOuMn0KSPfDpWRhsr/zR9Xd5orx1StTeW5EVsHODl/p12aOQwfpCIKR
	jKmhcI+wHRFbegqAfN+ZBAXLhBy5luSqj/eJjYuLgHiXFwOX0kWIocr6qzJy6+VpOcvq
	peIuXkqmRF/AtKZmnS1cREBlnC80ng7PEEB7SDzazAXuOoyQ+30qjPs6TuTuPmTraPsK
	4VyRwXAPxh0KvnkWKseIdeB4Wu+Mw6B2uUGIGSkJRkfgJDRXzVcIQJuBtJ/k2JUrw5Yd
	V8tEzoEecy4j7Y3oI0m0eY6vgMjLx8vUy8/xPhReHn8tG05A7oqPtDa+un6M/VXPuLa8
	dAUQ==
X-Gm-Message-State: AJaThX5jpcU/GTU31myBKIEFhkZwJFuUtk3xNQMLMIpPwz0n/gM7GWTa
	hPUJ0W3YjX61Kn2DLasxHsZpErH70axLV4PBpw8=
X-Google-Smtp-Source: AGs4zMYrgfXommqpbG1nXPdhpRro4n3W7ciw+9PKGxWeJDnyEZfToXYxMTSA/rQZtiHwcKmnsJ4JwMSd4TV577dHKB0=
X-Received: by 10.98.129.4 with SMTP id t4mr34748213pfd.125.1511746715607;
	Sun, 26 Nov 2017 17:38:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Sun, 26 Nov 2017 17:38:05 -0800 (PST)
In-Reply-To: <1511496049-796-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1511496049-796-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Nov 2017 17:38:05 -0800
Message-ID: <CAMKF1sqJUOC-Uw4vACzqwV4WPg5CA3hJ4_sk0nV5TbS2+K=Rrw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] quagga: 1.2.1 -> 1.2.2
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
X-List-Received-Date: Mon, 27 Nov 2017 01:38:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 23, 2017 at 8:00 PM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Update quagga from 1.2.1 to 1.2.2
>

I dont see deleting 1.2.1 recipes here. Is that a separate patch ? if
so please squash and resend.

> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb
>
> diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb b/meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb
> new file mode 100644
> index 0000000..653f46b
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb
> @@ -0,0 +1,4 @@
> +require quagga.inc
> +
> +SRC_URI[md5sum] = "e84be2938c26c0c872792090f1a6a866"
> +SRC_URI[sha256sum] = "522e22f2beee64e3f0c2cde3d0155f3b8103f4f6fc8abef92cb40bc3a4cc2931"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

