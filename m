Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3ED7CDEB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 18:43:25 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 201so55537232qkm.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 11:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OwNuxNc+R1pJ10qSoiDtZKYRGbIpyYw1jDDsb/chAzg=;
	b=SzYZWdJF1owVNQKGO6miNJFg8rPaxSZOjtuAXs2wXYSHPlerwR2w9gw6NusUOndvdC
	iCM2b0RCcup1pwxyN84H1tB+X3KYex+rj7ZygS3qL34aLDZrWQlMQYYCOFrd9PqAgdHz
	Bc94OQQtStKR2+7DLXBA6ljL2p8t2A/ucLPXK96JGEmfJb0lDBFnxpJIjRBpKdNTGPPm
	neyZIHip82tW3A6fY8Sn23rCdLn/l85DRyFegOYp4AX0eHMtSufhfCiGZxrFSkgq0WvP
	0yfT9kcwcCqMHkPVEWZMkECFN4nMBl0zgCJEYycbAA/oTIC8zXpwqllPFMUwwqIOTdpc
	I0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OwNuxNc+R1pJ10qSoiDtZKYRGbIpyYw1jDDsb/chAzg=;
	b=XPadAJcQQOm1daaFY4PAYvjIt4VJBmkCa4CoT9zyx8aSFu1VS/Z5VxGRKylZrImJO8
	dgu9JwFupU5LUg3aUwbnPgi6zviF3N/kuqU+vI5quE0YmcXyDSYxX1VvYrZpMq8h/4Op
	mr5GAvoT1SbH3aQE7xcEKGNFvVEO9aF9GLJARbVr/3BDl1APv7K33l1K1sk6PLOD87k8
	m3lvMM3hmynJgTJu5c88DJ40XuR7H/2HdKMk8EkYkLjsUdhFuCn2L3H4wF5EIScAfhuj
	Uka6gb9rNbRu7HTf5yLHz1t7AMcmb59HFhEGcA0/ER/MbiPqnLMmyXouNds0ApghOE7b
	Suag==
X-Gm-Message-State: APjAAAWaust01v5BFsUhYQ7vUV9n0MYZPE0jjlHDaxfEyMd+xVssbSx3
	kKVMCJvgum8N3k4ysOt7PbQYR5NItCR5H4kYfuw=
X-Google-Smtp-Source: APXvYqz8rk6CFeuWgnTbEfJ1m5NVfxiJBHhuhDyejBjHXxsf6TEuPaDGGOiMWI4n5my94IKielBCcj0LVjbgPQ5hzjg=
X-Received: by 2002:a37:c81:: with SMTP id 123mr94453409qkm.474.1564771405799; 
	Fri, 02 Aug 2019 11:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190802070221.15706-1-arturo.buzarra@digi.com>
In-Reply-To: <20190802070221.15706-1-arturo.buzarra@digi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Aug 2019 11:42:58 -0700
Message-ID: <CAMKF1srxWyPH_m7FxCCVTCMiszFymwfbcEukMxSJxu3RGkVqHg@mail.gmail.com>
To: Arturo Buzarra <arturo.buzarra@digi.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][thud][PATCH] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Fri, 02 Aug 2019 18:43:25 -0000
Content-Type: text/plain; charset="UTF-8"

can you send it rebased on top of master

On Fri, Aug 2, 2019 at 12:02 AM Arturo Buzarra <arturo.buzarra@digi.com> wrote:
>
> Commit c6e963f9e ("lvm2: Add RDEPEND on lvm2 to lvm2-udevrules") added
> a package dependency due to lvm2-udevrules needs dmsetup, however
> dmsetup was moved to libdevmapper in commit 269d009a81d4 ("lvm2:
> libdevicemapper package needs udev rules and dmsetup"), so this
> dependency should be only for libdevmapper instead of the full package.
>
> With the current implementation, a package that has a dependency with
> lvm2-udev rules will include also many unnecessary packages like lvm2,
> lvm2-scripts, etc. and their dependencies.
>
> Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
> index 7bd7b09d8..08287e358 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
> @@ -48,11 +48,11 @@ FILES_${PN}-scripts = " \
>      ${sbindir}/lvmdump \
>  "
>  # Specified explicitly for the udev rules, just in case that it does not get picked
>  # up automatically:
>  FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
> -RDEPENDS_${PN}-udevrules = "${PN}"
> +RDEPENDS_${PN}-udevrules = "libdevmapper"
>  RDEPENDS_${PN}_append_class-target = " libdevmapper"
>  RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
>
>  RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
>  RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

