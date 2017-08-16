Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 98C98783AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 17:12:32 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id l64so5705577pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 10:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5kpntrVBAvxnfjw8V9CPQ5uMx+efUeBuc8AoAzjI6P8=;
	b=hIXjCJLR6/CXrhEUXpt9rEQeyaiqfqlMIWQkZzeTce9GawTKhA6CotFNI3uVj3ElmR
	PIlJAPgX7P8cYwLj4PPMXDrgpAhyyrfVE87ms4BLv1RriB6egHPJWbyRCgwDnhFa107T
	XCQrt7xB1A25og896WSTSOR/PbA0/wD8XqRO/eDAoCmtTlxTzoXUhLO59v2Q56C7dO/w
	icF5v0wBatfd+/bIq2DizNUWOijIYNcYsY9k7K9tYVNAxnM0hfZ9u6XL8x5SFI6Y+aI2
	RkIEQEuefmjpFTqiegLgQabkEHfdCIkSkrvS1xX1YvMYxryeMxHJfuLhassiIf+MsWmp
	lytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5kpntrVBAvxnfjw8V9CPQ5uMx+efUeBuc8AoAzjI6P8=;
	b=dGWtcgORb6w288wWm3XlDeFRoC0IoDAIiThXssM8VN1c3/Z1OqWJSP30I+4QN2p/tR
	z8L8rawJlBGTkS9fmpAGjIebTRlc39IflmaUCbl3tlJaVwhe9s3aVMGG+Fpa/U7OHjvh
	BjOElPu4YtNSWAdwGmygw8ReNnsmmhtvAZ9z4gAF+UoeebaRylunOVBWKBwcGWDAbfTj
	YASfIlDZ1Tis84JTcuoV4S7cr8uZFT1DjZZYgpEternUao4BLzAP95GD1uhv+VWQa0co
	AZUKZiYwur6uGPrMVQ2CKBwtYxLS1A/7ljPDZ7BRzdWCnYDHurZlA8CP6yAPXaVysO5g
	GV6g==
X-Gm-Message-State: AHYfb5hMriNE32hZ1vRKxLItb5P98zHu20nT8T8HHfnSadWuivP0wy+c
	HFJiy0YIXJTSPpF7PTboAbvhVa8XdA==
X-Received: by 10.84.133.14 with SMTP id 14mr2602271plf.440.1502903553755;
	Wed, 16 Aug 2017 10:12:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Wed, 16 Aug 2017 10:12:03 -0700 (PDT)
In-Reply-To: <20170816053740.24934-1-jackie.huang@windriver.com>
References: <20170816053740.24934-1-jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2017 10:12:03 -0700
Message-ID: <CAMKF1sr1sKAThgm-tJPam+VAMqg4=wtSv7qhZ5ciBq+c6-gjsg@mail.gmail.com>
To: jhuang0 <jackie.huang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] vlock: add new recipe
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
X-List-Received-Date: Wed, 16 Aug 2017 17:12:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 15, 2017 at 10:37 PM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> vlock is a program to lock one or more
> sessions on the Linux console.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../vlock/vlock-2.2.3/disable_vlockrc.patch        |  37 +++++++
>  .../vlock/vlock-2.2.3/vlock-no_tally.patch         | 107 +++++++++++++++++++++
>  .../recipes-extended/vlock/vlock-2.2.3/vlock_pam   |   3 +
>  .../vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch |  19 ++++
>  meta-oe/recipes-extended/vlock/vlock_2.2.3.bb      |  59 ++++++++++++
>  5 files changed, 225 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
>  create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch
>  create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam
>  create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch
>  create mode 100644 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
>
> diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
> new file mode 100644
> index 000000000..ee0d074de
> --- /dev/null
> +++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
> @@ -0,0 +1,37 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +written by: Jeff Polk <jeff.polk@windriver.com>

I think a SOB is better than inventing another tag.

