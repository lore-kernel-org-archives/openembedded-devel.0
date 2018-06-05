Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id E6D947856A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 17:18:47 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id s9-v6so3254647qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2018 10:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9hcfTy2bUzAbFAtOKgLy2kFZaz+dFBmI4CPXDJQKazk=;
	b=A8tPtEF11MnrpwpPrZ6jXx9ceEqbkt5+itP2Lt1/EXD/SQfkR7Dq/oABE7Sc10U/SF
	4SQVIibMYBpbaApH//ysTRbt2zUSSgbNLtmSI+ZN8sT8PaOqXylLC6yza/IbuZeMaD1K
	dbt+fz75X5V7rdY40jK0e/cJceZMrH1c1izgF0rPaso2n787XX49nnDTml6gnn4+8TIW
	u6opbihMzV9DwYRezRxJCZw2MQ3dlaE0diAzhYTp7F+LX7MIwqxeHn8M3eIrWCq6px/O
	wrxqV2Wyy9uOiJhOcKdAAIkFaSFFKnK/JNXbQoHElBgslGcRuKxvKLKggUVy21vPuNLZ
	Ebyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9hcfTy2bUzAbFAtOKgLy2kFZaz+dFBmI4CPXDJQKazk=;
	b=fUuHmScRXkmNl8raFJxPZNRTazeGmIW/kst+6mTE8qqjKg+CRMUYhHWsm3zipW1egY
	J+RYloPk63nbpeM2PLYqLhHivl+wQk2fMx3CX+fKSFSxu4TissHWInNIHuGLTlnSIUka
	Aw+GADGtmvd4gXAjIdT+9/O76jtET5WlZ6/X3OgkYUqA8iymWcgw8ATdRzk7FkAgoSDF
	GdMaXJbsM+GM/bX4vwacmWLXhKNs9fIuo1M2CGc5PsMAVmg3zMEEN8u8xMiJQ18YH8+d
	K5k4rItLsDZw+8hniAk9xCkYUPvNY5KNAq+JD4gOOdKXCfHFFybpSoob3REVqua2eWVJ
	9DrA==
X-Gm-Message-State: APt69E1cnGHDeAwS8RR6aiPdTKDirL442sJSnXDtSbmxVzI86rwFj96Y
	RyzwscXbdvVW0ESUrELuU2xK9+OLfEi4R0CM9dM=
X-Google-Smtp-Source: ADUXVKJ+/UQR1rqFtNowVNPzgv2wKlf5DYMLU5ilCZgEbVNUCViWMFm/mrA4QZtydsiI0+YrFv65p/Bi3lYZilYjHNc=
X-Received: by 2002:aed:23e7:: with SMTP id
	k36-v6mr12434311qtc.20.1528219128706; 
	Tue, 05 Jun 2018 10:18:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 10:18:18 -0700 (PDT)
In-Reply-To: <3ab64a7c59f14cce82d9c3c07364cf4d@svr-ies-mbx-01.mgc.mentorg.com>
References: <1527249332-31097-1-git-send-email-noor_ahsan@mentor.com>
	<1527249332-31097-2-git-send-email-noor_ahsan@mentor.com>
	<3ab64a7c59f14cce82d9c3c07364cf4d@svr-ies-mbx-01.mgc.mentorg.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Jun 2018 10:18:18 -0700
Message-ID: <CAMKF1sryaCvMNK7vJR2CzFPn7rPH-K470bj53TT3NsJZ2MmjuA@mail.gmail.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] radvd: Fix missing yacc error.
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
X-List-Received-Date: Tue, 05 Jun 2018 17:18:48 -0000
Content-Type: text/plain; charset="UTF-8"

its in master-next, perhaps keeping an eye at patchwork or master-next
can be helpful

On Mon, Jun 4, 2018 at 1:53 AM, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:
> Hello,
>
> Any update on this. Kindly apply think on master and Sumo release.
>
> Noor
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Ahsan, Noor
> Sent: Friday, May 25, 2018 4:56 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-networking][PATCH] radvd: Fix missing yacc error.
>
> * Following error apprear in do configure. Fix it by adding bison-native in DEPENDS.
>   ../radvd-2.17/ylwrap: line 176: yacc: command not found
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  meta-networking/recipes-daemons/radvd/radvd.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
> index bff693c..06d16a4 100644
> --- a/meta-networking/recipes-daemons/radvd/radvd.inc
> +++ b/meta-networking/recipes-daemons/radvd/radvd.inc
> @@ -8,7 +8,7 @@ addresses and some other parameters. They also can \  choose a default router based on these advertisements."
>  HOMEPAGE = "http://www.litech.org/radvd/"
>  SECTION = "net"
> -DEPENDS = "flex-native libdaemon"
> +DEPENDS = "flex-native bison-native libdaemon "
>
>  # License is BSD-Style (with advertising clause) but also has an additional 0th clause  LICENSE = "radvd"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

