Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1DAB279977
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 23:07:42 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l197-v6so2544538oib.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 16:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wu+0Te28xcDB+OOtixZH0ZyOk0YGK71CWDbG/ZX3aq4=;
	b=omu43wMQFRTlqK8SWqNpXTybOxJtAyhG2rCl5G0OdfkTRrc1z3l5LAJqiVf+JyW6rw
	rD2Ia0pnpOKRqI0CQXZmvE4QdoXPV0E4gHuqrhWe6Oo/+LG2gvh2rbjA5xrAv2iiVBx1
	Jh5W1YRGRr+KSyhZY1XEaUa/RFUqt45R95Oyu/mi/08+cm2e/Gvxe2w7dxIL2veOM8Gt
	VfASKC0HR4ISft5R/6cbEe819zuFJJ0j4G02SBaJkedq/icXKhmi/1NZAg6rMI/Eqvr3
	9zmk8D/LrTRgZ9cGQ59pI7m2sP8jUxTmQM3TR7PXHf39P9MTEDGj9awdITL7+Eu7kIZ6
	k0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wu+0Te28xcDB+OOtixZH0ZyOk0YGK71CWDbG/ZX3aq4=;
	b=oAK5p3DhSvGtODL3RSOTiuu2ZdpXVyEMXt+riGQgd2b82Sb/4jqnNkknEBJNcJBiWY
	yt1M0b3Gy45ETxF6/V2tyt7V94XE9++uaAYbqhECkod1qcWmy/yUH0nPUrTy4hZ1aHxu
	mdRc80i/becPLzLZ1RWcgS8WJGRgIMOXzFs335VU5PIZ4wD6+DISK+M9C35smf+OXPZy
	AUZjAIBp1A4cFjy56ENusOSyj2/dN4nUXnO6dI+/fuMlYJYqNhxZKGqj85YRX32k2BOv
	MU7IWHNj8/qnf9vjSf816+8oJBvyZziIjGABJGwETtUn7IVcBEg4Nmu4xZ7Y9jSWeDT4
	nb9w==
X-Gm-Message-State: AGRZ1gIyAKqSZQQsPvfe2pVMR8CK8qoa2jBMEJM8d+7kA9cEJTZrrkt+
	KPB3iUrXBjGrdmd0rJiwpmtQzmM5e7MUlQqdZoM=
X-Google-Smtp-Source: AJdET5dFXeqGBUqmOBryrXnkyrxvopgocMKIqoG9bHLmSiEyxcTviF2D0qN2BdZGo74aqHyyglaIOhCx15v5dxkT5cI=
X-Received: by 2002:aca:4141:: with SMTP id
	o62-v6mr130945oia.189.1540336063694; 
	Tue, 23 Oct 2018 16:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20181023160438.19552-1-JPEWhacker@gmail.com>
	<fe28a311-767b-ca43-2308-489b1462e3b9@gmail.com>
In-Reply-To: <fe28a311-767b-ca43-2308-489b1462e3b9@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 23 Oct 2018 18:07:31 -0500
Message-ID: <CAJdd5GZpyeOaAd-t+PbyMaue38j1xVp-4OZNe2nPTmaiBsNbSQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Veselin Georgiev <Veselin.Georgiev@garmin.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master][sumo][PATCH] rapidjson: Update to newer 1.1.0 + git
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
X-List-Received-Date: Tue, 23 Oct 2018 23:07:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 23, 2018, 5:32 PM akuster808 <akuster808@gmail.com> wrote:

>
> On 10/23/18 5:04 PM, Joshua Watt wrote:
> > Bring in a newer version of rapidjson which includes a fixes when
> > running on ARM, specifically 748a652f04 ("Fix SIGBUS due to unaligned
> > access")
>
> Master can do what it want bug Stable has many concerns. What version
> was the old hash?  How many changes between the two versions? Is this a
> bug fix only update? Did you build it on all arches and with musl too?
>

Right. I reused the same git command to send both rapidjson patches, which
I should not have done. This doesn't need to be backported (or, a least, I
can send another patch with just the ARM alignment fix later). Sorry.


>
> - armin
>
> >
> > Also remove the existing patch file as the issue was resolved in the
> > mainline by 4c9a28a28e ("CMake: do not pass -march=native or
> > -mcpu=native when crosscompiling")
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > Signed-off-by: Veselin Georgiev <veselin.georgiev@garmin.com>
> > ---
> >  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > index 76e01f824..ec3df8263 100644
> > --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > @@ -4,11 +4,9 @@ SECTION = "libs"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM =
> "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
> >
> > -SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
> > -           file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
> > -"
> > +SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1"
> >
> > -SRCREV = "e5635fb27feab7f6e8d7b916aa20ad799045a641"
> > +SRCREV = "6a905f9311f82d306da77bd963ec5aa5da07da9c"
> >
> >  PV = "1.1.0+git${SRCPV}"
> >
>

