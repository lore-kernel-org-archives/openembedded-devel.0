Return-Path: <yisooan@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1EC79327
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 03:52:44 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id f6-v6so3522365plo.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PXhxYEJ35K5JB27wmVXW9yXNI1D5eRDgKLmKYJQEu3o=;
	b=j+IbH342lwGgdXEXN8q3zbN0V5hDivZF5RrH5sVhwRTQrGfZE5TkyaSezVs8pZGchV
	dZrAofFBphleW/5yIQd221NrAPXHyEx8suaZAAfg97af7de+MkFIlnejo27nOHDTsL4O
	aAFo6DvYj7rBXbRSHHvQXwl3Ioc2GS5yK76+68umUQgmbjlTLWLAaqOIs9LQz0Y5HpuV
	AKBXXKojyPyYW4XEjerdNKXvXzZUpyAu/mC3IaVyGLiRg4yqgpu1DrjJFYVZCxFE6oLj
	1FQSmvfIW9T69vGXFP4wDQk0OdNs+4ehqQlkJ0bJ3uu57IGMRWJE4WE9elvPOogFECT0
	Qhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PXhxYEJ35K5JB27wmVXW9yXNI1D5eRDgKLmKYJQEu3o=;
	b=lzW4GCktSTL/R3I1yWW2ryHe0xUiLj57zjhkUacVTIZszgPTqe7PZxjjpa0cKuiO31
	2kzhp9XQbpOKthzyJR4nnHKkN1QdbqJ86Se3n4B9OZ6uMXJlnsMxVfOP7Gll9XHxPzUS
	/hyq00C6OGdUdawA45j8wk68BkLipXabnTptwLFQyK2KmJgsneNTqxUabBpIr/JcPuYO
	N6CAEWOGaG69i6931AIMVf2ey+Dm7f0kqBILKF4Amvu0Pxt5viPZhRZyxwrbB875wba+
	jT86LoCuC51FSk/ct142T2Bl9l+/5fO+pWfdbn37eQI7uzen2imFlHUnyjz0L7BTEYG7
	Rsfw==
X-Gm-Message-State: APzg51AZG0LyLOSUI8x7dFNClJ+M8iHDtW1ag74bkoTkdPSyrrmq0vPe
	ZeZszQj1CX/NWpL2zIFXMUwGIGEJPXRneA==
X-Google-Smtp-Source: ANB0VdaJKTtMDiSdTduqVcrzVmCJVHlE36rm11quWy/ybWOHjAiqSpCAY0J0gY8tRHOdtMQ5NXZ3ag==
X-Received: by 2002:a17:902:683:: with SMTP id
	3-v6mr11486604plh.52.1535341965113; 
	Sun, 26 Aug 2018 20:52:45 -0700 (PDT)
Received: from localhost.localdomain ([118.42.82.236])
	by smtp.gmail.com with ESMTPSA id
	203-v6sm16910939pgb.14.2018.08.26.20.52.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Aug 2018 20:52:44 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180826045735.7732-1-yisooan@gmail.com>
	<CA+chaQeMuN4+wxyyA_jvJonCtSiLO614uWt7LqjvK3CwBeo2Lg@mail.gmail.com>
	<c25b4db3-f7c9-1de7-d5df-a9c6b9320168@gmail.com>
	<CA+chaQevzQwz6Yg2NDbRUeQh86P+6PUrMppzE1jCQis0_=J9uA@mail.gmail.com>
From: Yi-Soo An <yisooan@gmail.com>
Message-ID: <be85a891-7fcb-cb6c-f4f7-c26c62460746@gmail.com>
Date: Mon, 27 Aug 2018 12:52:42 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQevzQwz6Yg2NDbRUeQh86P+6PUrMppzE1jCQis0_=J9uA@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][morty][PATCH v2] libconfig: fix SRC_URI
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
X-List-Received-Date: Mon, 27 Aug 2018 03:52:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Thank you for helping :)

On 08/26/2018 09:15 PM, Martin Jansa wrote:
> Using git fetcher is fine, but don't use tag parameter nor tagname in 
> SRCREV, use git SHA which matches the tag in SRCREV.
> 
> Otherwise bitbake fetcher will still need to access then network every 
> single time to map tag name to git SHA used internally.
> 
> On Sun, Aug 26, 2018 at 1:34 PM Yi-Soo An <yisooan@gmail.com 
> <mailto:yisooan@gmail.com>> wrote:
> 
>     Thank you for the email.
> 
>     I have a question.
> 
>     Since hyperrealm has moved to github and the library is maintained
>     there.
>     Is it better to replace the current SRC_URI with git? as below.
>     SRC_URI = "git://github.com/hyperrealm/libconfig.git;tag=v1.5
>     <http://github.com/hyperrealm/libconfig.git;tag=v1.5>"
>     archive seems to need extra information, like checksum.
> 
>     Best regards,
>     Yi-Soo An
> 
>     On 08/26/2018 03:00 PM, Martin Jansa wrote:
>      > Don't use github archives which are regenerated from time to time
>     with
>      > different checksum.
>      >
>      > To fix it in morty all newer release needs to be fixed as well
>     and then
>      > the fix backported to morty (or explained in commit message why
>     the fix
>      > is needed only for morty).
>      >
>      > On Sun, Aug 26, 2018 at 7:01 AM Yi-Soo An <yisooan@gmail.com
>     <mailto:yisooan@gmail.com>
>      > <mailto:yisooan@gmail.com <mailto:yisooan@gmail.com>>> wrote:
>      >
>      >     It causes a fetch error since hyperrealm has moved to github
>      >     and the current SRC_URI is not available any longer.
>      >
>      >     To fix the error, use github repository.
>      >
>      >     Signed-off-by: Yi-Soo An <yisooan@gmail.com
>     <mailto:yisooan@gmail.com> <mailto:yisooan@gmail.com
>     <mailto:yisooan@gmail.com>>>
>      >     ---
>      >       meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>     <http://libconfig_1.5.bb>
>      >     <http://libconfig_1.5.bb> | 8 ++++----
>      >       1 file changed, 4 insertions(+), 4 deletions(-)
>      >
>      >     diff --git
>     a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>     <http://libconfig_1.5.bb>
>      >     <http://libconfig_1.5.bb>
>      >     b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>     <http://libconfig_1.5.bb>
>      >     <http://libconfig_1.5.bb>
>      >     index fb6e50e51..a0b3a9471 100644
>      >     --- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>     <http://libconfig_1.5.bb>
>      >     <http://libconfig_1.5.bb>
>      >     +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>     <http://libconfig_1.5.bb>
>      >     <http://libconfig_1.5.bb>
>      >     @@ -1,14 +1,14 @@
>      >       SUMMARY = "C/C++ Configuration File Library"
>      >       DESCRIPTION = "Library for manipulating structured
>     configuration
>      >     files"
>      >     -HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
>      >     +HOMEPAGE = "https://hyperrealm.github.io/libconfig"
>      >       SECTION = "libs"
>      >
>      >       LICENSE = "LGPLv2.1"
>      >       LIC_FILES_CHKSUM =
>      >     "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
>      >
>      >     -SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz
>     <http://www.hyperrealm.com/$%7BBPN%7D/$%7BBP%7D.tar.gz>
>      >     <http://www.hyperrealm.com/$%7BBPN%7D/$%7BBP%7D.tar.gz>"
>      >     +SRC_URI =
>     "https://github.com/hyperrealm/libconfig/archive/v1.5.tar.gz"
>      >
>      >       inherit autotools-brokensep pkgconfig
>      >
>      >     -SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
>      >     -SRC_URI[sha256sum] =
>      >   
>       "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
>      >     +SRC_URI[md5sum] = "e92a91c2ddf3bf77bea0f5ed7f09e492"
>      >     +SRC_URI[sha256sum] =
>      >   
>       "cae5c02361d8a9b2bb26946c64f089d2e5e599972f386203fbc48975c0d885c8"
>      >     --
>      >     2.17.1
>      >
>      >     --
>      >     _______________________________________________
>      >     Openembedded-devel mailing list
>      > Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>      >     <mailto:Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>>
>      > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>      >
> 

