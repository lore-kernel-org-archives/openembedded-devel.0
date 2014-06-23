Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 672926FC34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 02:11:02 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id u57so6166798wes.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jun 2014 19:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6Nsj57YC87FkkTWzMvS7+7gXI5IfyRc5etmGK/A4SLA=;
	b=Iu1JDT2mWbTM8xP484NCOrT9exlsYjUxgWGmP7d0rL/RBARW3BJEbKNoLpXXQ82RxM
	PuJvEfMXch6ntalKtD0vrukCOF8+IarcQSK/6Ex3S8ZzTje6/dmVRsWjb51xCTbZmK5y
	6FN3PeuSzljsNpOybHXZazpearqWuprC7WCnlk2KsLLGdz1Bd3ZJIP6AdBsYVexAXAhJ
	/fdhS4Qf2dV+u8SJ8jQGCA3KXH2yCpSeiYBlVyTDrC5qzTfX1qHBTnl7BZxgN90QmQQB
	zQeqjLJRy2bQ3cGSISGwuAWxfjsio/Jl7nCeGJwgUzcXQsiAgkk/UIqMCegRwjQDaIqY
	7MsQ==
MIME-Version: 1.0
X-Received: by 10.194.120.72 with SMTP id la8mr14915882wjb.24.1403489463492;
	Sun, 22 Jun 2014 19:11:03 -0700 (PDT)
Received: by 10.194.34.65 with HTTP; Sun, 22 Jun 2014 19:11:03 -0700 (PDT)
In-Reply-To: <CAOLEWZU2OoLJw9zfyry4=Ju6qqxTF1NuntTCnxvBwjsE9d-BJA@mail.gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
	<1403171993-26208-4-git-send-email-Martin.Jansa@gmail.com>
	<CAOLEWZU2OoLJw9zfyry4=Ju6qqxTF1NuntTCnxvBwjsE9d-BJA@mail.gmail.com>
Date: Sun, 22 Jun 2014 19:11:03 -0700
Message-ID: <CAOLEWZUv9BntX-Yc6O5VqDEq6oOmUVrF=ot47hjM_29hryMG1A@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][WIP][PATCH 04/25] imlib2, mcnavi: Blacklist because of broken imlib2 after freetype2-config was removed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jun 2014 02:11:10 -0000
Content-Type: text/plain; charset=UTF-8

It sure looks like gmail doesn't like .bbappend files as attachments, so
this is what I meant.

Steve


inherit autotools-brokensep

CFLAGS_append = " -I${STAGING_INCDIR}/freetype2"
CXXFLAGS_append = " -I${STAGING_INCDIR}/freetype2"
LDFLAGS_append = " -lfreetype"

EXTRA_OECONF += "--enable-visibility-hiding"

RPROVIDES_${PN}-tests += "imlib2-tests"
RPROVIDES_${PN}-themes += "imlib2-themes"
RPROVIDES_${PN}-filters += "imlib2-filters"
RPROVIDES_${PN}-loaders += "imlib2-loaders"

DEBIAN_NOAUTONAME_${PN}-tests = "1"
DEBIAN_NOAUTONAME_${PN}-themes = "1"
DEBIAN_NOAUTONAME_${PN}-filters = "1"
DEBIAN_NOAUTONAME_${PN}-loaders = "1"
DEBIAN_NOAUTONAME_${PN}-filters-dbg = "1"
DEBIAN_NOAUTONAME_${PN}-loaders-dbg = "1"



On Sun, Jun 22, 2014 at 7:05 PM, Stephen Arnold <stephen.arnold42@gmail.com>
wrote:

> This one doesn't build with the pkg-config trick; it needs more help than
> that...  The attached bbappend is what works for me, after removing the
> blacklist.
>
> Steve
>
>
>
> On Thu, Jun 19, 2014 at 2:59 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta-efl/recipes-efl/efl/imlib2_svn.bb             | 2 ++
>>  meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb | 2 ++
>>  2 files changed, 4 insertions(+)
>>
>> diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb
>> b/meta-efl/recipes-efl/efl/imlib2_svn.bb
>> index 8bd8032..9806de7 100644
>> --- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
>> +++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
>> @@ -7,6 +7,8 @@ PROVIDES = "virtual/imlib2"
>>  PV = "1.4.5+svnr${SRCPV}"
>>  SRCREV = "${EFL_SRCREV}"
>>
>> +PNBLACKLIST[imlib2] = "BROKEN: needs to be updated to use freetype2
>> pkg-config"
>> +
>>  inherit efl binconfig
>>  SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
>>  S = "${WORKDIR}/${SRCNAME}"
>> diff --git a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
>> b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
>> index d07b143..1a6e4a0 100644
>> --- a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
>> +++ b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
>> @@ -4,6 +4,8 @@ LICENSE = "GPLv3"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
>>  DEPENDS = "ecore evas imlib2 gpsd edje edje-native mysql5"
>>
>> +PNBLACKLIST[mcnavi] = "BROKEN: depends on broken imlib2"
>> +
>>  SRC_URI = "
>> http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.gz"
>>  SRC_URI[md5sum] = "6860cde5c02a9f93c829da4b10e5a226"
>>  SRC_URI[sha256sum] =
>> "ee7f65155e91386175875fc4f72f4bc94e4e9cdb8258112632da94520ef2c349"
>> --
>> 2.0.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

