Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.1343.1592592177952975733
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 11:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oZRIikLF;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id l12so11193914ejn.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 11:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=+dUvUPukToS+s9ROeScLz0VNh9cXvQTwoCfiUfRpqMA=;
        b=oZRIikLF4TykKOITGUUHCViGDTRtAnZGe6TESmVcbR4mMsyBdUPCBHfs+M65wQRDFR
         xohMlM3xMG2OYWZZsgLFkrXx5Fir8URwk7w/LRKs4Nc3p4PSgPGO+jfbYAjDNINqAqnA
         T3WxiBhy+1uaAsutNXA7bR63Bdo0LPxS7iX54PsHMk92HRAjrvvWsewpoWsgvJPqFhFC
         pGaNB8O7V4B8+b4/TbAkyxOyw337dMGcDR3/mQRa+Cbeqr822ed/k4sw0vdhBJO0yG4h
         7uZKhGdvjVCTyAs4M0jZzO6tO5L34BpH8BP6foueEklfQFkg86iklZ++fvD6/LyKRbWc
         Y4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+dUvUPukToS+s9ROeScLz0VNh9cXvQTwoCfiUfRpqMA=;
        b=Fwuu790xmTppKXH0s51HLl7mXj+W3PQryyZX7hWq4mKMcU0v70pYBpeYyh/zltip2e
         8sGwlsprgVJkRWTAUWBZpskELqE9G3Igmje/OqRY0xqyISwdYYrvLz1H6OfA3IGapGIo
         hTcCxHVPdSuSXsNUFbc0u4uM9YnlBV2HlWO6g9nI2vjCPSSN30wpxaCE1Tl59613vu9E
         ar61ckAlBL+AC2OBqsmVBCWSu5bXX1RTcJUbExknQhP6weCHZghpNiSOvF8OD4GfWE67
         QRPUgtzsOzu0Gma1tzWw4LNEfdyhlKKLSUJJ1lQ0i+oRurMyXLuJS5lt+1uRcx0N7z7y
         aX9g==
X-Gm-Message-State: AOAM531Rn7zZjc/G8L+NSS/gat9wG+intdM1mlurt80xPg8R5/eiuB03
	pddpgceBe+eC8C2BfyafBaI=
X-Google-Smtp-Source: ABdhPJz/RSG0ZzL/98XZJuy64s/Ycg41qKjEJ9T7J3paqDGLslc0W9d8QT+DvQwRSEi24Ps55VkIXA==
X-Received: by 2002:a17:906:ca0e:: with SMTP id jt14mr4788327ejb.325.1592592176254;
        Fri, 19 Jun 2020 11:42:56 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2pfrec.lan.ffah.ch (c-82-192-240-69.customer.ggaweb.ch. [82.192.240.69])
        by smtp.gmail.com with ESMTPSA id o7sm5355378edj.52.2020.06.19.11.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 11:42:55 -0700 (PDT)
Message-ID: <ae55c23bdbdf22311e7309f15fb93b2997f6ae69.camel@gmail.com>
Subject: Re: [oe] [meta-network][PATCH] squid: upgrade 4.9 -> 4.12
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jun 2020 20:42:54 +0200
In-Reply-To: <2345fb9e-e2a3-d89c-5978-6cc33168456b@gmail.com>
References: <20200619154506.43803-1-adrian.freihofer@siemens.com>
	 <2345fb9e-e2a3-d89c-5978-6cc33168456b@gmail.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Khem

Please ignore the patch. A bit-equal version is already on master-next.
Andreas Müller did the same as I, just few minutes earlier.

Regards Adrian

On Fri, 2020-06-19 at 09:01 -0700, Khem Raj wrote:
> Hi Adrian
> 
> On 6/19/20 8:45 AM, Adrian Freihofer wrote:
> > ---
> >  .../recipes-daemons/squid/{squid_4.9.bb => squid_4.12.bb}   | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-networking/recipes-daemons/squid/{squid_4.9.bb => squid_4.12.bb} (95%)
> > 
> > diff --git a/meta-networking/recipes-daemons/squid/squid_4.9.bb b/meta-networking/recipes-daemons/squid/squid_4.12.bb
> > similarity index 95%
> > rename from meta-networking/recipes-daemons/squid/squid_4.9.bb
> > rename to meta-networking/recipes-daemons/squid/squid_4.12.bb
> > index 19949acd8..6e49790fe 100644
> > --- a/meta-networking/recipes-daemons/squid/squid_4.9.bb
> > +++ b/meta-networking/recipes-daemons/squid/squid_4.12.bb
> > @@ -28,11 +28,11 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
> >  
> >  SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
> >  
> > -SRC_URI[md5sum] = "b315d0dce37627dfe61eec7f5304baaf"
> > -SRC_URI[sha256sum] = "0f5829d878002147e7c4d9b8901c2c3c051693465e82e45cef9ab0e226e3e729"
> > +SRC_URI[md5sum] = "5d058f7f8f1db9fa4ce3db910a008b0e"
> > +SRC_URI[sha256sum] = "eae0ad993921e472ce36cce34674c47a224fc2868b65ef0c4b41b2f5f18378a0"
> >  
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > -                    file://errors/COPYRIGHT;md5=19cc4dd146f397e72f3ff6f9f58fbfbe \
> > +                    file://errors/COPYRIGHT;md5=4c3268f394af77fbbf541875cef96a6c \
> 
> Please document the reason for this change in commit message as well.
> See [1]
> 
> >                      "
> >  DEPENDS = "libtool krb5 openldap db cyrus-sasl"
> >  
> 
> [1]
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Describing_license_changes

