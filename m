Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id D21AE74DCC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 22:46:21 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id p62-v6so11482733oie.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 15:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZQFwHRrsCb9YRtlGfM57fiHzJJzKlw9sXRP8/7ei+fU=;
	b=aqqYPKlnz8Fo5gk4CO9lilkMCTNmc1Y37gZ41KWgHMi9ue99sB3qdNzeRKtOXSMKG7
	4bDPwZmnAkj+3yQWXbxcuheFJfC9KP4b72aQrG7S9xewr1dD1dQBPq/p89jAvf9Bjf8N
	5M0n+tsKn2fMWglF/AUBwjQrBPVMK8XOuPITFKJh7t2kJCMyk3YSSlCThmv9ASaZ5pBp
	appjpbBGu0WkvEhNkFKN6u3XJiE1VtL8L4Mf9ySQ0q3ngm/t+h74fZZLODJ1dxjpUQwf
	zhyLZKOOzeRG61cePIUXU0c5R01c9ZATRUHo3a7dAEBQN82Yzg9hNFipeBd2ky8P15GG
	tl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZQFwHRrsCb9YRtlGfM57fiHzJJzKlw9sXRP8/7ei+fU=;
	b=an96qZEMuy7rI8AcnqFUN1qD8IqJQ55OXlbxJcszF09zDsW+Gpmwl97ZJgWX4UtHw/
	R5U18L3lSs1Gz6bEoRzffrfzaHEBL8Hd596UzL0JC9WVxipMBlmNlhNvf+ZeihmqKY8N
	ZQCPpilPgKOUA1Vkbi/X3eWIi4wu5H7CENTWro9puuoCu9GS3OLb2qeFEa8HgqhAnNBe
	b9up1+VNPexhOmlfvFh4hV1oAdyOqSw0v7ihFAwj1GCHZGxIEQAfKHNljTG86o3a6a4O
	QupfE1+HyatO6O5Cq5i28Yh0sE1XeO/jGBUBq9fq/rzZLXLRLnwbv2GFVFZ60/SCzgK0
	hPLQ==
X-Gm-Message-State: ALKqPwf/z62Jwlt/+SD0IkHwaO2wRh53umTYkh2mzIR7DnFj9opBQvB2
	+KBan3BuhLYtiTz/IydxPYy/8y3a8ML1CcevyJ8=
X-Google-Smtp-Source: AB8JxZohrin460RNS7zqK8cHvBVZfRU5dJHbaDqvAf0SMGS6Gz1pbizrxFAoqPNdBbEIvVxwbzoN6tucSyVPWWBgz2g=
X-Received: by 2002:aca:2ec3:: with SMTP id
	u186-v6mr10844253oiu.104.1526856382600; 
	Sun, 20 May 2018 15:46:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.73.11 with HTTP; Sun, 20 May 2018 15:46:21 -0700 (PDT)
In-Reply-To: <20180520223517.9869-1-raj.khem@gmail.com>
References: <20180520223517.9869-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 21 May 2018 00:46:21 +0200
Message-ID: <CALbNGRRMj8LqXaw+=DzkBMQoKgprxp5u8OdLrePgPxS9_x_dxg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 1/6] network-manager-applet: Package gir-1.0 files into devel package
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
X-List-Received-Date: Sun, 20 May 2018 22:46:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 21, 2018 at 12:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Fixes QA errors e.g.
>
> ERROR: network-manager-applet-1.8.10-r0 do_package: QA Issue: network-manager-applet: Files/directories were installed but not shipped in any package:
>   /usr/share/gir-1.0
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../network-manager-applet/network-manager-applet_1.8.10.bb   | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
> index dc2b964be5..ccfe38d010 100644
> --- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
> +++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
> @@ -43,3 +43,7 @@ FILES_${PN} += " \
>      ${datadir}/libnm-gtk/wifi.ui \
>      ${datadir}/libnma/wifi.ui \
>  "
> +
> +FILES_${PN}-dev += " \
> +    ${datadir}/gir-1.0 \
> +"
> --
> 2.17.0
>
On sumo I do not see this QA error and gir-files are packed properly
to network-manager-applet-dev.

Sure that this is a correct fix? What changed in oe-core?

Andreas

