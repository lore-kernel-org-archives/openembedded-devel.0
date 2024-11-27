Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15347D6D240
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 21:34:53 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.82246.1732743290861901134
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 13:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=STZoWTkW;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21278f3d547so1141315ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 13:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732743290; x=1733348090; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t9pLgSbfPcCl+vGEX3rZjjKh392Y747rlHdx9TN5unw=;
        b=STZoWTkWwNvHD7af+QcDxaFDTRBOpBPq1FaxwQbFRdts5U40mCLqBuZWg3KR5c3ZaE
         DasZuSyLgO952P4AxhPmCDaJQ8IShRfRDJfgXsdG5orbaIGUTAHqhqKOjYwOC0FjJecV
         LAQ1MAo5wVP2CA1302zvdul2C9HmPiw3duSPKuilCPAXnhjPxqxQlmd5nart1w6CEYmM
         XkW+4GpnrNzYAx8N53pb141jM4ptVSBAnAcs/aGNaHEkwPzH/sXa2IiTwu7q43njE8eS
         mm73z0CXFE7INejvVw97dXdplAIl8YJ9dPEBTcwc+D0K/Ev5K/nzdUBBUtA0sXJO780Y
         trPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732743290; x=1733348090;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9pLgSbfPcCl+vGEX3rZjjKh392Y747rlHdx9TN5unw=;
        b=w/8yOFlBZqxkwgT65av4PLSyLdf0UZ4bv7c1QAOc17IWsNRfErvDWvP/prKmsg0vdI
         Iy7kUv0v0pEfsuLqA79PSdFxQhueAevkXnd+gioXg/SPRR7tfD48OeEjKf8PWeLiEyhY
         tmsCfbuidZLCx58Vz188yYpf3B1Zb8WA5H0ws38fmCKm+D+A/vZRVVWCWPu+XKE/pbh8
         Fc25bX+0RN1GQB53yQ3LuwawIC2RZ3H49qqyZt7xrsY3UQ//WYO6VOcO34jJXvcpvcZb
         qLPlUCUW5a5Z+Sitaegxq8xZ9XotmdYyGztxTIaO2bm5BkOZHx+XweJ5RHP86PREsdEo
         Yzdw==
X-Gm-Message-State: AOJu0YxzzcW9hj6TbtXoiPD7NsPiEsR5IR4aC2gxKOQ9qY1LcXSmkTJn
	sBeswAPuEYCayQrNM7vPz6LiKdsklRbplYaO0sd3kUdGlLva0vS+wQw51Q==
X-Gm-Gg: ASbGnctdB+NGC02aCZof5U8wXfV/4vTYvPgiAk0vEBt/taHOCJfEbRiqKBjDznVJEEz
	dL4WUdYslXz47nY7Ri+WvpeaBUAWALX6NlnIpfCNQ/F5tqbbB4DQ1SY4hO0/dZZhi+RO/Je3OFY
	mPvHz4EsVnyaBiQtLL8Z0Gge4c0JPmp9cSG9bvnCLA95vxB8c3LMFEFOtFZcsy14rEMibpjtXVt
	uRBjDQmQu99lsNU32/qRmWnh+1St/GKqqFOknBOJ5k0YWc2
X-Google-Smtp-Source: AGHT+IEZh1mUTGXhMveENBYTgeDyntYU8Z4dHs4Y9IXNUnFdO1YtklAeIJMvPu8QNT6kQ88sgugb0Q==
X-Received: by 2002:a17:902:d4c4:b0:212:f64:8d9f with SMTP id d9443c01a7336-21501856d3bmr63286345ad.32.1732743290086;
        Wed, 27 Nov 2024 13:34:50 -0800 (PST)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521967191sm188245ad.163.2024.11.27.13.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 13:34:49 -0800 (PST)
Date: Wed, 27 Nov 2024 18:34:46 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: drop recipe
Message-ID: <20241127213446.lwlmbl64btasqg4b@hiago-nb>
References: <20241127190841.137119-1-hiagofranco@gmail.com>
 <CAMKF1srjsW3gH6P7Yy1TRvxO=BPPj4NaRB4sRQZ1suOAi1w1HA@mail.gmail.com>
 <CAMKF1sqgdr-nAyAVMajOUHhBCjECtxQ+HDzvsev0f_5mNuD8eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1sqgdr-nAyAVMajOUHhBCjECtxQ+HDzvsev0f_5mNuD8eg@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 21:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114098

On Wed, Nov 27, 2024 at 12:01:59PM -0800, Khem Raj wrote:
> On Wed, Nov 27, 2024 at 11:38 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Nov 27, 2024 at 11:09 AM Hiago De Franco via
> > lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > This recipe has been added to openembedded-core layer, since hwdata is
> > > now a requirement to build libdisplay-info, used by weston (see commit
> > > 3e5d5ba74bea "hwdata: add recipe from meta-openembedded" from oe-core).
> > >
> > > Therefore, drop this recipe.
> > >
> >
> > Thanks, this also needs to be dropped from
> > meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> 
> Forgot to mention that I have addressed it this time. Usually its good
> to look into the
> packagegroups when adding/deleting recipes

Noted, thanks for the help Khem, next time I will take a look at this
file.

> 
> >
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > >  .../recipes-support/hwdata/hwdata_0.389.bb    | 28 -------------------
> > >  1 file changed, 28 deletions(-)
> > >  delete mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.389.bb
> > >
> > > diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.389.bb b/meta-oe/recipes-support/hwdata/hwdata_0.389.bb
> > > deleted file mode 100644
> > > index fffd491178b1..000000000000
> > > --- a/meta-oe/recipes-support/hwdata/hwdata_0.389.bb
> > > +++ /dev/null
> > > @@ -1,28 +0,0 @@
> > > -DESCRIPTION = "Hardware identification and configuration data"
> > > -HOMEPAGE = "https://github.com/vcrhonek/hwdata"
> > > -SECTION = "System/Base"
> > > -
> > > -LICENSE = "GPL-2.0-or-later | XFree86-1.0"
> > > -LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
> > > -
> > > -SRCREV = "5313a12eb992a354c17fc895c1d69c8c42b09a06"
> > > -SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
> > > -
> > > -S = "${WORKDIR}/git"
> > > -
> > > -inherit allarch
> > > -
> > > -do_configure() {
> > > -    ${S}/configure --datadir=${datadir} --libdir=${libdir}
> > > -}
> > > -
> > > -do_compile[noexec] = "1"
> > > -
> > > -do_install() {
> > > -    oe_runmake install DESTDIR=${D}
> > > -}
> > > -
> > > -FILES:${PN} = "${libdir}/* \
> > > -               ${datadir}/* "
> > > -
> > > -BBCLASSEXTEND += "native"
> > > --
> > > 2.39.5
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#114094): https://lists.openembedded.org/g/openembedded-devel/message/114094
> > > Mute This Topic: https://lists.openembedded.org/mt/109811489/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

