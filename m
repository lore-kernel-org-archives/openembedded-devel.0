Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.27987.1585184132952019031
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 17:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D2UeQgO7;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id u10so5800748wro.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2020 17:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=asjVBrpAVEpvNqlCV366fKABJc3O8ajkOBVmhOg9jVc=;
        b=D2UeQgO7cuvEn4jIja8NEsFqxStCJAxKo2zZ6pSI2C7ssCg2ktIt13eOPNIMxCh8GZ
         O0JGXf4ChVbqyqNheDyvt2Yld55J7iimvPNsSMYpGcMrKDSexh6JExecX17H+9wBy0Xu
         hi/gPM/yNgnJtiq/Pc9CZD0Zm4MG2a78NaYhADbMyQl5CY2k9YghBBB73WVWPZWAwyBD
         dmYXRhwUZxS1ZuQ3WESGNKsTOqY2aWGD2qNnZz+vQTBUqkkOYXL45beVdnB4WvH48bNZ
         UhtqSrG5vvIvVw3T96KYOLUEgmexmSP32px/ZHfFY2uFidZQda6CWfsI2FovWGUEAmfF
         e/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=asjVBrpAVEpvNqlCV366fKABJc3O8ajkOBVmhOg9jVc=;
        b=c47g7PNKATMOHubasvnpwVTcUP2ftPrBdVSeTV92NtbZba3oQswJjp8THAvmU5Fo40
         ChdxGBOHk0iR7tAC2aKG87XN4llkp+/j6Qv6d1m0n/ZYKla7nSNSiEH7pFXeSCn7FEN7
         nH0mqaobrgUH32OG7t2dm29ZNkqpNZEF0PzAFeUl8lXCOGX5WcY3BVaK2TL2u2MOsPFL
         rhGzIqk7VweHm0RxHgcNFWgXYSHHtyiTtSSow39hk7tuvCsce1RvJ8et6i9jij0gzJHY
         bkJE9C5Zl1orKq1Ii4kv0oO+8n3nPbnc4DHzGZMs9AHLQeWyKxL8/OujKKSyZSsvweuh
         EV5A==
X-Gm-Message-State: ANhLgQ3wISlMk8kq6xz7EpelgmKdoi6/w+C2VL56zEmFIQ1kgygkaJLg
	aVg2Da31Byzo6UHr+mq1YAs=
X-Google-Smtp-Source: ADFU+vs5X/z3uYyG1HttPDEE7mLn6rUdpGYP+3PADf4z/byzGy4ZzpC2/S5v/kopyqDbWio+MPhJAg==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr6637971wru.390.1585184131086;
        Wed, 25 Mar 2020 17:55:31 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c7sm1065342wro.75.2020.03.25.17.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 17:55:30 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 26 Mar 2020 01:55:29 +0100
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-qt5] qtwebkit 5.15 update failure
Message-ID: <20200326005529.c77siajyzfgxdc4a@jama>
References: <20200326000257.GF1578@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200326000257.GF1578@denix.org>
User-Agent: NeoMutt/20180716
X-Groupsio-MsgNum: 83513
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d7d7djantrpakz6g"
Content-Disposition: inline

--d7d7djantrpakz6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 08:02:57PM -0400, Denys Dmytriyenko wrote:
> | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVid=
eoHandler.cpp:116: error: undefined reference to 'QWebFullScreenVideoHandle=
r::qt_metacast(char const*)'
> | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVid=
eoHandler.cpp:121: error: undefined reference to 'QWebFullScreenVideoHandle=
r::qt_metacall(QMetaObject::Call, int, void**)'
> | Source/WebKit/CMakeFiles/WebKitWidgets.dir/WebKitWidgets_autogen/mocs_c=
ompilation.cpp.o:mocs_compilation.cpp:WebKit::DefaultFullScreenVideoHandler=
::staticMetaObject: error: undefined reference to 'QWebFullScreenVideoHandl=
er::staticMetaObject'
> | /usr/src/debug/qtwebkit/5.14.99+gitAUTOINC+ab1bd15209-r0.arago8/git/Sou=
rce/WebKit/qt/WidgetSupport/DefaultFullScreenVideoHandler.cpp:45: error: un=
defined reference to 'vtable for QWebFullScreenVideoHandler'
>=20
> FWIW, it was building just fine before the update...

If you care about qtwebkit, then please send patches for this.

--d7d7djantrpakz6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXnv9gAAKCRA3VSO3ZXaA
HMIvAJ9W0s7sb6sVTB/lbAUQL6KCUSul8ACgmc7jIkTXyGLnXW8JnBH1CO3pwOs=
=l1Qx
-----END PGP SIGNATURE-----

--d7d7djantrpakz6g--
