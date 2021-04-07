Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.111.1617835285748344447
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iOzvH3mE;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id g15so317738qkl.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Dl2eC67wlIk3MaD7l4WQnDtJ6KX7kJdzmR0XdeASEII=;
        b=iOzvH3mEmVCktODFqAMMtI7H2BwenAtxNK51va7YBF1WAwnABIbyIWZ1nOnWzBHrgZ
         wGR4G6hiyfNG3BstUi9wI74Aa+vPcc5BJYfREwSxcauSnCKlusNPrDj4hcUWCV0ojKr8
         3V9gFGrKX314d2nIwhN+x9n8uKb/kOOJMOM3qMIc3dVvlM6KXHhQF1hnXOotBxHjZf1g
         BE453rDDCuSqCI0Ux9WWVovnsJgbQy0w+qi517DbQMWk/XmATG376ZrBISQB3tHafl1W
         sSS5+sWpttmzgXd8eONIduGN56LvYqj2hYFMJlk5Jw6blO2OCe6DyIkCkToAyHauFAyG
         NjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Dl2eC67wlIk3MaD7l4WQnDtJ6KX7kJdzmR0XdeASEII=;
        b=b0ui1vMhhN0cF0LVvGwP+bussPu3Fxa3Maacsu4YX+Z4/G7J0q/48ZFSILh3n5mxIj
         P7uHb0FXPKEsMWmDCUxSvFI/e2QUojzy4GUglEp8/zgkPZTaQvINCIb6p4gOK5L7Ghh8
         FWSHffHfvsPH+eavGb70H5R31wATav0POIVR6q8CVCe7DErFxpBM8WCVCpzUcdEUcnse
         wDkr3IB8cnLjuEtadMj76ws7ieA166guNn70MNX41xQX/SeTGzl2cQciiBaiTGqCbtOH
         yTwKTxxiUWWRfJ4aiXfKc/PHGhGZHAPew2VMrHTeitNF0UvuhU2qIMvhKHPL6b76Vo+H
         Fscw==
X-Gm-Message-State: AOAM531i5otu6xgOPC9jlKp7NFkFiujGVXJslnp6W9Tx37T5bO3W3rp4
	lLWxIw4zAxVROkp8fiY39+yi0YE3HoEoj2sGZCU=
X-Google-Smtp-Source: ABdhPJxE0MiHCuWIanfqPiZ+aIBpJSVFEXghozEQfMg4t1QrV/ve2/9t6lzYK/HrY6vlW+KCzx/bC3dYhI+ErnW2gIk=
X-Received: by 2002:a37:a350:: with SMTP id m77mr5416496qke.146.1617835284786;
 Wed, 07 Apr 2021 15:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210407221829.606871-1-schnitzeltony@gmail.com>
 <20210407221829.606871-2-schnitzeltony@gmail.com> <CAMKF1soK2QREb8XkTanPJQ_bCOQRAGTeng5iiuf1_D_WUwfpwQ@mail.gmail.com>
 <CA+chaQe8OauKrne0mB1sbZ2Ct46+qTwzkbjqzoFCCC3f16HisA@mail.gmail.com>
In-Reply-To: <CA+chaQe8OauKrne0mB1sbZ2Ct46+qTwzkbjqzoFCCC3f16HisA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Apr 2021 15:40:58 -0700
Message-ID: <CAMKF1spGShXGZUcghg6vm=mx4=8U4DRsLKT+zJOKKJ7ASF78TA@mail.gmail.com>
Subject: Re: [oe] [PATCH] networkmanager-openvpn: Fix packageing
To: Martin Jansa <martin.jansa@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yes infact, Thanks Marttin, I was looking at wrong local tree myself
:) and wondering.

On Wed, Apr 7, 2021 at 3:32 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> isn't this one already in master?
> https://git.openembedded.org/meta-openembedded/commit/?id=3Da23fa069d0a6=
0cf348dcc6399f7990de59105c21
>
> On Thu, Apr 8, 2021 at 12:26 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, Apr 7, 2021 at 3:18 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>> >
>> > Recent upgrade introduced:
>> > | ERROR: networkmanager-openvpn-1.8.14-r0 do_package: QA Issue: netwo=
rkmanager-openvpn: Files/directories were installed but not shipped in any =
package:
>> > |  /usr/share/metainfo
>> > |  /usr/share/metainfo/network-manager-openvpn.metainfo.xml
>> >
>>
>> I wonder why my world build missed this. Is there any setting you are
>> use where this is triggered.
>>
>> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> > ---
>> >  .../networkmanager/networkmanager-openvpn_1.8.14.bb              | 1=
 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager-openvpn_1.8.14.bb b/meta-networking/recipes-connectivity/network=
manager/networkmanager-openvpn_1.8.14.bb
>> > index a1a61bed1..1f76d8ab5 100644
>> > --- a/meta-networking/recipes-connectivity/networkmanager/networkmana=
ger-openvpn_1.8.14.bb
>> > +++ b/meta-networking/recipes-connectivity/networkmanager/networkmana=
ger-openvpn_1.8.14.bb
>> > @@ -38,6 +38,7 @@ USERADD_PARAM_${PN} =3D "--system nm-openvpn"
>> >
>> >  FILES_${PN} +=3D " \
>> >      ${datadir}/dbus-1 \
>> > +    ${datadir}/metainfo \
>> >      ${libdir}/NetworkManager/*.so \
>> >      ${nonarch_libdir}/NetworkManager/VPN/nm-openvpn-service.name \
>> >  "
>> > --
>> > 2.26.2
>> >
>> >
>> >
>> >
>>
>>=20
>>
