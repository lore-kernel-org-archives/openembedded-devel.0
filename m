Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 335B97D2AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 04:35:54 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id bb5so521435plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 20:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=/murioVXoAI8vnTsdVU9UhZhCePb0fGbjjxydCE2dRc=;
	b=UZU1tVb1WJl1EHs7y8cs1PgC/3mLNK+EUnbpJ1O+O/PZ7lP02ZUDRvY9mLJ6bYcvBC
	xhc2FABXxtOb9YP19qzJp5RmdVS0PkiWRLL5dZDLrcd7/R8lObwDmQc3fIqyiUoINGBB
	hS/qRT2d5p8dp0sHrgTH9e5ATyCL/fIq7nftbHsrWbmBuri+ej+THvXmgWC3MFIhtXTX
	cLF0bSI6S852nK7Etk7vpDucajhEeMQJR4sjBdKCk2U3fG9EhRVJsD7ikdGudnX9YYbf
	0Dtpncd2Rv69AC+PIdseuMwC5W1gN0mlF+zWSpbTZAPma9+MntK9TmmPuHxT/SOe7UAY
	w+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=/murioVXoAI8vnTsdVU9UhZhCePb0fGbjjxydCE2dRc=;
	b=OVMd+Pb1PdBmnwi/MBugrxu/a83VGc7SPFv403OQHdzn6q4lbLZjGxsvEBFLoow44v
	g0MTGyzYv5pLPfQqIEV+Yp6zxcnTrprf9LqlSsTdS1+A0usmE3T1o21SomWwF+Jw8/QZ
	I0Md8WPJknyCtoY/f01xRyPacdOi7aBhxLeSOIQOETDry32CsWxoynqE4KDCT9ttWpku
	cado+wlFbQCUHjmJxTsPm0izRjWOi/3opzSLeru0r1FzDb7ZSW9VxxfdIwNPDRZ9fHN0
	QVFEQ7oIPPviMIY8udp+y+qldoC9UxN1Jg5ws95FP9xLoQao0ABEQP8KnZsX4m8SxkHk
	dw/w==
X-Gm-Message-State: APjAAAWzju1ps4E2gkDuf+ZdqkFPAUssvp29ar/mFkSQopFOHf6tN34q
	fYOvHuOBu+ytgt2TtcV5gW0=
X-Google-Smtp-Source: APXvYqzyiACmOMklb2p4AOx886+4vE5QAcVsyM3iPSb0l1zpGbPvVbUyxHZ7I+o58A1ob2Cu0WIpdg==
X-Received: by 2002:a17:902:6b0a:: with SMTP id
	o10mr1547980plk.15.1573619754822; 
	Tue, 12 Nov 2019 20:35:54 -0800 (PST)
Received: from tyche ([2601:646:8500:1c20::db51])
	by smtp.gmail.com with ESMTPSA id a23sm694176pjv.26.2019.11.12.20.35.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 20:35:54 -0800 (PST)
Message-ID: <28310deb2c64152b225cbd630c51f590bdfbb5bc.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Nov 2019 20:35:53 -0800
In-Reply-To: <CA+chaQec06vqFFH0buJY6bTNzLK_jPD8-KV5xJxfpPZux_AHMA@mail.gmail.com>
References: <20191109195436.78248-1-raj.khem@gmail.com>
	<CA+chaQec06vqFFH0buJY6bTNzLK_jPD8-KV5xJxfpPZux_AHMA@mail.gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sip: Upgrade to 4.19.19
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
X-List-Received-Date: Wed, 13 Nov 2019 04:35:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-11-09 at 22:03 +0100, Martin Jansa wrote:
> Any idea why it built ok for me when testing 5.13 with glibc?
> 
> In the e-mail you mentioned failures with musl, is this upgrade
> needed only together with musl? You also mentioned it's new failure
> and 5.13 is in meta-qt5 for quite some time, the recent upgrade was
> just from 5.13.0 to 5.13.2, maybe it got caused by 
> https://github.com/meta-qt5/meta-qt5/pull/243 instead? Still this PR
> builds fine here with 5.13.2, glibc, qemux86-64.
> 

it seems likely the cause, I have posted a pull request

https://github.com/meta-qt5/meta-qt5/pull/255

Which upgrades pyqt5 to 5.13.2 as well, secondly it disables/blacklists
py2 version of recipe, I think py2 is on its way out anyway so we can
ignore that, second patch adds a patch to qtwebengine to fix the
do_install issue with musl. Please take a look at this pull.

> If that is the case, then we might need this upgrade in zeus branch
> as well (5.13 is in meta-qt5/zeus)


I guess, just blacklist py2 version of pyqt5 in zeus would be
sufficient.


> 
> Cheers,
> 
> On Sat, Nov 9, 2019 at 8:55 PM Khem Raj <raj.khem@gmail.com> wrote:
> > Needed for QT 5.13 based python modules
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-devtools/sip/sip.inc                        | 6
> > +++---
> >  .../sip/{sip3_4.19.16.bb => sip3_4.19.19.bb}                | 0
> >  .../recipes-devtools/sip/{sip_4.19.16.bb => sip_4.19.19.bb} | 0
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-devtools/sip/{sip3_4.19.16.bb =>
> > sip3_4.19.19.bb} (100%)
> >  rename meta-oe/recipes-devtools/sip/{sip_4.19.16.bb =>
> > sip_4.19.19.bb} (100%)
> > 
> > diff --git a/meta-oe/recipes-devtools/sip/sip.inc b/meta-
> > oe/recipes-devtools/sip/sip.inc
> > index 092531b322..d8e32a7687 100644
> > --- a/meta-oe/recipes-devtools/sip/sip.inc
> > +++ b/meta-oe/recipes-devtools/sip/sip.inc
> > @@ -5,9 +5,9 @@ LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM = "file://LICENSE-
> > GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
> > 
> >  SRC_URI = "
> > https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz
> > \
> > -          "
> > -SRC_URI[md5sum] = "7e854b0da395ddc8fb5da82d0321994d"             
> >              
> > -SRC_URI[sha256sum] =
> > "184c790d58e9527fc6bdac2bbf8638f3d1b41dea922cad8eb83172b4ba70c620"
> > +"
> > +SRC_URI[md5sum] = "98111479309dc472410f26080d6d4a88"
> > +SRC_URI[sha256sum] =
> > "5436b61a78f48c7e8078e93a6b59453ad33780f80c644e5f3af39f94be1ede44"
> > 
> >  S = "${WORKDIR}/sip-${PV}"
> > 
> > diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.16.bb b/meta-
> > oe/recipes-devtools/sip/sip3_4.19.19.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/sip/sip3_4.19.16.bb
> > rename to meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
> > diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.16.bb b/meta-
> > oe/recipes-devtools/sip/sip_4.19.19.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/sip/sip_4.19.16.bb
> > rename to meta-oe/recipes-devtools/sip/sip_4.19.19.bb
> > -- 
> > 2.24.0
> > 


