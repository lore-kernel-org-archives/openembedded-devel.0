Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2aa2-0005QU-Mv
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 03:47:22 +0100
Received: by iyb26 with SMTP id 26so9654509iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 19:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=nQyRS9A7YyBsMMRV80cexv/6uD9qoP9G0kyyEUl5HhU=;
	b=D8TvZI9snFT+kANu/1eOm0KiuPdmdnFxdKVW8b0ZVux1i7HiwPVb+HMxsl/QR4P4Ne
	ezVWGb4/EVOGzB/eiwEfk6lBJcHac9gKH+nozkoM4AU8dfUEsef2/S81aSUzJFZvN8ac
	c8Ku+AeQGhbmpFVnmV685PNdQV8qrCpcGiK8c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=MtEVTz3ecKs/fqW1Tw1bLV1ZwOINx0Sxcxyuoak3VMEGQnpBS43unuVV6VulD5tkAE
	/S2tmQkMLnBa7509Sisxsb7MRWkV4gKKWLpvPedM52Qn5kJDfrh+AVK8aAQ+WkuOuYnC
	jUMLJXAO8ErvzovObkd8iTWt2Mwv27V4L63yY=
Received: by 10.42.144.70 with SMTP id a6mr46461icv.395.1300934730187;
	Wed, 23 Mar 2011 19:45:30 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c1sm5480508ibe.32.2011.03.23.19.45.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 19:45:29 -0700 (PDT)
Date: Wed, 23 Mar 2011 19:45:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110324024550.GA20796@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
	<20110323104755.GH21392@excalibur.local>
	<20110323112448.GE3418@jama.jama.net>
	<imcma4$hlu$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <imcma4$hlu$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 01/12] libnl: rename libnl2 to libnl as used in openembedded-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2011 02:47:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/03/11 12:41), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 23-03-11 12:24, Martin Jansa wrote:
> > On Wed, Mar 23, 2011 at 11:47:55AM +0100, Stefan Schmidt wrote:
> >> Hello.
> >>
> >> On Fri, 2011-03-18 at 15:00, Martin Jansa wrote:
> >>> * libnl1/libnl2 still conflicts even when using separate includedir so
> >>>   it will be easier for distro maintainers to use only libnl1 or libnl2
> >>>   by PREFERRED_VERSION
> >>
> >> For distros that want to support network-manager that still means that
> >> both versions are being build and may clash as we have seen before.
> > 
> > How do you build 2 versions of same package? Whole point of this patch
> > series is to force distromaintainers to use only libnl_2.0.0 or
> > libnl_1.1.0 based on PREFERRED_VERSION_libnl and this way keep them away
> > from shooting own foot by accident.
> 
> I don't think that's an acceptable solution just yet since angstrom
> needs both iw and nm. I think the best way forward is:
> 
> 1) configure libnl1 to only build a .a
> 2) rename that .a to libnl-old.a before installing it
> 3) patch nm to use -l:libnl-old.a


if its only one package that needs libnl1 supposedly then I would
suggest to add this to said package's build system if possible
but if there are more than one packages that we care, that need it
then having a static archive would be ok approach.

> 
> or
> 
> 1) configure libnl1 to only build a .a
> 2) move that .a to ${libdir}/libnl1/
> 3) patch nm to use -L${STAGING_LIBDIR}/libnl1 -l:libnl.a
> 
> A lot like
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=71e69ad8b551aa06f63160232d1bd87b8d801a1d
> but a bit cleaner.
> 
> >> Just a remark. Personally I would like to go this route and maybe get
> >> rid of libnl1 at all.
> > 
> > Yes this is step in direction to get rid of libnl1 :). I'm using
> > libnl_2.0.0 from oe-core in meta-shr, so this change is making diff
> > between recipes in oe.dev and meta-shr smaller.
> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFNidyDMkyGM64RGpERAtrBAJ9j+q1b4dFMXW7C0T9g55y22GO/PACfeH1O
> 3NU5PzIAzmtbZy5rdk7ojhs=
> =Vgfx
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


