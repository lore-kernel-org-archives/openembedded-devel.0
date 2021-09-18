Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.2255.1631992229170315365
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 12:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F44TrrgA;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id h3so13123480pgb.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 12:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=8z+6ygBhE+/zOwKXMv93BN2TRKFaeO3eZISqZX/pMsA=;
        b=F44TrrgAIjS6vIGlfE4eZ3BuHDKHam0RMRxSspG4tXRcdTyKt4Z2j3wb2sKT2HH5dQ
         WfGVJ5ulPjzWd/vXswwfXTdt+ymuLZjiBUAwxrqA2CtiePOhniSSghdJUllSPflZZwMG
         nVv2GzfDrEawuKYlXNO9pleqzA4V4usYe6QR1iFGGp89wWt46gO1Vu7tlRk/KYfTggX+
         XnriP7lva4CjSisP7Bektzh/G2fpVWtaru1dYPKiIkoTrCaX7hcR3GtiPcTKQL2fhkNm
         HxszUntXbqrVrGUyNduMCecwRmvTOh71UVq/03Q7lIIHiPYIysMvDS8y++I79IRUIauW
         YHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=8z+6ygBhE+/zOwKXMv93BN2TRKFaeO3eZISqZX/pMsA=;
        b=n/janLfO/Bh3dipVCHR5b3oGTxlr+4JiLRSy5GCpVDysqa/UBXP3bZFu+D0Odf4j6A
         iYmfxy3F+eBLVWRWD/1R4p1Bn2cK9xOd4D1UkkTEk/rQW2K0UvPdxEJrpp3BY/PBYbEr
         KCbQ75nQTUQslT6tuU78eXzjWbyGy+eLDc7NNjSRakEjuEurZaQ2wcfg84K7d9DpdTMB
         JrjK5OgAjudw4uK8Y1MWrZuVySJOO48xYoTS6B16UJ2na02F7y+S1z08nRGiCcSe4UyI
         7h81UtVpJ1iadthnou8LId2GQRG/nHYGRqLUGMUM+5j/Ifc8TvXpnpyPRjDm1KaRoEq9
         qCyQ==
X-Gm-Message-State: AOAM533yoVigeDErTuzUDJs8KmXWvMd8/k/uMb1xzVR+TlWkmD3Yd1Vu
	h4XbCkmDYB+mzoz59gRLn+cFXB84HOI=
X-Google-Smtp-Source: ABdhPJz7V7mzzS/2XpDL8HTuAp8vnXNaWJJiP+7c/wHAyzbL1C+hu4RPK7sSroZ5sQJm1jX9FFsoDw==
X-Received: by 2002:a63:741b:: with SMTP id p27mr16089769pgc.140.1631992228478;
        Sat, 18 Sep 2021 12:10:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:f923:d379:e6c9:abf7? ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id 11sm9119820pfl.41.2021.09.18.12.10.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 12:10:28 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: meta-networking: fping license
Message-ID: <01841159-90c6-ba5f-62e6-b4e5859a770e@gmail.com>
Date: Sat, 18 Sep 2021 12:10:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

The LICENSE listed in this recipe is "BSD" and it clearly is not that
nor could I find the below wording matching any of the BSD variants (
Not a Lawyer). Now that SPDX data can be generated easier from core,
this may barf with the invalid "License".  This is the last outstanding
invalid BSD license in meta-oe and if anyone uses this package, maybe
you can dig into finding out what the proper license should be.

- Armin


Constance of 'COPYING':

* Original author:  Roland Schemers  <schemers@stanford.edu>
 * IPv6 Support:     Jeroen Massar    <jeroen@unfix.org / jeroen@ipng.nl>
 * Improved main loop: David Schweikert <david@schweikert.ch>
 * Debian Merge, TOS settings: Tobi Oetiker <tobi@oetiker.ch>
 * Bugfixes, byte order & senseful seq.-numbers: Stephan Fuhrmann
(stephan.fuhrmann AT 1und1.de)
 *
 * Redistribution and use in source and binary forms are permitted
 * provided that the above copyright notice and this paragraph are
 * duplicated in all such forms and that any documentation,
 * advertising materials, and other materials related to such
 * distribution and use acknowledge that the software was developed
 * by Stanford University.  The name of the University may not be used
 * to endorse or promote products derived from this software without
 * specific prior written permission.
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
 * WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.

