Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0E50675462
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:58:09 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id r10-v6so5855017uao.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Hlcowie6tkJWpNqrMdNQOCLtQU/CZjVpystt1IK7LKs=;
	b=Ijf9tYjMA6ZNorr2Cfk73TjWRAWpSD3DfryLMpy4p0z0KyL9L3pg5j/xuMe4EV+93R
	rxe5Vrb/2a+wgj6n91NuoaeVbWIOz8Pv5hm91PV1sxXQV3yt1kfBl8OIA7saG6tl/izj
	7BTQsw1aTD6kVSI3W0dbSo2p1/u+iGJCTcDK0zShi65ZpRYjlqr/UFeEwFsk2wEbcCcp
	kGnY4u5kSAPPz82SytJ+xch3NqWzzDtt/8393yIHpnE/4Is/LhkwXrjs4CHHXM77KURP
	r7NEO+DrSnC/vJCDzvWqyryfaiY1IuwG90mFHYQcxnrKOK74s6RDhrhXLtSp8He0j2De
	Vzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Hlcowie6tkJWpNqrMdNQOCLtQU/CZjVpystt1IK7LKs=;
	b=lLay4LrkOwsVldJrdNTvaVKKIPhPWsserGwUdZvNvgSmc+n+qlLYjJIi7KHIXQLY5Z
	8fZvJS2uok6Pq5GyxxIYTiqRzqUS7E7TiI4tYz3ZE7FmTESy0zA/Amo5vQT05N2KwxZr
	YzBC+PQ0Ae2KEMU31MeH+0A49zDlvkEtZEuKBL2M58klhUbqCjE9wovw5CoBidQPyR9l
	xQ3QwvgvINixGj9FOMazI4jChUkbJPXofQMLJCvUrdgWF/WwgzO1xz0cPCOLJpl300Se
	uML4Mabhc3HchJsuLMOwfwvR/3vu2EM0E/dIyPk1YDa4W3n5j/gKq0z/v/OG507Uh2G4
	x8fw==
X-Gm-Message-State: APt69E094DARMQIFyIFN1EolG/w7zMXB85Xfer5ve11iZhxgiN5ycX3B
	VkJ9DESvfAUKj/Sy7g6J2oyx/S7J8ij86Z55730=
X-Google-Smtp-Source: AAOMgpfPV5MPx1UdFPN/fH7HJ2L7hgV/feqIjZyY+Fv8mSFYofPkUGcxw2jAkGpIuLcdtUe5O4a5G8ZpZNPTvxPahZc=
X-Received: by 2002:ab0:304e:: with SMTP id
	x14-v6mr9373137ual.80.1530280690753; 
	Fri, 29 Jun 2018 06:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <1530253243-32383-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1530253243-32383-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jun 2018 06:57:30 -0700
Message-ID: <CAMKF1sou2xdCKjWW2uyxQi6pCVWnQd22KjPJ7EVwRN=q=1hEKQ@mail.gmail.com>
To: changqing.li@windriver.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] corosync: upgrade 2.4.3 -> 2.4.4
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
X-List-Received-Date: Fri, 29 Jun 2018 13:58:10 -0000
Content-Type: text/plain; charset="UTF-8"

corosync 2.4.4 upgrade is already on master.
On Thu, Jun 28, 2018 at 11:21 PM Changqing Li
<changqing.li@windriver.com> wrote:
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../corosync/{corosync_2.4.3.bb => corosync_2.4.4.bb}                 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-extended/corosync/{corosync_2.4.3.bb => corosync_2.4.4.bb} (95%)
>
> diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
> similarity index 95%
> rename from meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
> rename to meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
> index dc2f01b0f..b760c117c 100644
> --- a/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
> +++ b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
> @@ -9,8 +9,8 @@ inherit autotools pkgconfig systemd useradd
>
>  SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
>
> -SRC_URI[md5sum] = "bf0ede13018aadc8a046183bc593b0e0"
> -SRC_URI[sha256sum] = "b1e7e422e8d2f7af8e5315fa329b1dbd1175fff32efaa55e8054584c80a2c597"
> +SRC_URI[md5sum] = "69db29ff4bc035936946be44fc8be5cd"
> +SRC_URI[sha256sum] = "9bd4707bb271df16f8d543ec782eb4c35ec0330b7be696b797da4bd8f058a25d"
>
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(?!99)\d+(\.\d+)+)"
>
> --
> 2.13.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

