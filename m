Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 656336B7D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 21:39:27 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z11so22425lbi.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 13:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=rfEDv7pCLYal8oyVmmMP/zFPNupJGFt24gTxG7J15A0=;
	b=KZlSVqVvr5kBqTJooV9yBMyPgcX3UdrR2djHvO+UKnsoYo1IciGIA2BbDKTMYkDa54
	J5UHl/kXDBTngvXpHNQIx9Ncla2+Wx7mRx8xI0p8LaMdXbBBaKcBrfheD9GyegwJDTO9
	lyU3jiEX7BV705B38a4FYPsN+WLpe9IfeIIEH8uzqrWWe3RokEihG+BXypHkuoCtSWzp
	jd5Vro6+43zaesaxRCtDmTFtUwfoWkPQI4ozPLjqmBG0vTGBTRK25tGlplGJLUlvWiV/
	LcwiSwn9HEu1NxdoLnxx9l11g4TzxnjZ1IuPYpQPFVQI0B0T5nVpyQbFklDco9ptD2bU
	P3ag==
MIME-Version: 1.0
X-Received: by 10.112.138.233 with SMTP id qt9mr12904041lbb.34.1393277967455; 
	Mon, 24 Feb 2014 13:39:27 -0800 (PST)
Received: by 10.112.53.35 with HTTP; Mon, 24 Feb 2014 13:39:27 -0800 (PST)
In-Reply-To: <CAPbeDCmoikCwWd36zZ_8xNPECdkJm=kuVgY=7pd9shByfg_VcQ@mail.gmail.com>
References: <1393021765-4399-1-git-send-email-jacob.kroon@mikrodidakt.se>
	<CAPbeDCmoikCwWd36zZ_8xNPECdkJm=kuVgY=7pd9shByfg_VcQ@mail.gmail.com>
Date: Mon, 24 Feb 2014 22:39:27 +0100
Message-ID: <CAPbeDCmn=0pewX_47mLXADpR=pKtvxExdb-ZA-mMb__HTDva1g@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] Disable Debian-style package renaming for nativesdk-qtbase-tools
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
X-List-Received-Date: Mon, 24 Feb 2014 21:39:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 4:19 PM, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On Fri, Feb 21, 2014 at 11:29 PM, Jacob Kroon <jacob.kroon@mikrodidakt.se>wrote:
>
>> Since commit 8da5017712a7ddcb8488e095b9aa03b0273f23e9, libQt5*.so files
>> are included in the nativesdk-qtbase-tools package. However this
>> seems to enable Debian-style renaming, causing the resulting ipk package
>> to be created as "nativesdk-libqt5core5".
>>
>> Explicitly disable renaming for nativesdk-qtbase-tools package.
>>
>> Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
>> ---
>>  recipes-qt/qt5/nativesdk-qtbase.inc | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc
>> b/recipes-qt/qt5/nativesdk-qtbase.inc
>> index 3cb9b0e..e87624b 100644
>> --- a/recipes-qt/qt5/nativesdk-qtbase.inc
>> +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
>> @@ -60,6 +60,8 @@ FILES_${PN}-tools = " \
>>      ${OE_QMAKE_PATH_BINS}/* \
>>  "
>>
>> +DEBIAN_NOAUTONAME_${PN}-tools = "1"
>> +
>>  QT_CONFIG_FLAGS += " \
>>      -reduce-relocations \
>>      -shared \
>> --
>> 1.8.5.3
>>
>>
> Now that I think of it, would it be a better idea to somehow handle this
> in debian.bbclass ? Or would that break too many existing package names..
>
> Looking closer at debian.bbclass, it seems that the function
auto_libname() fails to detect that "nativesdk-qtbase-tools" contains
binaries,
since the actual binaries are installed under "bin/qt5/" not "bin/", and
the regexp used for detecteding binaries is ".*/s?bin$", which won't
produce any matches.

  -- Jacob

