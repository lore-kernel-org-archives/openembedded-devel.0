Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5443275D4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 21:24:57 +0000 (UTC)
Received: by ioll68 with SMTP id l68so93897438iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 14:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0xDRg6gWRPxNmj12SOe4ePzJVMOCMb3V8iGnPvXvD+0=;
	b=ryhAzNeuntC9WVbvYICQP4cVqgUws1dONtbTGLMsrRLAx942Dot1i4kc/r9M6LcErx
	jUNAYz+qfeJRHrsgk/fLm26YMLdk67YVre2hY3ijO1n6krW9ahpFqFNefNKs3Pg+1jC5
	RWRcHUhZ+FDVZEEUZK2BQ2ZIeKiJMpNnpL/ag5XETl7uvTir4+VvC9ac77hdPiwTbGSH
	OeOBgFzq2GojGSFCE1I+oE53NKLM1Obv0kMOpExGfDOQ0OEoybDNAIjgdPqDsPPz/OSx
	B26iA76VDuUOnpI/ZVcj0iVs9+dO5b5c2zG6kMRK0MTcxx0HGDUgE7KcY8JdNPr6CdH4
	B4kg==
MIME-Version: 1.0
X-Received: by 10.107.30.207 with SMTP id e198mr11791684ioe.99.1446240297135; 
	Fri, 30 Oct 2015 14:24:57 -0700 (PDT)
Received: by 10.36.31.131 with HTTP; Fri, 30 Oct 2015 14:24:57 -0700 (PDT)
In-Reply-To: <CAMKF1spmiD9ohoORXi7wnLBFNOFKeG0vgdpJ_n+-5b8-gp_F3A@mail.gmail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
	<1446207225-15386-14-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1spmiD9ohoORXi7wnLBFNOFKeG0vgdpJ_n+-5b8-gp_F3A@mail.gmail.com>
Date: Fri, 30 Oct 2015 22:24:57 +0100
Message-ID: <CALbNGRTL5Q-enOj1dp4kZvu1=122ebseTizbhh+ondfH31ieHw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 13/13] fontforge: avoid cloning uthash during do_compile
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
X-List-Received-Date: Fri, 30 Oct 2015 21:24:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 10:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Oct 30, 2015 at 5:13 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb | 11 +++++++++=
--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/=
meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>> index eb40eaa..21f955f 100644
>> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D " \
>>      file://LICENSE;md5=3D3f922b42ed0033fa0fd4cd3268f6429c \
>>  "
>>
>> -DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
>> +DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uth=
ash"
>>  DEPENDS_append_class-target =3D " libxi"
>>
>>  inherit bootstrap pkgconfig pythonnative distro_features_check
>> @@ -20,7 +20,14 @@ S =3D "${WORKDIR}/git"
>>
>>  EXTRA_OECONF_append_class-native =3D " with_x=3Dno --disable-python-ext=
ension --disable-python-scripting"
>>
>> -EXTRA_OEMAKE =3D "CFLAGS=3D'${CFLAGS} -I${B}/uthash/src'"
>> +do_configure_prepend() {
>> +    # uthash sources are expected in uthash/src
>> +    currdir=3D`pwd`
>> +    cd ${S}
>> +    mkdir -p uthash/src
>> +    cp ${STAGING_INCDIR}/ut*.h uthash/src
>
> why not teach the component's build system to refer it from sysroot
> and avoid copying this.
Simple answer: This solution is far more simple: Headers are exactly
there where Makefile would put them by cloning. Have no idea how many
files expect a fixed location for the uthash headers.

Andreas

