Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.1691.1585259267895228698
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 14:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pWH0PCmc;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id e11so8698234qkg.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 14:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbWOMPLZpaC69jtZHz5kSp0zWe74pvuUCmYI8H1jZLc=;
        b=pWH0PCmcTNrv3RTVQ+U3o+0qV0puJTRBV3MKRw6mTEjeM3Sw64AFuHrpVL4Ckghh7J
         n1gMPgwU8DdD1vyp/IDdVW4kOSgFcniub4z0S1GxkrFsIfTIz5fz1FaKbOezM2W6m4YW
         hj42CHGoxV+1UKiFQxw8y2UPqqi5HlQfjNVpiFxSBtFJLKW1IsWcyA2CBNv7m4Ili/Jw
         5qedA2MV8R4GJyHRYzRihTRPxtIUjKyML9RJiz3nQq34qMBcN5a0fYYPkav/bPqLP2Ia
         hKkH3k2ENM/gazxXih2oyzMFIdRI45Qat/cwGnXis8EQWpL9qHXRtAlkr8uTR3OitGCo
         c4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbWOMPLZpaC69jtZHz5kSp0zWe74pvuUCmYI8H1jZLc=;
        b=jpr0RzftiUsOeSqpKmQHFD2s28jn0Bj4eiGqzAK4Yu1SKoIIL0LIDL6WZPFNG4EZi/
         ES+9trO2JBEc5TKlIUut63+ZRCR185LLznyp2wh6wC0S4qWxLvLPpD+GxGOP9xPsI9Ho
         rLmmeFWEvMUnmYPGG2UekMn0KJOGql8YE1kNXofCOZ8Fz1zjL92FGqoJGLdCu+9HWXPE
         d/wLuKZ1ORWcUxxKl4nZavgrR86A/FxVwqR8pxKDGdtuaHH6xvmNeSTXsPYsNzptG3h0
         0Mv0oJQBnlKBdQxAm3Y7+QrA0CtJtDoQM3QU/Tb1/X3MocFdEdhEjXiWx2liTN+Sah8r
         Mbuw==
X-Gm-Message-State: ANhLgQ3EyrEjP3tXLPV4x7S/48rQCSIDP+zN6gHnpzNq3RPUYFHVImrj
	hpYwnDZxrA/aAVtFrJWmEkosFgGDSPOAVMB2AIW7awUn
X-Google-Smtp-Source: ADFU+vtn36QEec77Gd4oEnFM11r2ZD9i1UkWuoN0woKVkomLeaXl+YIzKMP5v9Sk0gz54dy5i/q8nBwMfxnLKTcyrqY=
X-Received: by 2002:a05:620a:22b:: with SMTP id u11mr10928103qkm.225.1585259266683;
 Thu, 26 Mar 2020 14:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200326000440.GG1578@denix.org>
In-Reply-To: <20200326000440.GG1578@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Mar 2020 14:47:19 -0700
Message-ID: <CAMKF1sq15BM1_Bmhx-_3gapap7c+ueshijPTXsFE1qWtt8zpzA@mail.gmail.com>
Subject: Re: [oe] [meta-qt5] qt3d patch failure
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 25, 2020 at 5:04 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> 0001-Allow-a-tools-only-build.patch this patch no longer applies for qt3d
> after the update and fails do_patch()
>

seen that too :)
> --
> Denys
>
> 
