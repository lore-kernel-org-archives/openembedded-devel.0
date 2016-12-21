Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 777797736F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:06:16 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 50so17352597uae.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ofRvH+uI+By7bFH75lOjYcEbt/CcYaCGJxtnldFp0Jo=;
	b=S6zsneiaBRs2Y9fa4sE+e77GIYGYBOCIjnvVzT9Q1kxGD9OISjj+a5MjEsrXPfuAIv
	LJq/HvDfe7iMRkVsTkIuuAVpca5sOvk3REbzG6i95ZI20qmyh0VwhnINnf30LuZkF2ki
	OfE3MfP0qIKp6S8XXQ7KMEBtrp2EuekDZHtYill0o91CTP/vPjv5DSjhgdBKNPy6rDx6
	TIK4jExnbxLgzoOru8B+BS0LcFVvMNlOle8RKWjHo9Cuv1TSbaYPvITofBHFKKFcmo3N
	7SodDFWzS9UR6RH6XS+XP2k24KybBkpeHuBqZvztJLSdb+Zwfts97bz3WjSIG7sgjjEB
	MWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ofRvH+uI+By7bFH75lOjYcEbt/CcYaCGJxtnldFp0Jo=;
	b=NsTx+weJq3yngOajDR86iovsnGgRk8/+Zls8Y7gAbcccRavoBUrDApDrfufP5eiWg8
	0XwmgMUnmS5ZgQTNj/YGeyFQilmBmDhzT6+pW+i7FuN+IngKAz98o3BojvXytGXyFi6l
	lR+4ptfRyJ0X4uqPArlLb4J2elfnFI+RigS6HCMqxjaEuh0CnFFVO9W3EPQApfxknVOd
	lCJS3oYc4ZyU2USe/eCWj+iiIck9mf711L3Ga/8B9OmUX7QqcE+CPx7dL6+XZiIT8U/I
	r61tje5+OGmN809IoRnYGqzBQvv4EMSFbKspe14pz6l/iuHpm1Y7Dz0alrCuqHIJ7joz
	9l7Q==
X-Gm-Message-State: AIkVDXJU27Negwn/lHdqwBhJt1bTAA0UX+v5RcvDJGhdX0lKyVYOOJTx11k9/JnsphgczPZGaLuigxNZpqabxQ==
X-Received: by 10.176.0.180 with SMTP id 49mr2612444uaj.32.1482300377402; Tue,
	20 Dec 2016 22:06:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 20 Dec 2016 22:05:47 -0800 (PST)
In-Reply-To: <20161220124624.GD3275@jama>
References: <20161220053351.4499-1-raj.khem@gmail.com>
	<20161220124624.GD3275@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Dec 2016 22:05:47 -0800
Message-ID: <CAMKF1sqbxTeJ4R7-7A8NAUebKOj571B6_StxsvJdgkFN9LjMnw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2] yajl_1.0.12: Add recipe for yajl1
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
X-List-Received-Date: Wed, 21 Dec 2016 06:06:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 20, 2016 at 4:46 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Dec 19, 2016 at 09:33:51PM -0800, Khem Raj wrote:
>> yajl1 and yajl2 are not ABI compatible, therefore
>> add a recipe for latest release of yajl1
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../yajl-1.0.12/0001-bump-version-to-1.0.12.patch  | 25 ++++++++++++++++++++++
>>  meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb       | 21 ++++++++++++++++++
>>  2 files changed, 46 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-version-to-1.0.12.patch
>>  create mode 100644 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
>>
>> diff --git a/meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-version-to-1.0.12.patch b/meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-version-to-1.0.12.patch
>> new file mode 100644
>> index 000000000..5e8aef051
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-version-to-1.0.12.patch
>> @@ -0,0 +1,25 @@
>> +From 17b1790fb9c8abbb3c0f7e083864a6a014191d56 Mon Sep 17 00:00:00 2001
>> +From: Lloyd Hilaiel <lloyd@hilaiel.com>
>> +Date: Mon, 25 Apr 2011 12:56:24 -0600
>> +Subject: [PATCH] bump version to 1.0.12
>> +
>> +---
>> + CMakeLists.txt | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index 727a488..c703244 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -34,7 +34,7 @@ PROJECT(YetAnotherJSONParser C)
>> +
>> + SET (YAJL_MAJOR 1)
>> + SET (YAJL_MINOR 0)
>> +-SET (YAJL_MICRO 11)
>> ++SET (YAJL_MICRO 12)
>> +
>> + SET (YAJL_DIST_NAME "yajl-${YAJL_MAJOR}.${YAJL_MINOR}.${YAJL_MICRO}")
>> +
>> +--
>> +2.11.0
>> +
>> diff --git a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
>> new file mode 100644
>> index 000000000..f8451a406
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
>> @@ -0,0 +1,21 @@
>> +SUMMARY = "Yet Another JSON Library."
>> +
>> +DESCRIPTION = "YAJL is a small event-driven (SAX-style) JSON parser \
>> +written in ANSI C, and a small validating JSON generator."
>> +
>> +HOMEPAGE = "http://lloyd.github.com/yajl/"
>> +
>> +LICENSE = "ISC"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=da2e9aa80962d54e7c726f232a2bd1e8"
>
> yajl1 was BSD:
> https://github.com/lloyd/yajl/commit/de81b1fcd22b29b152f921f23faab759c79da7e1

sent a v3

>
>> +
>> +SRCREV = "6a8906d409dfe6dd3f1e01ed066aa162b1729cec"
>> +
>> +SRC_URI = "git://github.com/lloyd/yajl;branch=1.x \
>> +           file://0001-bump-version-to-1.0.12.patch \
>> +          "
>
> This should be better than adding local .patch:
>
> # corresponds to tag 1.0.12
> SRCREV = "17b1790fb9c8abbb3c0f7e083864a6a014191d56"
> SRC_URI = "git://github.com/lloyd/${PN};nobranch=1"
>
>> +
>> +inherit cmake lib_package
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

