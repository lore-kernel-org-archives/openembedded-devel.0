Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 45E127199E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 03:18:14 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id k7so10306685pga.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Oct 2017 20:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NLU+fZcGqFRRa+KLjAnnUkbQUKUKD+IxScuMm8G4CaU=;
	b=FbmfY+DHolEJBSHWRTRVD/UnzprRTDtsvu0qp9brXkodvOsObI7FZYMGAyS2JE0DkT
	ckIWoq+dll8lzDjTq4xLzwXTGQwbAlAjy8iD12eoZTa4q4gm0Em4KCnBFiy2Tb2IkFZc
	WSWVlqvD8ltYBIg/0yCPiD+hH8VLr36Shmued8KYA9wocK5J4yu+vJkX/1e8PgrBHrH7
	go2ZN2+0LqhNeBy2pXntuEU2io/QwOm3C+tk4eIQz0UE+JZ2mfeJdyM5HOnt3sxFeCdZ
	DABmBHhFFhLGj2EFUfrxeDMrVHeSinrnSgDGSVj4TADzEI0K6elnTZyV2HlC/mMeOE6D
	3nNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NLU+fZcGqFRRa+KLjAnnUkbQUKUKD+IxScuMm8G4CaU=;
	b=PCzPsPTul7MARwveyWyvauvl3eKyu6ASmdKBEmd3JPo3ybiBTKcCT/OnvETaZOG76E
	rw/Nwt+6lXRyJdVg2cIqJiJqH0toQorQn7BeG0XAf1R3yMxcQ21Or+dCKM2fiK4P5AtA
	PcRC9SCQBJaurhYs2zx2/lwK5Fthfd76R9ojJ3xMrDkBCtSf2C+FXGcRyDA15kxAcpsm
	6N2ABv0820W1us9iC6UkYK8qKBGTkAZyiGoD6eTKMjJNRexZLxRNFxuPIb02aJS/vv8d
	9yFqPu5fM0EK/6SxO5bBc9YZ3O27q9CjsMdQunLeOShF9wXp7SF58hBEw2mGX3KbZ0Bt
	Qxjg==
X-Gm-Message-State: AMCzsaUwGrXRv+4lmePfcLZTMIbrWqppenDSByoPy3XkbeqJAPKrqNad
	mUIWJ8Wq7hqSi+20tx1R9S39OYtXBm16WUw3/8U=
X-Google-Smtp-Source: ABhQp+TT8jmuitB1vhWRdwrk1JcB9oX+zKWZ0nzkbWadFPfYPd9YZlKU2ZQuDFANnlXNUW40WjceOOiEvgQkvkbZQZM=
X-Received: by 10.101.100.216 with SMTP id t24mr1775939pgv.439.1509333496337; 
	Sun, 29 Oct 2017 20:18:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Sun, 29 Oct 2017 20:17:45 -0700 (PDT)
In-Reply-To: <1509327356-19319-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <a52d7476-864f-728c-e115-96967fdce450@balister.org>
	<1509327356-19319-1-git-send-email-fan.xin@jp.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Oct 2017 20:17:45 -0700
Message-ID: <CAMKF1sohPCP07Hx-aHdoKDqtrTXWO+3atWDX-MMLP80RsdxRNg@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] spi-tools: Add version info
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
X-List-Received-Date: Mon, 30 Oct 2017 03:18:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 29, 2017 at 6:35 PM, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  meta-oe/recipes-support/spitools/spitools_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
> index f808125..6ca6ad7 100644
> --- a/meta-oe/recipes-support/spitools/spitools_git.bb
> +++ b/meta-oe/recipes-support/spitools/spitools_git.bb
> @@ -4,6 +4,9 @@ AUTHOR = "Christophe BLAESS"
>  LICENSE="GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
>
> +BPV = "0.8.1"
> +PV = "${BPV}"
> +

why do we need BPV ?


>  S = "${WORKDIR}/git"
>
>  SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
> --
> 2.7.4
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

