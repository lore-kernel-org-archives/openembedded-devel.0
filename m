Return-Path: <brendank310@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 62C3579D4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Nov 2018 17:27:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b203-v6so1968983wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2018 09:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aiThxWrTh0Z4sDLCXDcOQR1rPZ4+jAMaC/kR93w2NjU=;
	b=Q7UHrtpY8OyeJqbJrH6RcgMQyDA/JRZJvKDyf8fMCM3mO7XA6ZsL/ejCZZV1Ifc8Wu
	LBejdyc/0LijQX0o9xc3oIkMtJX2fEof32j0Ww7uRXvdkWxxFhHTBcMrSQchrLcqQKRk
	rEd3BjXEJYbT1+Xsc8KXK0E0Ogxvuijrg2jDczL7C5OylcJP4vcbuO5v60l4pUgltuXQ
	LbWmTQN0caq8kJBS1O5+3sic62fC3V8yDhI+PGIPSpgv7vQnt8jC3+tXdee5DLrV34PN
	LunyuskFWZsjPsaMROB7j3Uj2qlyU/G6MVwsyynoeXz/rovwb971k1XJY47knJF0fL+t
	qPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aiThxWrTh0Z4sDLCXDcOQR1rPZ4+jAMaC/kR93w2NjU=;
	b=WWJhlVCAwVfJpeqDrei+9SNWfPqNF7yWxeUYv/aGxo+8lFC0bl7JRE7C0Y149bMfiF
	qprqemvcuwWfcGvDBlbwysTfjaWUzHsR3z00DyJB9seLad7Uj0gNIhyfBk4hfe7gq/Zc
	QPliKnRDmqXjYRoNOqs5vVgMGKIAMSkiXW1pckojklIXTmInFY9/dbVyt5QHbuqk2gNT
	5PVOA//figzKmLRRpB86+Dx8nv5q/OjPnW0z3Z+Z9IjHQ5hwtMQHzQt/LfJPTwZqj8Rg
	fRUrnvRAbRRPTVdEnDqIRyp83zcAC2UGq8+fulB6cJpZnpg7iyb+Jwtla98Lj4dVbXNQ
	hBNw==
X-Gm-Message-State: AGRZ1gIojJwuNK8qowoDSjpYf1K7Uugak707ux+qItLPi055W2HlBszt
	1naGLYcnS/bhhVj8UELp0BaRdLLZLx8W2UdHPsY=
X-Google-Smtp-Source: AJdET5c3n4OVlMf1sGC+GHyajdmwzo5VT0ucy7NV7Al1k7/R8KiSbXHB9f8C+k902fP+aRZGTx8s9c7eThT/aeyC4Ng=
X-Received: by 2002:a1c:f514:: with SMTP id
	t20-v6mr2014938wmh.129.1541698071867; 
	Thu, 08 Nov 2018 09:27:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<ad2a3fd59975f2af76a55c6c480bbbbc4855f49a.1540830650.git.brendank310@gmail.com>
	<CAJTo0LZJv8Pmoqnb5-Xb2Tjms12P_Oa4S69CxdYvHd=fRSWBNA@mail.gmail.com>
In-Reply-To: <CAJTo0LZJv8Pmoqnb5-Xb2Tjms12P_Oa4S69CxdYvHd=fRSWBNA@mail.gmail.com>
From: Brendan Kerrigan <brendank310@gmail.com>
Date: Thu, 8 Nov 2018 12:27:40 -0500
Message-ID: <CAKPa3c2N1=Q-Ay5J=iN3U0U7HcR=8LEbTRVM7AMuFSqaLi=TzQ@mail.gmail.com>
To: ross.burton@intel.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 02/16] ibus: add recipe for ibus to support gnome-settings-daemon and gnome-shell
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
X-List-Received-Date: Thu, 08 Nov 2018 17:27:51 -0000
Content-Type: text/plain; charset="UTF-8"

Yeah it does have a build time dependency on gtk+2. I've made the other
changes, though I still have two libraries that are in subdirectories of
libdir that are giving me an installed vs. shipped QA warning. Is it
appropriate to do a more specific packaging within libdir (e.g. FILES_${PN}
+= "${libdir}/subdir/subdir.so") or should I take a different approach?

Thanks,
Brendan

On Tue, Oct 30, 2018 at 7:25 AM Burton, Ross <ross.burton@intel.com> wrote:

> On Mon, 29 Oct 2018 at 16:41, brendank310 <brendank310@gmail.com> wrote:
> > +DESCRIPTION = "Intelligent Input Bus for Linux/Unix"
> > +LICENSE = "LGPLv2.1"
> > +DEPENDS = "prelink \
> > +           gtk+ \
> > +          "
>
> It depends on gtk+2?
>
> > +S = "${WORKDIR}/${PN}-${PV}"
>
> This is the default.
>
> > +inherit autotools pkgconfig gtk-doc distro_features_check vala
> gobject-introspection
>
> distro_features_check isn't being used.
>
> > +FILES_${PN} += "${libdir}"
>
> Definitely wrong.
>
> Ross
>

