Return-Path: <net147@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id CC5A67729E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Sep 2016 04:03:33 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id e124so5849682ith.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Sep 2016 21:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=XMnjU8nvz3A0J6H/aw5BEbJ1yLWdagGcS2dIR1xFR1s=;
	b=lhylmXAv6QxTyo4etc1TwZ7gg09sb95kfO7tHDiCMx7CWA04aL+l1w9kIe/VitVtEF
	bVuGx1CWIa6AFmxEFlKSPvhxE4KYo8yigJUgOtBt/PVGdH0tDoi8kBFiZpGtbY/0kkDP
	vqxKw2DkEG2/YJVNcUaZhJcKuPfU8qxd7sXieML0thH5cpxxREOz3AR0ubUsmgUfN54U
	NDwX+dzpBerOczf4o8oJkHhWud61fsnisvijus5ynvnJlnjk65m8OH/QMZ7IZGX8Z4q9
	YHkLCdvFmo4o8oaULKg3O2unBdlpyc0AoVpjzcLiEUktJ2cv52L1QkcwQR9scST9S/vK
	+j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=XMnjU8nvz3A0J6H/aw5BEbJ1yLWdagGcS2dIR1xFR1s=;
	b=URbIoDudujPNXX6bVCs0Oq6BstrGcYkLXGN5e5LHlgzVc+G5pSSkk0N+tbkweCZQS1
	FSNi19N/o/zQW5vfvNrUWLU5GntOYQK+QLPbdO1LgYqdb9JfaIQv7ggBq0ZdnnDZL8qK
	13mcOvqMJfjTupAhcgHJQBj0/ZXQrUafCRaX8vWqLJUucw9XRwtGMhg0kVJqiFn20N/B
	51s+Edvo5VhEUD9kSMHG4j7lQOlugNLHcHR4JFWuhbYnejTvAUVpb8nHMHCXE6pw4ULl
	DnI8GumWHqopLgydRs6f/90aZQkdgMDRfpde68EnPydNGrl9oR5YrJRKVZGQC9FKNxHA
	xN/w==
X-Gm-Message-State: AE9vXwO6nIj18dbJaX6qnILW9lVX3+Nmef4Sh2vhmEYVbpRR6yh5IlruaXCGJZVI6tt8sxgP2Xe0fcEI6DFYCA==
X-Received: by 10.36.17.20 with SMTP id 20mr15109367itf.94.1472961813728; Sat,
	03 Sep 2016 21:03:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.60.73 with HTTP; Sat, 3 Sep 2016 21:03:33 -0700 (PDT)
In-Reply-To: <20160831194106.14065-1-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
From: Jonathan Liu <net147@gmail.com>
Date: Sun, 4 Sep 2016 14:03:33 +1000
Message-ID: <CANwerB0gyDqWi+5d4hvLs3otSDCmZNb7BWQtaAJChbZvAM6q1Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 01/11] xf86-input-tslib: remove
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
X-List-Received-Date: Sun, 04 Sep 2016 04:03:35 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

On 1 September 2016 at 05:40, Martin Jansa <martin.jansa@gmail.com> wrote:
> * tslib was removed from oe-core
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../xf86-input-tslib/10-x11-input-tslib.fdi        |  11 --
>  .../xf86-input-tslib/99-xf86-input-tslib.rules     |   5 -
>  .../xf86-input-tslib/double-free-crash.patch       |  20 ---
>  ...f86-input-tslib-0.0.6-xf86XInputSetScreen.patch |  31 ----
>  .../xf86-input-tslib-port-ABI-12-r48.patch         | 196 ---------------------
>  .../xserver-174-XGetPointerControl.patch           |  34 ----
>  .../xorg-driver/xf86-input-tslib_0.0.6.bb          |  35 ----
>  7 files changed, 332 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/10-x11-input-tslib.fdi
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/99-xf86-input-tslib.rules
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/double-free-crash.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-port-ABI-12-r48.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xserver-174-XGetPointerControl.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb

tslib should be added to meta-openembedded instead. There is a
patchset submitted to ML to add tslib and related recipes to
meta-openembedded.

Regards,
Jonathan

