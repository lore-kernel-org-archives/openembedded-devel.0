Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id A25A67875C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 16:07:55 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 141so6709376wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 08:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XU8EKEvt3bBVNCYCrxUnczffRirLU9+gkbUnxFKtJVE=;
	b=EvAumEq0kROhzAMbscvM7R+pEjYbgRPnqscm8te08SzjntYYi5t6i+b8jAEb0fexwr
	+ox4As9dP5DBOXI+Z4AhSJmfJi+rA1jbMeG7phoYnhhha92KZ0h80bhZ6fpjyVO9wqdc
	0yHudGH7McixRhL97Ej3aMt4z9jbS5SG/Ddzev4wh9x6Bw8/17AYHKxtPBd8Q4yeyust
	5ZVgnRKGsN2Gs0tq1zisalIyi5bIGFZV977BHyOSGsYDZfrgya7cZusyrUnAIIxCd4VR
	sflMrrBvK5KLQeTsg1ybpppWRqUrA+UsgD8eif2OrhFWeTjMIRPUFautadRpgOJmBuHj
	Oobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XU8EKEvt3bBVNCYCrxUnczffRirLU9+gkbUnxFKtJVE=;
	b=Oau7/3Hq9KuthYybze3GU1ptMlhSfNA/7zgCeX77d8MVMpikSQOzoia7dmoY8+gRcj
	c7363YdfJPmpOjr3/c1zgnNv7TnPO9W5pMRcFStuWcXl1Xirc/ZKJgMirKncZFCeoT4V
	Jj0eQ+j4Ik4t13aCe8yoXBFqkNsmhPzJebKY5t7dPuJC9eiI130QNQrFbxIYuuIzXzLC
	x0LAWcWLJnmydjpLUoeUjD7KM1ZQ90iXZe15Nl55MMVehMJYMOWOge7vIm2hE4ljREp2
	aDCTjI6/oG5HKHZewGvs+PdlI7Cjg/kj3mSl9wYVvVajTQ2Dk2OMyms9AvgdTRVJxkrj
	YR2w==
X-Gm-Message-State: AKwxytdyWgDt157oPgZ0j2Hl/erMPTrWrnJq+PtEHjYsJAyElGIOMd76
	szXZNEDLz4jGC17q4vr8hL2rXuU5b357KJhQfwk=
X-Google-Smtp-Source: AH8x226wHT5R2pLiESkIZ5RcnupT67hhCgtHAUI8Fo9B5UodCHFvEV6A+NImbaVTGBGAFuZql816ZzMySP6DMTXo+k8=
X-Received: by 10.28.13.18 with SMTP id 18mr28728380wmn.112.1517501276513;
	Thu, 01 Feb 2018 08:07:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Thu, 1 Feb 2018 08:07:55 -0800 (PST)
In-Reply-To: <20180201165756.0f54c7bc@t460p>
References: <20180201142340.11083-1-Martin.Jansa@gmail.com>
	<20180201142340.11083-2-Martin.Jansa@gmail.com>
	<20180201165756.0f54c7bc@t460p>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 1 Feb 2018 17:07:55 +0100
Message-ID: <CA+chaQeDFexQPwNj8o4PS2zKqjsbwHBgdqhdDjBx2gxuiHDyow@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, python-pam, smbnetfs: require pam in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 01 Feb 2018 16:07:55 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

I'm just trying to get rid of libpam from builds without pam in
DISTRO_FEATURES (even for world builds, see the change for oe-core).

I'm aware that libpam usage from samba is a bit strange as discussed few
times:
http://lists.openembedded.org/pipermail/openembedded-commits/2016-October/198752.html
http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/106583.html
http://lists.openembedded.org/pipermail/openembedded-devel/2016-September/109143.html

Now RSS and also with libpam being available only when pam is in
DISTRO_FEATURES, we might possibly return the PACKAGECONFIG without
re-introducing undeterministic link with libpam, but I'm not using samba
(other than building it in bitbake world) so I'll let that to people who
actually care about samba itself (and can properly test it in runtime).

Regards,

On Thu, Feb 1, 2018 at 4:57 PM, Andreas Oberritter <obi@opendreambox.org>
wrote:

> Hi Martin,
>
> On Thu,  1 Feb 2018 14:23:40 +0000
> Martin Jansa <martin.jansa@gmail.com> wrote:
>
> > * there is explicit dependency on libpam without respecting pam in
> DISTRO_FEATURES
> >   so add the check to prevent people building it against broken libpam
>
> [...]
>
> > --- a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> > +++ b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> > @@ -40,9 +40,10 @@ inherit systemd waf-samba cpan-base perlnative
> update-rc.d
> >  # remove default added RDEPENDS on perl
> >  RDEPENDS_${PN}_remove = "perl"
> >
> > -#DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb
> libtevent libldb libbsd libaio libpam"
> > -DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb
> libtevent libbsd libaio libpam"
> > -DEPENDS += "libldb"
> > +DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb
> libtevent libldb libbsd libaio libpam"
> > +
> > +inherit distro_features_check
> > +REQUIRED_DISTRO_FEATURES = "pam"
>
> AFAIR, Samba doesn't build without libpam, but runs fine without a PAM
> installation. Which problem you're trying to solve? I guess it's fair
> to expect a dysfunctional PAM library without the 'pam' distro feature.
>
> Regards,
> Andreas
>

