Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECEF74242
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Sep 2015 16:14:57 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so22632946wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2015 09:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:to:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=DNJ7Od/8FAOYeM7TyVh+T9aYHi993r8BWYosdApPL+o=;
	b=F4D3i2q0gJLHQRaV6iweDSZtq0stEEMGGxCuDZUH0y0YdV0JlIC/Epv3dN3tH5GztA
	NDZlhNj433sq/2TYxYOq4Kx/us/+OaE2z6pxwdvCuo6Zvq6xSLwfEeRpKp2ndL9TQJZN
	LXlfutmEGIalDxQdL47HHnfK877URrFEHvFbRdlpo0y6E5CVKCTrPKxx/nS+HaK2gkwx
	lH1NnLBkrXZeC7fQRiZ6kczl3F8VkeX+DiGcPdxXEqhm4tfbJEsgHMuxtv5GoLcZZWDH
	2w5y0coKJb5owgp7J811J8DrDtNixD5MmhM8djQiZ0wrp/HS7zsfoc7v6T572lkKvkmC
	5QHg==
X-Gm-Message-State: ALoCoQlsD3xeJv9qX+bU2YP/eF3J4+nVrVemnVz5AA6bRuGwCRQCY0zqJNvxOY4nIigt4a116+86
X-Received: by 10.194.82.37 with SMTP id f5mr9406697wjy.36.1441383297400;
	Fri, 04 Sep 2015 09:14:57 -0700 (PDT)
Received: from ?IPv6:2001:bf0:c080:401::2? (wiki.deck1.zone42.org.
	[2001:bf0:c080:401::2])
	by smtp.gmail.com with ESMTPSA id p20sm5209256wie.5.2015.09.04.09.14.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Sep 2015 09:14:56 -0700 (PDT)
References: <55E9C13C.9070308@zone42.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Forwarded-Message-Id: <55E9C13C.9070308@zone42.org>
Message-ID: <55E9C37F.4010509@dresearch-fe.de>
Date: Fri, 4 Sep 2015 18:14:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55E9C13C.9070308@zone42.org>
Subject: [meta-qt5] install problem for qtbase
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
X-List-Received-Date: Fri, 04 Sep 2015 16:14:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

We've a big problem building qtbase (from fido branch) for two machines with the same SoC in one workspace.

It seems that the do_install of the run for the second machine (which fails) destroys the image subdirectory totally. :(

Here's what we see after a clean build:

-------------------------------------------------------------------------------------
MACHINE=firstmachine bitbake qtbase

# tree -d -L 3 tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
└── usr
    ├── bin
    │   └── qt5
    ├── include
    │   └── qt5
    ├── lib
    │   ├── cmake
    │   ├── fonts
    │   ├── pkgconfig
    │   └── qt5
    └── share
        ├── doc
        └── qt5

13 directories
# tree -d -L 3 tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
└── home
    └── sledz
        └── work

3 directories

-------------------------------------------------------------------------------------
MACHINE=secondmachine bitbake qtbase

# tree -d -L 3 tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
├── home
│   └── sledz
│       └── work
└── usr
    ├── bin
    │   └── qt5
    └── lib

7 directories
# tree -d -L 3 tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
└── home
    └── sledz
        └── work

3 directories

-------------------------------------------------------------------------------------

Additionally after the second run some files are in the wrong subdirectories, e.g. the font files are located in image/usr/lib/ instead of image/usr/lib/fonts.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

