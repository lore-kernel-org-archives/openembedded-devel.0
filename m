Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22B7C5472C
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 08:47:51 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.73111.1724748463790202188
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Aug 2024 01:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZbkZIpO5;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: nikhilar2410@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bed72ff2f2so6547382a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Aug 2024 01:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724748462; x=1725353262; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tv+CJLUticBQlm6JJ1EvLCycykPuYBhicTssGXI+78s=;
        b=ZbkZIpO5xdpMh6hG/3gmDU8sFtPzHUDwuKXw1LsqIhV++YOop1JFGEERcVu2a842Vx
         5ivlP5KVkYK91nqErrDRcv1IyaP9raxZA7Dkn+jIcdQup3Mdof1+uyxK/FIveIPp5zBA
         8DayeQph5FU1NQ0sVD0qSl7OfWLNCr5q/zQYagEwyEPh3vTpbyvqThKIE13fYbyW823y
         s6YW2goPRsgzMHc+8DB/KJNdLx7Yof8YMUqX1/aXjRMoVKswJ2DnIrA88LesZXDYHeiC
         7d3pMKTbX7CKxF5NabaSkXjzMEnZXg2VwmG/GMRaVyGiAk3peQLUfKCoC2IPTsPcc1t1
         g1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724748462; x=1725353262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tv+CJLUticBQlm6JJ1EvLCycykPuYBhicTssGXI+78s=;
        b=CMgi8NS9kuHYTrPFteiid363ddV+7cXVKZ1IbA/dng/M6p15p/K4UTCLpUnCPzN4dd
         UnVorO0S9S3WbFt5Qo2zcfPbqBox3WIR7Vqt8On/sFOpwt6y0fMYO+3fBW6MgJ4TDHel
         4J6WVsyCHGrVL2j46ipkeIehGt+iVb1032b902bOhXJmn/EUMe83L8634oTWno0ccXza
         QPxibpKbWUD9vUxBq1JzoHp7vA/aIokM6CF2jn0IOex521KHmaD0ipNlagr6eusDxMMs
         eEnlTXjcW+v3sxm96/qgPOWokS5+0AkkIuul9LScmoz7YxTJQv50EzafxugpjrXrBS4M
         Yh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0N6tjc8Qof/TZAVq35DsiBcxVxsdP0zOhmLHiKQFU3oA2eJ1K+gK5EycRysuAXKOmKdcAGg1QKvUnIACaWn2Vr/g=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzvpdb3BF5cdGyOEsgaRLjl/O7R5ovkODzgeGgfSkrV456E9s85
	2SO3S2qq58kOCYVJLhpMuc1eWKIu0SjseJ5ZHJ3VQFAa4suXtrHBgrB7pMi4gn5ykBr6v1fJ+mD
	9VtUNCrJ2SFxqHo2vs2/L4SVTZA==
X-Google-Smtp-Source: AGHT+IFgK2jAjdODu3F0DunioqJu2CtPBX8Szf/UYyA9cHGdoqgum3RhFyY3yHOTZbHeNz6lBDLcEvEMkOXGzfKcL9s=
X-Received: by 2002:a05:6402:34cb:b0:5be:fbce:9391 with SMTP id
 4fb4d7f45d1cf-5c0ba2ada64mr1380224a12.11.1724748461118; Tue, 27 Aug 2024
 01:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240806063939.527656-1-nikhil.r@kpit.com> <4b2a8bb2-c67e-4233-be35-605e8a946bde@gmail.com>
 <MAZPR01MB8950C73EC4B4044CAD8863F0EEBF2@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAZPR01MB8950C73EC4B4044CAD8863F0EEBF2@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
From: Nikhil R <nikhilar2410@gmail.com>
Date: Tue, 27 Aug 2024 14:17:29 +0530
Message-ID: <CAChEZcJTqC8J9bJ9JsLD7MsMvY3jF2VzUjdfiGhP4tWwU5c2zw@mail.gmail.com>
Subject: Re: [oe][kirkstone][PATCH] opensc: Fix CVE CVE-2023-5992
To: nikhil.r@kpit.com
Cc: akuster808 <akuster808@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
Content-Type: multipart/alternative; boundary="0000000000005a1f7a0620a64b9c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Aug 2024 08:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111973

--0000000000005a1f7a0620a64b9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any update on this ?

Thanks
Nikhil

On Tue, Aug 6, 2024, 18:57 Nikhil via lists.openembedded.org <nikhil.r=3D
kpit.com@lists.openembedded.org> wrote:

> It was a resend , some issue with my mail
>
> Sorry for the inconvenience
>
> Thanks,
> Nikhil
> ------------------------------
> *From:* akuster808 <akuster808@gmail.com>
> *Sent:* Tuesday, August 6, 2024 6:53 PM
> *To:* Nikhil R <Nikhil.R@kpit.com>;
> openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *Cc:* Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
> *Subject:* Re: [oe][kirkstone][PATCH] opensc: Fix CVE CVE-2023-5992
>
> Caution: This email originated from outside of the KPIT. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.
>
> On 8/6/24 2:39 AM, Nikhil via lists.openembedded.org wrote:
> > A vulnerability was found in OpenSC where PKCS#1
> > encryption padding removal is not implemented as
> > side-channel resistant. This issue may result in
> > the potential leak of private data.
> >
> > Links:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits&data=3D05%7C02%7Cnikhil.r%4=
0kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C638585474039172084%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dv1zX=
WJdAQKH%2FBg8GgbnqZQvSs83bGwgOc6G9tlMMv0o%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/2948/commits>
> >
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F3016&data=3D05%7C02%7Cnikhil.r%40kpit.com%=
7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C638585474039184980%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DJ5nHjZsiJbZmN3=
v7RfQ%2FdesIPfDbVfKpcnUqVvws5d8%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/3016>
> >
> > Link:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fxhanulik%2FOpenSC%2Fcommit%2Fbb9bd627462af4d61943a33d6e54308e103618=
f0&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039188910%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C0%7C%7C%7C&sdata=3DDaRkHFwlHSpIEpXNSNSMxXaxXdzWGOqoMu0LqYCFdDM%3D&re=
served=3D0
> <https://github.com/xhanulik/OpenSC/commit/bb9bd627462af4d61943a33d6e5430=
8e103618f0>
> > Add the above commit to fix the below error
> > Error:
> > | ../../../git/src/pkcs11/mechanism.c: In function 'sc_pkcs11_decrypt':
> > | ../../../git/src/pkcs11/mechanism.c:1093:24: error: 'rv' undeclared
> (first use in this function)
>
> Is this a v2 or just a resend?
>
> - armin
> >
> > The below commits were not added as they are part
> > of unittests
> >
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F708ce24c6b9f92a9f39bb7acc=
da601b2891304a3&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403919232=
5%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D0vQBOHhjyIIqCfiCSq2zFEhTzAym7Wsub3T1=
jHcUMWs%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/2948/commits/708ce24c6b9f92a9f39bb=
7accda601b2891304a3>
> >
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F3016%2Fcommits%2F7309b37eb82496e7324671283=
a39f9291be09830&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403919577=
8%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DcXH3gbRXa87SGKXBjweq3O9dISPyKujB6ha%=
2BIZno%2B6Q%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/3016/commits/7309b37eb82496e732467=
1283a39f9291be09830>
> >
> > Signed-off-by: Nikhil R <nikhil.r@kpit.com>
> > ---
> >   ...lement-the-C_DecryptFinalize-and-C_D.patch | 110 ++++++
> >   .../opensc/opensc/CVE-2023-5992-1.patch       | 357 +++++++++++++++++=
+
> >   .../opensc/opensc/CVE-2023-5992-2.patch       |  39 ++
> >   .../opensc/opensc/CVE-2023-5992-3.patch       | 105 ++++++
> >   .../opensc/opensc/CVE-2023-5992-4.patch       |  47 +++
> >   .../opensc/opensc/CVE-2023-5992-5.patch       | 115 ++++++
> >   .../opensc/opensc/CVE-2023-5992-6.patch       |  47 +++
> >   .../opensc/opensc/CVE-2023-5992-7.patch       |  33 ++
> >   .../opensc/opensc/CVE-2023-5992-8.patch       |  71 ++++
> >   .../recipes-support/opensc/opensc_0.22.0.bb   |   9 +
> >   10 files changed, 933 insertions(+)
> >   create mode 100644
> meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implement-the-C_D=
ecryptFinalize-and-C_D.patch
> >   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch
> >   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch
> >   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch
> >   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch
> >   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch
> >   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch
> >   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch
> >   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch
> >
> > diff --git
> a/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implement-the-C=
_DecryptFinalize-and-C_D.patch
> b/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implement-the-C=
_DecryptFinalize-and-C_D.patch
> > new file mode 100644
> > index 000000000..619ab522e
> > --- /dev/null
> > +++
> b/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implement-the-C=
_DecryptFinalize-and-C_D.patch
> > @@ -0,0 +1,110 @@
> > +From bb9bd627462af4d61943a33d6e54308e103618f0 Mon Sep 17 00:00:00 2001
> > +From: Peter Popovec <popovec.peter@gmail.com>
> > +Date: Mon, 20 Dec 2021 08:43:49 +0100
> > +Subject: [PATCH] Preparing to implement the C_DecryptFinalize and
> > + C_DecryptUpdate functions.
> > +
> > +The C_Decrypt() and pkcs15_prkey_decrypt() functions have been changed
> to
> > +allow pkcs15_prkey_decrypt() to be called from C_DecryptInit(),
> > +C_DecryptUpdate() and C_DecryptFinalize().
> > +
> > +CVE: CVE-2023-5992
> > +Upstream-Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fxhanulik%2FOpenSC%2Fcommit%2Fbb9bd627462af4d61943a33d6e54308e103618=
f0&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039199071%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C0%7C%7C%7C&sdata=3DchY%2FOcThfZawDLg0w6dI9NUdqQMzYiMdHzW7Hyf9%2Fcg%3=
D&reserved=3D0
> <https://github.com/xhanulik/OpenSC/commit/bb9bd627462af4d61943a33d6e5430=
8e103618f0>
> ]
> > +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> > +Comment: Refreshed hunk to match latest kirkstone
> > +---
> > + src/pkcs11/framework-pkcs15.c | 15 +++++++++++++
> > + src/pkcs11/mechanism.c        | 42 ++++++++++++++++++++++++++++++----=
-
> > + 2 files changed, 51 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/src/pkcs11/framework-pkcs15.c
> b/src/pkcs11/framework-pkcs15.c
> > +index 688cd84fdc..18f94271ed 100644
> > +--- a/src/pkcs11/framework-pkcs15.c
> > ++++ b/src/pkcs11/framework-pkcs15.c
> > +@@ -4345,6 +4345,21 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_se
> > +       int rv, flags =3D 0, prkey_has_path =3D 0;
> > +       CK_ULONG mask, good, rv_pkcs11;
> > +
> > ++      if (pulDataLen =3D=3D NULL) {
> > ++              /* This is call from the C_DecyptInit function */
> > ++              sc_log(context, "C_DecryptInit...");
> > ++              return CKR_OK;
> > ++      }
> > ++      if (pEncryptedData =3D=3D NULL && ulEncryptedDataLen =3D=3D 0) =
{
> > ++              /* This is call from the C_DecryptFinalize function */
> > ++              sc_log(context, "C_DecryptFinalize...");
> > ++              *pulDataLen =3D 0;
> > ++              return CKR_OK;
> > ++      }
> > ++      /* DecryptUpdate: we assume this code is called only once per
> session, either
> > ++       * from the C_Decrypt function or from an application using the
> C_DecryptUpdate call
> > ++       */
> > ++
> > +       sc_log(context, "Initiating decryption.");
> > +
> > +       if (!p11card)
> > +diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c
> > +index 3035e8a763..a81b58fea6 100644
> > +--- a/src/pkcs11/mechanism.c
> > ++++ b/src/pkcs11/mechanism.c
> > +@@ -1072,9 +1072,11 @@ sc_pkcs11_decrypt_init(sc_pkcs11_operati
> > +                       LOG_FUNC_RETURN(context, (int) rv);
> > +               }
> > +       }
> > +-
> > +       operation->priv_data =3D data;
> > +-      return CKR_OK;
> > ++
> > ++      /* The last parameter is NULL - this is call to INIT code in
> underlying functions */
> > ++      return key->ops->decrypt(operation->session,
> > ++                      key, &operation->mechanism, NULL, 0, NULL, NULL=
);
> > + }
> > +
> > + static CK_RV
> > +@@ -1084,14 +1086,42 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t
> > + {
> > +       struct signature_data *data;
> > +       struct sc_pkcs11_object *key;
> > ++      CK_RV rv;
> > ++      CK_ULONG ulDataLen, ulLastDataLen;
> > ++
> > ++      /* PKCS#11: If pBuf is not NULL_PTR, then *pulBufLen must
> contain the size in bytes.. */
> > ++      if (pData && !pulDataLen)
> > ++              return CKR_ARGUMENTS_BAD;
> > ++
> > ++      ulDataLen =3D pulDataLen ? *pulDataLen : 0;
> > ++      ulLastDataLen =3D ulDataLen;
> > +
> > +       data =3D (struct signature_data*) operation->priv_data;
> > +
> > +       key =3D data->key;
> > +-      return key->ops->decrypt(operation->session,
> > +-                              key, &operation->mechanism,
> > +-                              pEncryptedData, ulEncryptedDataLen,
> > +-                              pData, pulDataLen);
> > ++
> > ++      /* Decrypt */
> > ++      rv =3D key->ops->decrypt(operation->session, key,
> &operation->mechanism,
> > ++                      pEncryptedData, ulEncryptedDataLen, pData,
> &ulDataLen);
> > ++
> > ++      if (pulDataLen)
> > ++              *pulDataLen =3D ulDataLen;
> > ++
> > ++      if (rv !=3D CKR_OK)
> > ++              return rv;
> > ++
> > ++      /* recalculate buffer space */
> > ++      if (ulDataLen <=3D ulLastDataLen)
> > ++              ulLastDataLen -=3D ulDataLen;
> > ++      else
> > ++              ulLastDataLen =3D 0;
> > ++
> > ++      /* DecryptFinalize */
> > ++      rv =3D key->ops->decrypt(operation->session, key,
> &operation->mechanism,
> > ++                      NULL, 0, pData + ulDataLen, &ulLastDataLen);
> > ++      if (pulDataLen)
> > ++              *pulDataLen =3D ulDataLen + ulLastDataLen;
> > ++      return rv;
> > + }
> > +
> > + static CK_RV
> > diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patc=
h
> b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch
> > new file mode 100644
> > index 000000000..8450ed010
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch
> > @@ -0,0 +1,357 @@
> > +From b9e1d344df1f850a9b15bce6294f72c1620d0b45 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanu=
lik@redhat.com>
> > +Date: Mon, 13 Nov 2023 13:54:54 +0100
> > +Subject: [PATCH] Reimplement removing of PKCS#1 v1.5 padding to be tim=
e
> > + constant
> > +
> > +CVE: CVE-2023-5992
> > +Upstream-Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2Fb9e1d344df1f850a9b15bce62=
94f72c1620d0b45&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403920221=
8%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DiPX5r%2Fgij2FkmH7YiZyjjq3X4bmfg3b5M3=
swdYu1oXc%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/2948/commits/b9e1d344df1f850a9b15b=
ce6294f72c1620d0b45>
> ]
> > +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> > +Comment: Refreshed hunks to match latest kirkstone
> > +---
> > + src/common/Makefile.am      |   6 +-
> > + src/common/constant-time.h  | 128 +++++++++++++++++++++++++++++++++++=
+
> > + src/libopensc/internal.h    |   4 +-
> > + src/libopensc/padding.c     | 102 +++++++++++++++++++---------
> > + src/libopensc/pkcs15-sec.c  |   5 +-
> > + src/minidriver/minidriver.c |   4 +-
> > + 6 files changed, 210 insertions(+), 39 deletions(-)
> > + create mode 100644 src/common/constant-time.h
> > +
> > +diff --git a/src/common/Makefile.am b/src/common/Makefile.am
> > +index 5153428dce..9ecbffe8fd 100644
> > +--- a/src/common/Makefile.am
> > ++++ b/src/common/Makefile.am
> > +@@ -8,7 +8,8 @@ dist_noinst_DATA =3D \
> > +       LICENSE.compat_getopt compat_getopt.txt \
> > +       compat_getopt_main.c \
> > +       README.compat_strlcpy compat_strlcpy.3
> > +-noinst_HEADERS =3D compat_strlcat.h compat_strlcpy.h compat_strnlen.h
> compat_getpass.h compat_getopt.h simclist.h libpkcs11.h libscdl.h
> > ++noinst_HEADERS =3D compat_strlcat.h compat_strlcpy.h compat_strnlen.h
> compat_getpass.h \
> > ++      compat_getopt.h simclist.h libpkcs11.h libscdl.h constant-time.=
h
> > +
> > + AM_CPPFLAGS =3D -I$(top_srcdir)/src
> > +
> > +@@ -40,7 +41,8 @@ TIDY_FILES =3D \
> > +       compat_report_rangecheckfailure.c \
> > +       compat___iob_func.c \
> > +       simclist.c simclist.h \
> > +-      libpkcs11.c libscdl.c
> > ++      libpkcs11.c libscdl.c \
> > ++      constant-time.h
> > +
> > + check-local:
> > +       if [ -x "$(CLANGTIDY)" ]; then clang-tidy -config=3D''
> --checks=3D'$(TIDY_CHECKS)' -header-filter=3D.* $(addprefix
> $(srcdir)/,$(TIDY_FILES)) -- $(TIDY_FLAGS); fi
> > +diff --git a/src/common/constant-time.h b/src/common/constant-time.h
> > +new file mode 100644
> > +index 0000000000..40c3e500c2
> > +--- /dev/null
> > ++++ b/src/common/constant-time.h
> > +@@ -0,0 +1,128 @@
> > ++/* Original source:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenssl%2Fopenssl%2Fblob%2F9890cc42daff5e2d0cad01ac4bf78c391f599a6e=
%2Finclude%2Finternal%2Fconstant_time.h&data=3D05%7C02%7Cnikhil.r%40kpit.co=
m%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0=
%7C0%7C638585474039205497%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D2ZUT7z6e6fmV=
bnWkr%2BeO4r8DNFdkIFasKGZC4XByAuY%3D&reserved=3D0
> <https://github.com/openssl/openssl/blob/9890cc42daff5e2d0cad01ac4bf78c39=
1f599a6e/include/internal/constant_time.h>
> */
> > ++
> > ++#ifndef CONSTANT_TIME_H
> > ++#define CONSTANT_TIME_H
> > ++
> > ++#include <stdlib.h>
> > ++#include <string.h>
> > ++
> > ++#if !defined(inline)
> > ++#if defined(__STDC_VERSION__) && __STDC_VERSION__ >=3D 199901L
> > ++#define constant_inline inline
> > ++#elif defined(__GNUC__) && __GNUC__ >=3D 2
> > ++#elif defined(__GNUC__) && __GNUC__ >=3D 2
> > ++#elif defined(_MSC_VER)
> > ++#define constant_inline __inline
> > ++#else
> > ++#define constant_inline
> > ++#endif
> > ++#else                        /* use what caller wants as inline  may
> be from config.h */
> > ++#define constant_inline inline /* inline */
> > ++#endif
> > ++
> > ++/*-
> > ++ * The boolean methods return a bitmask of all ones (0xff...f) for tr=
ue
> > ++ * and 0 for false. For example,
> > ++ *      if (a < b) {
> > ++ *        c =3D a;
> > ++ *      } else {
> > ++ *        c =3D b;
> > ++ *      }
> > ++ * can be written as
> > ++ *      unsigned int lt =3D constant_time_lt(a, b);
> > ++ *      c =3D constant_time_select(lt, a, b);
> > ++ */
> > ++
> > ++static constant_inline unsigned int
> > ++value_barrier(unsigned int a)
> > ++{
> > ++      volatile unsigned int r =3D a;
> > ++      return r;
> > ++}
> > ++
> > ++static constant_inline size_t
> > ++value_barrier_s(size_t a)
> > ++{
> > ++      volatile size_t r =3D a;
> > ++      return r;
> > ++}
> > ++
> > ++/* MSB */
> > ++static constant_inline size_t
> > ++constant_time_msb_s(size_t a)
> > ++{
> > ++      return 0 - (a >> (sizeof(a) * 8 - 1));
> > ++}
> > ++
> > ++static constant_inline unsigned int
> > ++constant_time_msb(unsigned int a)
> > ++{
> > ++      return 0 - (a >> (sizeof(a) * 8 - 1));
> > ++}
> > ++
> > ++/* Select */
> > ++static constant_inline unsigned int
> > ++constant_time_select(unsigned int mask, unsigned int a, unsigned int =
b)
> > ++{
> > ++      return (value_barrier(mask) & a) | (value_barrier(~mask) & b);
> > ++}
> > ++
> > ++static constant_inline unsigned char
> > ++constant_time_select_8(unsigned char mask, unsigned char a, unsigned
> char b)
> > ++{
> > ++      return (unsigned char)constant_time_select(mask, a, b);
> > ++}
> > ++
> > ++static constant_inline size_t
> > ++constant_time_select_s(size_t mask, size_t a, size_t b)
> > ++{
> > ++      return (value_barrier_s(mask) & a) | (value_barrier_s(~mask) &
> b);
> > ++}
> > ++
> > ++/* Zero */
> > ++static constant_inline unsigned int
> > ++constant_time_is_zero(unsigned int a)
> > ++{
> > ++      return constant_time_msb(~a & (a - 1));
> > ++}
> > ++
> > ++static constant_inline size_t
> > ++constant_time_is_zero_s(size_t a)
> > ++{
> > ++      return constant_time_msb_s(~a & (a - 1));
> > ++}
> > ++
> > ++/* Comparison*/
> > ++static constant_inline size_t
> > ++constant_time_lt_s(size_t a, size_t b)
> > ++{
> > ++      return constant_time_msb_s(a ^ ((a ^ b) | ((a - b) ^ b)));
> > ++}
> > ++
> > ++static constant_inline unsigned int
> > ++constant_time_lt(unsigned int a, unsigned int b)
> > ++{
> > ++      return constant_time_msb(a ^ ((a ^ b) | ((a - b) ^ b)));
> > ++}
> > ++
> > ++static constant_inline unsigned int
> > ++constant_time_ge(unsigned int a, unsigned int b)
> > ++{
> > ++      return ~constant_time_lt(a, b);
> > ++}
> > ++
> > ++/* Equality*/
> > ++
> > ++static constant_inline unsigned int
> > ++constant_time_eq(unsigned int a, unsigned int b)
> > ++{
> > ++      return constant_time_is_zero(a ^ b);
> > ++}
> > ++
> > ++static constant_inline size_t
> > ++constant_time_eq_s(size_t a, size_t b)
> > ++{
> > ++      return constant_time_is_zero_s(a ^ b);
> > ++}
> > ++
> > ++#endif /* CONSTANT_TIME_H */
> > +diff --git a/src/libopensc/internal.h b/src/libopensc/internal.h
> > +index 7531260c14..2a98f0e966 100644
> > +--- a/src/libopensc/internal.h
> > ++++ b/src/libopensc/internal.h
> > +@@ -166,8 +166,8 @@ int _sc_card_add_xeddsa_alg(struct sc_ca
> > +
> > + int sc_pkcs1_strip_01_padding(struct sc_context *ctx, const u8
> *in_dat, size_t in_len,
> > +               u8 *out_dat, size_t *out_len);
> > +-int sc_pkcs1_strip_02_padding(struct sc_context *ctx, const u8 *data,
> size_t len,
> > +-              u8 *out_dat, size_t *out_len);
> > ++int sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx,
> unsigned int n, const u8 *data,
> > ++              unsigned int data_len, u8 *out, unsigned int *out_len);
> > + int sc_pkcs1_strip_digest_info_prefix(unsigned int *algorithm,
> > +               const u8 *in_dat, size_t in_len, u8 *out_dat, size_t
> *out_len);
> > +
> > +diff --git a/src/libopensc/padding.c b/src/libopensc/padding.c
> > +index ca47733a4e..ddb3061134 100644
> > +--- a/src/libopensc/padding.c
> > ++++ b/src/libopensc/padding.c
> > +@@ -32,10 +32,13 @@
> > + #include <string.h>
> > + #include <stdlib.h>
> > +
> > ++#include "common/constant-time.h"
> > + #include "internal.h"
> > +
> > + /* TODO doxygen comments */
> > +
> > ++#define SC_PKCS1_PADDING_MIN_SIZE 11
> > ++
> > + /*
> > +  * Prefixes for pkcs-v1 signatures
> > +  */
> > +@@ -143,45 +146,82 @@ sc_pkcs1_strip_01_padding(struct sc_context *ctx=
,
> const u8 *in_dat, size_t in_le
> > +       return SC_SUCCESS;
> > + }
> > +
> > +-
> > +-/* remove pkcs1 BT02 padding (adding BT02 padding is currently not
> > +- * needed/implemented) */
> > ++/* Remove pkcs1 BT02 padding (adding BT02 padding is currently not
> > ++ * needed/implemented) in constant-time.
> > ++ * Original source:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenssl%2Fopenssl%2Fblob%2F9890cc42daff5e2d0cad01ac4bf78c391f599a6e=
%2Fcrypto%2Frsa%2Frsa_pk1.c%23L171&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd=
9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C638585474039208698%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dri2Mtwz%2FavHG13A=
CpSdlI3ucHbNqOtofLco53NB%2B6KM%3D&reserved=3D0
> <https://github.com/openssl/openssl/blob/9890cc42daff5e2d0cad01ac4bf78c39=
1f599a6e/crypto/rsa/rsa_pk1.c#L171>
> */
> > + int
> > +-sc_pkcs1_strip_02_padding(sc_context_t *ctx, const u8 *data, size_t
> len, u8 *out, size_t *out_len)
> > ++sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsigned
> int n, const u8 *data, unsigned int data_len, u8 *out, unsigned int
> *out_len)
> > + {
> > +-      unsigned int    n =3D 0;
> > +-
> > ++      unsigned int i =3D 0;
> > ++      u8 *msg, *msg_orig =3D NULL;
> > ++      unsigned int good, found_zero_byte, mask;
> > ++      unsigned int zero_index =3D 0, msg_index, mlen =3D -1, len =3D =
0;
> > +       LOG_FUNC_CALLED(ctx);
> > +-      if (data =3D=3D NULL || len < 3)
> > ++
> > ++      if (data =3D=3D NULL || data_len <=3D 0 || data_len > n || n <
> SC_PKCS1_PADDING_MIN_SIZE)
> > +               LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
> > +
> > +-      /* skip leading zero byte */
> > +-      if (*data =3D=3D 0) {
> > +-              data++;
> > +-              len--;
> > ++      msg =3D msg_orig =3D calloc(n, sizeof(u8));
> > ++      if (msg =3D=3D NULL)
> > ++              LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
> > ++
> > ++      /*
> > ++       * We can not check length of input data straight away and stil=
l
> we need to read
> > ++       * from input even when the input is not as long as needed to
> keep the time constant.
> > ++       * If data has wrong size, it is padded by zeroes from left and
> the following checks
> > ++       * do not pass.
> > ++       */
> > ++      len =3D data_len;
> > ++      for (data +=3D len, msg +=3D n, i =3D 0; i < n; i++) {
> > ++              mask =3D ~constant_time_is_zero(len);
> > ++              len -=3D 1 & mask;
> > ++              data -=3D 1 & mask;
> > ++              *--msg =3D *data & mask;
> > ++      }
> > ++      // check first byte to be 0x00
> > ++      good =3D constant_time_is_zero(msg[0]);
> > ++      // check second byte to be 0x02
> > ++      good &=3D constant_time_eq(msg[1], 2);
> > ++
> > ++      // find zero byte after random data in padding
> > ++      found_zero_byte =3D 0;
> > ++      for (i =3D 2; i < n; i++) {
> > ++              unsigned int equals0 =3D constant_time_is_zero(msg[i]);
> > ++              zero_index =3D constant_time_select(~found_zero_byte &
> equals0, i, zero_index);
> > ++              found_zero_byte |=3D equals0;
> > +       }
> > +-      if (data[0] !=3D 0x02)
> > +-              LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);
> > +-      /* skip over padding bytes */
> > +-      for (n =3D 1; n < len && data[n]; n++)
> > +-              ;
> > +-      /* Must be at least 8 pad bytes */
> > +-      if (n >=3D len || n < 9)
> > +-              LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);
> > +-      n++;
> > +-      if (out =3D=3D NULL)
> > +-              /* just check the padding */
> > +-              LOG_FUNC_RETURN(ctx, SC_SUCCESS);
> > +
> > +-      /* Now move decrypted contents to head of buffer */
> > +-      if (*out_len < len - n)
> > +-              LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
> > +-      *out_len =3D len - n;
> > +-      memmove(out, data + n, *out_len);
> > ++      // zero_index stands for index of last found zero
> > ++      good &=3D constant_time_ge(zero_index, 2 + 8);
> > ++
> > ++      // start of the actual message in data
> > ++      msg_index =3D zero_index + 1;
> > ++
> > ++      // length of message
> > ++      mlen =3D data_len - msg_index;
> > ++
> > ++      // check that message fits into out buffer
> > ++      good &=3D constant_time_ge(*out_len, mlen);
> > ++
> > ++      // move the result in-place by
> |num|-SC_PKCS1_PADDING_MIN_SIZE-|mlen| bytes to the left.
> > ++      *out_len =3D constant_time_select(constant_time_lt(n -
> SC_PKCS1_PADDING_MIN_SIZE, *out_len),
> > ++                      n - SC_PKCS1_PADDING_MIN_SIZE, *out_len);
> > ++      for (msg_index =3D 1; msg_index < n - SC_PKCS1_PADDING_MIN_SIZE=
;
> msg_index <<=3D 1) {
> > ++              mask =3D ~constant_time_eq(msg_index & (n -
> SC_PKCS1_PADDING_MIN_SIZE - mlen), 0);
> > ++              for (i =3D SC_PKCS1_PADDING_MIN_SIZE; i < n - msg_index=
;
> i++)
> > ++                      msg[i] =3D constant_time_select_8(mask, msg[i +
> msg_index], msg[i]);
> > ++      }
> > ++      // move message into out buffer, if good
> > ++      for (i =3D 0; i < *out_len; i++) {
> > ++              unsigned int msg_index;
> > ++              // when out is longer than message in data, use some
> bogus index in msg
> > ++              mask =3D good & constant_time_lt(i, mlen);
> > ++              msg_index =3D constant_time_select(mask, i +
> SC_PKCS1_PADDING_MIN_SIZE, 0); // to now overflow msg buffer
> > ++              out[i] =3D constant_time_select_8(mask, msg[msg_index],
> out[i]);
> > ++      }
> > +
> > +-      sc_log(ctx, "stripped output(%"SC_FORMAT_LEN_SIZE_T"u): %s", le=
n
> - n,
> > +-             sc_dump_hex(out, len - n));
> > +-      LOG_FUNC_RETURN(ctx, len - n);
> > ++      free(msg_orig);
> > ++      return constant_time_select(good, mlen, SC_ERROR_WRONG_PADDING)=
;
> > + }
> > +
> > + /* add/remove DigestInfo prefix */
> > +diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c
> > +index 2ac6ca7ddf..a019af460f 100644
> > +--- a/src/libopensc/pkcs15-sec.c
> > ++++ b/src/libopensc/pkcs15-sec.c
> > +@@ -308,8 +308,9 @@ int sc_pkcs15_decipher(struct sc_pkcs15_
> > +
> > +       /* Strip any padding */
> > +       if (pad_flags & SC_ALGORITHM_RSA_PAD_PKCS1) {
> > +-              size_t s =3D r;
> > +-              r =3D sc_pkcs1_strip_02_padding(ctx, out, s, out, &s);
> > ++              int s =3D r;
> > ++              int key_size =3D alg_info->key_length;
> > ++              r =3D sc_pkcs1_strip_02_padding_constant_time(ctx,
> key_size / 8, out, s, out, &s);
> > +               LOG_TEST_RET(ctx, r, "Invalid PKCS#1 padding");
> > +       }
> > +
> > +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
> > +index 3391994abe..5248d9758a 100644
> > +--- a/src/minidriver/minidriver.c
> > ++++ b/src/minidriver/minidriver.c
> > +@@ -4582,9 +4582,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> > +                                         "sc_pkcs15_decipher:
> DECRYPT-INFO dwVersion=3D%lu\n",
> > +                                         (unsigned
> long)pInfo->dwVersion);
> > +                               if (pInfo->dwPaddingType =3D=3D
> CARD_PADDING_PKCS1)   {
> > +-                                      size_t temp =3D pInfo->cbData;
> > ++                                      unsigned int temp =3D
> pInfo->cbData;
> > +                                       logprintf(pCardData, 2,
> "sc_pkcs15_decipher: stripping PKCS1 padding\n");
> > +-                                      r =3D
> sc_pkcs1_strip_02_padding(vs->ctx, pbuf2, pInfo->cbData, pbuf2, &temp);
> > ++                                      r =3D
> sc_pkcs1_strip_02_padding_constant_time(vs->ctx, prkey_info->modulus_leng=
th
> / 8, pbuf2, pInfo->cbData, pbuf2, &temp);
> > +                                       pInfo->cbData =3D (DWORD) temp;
> > +                                       if (r < 0)   {
> > +                                               logprintf(pCardData, 2,
> "Cannot strip PKCS1 padding: %i\n", r);
> > diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patc=
h
> b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch
> > new file mode 100644
> > index 000000000..1d8bc1259
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch
> > @@ -0,0 +1,39 @@
> > +From 1a6a18c51a1d6239850b61d19aed6424afd4912f Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanu=
lik@redhat.com>
> > +Date: Thu, 16 Nov 2023 10:38:12 +0100
> > +Subject: [PATCH] pkcs15-sec: Remove logging after PKCS#1 v1.5 depaddin=
g
> > +
> > +To prevent Marvin attack on RSA PKCS#1 v1.5 padding
> > +when logging the return value, signaling the padding error.
> > +
> > +CVE: CVE-2023-5992
> > +Upstream-Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F1a6a18c51a1d6239850b61d19=
aed6424afd4912f&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403921187=
1%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D85lGNhd1ZVO%2BryUZRPhW%2FOZou8jP6r6Z=
m8TeDi%2FRgCI%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/2948/commits/1a6a18c51a1d6239850b6=
1d19aed6424afd4912f>
> ]
> > +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> > +Comment: Refreshed hunk to match latest kirkstone
> > +---
> > + src/libopensc/pkcs15-sec.c | 9 +++++----
> > + 1 file changed, 5 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c
> > +index a019af460f..f7ee819d65 100644
> > +--- a/src/libopensc/pkcs15-sec.c
> > ++++ b/src/libopensc/pkcs15-sec.c
> > +@@ -308,13 +308,14 @@ int sc_pkcs15_decipher(struct sc_pkcs15_
> > +
> > +       /* Strip any padding */
> > +       if (pad_flags & SC_ALGORITHM_RSA_PAD_PKCS1) {
> > +-              int s =3D r;
> > +-              int key_size =3D alg_info->key_length;
> > ++              unsigned int s =3D r;
> > ++              unsigned int key_size =3D (unsigned
> int)alg_info->key_length;
> > +               r =3D sc_pkcs1_strip_02_padding_constant_time(ctx,
> key_size / 8, out, s, out, &s);
> > +-              LOG_TEST_RET(ctx, r, "Invalid PKCS#1 padding");
> > ++              /* for keeping PKCS#1 v1.5 depadding constant-time, do
> not log error here */
> > +       }
> > +
> > +-      LOG_FUNC_RETURN(ctx, r);
> > ++      /* do not log error code to prevent side channel attack */
> > ++      return r;
> > + }
> > +
> > + /* derive one key from another. RSA can use decipher, so this is for
> only ECDH
> > diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patc=
h
> b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch
> > new file mode 100644
> > index 000000000..d3846e5da
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch
> > @@ -0,0 +1,105 @@
> > +From a8ac5930ab8f2da5cb93793d05389761c342f995 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanu=
lik@redhat.com>
> > +Date: Thu, 16 Nov 2023 15:49:15 +0100
> > +Subject: [PATCH] framework-pkcs15.c: Handle PKCS#1 v1.5 depadding
> > + constant-time
> > +
> > +In order to not disclose time side-channel when the depadding
> > +fails, do the same operations as for case when depadding ends
> > +with success.
> > +
> > +CVE: CVE-2023-5992
> > +Upstream-Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2Fa8ac5930ab8f2da5cb93793d0=
5389761c342f995&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403921514=
6%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dx206N6Zb8coR7iTMmKuZRhlAlymSDrm83Py%=
2FtzaKWq8%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/2948/commits/a8ac5930ab8f2da5cb937=
93d05389761c342f995>
> ]
> > +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> > +Comment: Refreshed hunks to match latest kirkstone
> > +---
> > + src/pkcs11/framework-pkcs15.c | 54 ++++++++++++++++++++++++++--------=
-
> > + 1 file changed, 41 insertions(+), 13 deletions(-)
> > +
> > +diff --git a/src/pkcs11/framework-pkcs15.c
> b/src/pkcs11/framework-pkcs15.c
> > +index f75a3dbaec..632681df63 100644
> > +--- a/src/pkcs11/framework-pkcs15.c
> > ++++ b/src/pkcs11/framework-pkcs15.c
> > +@@ -18,6 +18,7 @@
> > +  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> <https://www.google.com/maps/search/59+Temple+Place,+Suite+330,+Boston,+M=
A+02111-1307+USA?entry=3Dgmail&source=3Dg>
> 02111-1307
> <https://www.google.com/maps/search/59+Temple+Place,+Suite+330,+Boston,+M=
A+02111-1307+USA?entry=3Dgmail&source=3Dg>
> USA
> <https://www.google.com/maps/search/59+Temple+Place,+Suite+330,+Boston,+M=
A+02111-1307+USA?entry=3Dgmail&source=3Dg>
> > +  */
> > +
> > ++#include "common/constant-time.h"
> > + #include "config.h"
> > + #include <stdlib.h>
> > + #include <string.h>
> > +@@ -4341,7 +4342,8 @@
> > +       struct pkcs15_fw_data *fw_data =3D NULL;
> > +       struct pkcs15_prkey_object *prkey;
> > +       unsigned char decrypted[512]; /* FIXME: Will not work for keys
> above 4096 bits */
> > +-      int     buff_too_small, rv, flags =3D 0, prkey_has_path =3D 0;
> > ++      int rv, flags =3D 0, prkey_has_path =3D 0;
> > ++      CK_ULONG mask, good, rv_pkcs11;
> > +
> > +       sc_log(context, "Initiating decryption.");
> > +
> > +@@ -4415,27 +4417,53 @@
> > +       rv =3D sc_pkcs15_decipher(fw_data->p15_card, prkey->prv_p15obj,
> flags,
> > +                       pEncryptedData, ulEncryptedDataLen, decrypted,
> sizeof(decrypted));
> > +
> > +-      if (rv < 0 && !sc_pkcs11_conf.lock_login && !prkey_has_path)
> > ++      /* skip for PKCS#1 v1.5 padding prevent side channel attack */
> > ++      if (!(flags & SC_ALGORITHM_RSA_PAD_PKCS1) &&
> > ++                      rv < 0 && !sc_pkcs11_conf.lock_login &&
> !prkey_has_path)
> > +               if (reselect_app_df(fw_data->p15_card) =3D=3D SC_SUCCES=
S)
> > +                       rv =3D sc_pkcs15_decipher(fw_data->p15_card,
> prkey->prv_p15obj, flags,
> > +                                       pEncryptedData,
> ulEncryptedDataLen, decrypted, sizeof(decrypted));
> > +
> > +       sc_unlock(p11card->card);
> > +
> > +-      sc_log(context, "Decryption complete. Result %d.", rv);
> > ++      sc_log(context, "Decryption complete.");
> > +
> > +-      if (rv < 0)
> > +-              return sc_to_cryptoki_error(rv, "C_Decrypt");
> > ++      /* Handle following code in constant-time
> > ++       * to prevent Marvin attack for PKCS#1 v1.5 padding. */
> > +
> > +-      buff_too_small =3D (*pulDataLen < (CK_ULONG)rv);
> > +-      *pulDataLen =3D rv;
> > +-      if (pData =3D=3D NULL_PTR)
> > +-              return CKR_OK;
> > +-      if (buff_too_small)
> > +-              return CKR_BUFFER_TOO_SMALL;
> > +-      memcpy(pData, decrypted, *pulDataLen);
> > ++      /* only padding error must be handled in constant-time way,
> > ++       * other error can be returned straight away */
> > ++      if ((~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING) &
> constant_time_lt_s(sizeof(decrypted), rv)))
> > ++              return sc_to_cryptoki_error(rv, "C_Decrypt");
> > +
> > +-      return CKR_OK;
> > ++      /* check rv for padding error */
> > ++      good =3D ~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING);
> > ++      rv_pkcs11 =3D sc_to_cryptoki_error(SC_ERROR_WRONG_PADDING,
> "C_Decrypt");
> > ++      rv_pkcs11 =3D constant_time_select_s(good, CKR_OK, rv_pkcs11);
> > ++
> > ++      if (pData =3D=3D NULL_PTR) {
> > ++              /* set length only if no error */
> > ++              *pulDataLen =3D constant_time_select_s(good, rv,
> *pulDataLen);
> > ++              /* return error only if original rv < 0 */
> > ++              return rv_pkcs11;
> > ++      }
> > ++
> > ++      /* check whether *pulDataLen < rv and set return value for smal=
l
> output buffer */
> > ++      mask =3D good & constant_time_lt_s(*pulDataLen, rv);
> > ++      rv_pkcs11 =3D constant_time_select_s(mask, CKR_BUFFER_TOO_SMALL=
,
> rv_pkcs11);
> > ++      good &=3D ~mask;
> > ++
> > ++      /* move everything from decrypted into out buffer constant-time=
,
> if rv is ok */
> > ++      for (CK_ULONG i =3D 0; i < *pulDataLen; i++) { /* iterate over
> whole pData to not disclose real depadded length */
> > ++              CK_ULONG msg_index;
> > ++              mask =3D good & constant_time_lt_s(i,
> sizeof(decrypted));             /* i should be in the bounds of decrypted=
 */
> > ++              mask &=3D constant_time_lt_s(i,
> constant_time_select_s(good, rv, 0)); /* check that is in bounds of
> depadded message */
> > ++              msg_index =3D constant_time_select_s(mask, i, 0);
> > ++              pData[i] =3D constant_time_select_8(mask,
> decrypted[msg_index], pData[i]);
> > ++      }
> > ++      *pulDataLen =3D constant_time_select_s(good, rv, *pulDataLen);
> > ++      /* do not log error code to prevent side channel attack */
> > ++      return rv_pkcs11;
> > + }
> > +
> > diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patc=
h
> b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch
> > new file mode 100644
> > index 000000000..e113df7c4
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch
> > @@ -0,0 +1,47 @@
> > +From 32cdab44f6b1e6343f029879a8ab32de4f32743f Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanu=
lik@redhat.com>
> > +Date: Mon, 8 Jan 2024 14:59:22 +0100
> > +Subject: [PATCH] mechanism: Handle PKCS#1 v1.5 depadding constant-time
> > +
> > +CVE: CVE-2023-5992
> > +Upstream-Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F32cdab44f6b1e6343f029879a=
8ab32de4f32743f&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403921893=
3%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DwlIwj01UWFsUnKMzR9qAW0hHzK7kSjAygzZQ=
atz%2BG8A%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/2948/commits/32cdab44f6b1e6343f029=
879a8ab32de4f32743f>
> ]
> > +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> > +Comment: 1 hunk removed and refreshed hunks to match latest kirkstone
> > +---
> > + src/pkcs11/mechanism.c | 19 ++++++++++++++-----
> > + 1 file changed, 14 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c
> > +index 03495265a4..d3f0434231 100644
> > +--- a/src/pkcs11/mechanism.c
> > ++++ b/src/pkcs11/mechanism.c
> > +@@ -23,6 +23,7 @@
> > + #include <stdlib.h>
> > + #include <string.h>
> > +
> > ++#include "common/constant-time.h"
> > + #include "sc-pkcs11.h"
> > +
> > + /* Also used for verification data */
> > +@@ -844,7 +845,9 @@ sc_pkcs11_decr(struct sc_pkcs11_session
> > +       rv =3D op->type->decrypt(op, pEncryptedData, ulEncryptedDataLen=
,
> > +                              pData, pulDataLen);
> > +
> > +-      if (rv !=3D CKR_BUFFER_TOO_SMALL && pData !=3D NULL)
> > ++      /* terminate session for any return value except
> CKR_BUFFER_TOO_SMALL,
> > ++       * perform check in time side-channel free way to prevent Marvi=
n
> attack */
> > ++      if (!constant_time_eq_s(rv, CKR_BUFFER_TOO_SMALL) && pData !=3D
> NULL)
> > +               session_stop_operation(session,
> SC_PKCS11_OPERATION_DECRYPT);
> > +
> > +       return rv;
> > +@@ -1107,6 +1107,10 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t
> > +       if (pulDataLen)
> > +               *pulDataLen =3D ulDataLen;
> > +
> > ++      /* Skip DecryptFinalize for PKCS#1 v1.5 padding to prevent time
> side-channel leakage */
> > ++      if (((CK_MECHANISM_PTR)&operation->mechanism)->mechanism =3D=3D
> CKM_RSA_PKCS)
> > ++              return rv;
> > ++
> > +       if (rv !=3D CKR_OK)
> > +               return rv;
> > +
> > diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patc=
h
> b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch
> > new file mode 100644
> > index 000000000..7bb862194
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch
> > @@ -0,0 +1,115 @@
> > +From 1fe1a78610b00b9db83a03396762c72c1371bd02 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanu=
lik@redhat.com>
> > +Date: Wed, 22 Nov 2023 15:02:57 +0100
> > +Subject: [PATCH] minidriver: Make CardRSADecrypt constant-time
> > +
> > +CVE: CVE-2023-5992
> > +Upstream-Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F1fe1a78610b00b9db83a03396=
762c72c1371bd02&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403922223=
6%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D45wf78tNtkWO15anb%2FntZ%2BKbbZaqLE3a=
KnfLhVot0bI%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/2948/commits/1fe1a78610b00b9db83a0=
3396762c72c1371bd02>
> ]
> > +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> > +Comment: Refreshed hunks to match latest kirkstone
> > +---
> > + src/minidriver/minidriver.c | 37 +++++++++++++++++++++++-------------=
-
> > + 1 file changed, 23 insertions(+), 14 deletions(-)
> > +
> > +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
> > +index 5248d9758a..b99b6cff89 100644
> > +--- a/src/minidriver/minidriver.c
> > ++++ b/src/minidriver/minidriver.c
> > +@@ -41,6 +41,7 @@
> > + #include "cardmod.h"
> > +
> > + #include "common/compat_strlcpy.h"
> > ++#include "common/constant-time.h"
> > + #include "libopensc/asn1.h"
> > + #include "libopensc/cardctl.h"
> > + #include "libopensc/opensc.h"
> > +@@ -4463,13 +4464,15 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> > +
> > + {
> > +       DWORD dwret;
> > +-      int r, opt_crypt_flags =3D 0;
> > ++      int r, opt_crypt_flags =3D 0, good =3D 0;
> > +       unsigned ui;
> > +       VENDOR_SPECIFIC *vs;
> > +       struct sc_pkcs15_prkey_info *prkey_info;
> > +       BYTE *pbuf =3D NULL, *pbuf2 =3D NULL;
> > +       struct sc_pkcs15_object *pkey =3D NULL;
> > +       struct sc_algorithm_info *alg_info =3D NULL;
> > ++      unsigned int wrong_padding =3D 0;
> > ++      unsigned int pbufLen =3D 0;
> > +
> > +       MD_FUNC_CALLED(pCardData, 1);
> > +
> > +@@ -4570,11 +4573,11 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> > +               goto err;
> > +       }
> > +
> > ++      pbufLen =3D pInfo->cbData;
> > +       if (alg_info->flags & SC_ALGORITHM_RSA_RAW)   {
> > +               logprintf(pCardData, 2, "sc_pkcs15_decipher: using
> RSA-RAW mechanism\n");
> > +               r =3D sc_pkcs15_decipher(vs->p15card, pkey,
> opt_crypt_flags, pbuf, pInfo->cbData, pbuf2, pInfo->cbData);
> > +-              logprintf(pCardData, 2, "sc_pkcs15_decipher returned
> %d\n", r);
> > +-
> > ++              /* do not log return value to not leak it */
> > +               if (r > 0) {
> > +                       /* Need to handle padding */
> > +                       if (pInfo->dwVersion >=3D
> CARD_RSA_KEY_DECRYPT_INFO_VERSION_TWO) {
> > +@@ -4586,13 +4589,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> > +                                       logprintf(pCardData, 2,
> "sc_pkcs15_decipher: stripping PKCS1 padding\n");
> > +                                       r =3D
> sc_pkcs1_strip_02_padding_constant_time(vs->ctx, prkey_info->modulus_leng=
th
> / 8, pbuf2, pInfo->cbData, pbuf2, &temp);
> > +                                       pInfo->cbData =3D (DWORD) temp;
> > +-                                      if (r < 0)   {
> > +-                                              logprintf(pCardData, 2,
> "Cannot strip PKCS1 padding: %i\n", r);
> > +-
> pCardData->pfnCspFree(pbuf);
> > +-
> pCardData->pfnCspFree(pbuf2);
> > +-                                              dwret =3D
> SCARD_F_INTERNAL_ERROR;
> > +-                                              goto err;
> > +-                                      }
> > ++                                      wrong_padding =3D
> constant_time_eq_s(r, SC_ERROR_WRONG_PADDING);
> > ++                                      /* continue without returning
> error to not leak that padding is wrong
> > ++                                         to prevent time side-channel
> leak for Marvin attack*/
> > +                               }
> > +                               else if (pInfo->dwPaddingType =3D=3D
> CARD_PADDING_OAEP)   {
> > +                                       /* TODO: Handle OAEP padding if
> present - can call PFN_CSP_UNPAD_DATA */
> > +@@ -4640,28 +4639,38 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> > +               goto err;
> > +       }
> > +
> > +-      if ( r < 0)   {
> > ++      good =3D constant_time_eq_s(r, 0);
> > ++      /* if no error or padding error, do not return here to prevent
> Marvin attack */
> > ++      if (!(good | wrong_padding) && r < 0)   {
> > +               logprintf(pCardData, 2, "sc_pkcs15_decipher error(%i):
> %s\n", r, sc_strerror(r));
> > +               pCardData->pfnCspFree(pbuf);
> > +               pCardData->pfnCspFree(pbuf2);
> > +               dwret =3D md_translate_OpenSC_to_Windows_error(r,
> SCARD_E_INVALID_VALUE);
> > +               goto err;
> > +       }
> > ++      dwret =3D constant_time_select_s(good, SCARD_S_SUCCESS,
> SCARD_F_INTERNAL_ERROR);
> > +
> > +       logprintf(pCardData, 2, "decrypted data(%lu):\n",
> > +                 (unsigned long)pInfo->cbData);
> > +       loghex(pCardData, 7, pbuf2, pInfo->cbData);
> > +
> > +       /*inversion donnees */
> > +-      for(ui =3D 0; ui < pInfo->cbData; ui++)
> > +-              pInfo->pbData[ui] =3D pbuf2[pInfo->cbData-ui-1];
> > ++      /* copy data in constant-time way to prevent leak */
> > ++      for (ui =3D 0; ui < pbufLen; ui++) {
> > ++              unsigned int mask, msg_index, inv_ui;
> > ++              mask =3D good & constant_time_lt_s(ui, pInfo->cbData); =
/*
> ui should be in the bounds of pbuf2 */
> > ++              inv_ui =3D pInfo->cbData - ui - 1;
> > ++              msg_index =3D constant_time_select_s(mask, inv_ui, 0);
> > ++              pInfo->pbData[ui] =3D constant_time_select_8(mask,
> pbuf2[msg_index], pInfo->pbData[ui]);
> > ++      }
> > +
> > +       pCardData->pfnCspFree(pbuf);
> > +       pCardData->pfnCspFree(pbuf2);
> > +
> > + err:
> > +       unlock(pCardData);
> > +-      MD_FUNC_RETURN(pCardData, 1, dwret);
> > ++      /* do not log return value to not leak it */
> > ++      return dwret;
> > + }
> > +
> > diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patc=
h
> b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch
> > new file mode 100644
> > index 000000000..5deeacc25
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch
> > @@ -0,0 +1,47 @@
> > +From 306dc92bd4d2d74203f53cf3d9ea68c223115375 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanu=
lik@redhat.com>
> > +Date: Fri, 24 Nov 2023 20:59:07 +0100
> > +Subject: [PATCH] pkcs11-object: Remove return value logging
> > +
> > +To prevent Marvin attack on RSA PKCS#1 v1.5 padding
> > +when logging the return value, signaling the padding error.
> > +
> > +CVE: CVE-2023-5992
> > +Upstream-Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F306dc92bd4d2d74203f53cf3d=
9ea68c223115375&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403922538=
3%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DWw6twdIVhAGYFgLBGs0hZp2udnjM2hXy4hl9=
mzFGEy0%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/2948/commits/306dc92bd4d2d74203f53=
cf3d9ea68c223115375>
> ]
> > +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> > +Comment: Two hunks removed from pkcs11-object.c and refreshed
> sc-pkcs11.h
> > +---
> > + src/pkcs11/pkcs11-object.c | 9 ++++++---
> > + src/pkcs11/sc-pkcs11.h     | 5 +++++
> > + 2 files changed, 11 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/src/pkcs11/pkcs11-object.c b/src/pkcs11/pkcs11-object.c
> > +index f04c0b4c56..b023911213 100644
> > +--- a/src/pkcs11/pkcs11-object.c
> > ++++ b/src/pkcs11/pkcs11-object.c
> > +@@ -930,7 +930,8 @@ CK_RV C_Decrypt(CK_SESSION_HANDLE hSessi
> > +               rv =3D reset_login_state(session->slot, rv);
> > +       }
> > +
> > +-      sc_log(context, "C_Decrypt() =3D %s", lookup_enum ( RV_T, rv ))=
;
> > ++      /* do not log error code to prevent side channel attack */
> > ++      SC_LOG("C_Decrypt()");
> > +       sc_pkcs11_unlock();
> > +       return rv;
> > + }
> > +diff --git a/src/pkcs11/sc-pkcs11.h b/src/pkcs11/sc-pkcs11.h
> > +index 66dfcdde67..510017ed2a 100644
> > +--- a/src/pkcs11/sc-pkcs11.h
> > ++++ b/src/pkcs11/sc-pkcs11.h
> > +@@ -226,6 +226,11 @@
> > + };
> > + typedef struct sc_pkcs11_slot sc_pkcs11_slot_t;
> > +
> > ++#define SC_LOG(fmt) \
> > ++      do { \
> > ++              sc_log(context, (fmt)); \
> > ++      } while (0)
> > ++
> > + /* Debug virtual slots. S is slot to be highlighted or NULL
> > +  * C is a comment format string and args It will be preceded by "VSS =
"
> */
> > + #define DEBUG_VSS(S, ...) do { sc_log(context,"VSS " __VA_ARGS__);
> _debug_virtual_slots(S); } while (0)
> > diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patc=
h
> b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch
> > new file mode 100644
> > index 000000000..7b41abc0e
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch
> > @@ -0,0 +1,33 @@
> > +From aa6bf2b65fe432e8f234a132268b79ea54d5d74b Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanu=
lik@redhat.com>
> > +Date: Fri, 24 Nov 2023 21:00:23 +0100
> > +Subject: [PATCH] misc: Compare return value constant-time
> > +
> > +CVE: CVE-2023-5992
> > +Upstream-Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2Faa6bf2b65fe432e8f234a1322=
68b79ea54d5d74b&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403922848=
9%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DFuhfgrvC6wIKW%2F8FyZLmFAPVx3AC0%2F4J=
C%2FJQvNu4hWs%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/2948/commits/aa6bf2b65fe432e8f234a=
132268b79ea54d5d74b>
> ]
> > +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> > +---
> > + src/pkcs11/misc.c | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/pkcs11/misc.c b/src/pkcs11/misc.c
> > +index 5ca1176b1d..1d893d6181 100644
> > +--- a/src/pkcs11/misc.c
> > ++++ b/src/pkcs11/misc.c
> > +@@ -23,6 +23,7 @@
> > + #include <stdlib.h>
> > + #include <string.h>
> > +
> > ++#include "common/constant-time.h"
> > + #include "sc-pkcs11.h"
> > +
> > + #define DUMP_TEMPLATE_MAX     32
> > +@@ -174,7 +175,7 @@ CK_RV reset_login_state(struct sc_pkcs11_slot
> *slot, CK_RV rv)
> > +                       slot->p11card->framework->logout(slot);
> > +               }
> > +
> > +-              if (rv =3D=3D CKR_USER_NOT_LOGGED_IN) {
> > ++              if (constant_time_eq_s(rv, CKR_USER_NOT_LOGGED_IN)) {
> > +                       slot->login_user =3D -1;
> > +                       pop_all_login_states(slot);
> > +               }
> > diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patc=
h
> b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch
> > new file mode 100644
> > index 000000000..3ad681ecb
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch
> > @@ -0,0 +1,71 @@
> > +From fd80ba7c00bb87f52a63f628509955ccee5b09e4 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanu=
lik@redhat.com>
> > +Date: Mon, 5 Feb 2024 13:33:05 +0100
> > +Subject: [PATCH] Fix constant-time comparison of negative values
> > +
> > +Thanks Coverity CID 414687
> > +
> > +CVE: CVE-2023-5992
> > +Upstream-Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F3016%2Fcommits%2Ffd80ba7c00bb87f52a63f6285=
09955ccee5b09e4&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403923265=
5%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DJRq1GCbjG37VCUIyggF%2FUtBtUYYmuw2Iun=
8lOnIxFj4%3D&reserved=3D0
> <https://github.com/OpenSC/OpenSC/pull/3016/commits/fd80ba7c00bb87f52a63f=
628509955ccee5b09e4>
> ]
> > +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> > +---
> > + src/common/constant-time.h    | 6 ++++++
> > + src/minidriver/minidriver.c   | 4 ++--
> > + src/pkcs11/framework-pkcs15.c | 4 ++--
> > + 3 files changed, 10 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/src/common/constant-time.h b/src/common/constant-time.h
> > +index 40c3e500c2..3f4446d4d8 100644
> > +--- a/src/common/constant-time.h
> > ++++ b/src/common/constant-time.h
> > +@@ -125,4 +125,10 @@ constant_time_eq_s(size_t a, size_t b)
> > +       return constant_time_is_zero_s(a ^ b);
> > + }
> > +
> > ++static constant_inline unsigned int
> > ++constant_time_eq_i(int a, int b)
> > ++{
> > ++      return constant_time_eq((unsigned int)a, (unsigned int)b);
> > ++}
> > ++
> > + #endif /* CONSTANT_TIME_H */
> > +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
> > +index a3c738966b..d146b42549 100644
> > +--- a/src/minidriver/minidriver.c
> > ++++ b/src/minidriver/minidriver.c
> > +@@ -4660,7 +4660,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA
> pCardData,
> > +                                       logprintf(pCardData, 2,
> "sc_pkcs15_decipher: stripping PKCS1 padding\n");
> > +                                       r =3D
> sc_pkcs1_strip_02_padding_constant_time(vs->ctx, prkey_info->modulus_leng=
th
> / 8, pbuf2, pInfo->cbData, pbuf2, &temp);
> > +                                       pInfo->cbData =3D (DWORD) temp;
> > +-                                      wrong_padding =3D
> constant_time_eq_s(r, SC_ERROR_WRONG_PADDING);
> > ++                                      wrong_padding =3D
> constant_time_eq_i(r, SC_ERROR_WRONG_PADDING);
> > +                                       /* continue without returning
> error to not leak that padding is wrong
> > +                                          to prevent time side-channel
> leak for Marvin attack*/
> > +                               }
> > +@@ -4710,7 +4710,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA
> pCardData,
> > +               goto err;
> > +       }
> > +
> > +-      good =3D constant_time_eq_s(r, 0);
> > ++      good =3D constant_time_eq_i(r, 0);
> > +       /* if no error or padding error, do not return here to prevent
> Marvin attack */
> > +       if (!(good | wrong_padding) && r < 0)   {
> > +               logprintf(pCardData, 2, "sc_pkcs15_decipher error(%i):
> %s\n", r, sc_strerror(r));
> > +diff --git a/src/pkcs11/framework-pkcs15.c
> b/src/pkcs11/framework-pkcs15.c
> > +index cb4df7a64f..11cfc51273 100644
> > +--- a/src/pkcs11/framework-pkcs15.c
> > ++++ b/src/pkcs11/framework-pkcs15.c
> > +@@ -4627,11 +4627,11 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_session
> *session, void *obj,
> > +
> > +       /* only padding error must be handled in constant-time way,
> > +        * other error can be returned straight away */
> > +-      if ((~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING) &
> constant_time_lt_s(sizeof(decrypted), rv)))
> > ++      if ((~constant_time_eq_i(rv, SC_ERROR_WRONG_PADDING) &
> constant_time_lt_s(sizeof(decrypted), (size_t)rv)))
> > +               return sc_to_cryptoki_error(rv, "C_Decrypt");
> > +
> > +       /* check rv for padding error */
> > +-      good =3D ~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING);
> > ++      good =3D ~constant_time_eq_i(rv, SC_ERROR_WRONG_PADDING);
> > +       rv_pkcs11 =3D sc_to_cryptoki_error(SC_ERROR_WRONG_PADDING,
> "C_Decrypt");
> > +       rv_pkcs11 =3D constant_time_select_s(good, CKR_OK, rv_pkcs11);
> > +
> > diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> > index 770c2d686..16b3ec292 100644
> > --- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> > +++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> > @@ -23,6 +23,15 @@ SRC_URI =3D "git://
> github.com/OpenSC/OpenSC;branch=3Dmaster;protocol=3Dhttps \
> >              file://CVE-2023-40661-5.patch \
> >              file://CVE-2023-40661-6.patch \
> >              file://CVE-2023-40661-7.patch \
> > +           file://CVE-2023-5992-1.patch \
> > +           file://CVE-2023-5992-2.patch \
> > +           file://CVE-2023-5992-3.patch \
> > +
> file://0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch \
> > +           file://CVE-2023-5992-4.patch \
> > +           file://CVE-2023-5992-5.patch \
> > +           file://CVE-2023-5992-6.patch \
> > +           file://CVE-2023-5992-7.patch \
> > +           file://CVE-2023-5992-8.patch \
> >             "
> >
> >   # CVE-2021-34193 is a duplicate CVE covering the 5 individual
> > --
> > 2.25.1
> >
> > This message contains information that may be privileged or confidentia=
l
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient=
,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
> >
> >
> >
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient=
,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111583):
> https://lists.openembedded.org/g/openembedded-devel/message/111583
> Mute This Topic: https://lists.openembedded.org/mt/107747046/6932718
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> nikhilar2410@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005a1f7a0620a64b9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Any update on this ?</p>
<p dir=3D"ltr">Thanks <br>
Nikhil</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Aug 6, 2024, 18:57 Nikhil via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;nikhil.r=3D<a href=3D"mailto:kpit.com@lists.o=
penembedded.org">kpit.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
It was a resend , some issue with my mail</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Sorry for the inconvenience=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Nikhil=C2=A0</div>
<div id=3D"m_3347723860327590162Signature">
<div style=3D"background-color:rgb(255,255,255);margin:0px"></div>
</div>
<div id=3D"m_3347723860327590162appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_3347723860327590162divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> =
akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank" re=
l=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
<b>Sent:</b> Tuesday, August 6, 2024 6:53 PM<br>
<b>To:</b> Nikhil R &lt;<a href=3D"mailto:Nikhil.R@kpit.com" target=3D"_bla=
nk" rel=3D"noreferrer">Nikhil.R@kpit.com</a>&gt;; <a href=3D"mailto:openemb=
edded-devel@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">op=
enembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembed=
ded-devel@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">open=
embedded-devel@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> Ranjitsinh Rathod &lt;<a href=3D"mailto:Ranjitsinh.Rathod@kpit.c=
om" target=3D"_blank" rel=3D"noreferrer">Ranjitsinh.Rathod@kpit.com</a>&gt;=
<br>
<b>Subject:</b> Re: [oe][kirkstone][PATCH] opensc: Fix CVE CVE-2023-5992</f=
ont>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>Caution: This email originated from outside of the KPIT. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.<br>
<br>
On 8/6/24 2:39 AM, Nikhil via <a href=3D"http://lists.openembedded.org" tar=
get=3D"_blank" rel=3D"noreferrer">lists.openembedded.org</a> wrote:<br>
&gt; A vulnerability was found in OpenSC where PKCS#1<br>
&gt; encryption padding removal is not implemented as<br>
&gt; side-channel resistant. This issue may result in<br>
&gt; the potential leak of private data.<br>
&gt;<br>
&gt; Links: <a href=3D"https://github.com/OpenSC/OpenSC/pull/2948/commits" =
target=3D"_blank" rel=3D"noreferrer">https://apc01.safelinks.protection.out=
look.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2F=
commits&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dc=
b61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039172084%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Dv1zXWJdAQKH%2FBg8GgbnqZQvSs83bGwgOc6=
G9tlMMv0o%3D&amp;reserved=3D0</a><br>
&gt; <a href=3D"https://github.com/OpenSC/OpenSC/pull/3016" target=3D"_blan=
k" rel=3D"noreferrer">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F3016&amp;data=3D05%7=
C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C638585474039184980%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C=
%7C&amp;sdata=3DJ5nHjZsiJbZmN3v7RfQ%2FdesIPfDbVfKpcnUqVvws5d8%3D&amp;reserv=
ed=3D0</a><br>
&gt;<br>
&gt; Link: <a href=3D"https://github.com/xhanulik/OpenSC/commit/bb9bd627462=
af4d61943a33d6e54308e103618f0" target=3D"_blank" rel=3D"noreferrer">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fxhanulik%2FOpenSC%2Fcommit%2Fbb9bd627462af4d61943a33d6e54308e103618f0=
&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea=
5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039188910%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DDaRkHFwlHSpIEpXNSNSMxXaxXdzWGOqoMu0LqYCFdDM=
%3D&amp;reserved=3D0</a><br>
&gt; Add the above commit to fix the below error<br>
&gt; Error:<br>
&gt; | ../../../git/src/pkcs11/mechanism.c: In function &#39;sc_pkcs11_decr=
ypt&#39;:<br>
&gt; | ../../../git/src/pkcs11/mechanism.c:1093:24: error: &#39;rv&#39; und=
eclared (first use in this function)<br>
<br>
Is this a v2 or just a resend?<br>
<br>
- armin<br>
&gt;<br>
&gt; The below commits were not added as they are part<br>
&gt; of unittests<br>
&gt; <a href=3D"https://github.com/OpenSC/OpenSC/pull/2948/commits/708ce24c=
6b9f92a9f39bb7accda601b2891304a3" target=3D"_blank" rel=3D"noreferrer">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F708ce24c6b9f92a9f39bb7accda=
601b2891304a3&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c1=
2b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039192=
325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3D0vQBOHhjyIIqCfiCSq2zFEhTzAym7W=
sub3T1jHcUMWs%3D&amp;reserved=3D0</a><br>
&gt; <a href=3D"https://github.com/OpenSC/OpenSC/pull/3016/commits/7309b37e=
b82496e7324671283a39f9291be09830" target=3D"_blank" rel=3D"noreferrer">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2FOpenSC%2FOpenSC%2Fpull%2F3016%2Fcommits%2F7309b37eb82496e7324671283a3=
9f9291be09830&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c1=
2b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039195=
778%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DcXH3gbRXa87SGKXBjweq3O9dISPyKu=
jB6ha%2BIZno%2B6Q%3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Nikhil R &lt;<a href=3D"mailto:nikhil.r@kpit.com" targe=
t=3D"_blank" rel=3D"noreferrer">nikhil.r@kpit.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0=C2=A0 ...lement-the-C_DecryptFinalize-and-C_D.patch | 110 ++++++=
<br>
&gt;=C2=A0=C2=A0 .../opensc/opensc/CVE-2023-5992-1.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 357 ++++++++++++++++++<br>
&gt;=C2=A0=C2=A0 .../opensc/opensc/CVE-2023-5992-2.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 39 ++<br>
&gt;=C2=A0=C2=A0 .../opensc/opensc/CVE-2023-5992-3.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 105 ++++++<br>
&gt;=C2=A0=C2=A0 .../opensc/opensc/CVE-2023-5992-4.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 47 +++<br>
&gt;=C2=A0=C2=A0 .../opensc/opensc/CVE-2023-5992-5.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 115 ++++++<br>
&gt;=C2=A0=C2=A0 .../opensc/opensc/CVE-2023-5992-6.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 47 +++<br>
&gt;=C2=A0=C2=A0 .../opensc/opensc/CVE-2023-5992-7.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 33 ++<br>
&gt;=C2=A0=C2=A0 .../opensc/opensc/CVE-2023-5992-8.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 71 ++++<br>
&gt;=C2=A0=C2=A0 .../recipes-support/opensc/<a href=3D"http://opensc_0.22.0=
.bb" target=3D"_blank" rel=3D"noreferrer">opensc_0.22.0.bb</a>=C2=A0=C2=A0 =
|=C2=A0=C2=A0 9 +<br>
&gt;=C2=A0=C2=A0 10 files changed, 933 insertions(+)<br>
&gt;=C2=A0=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/0=
001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch<br>
&gt;=C2=A0=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-1.patch<br>
&gt;=C2=A0=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-2.patch<br>
&gt;=C2=A0=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-3.patch<br>
&gt;=C2=A0=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-4.patch<br>
&gt;=C2=A0=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-5.patch<br>
&gt;=C2=A0=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-6.patch<br>
&gt;=C2=A0=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-7.patch<br>
&gt;=C2=A0=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-8.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-i=
mplement-the-C_DecryptFinalize-and-C_D.patch b/meta-oe/recipes-support/open=
sc/opensc/0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000..619ab522e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implemen=
t-the-C_DecryptFinalize-and-C_D.patch<br>
&gt; @@ -0,0 +1,110 @@<br>
&gt; +From bb9bd627462af4d61943a33d6e54308e103618f0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Popovec &lt;<a href=3D"mailto:popovec.peter@gmail.com" ta=
rget=3D"_blank" rel=3D"noreferrer">popovec.peter@gmail.com</a>&gt;<br>
&gt; +Date: Mon, 20 Dec 2021 08:43:49 +0100<br>
&gt; +Subject: [PATCH] Preparing to implement the C_DecryptFinalize and<br>
&gt; + C_DecryptUpdate functions.<br>
&gt; +<br>
&gt; +The C_Decrypt() and pkcs15_prkey_decrypt() functions have been change=
d to<br>
&gt; +allow pkcs15_prkey_decrypt() to be called from C_DecryptInit(),<br>
&gt; +C_DecryptUpdate() and C_DecryptFinalize().<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/xhanulik/Ope=
nSC/commit/bb9bd627462af4d61943a33d6e54308e103618f0" target=3D"_blank" rel=
=3D"noreferrer">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub.com%2Fxhanulik%2FOpenSC%2Fcommit%2Fbb9bd627462af4d61943a33d=
6e54308e103618f0&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d=
4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039=
199071%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DchY%2FOcThfZawDLg0w6dI9NUdq=
QMzYiMdHzW7Hyf9%2Fcg%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;<a href=3D"mailto:nikhil.r@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">nikhil.r@kpit.com</a>&gt;<br>
&gt; +Comment: Refreshed hunk to match latest kirkstone<br>
&gt; +---<br>
&gt; + src/pkcs11/framework-pkcs15.c | 15 +++++++++++++<br>
&gt; + src/pkcs11/mechanism.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4=
2 ++++++++++++++++++++++++++++++-----<br>
&gt; + 2 files changed, 51 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkc=
s15.c<br>
&gt; +index 688cd84fdc..18f94271ed 100644<br>
&gt; +--- a/src/pkcs11/framework-pkcs15.c<br>
&gt; ++++ b/src/pkcs11/framework-pkcs15.c<br>
&gt; +@@ -4345,6 +4345,21 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_se<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int rv, flags =3D 0, prkey_has_p=
ath =3D 0;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CK_ULONG mask, good, rv_pkcs11;<=
br>
&gt; +<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pulDataLen =3D=3D NULL) {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* This is call from the C_DecyptInit function */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 sc_log(context, &quot;C_DecryptInit...&quot;);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return CKR_OK;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pEncryptedData =3D=3D NULL &amp;&=
amp; ulEncryptedDataLen =3D=3D 0) {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* This is call from the C_DecryptFinalize function */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 sc_log(context, &quot;C_DecryptFinalize...&quot;);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 *pulDataLen =3D 0;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return CKR_OK;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* DecryptUpdate: we assume this code=
 is called only once per session, either<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * from the C_Decrypt function o=
r from an application using the C_DecryptUpdate call<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt; ++<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_log(context, &quot;Initiating=
 decryption.&quot;);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!p11card)<br>
&gt; +diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c<br>
&gt; +index 3035e8a763..a81b58fea6 100644<br>
&gt; +--- a/src/pkcs11/mechanism.c<br>
&gt; ++++ b/src/pkcs11/mechanism.c<br>
&gt; +@@ -1072,9 +1072,11 @@ sc_pkcs11_decrypt_init(sc_pkcs11_operati<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LOG_FUNC_RE=
TURN(context, (int) rv);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +-<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 operation-&gt;priv_data =3D data=
;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return CKR_OK;<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* The last parameter is NULL - this =
is call to INIT code in underlying functions */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return key-&gt;ops-&gt;decrypt(operat=
ion-&gt;session,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key, &amp;oper=
ation-&gt;mechanism, NULL, 0, NULL, NULL);<br>
&gt; + }<br>
&gt; +<br>
&gt; + static CK_RV<br>
&gt; +@@ -1084,14 +1086,42 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct signature_data *data;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sc_pkcs11_object *key;<br=
>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CK_RV rv;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CK_ULONG ulDataLen, ulLastDataLen;<br=
>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* PKCS#11: If pBuf is not NULL_PTR, =
then *pulBufLen must contain the size in bytes.. */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pData &amp;&amp; !pulDataLen)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return CKR_ARGUMENTS_BAD;<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ulDataLen =3D pulDataLen ? *pulDataLe=
n : 0;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ulLastDataLen =3D ulDataLen;<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data =3D (struct signature_data*=
) operation-&gt;priv_data;<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key =3D data-&gt;key;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return key-&gt;ops-&gt;decrypt(operat=
ion-&gt;session,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key, &amp;operation-&gt;mechanism,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pEncryptedData, ulEncryptedDataLen,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pData, pulDataLen);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Decrypt */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rv =3D key-&gt;ops-&gt;decrypt(operat=
ion-&gt;session, key, &amp;operation-&gt;mechanism,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pEncryptedData=
, ulEncryptedDataLen, pData, &amp;ulDataLen);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pulDataLen)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 *pulDataLen =3D ulDataLen;<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rv !=3D CKR_OK)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return rv;<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* recalculate buffer space */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ulDataLen &lt;=3D ulLastDataLen)<=
br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ulLastDataLen -=3D ulDataLen;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ulLastDataLen =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* DecryptFinalize */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rv =3D key-&gt;ops-&gt;decrypt(operat=
ion-&gt;session, key, &amp;operation-&gt;mechanism,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, pData=
 + ulDataLen, &amp;ulLastDataLen);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pulDataLen)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 *pulDataLen =3D ulDataLen + ulLastDataLen;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rv;<br>
&gt; + }<br>
&gt; +<br>
&gt; + static CK_RV<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..8450ed010<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch<br>
&gt; @@ -0,0 +1,357 @@<br>
&gt; +From b9e1d344df1f850a9b15bce6294f72c1620d0b45 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;<=
a href=3D"mailto:vhanulik@redhat.com" target=3D"_blank" rel=3D"noreferrer">=
vhanulik@redhat.com</a>&gt;<br>
&gt; +Date: Mon, 13 Nov 2023 13:54:54 +0100<br>
&gt; +Subject: [PATCH] Reimplement removing of PKCS#1 v1.5 padding to be ti=
me<br>
&gt; + constant<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/b9e1d344df1f850a9b15bce6294f72c1620d0b45" target=3D"_bl=
ank" rel=3D"noreferrer">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2Fb9e=
1d344df1f850a9b15bce6294f72c1620d0b45&amp;data=3D05%7C02%7Cnikhil.r%40kpit.=
com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638585474039202218%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DiPX5r%=
2Fgij2FkmH7YiZyjjq3X4bmfg3b5M3swdYu1oXc%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;<a href=3D"mailto:nikhil.r@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">nikhil.r@kpit.com</a>&gt;<br>
&gt; +Comment: Refreshed hunks to match latest kirkstone<br>
&gt; +---<br>
&gt; + src/common/Makefile.am=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6=
 +-<br>
&gt; + src/common/constant-time.h=C2=A0 | 128 +++++++++++++++++++++++++++++=
+++++++<br>
&gt; + src/libopensc/internal.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-<br>
&gt; + src/libopensc/padding.c=C2=A0=C2=A0=C2=A0=C2=A0 | 102 ++++++++++++++=
+++++---------<br>
&gt; + src/libopensc/pkcs15-sec.c=C2=A0 |=C2=A0=C2=A0 5 +-<br>
&gt; + src/minidriver/minidriver.c |=C2=A0=C2=A0 4 +-<br>
&gt; + 6 files changed, 210 insertions(+), 39 deletions(-)<br>
&gt; + create mode 100644 src/common/constant-time.h<br>
&gt; +<br>
&gt; +diff --git a/src/common/Makefile.am b/src/common/Makefile.am<br>
&gt; +index 5153428dce..9ecbffe8fd 100644<br>
&gt; +--- a/src/common/Makefile.am<br>
&gt; ++++ b/src/common/Makefile.am<br>
&gt; +@@ -8,7 +8,8 @@ dist_noinst_DATA =3D \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LICENSE.compat_getopt compat_get=
opt.txt \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compat_getopt_main.c \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 README.compat_strlcpy compat_str=
lcpy.3<br>
&gt; +-noinst_HEADERS =3D compat_strlcat.h compat_strlcpy.h compat_strnlen.=
h compat_getpass.h compat_getopt.h simclist.h libpkcs11.h libscdl.h<br>
&gt; ++noinst_HEADERS =3D compat_strlcat.h compat_strlcpy.h compat_strnlen.=
h compat_getpass.h \<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compat_getopt.h simclist.h libpkcs11.=
h libscdl.h constant-time.h<br>
&gt; +<br>
&gt; + AM_CPPFLAGS =3D -I$(top_srcdir)/src<br>
&gt; +<br>
&gt; +@@ -40,7 +41,8 @@ TIDY_FILES =3D \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compat_report_rangecheckfailure.=
c \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compat___iob_func.c \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 simclist.c simclist.h \<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libpkcs11.c libscdl.c<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libpkcs11.c libscdl.c \<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 constant-time.h<br>
&gt; +<br>
&gt; + check-local:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -x &quot;$(CLANGTIDY)&quot;=
 ]; then clang-tidy -config=3D&#39;&#39; --checks=3D&#39;$(TIDY_CHECKS)&#39=
; -header-filter=3D.* $(addprefix $(srcdir)/,$(TIDY_FILES)) -- $(TIDY_FLAGS=
); fi<br>
&gt; +diff --git a/src/common/constant-time.h b/src/common/constant-time.h<=
br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000..40c3e500c2<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/src/common/constant-time.h<br>
&gt; +@@ -0,0 +1,128 @@<br>
&gt; ++/* Original source: <a href=3D"https://github.com/openssl/openssl/bl=
ob/9890cc42daff5e2d0cad01ac4bf78c391f599a6e/include/internal/constant_time.=
h" target=3D"_blank" rel=3D"noreferrer">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenssl%2Fopenssl%2Fblob%2F9890cc42daff5e2d0cad01ac4bf78c391f599a6e%2=
Finclude%2Finternal%2Fconstant_time.h&amp;data=3D05%7C02%7Cnikhil.r%40kpit.=
com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638585474039205497%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3D2ZUT7z=
6e6fmVbnWkr%2BeO4r8DNFdkIFasKGZC4XByAuY%3D&amp;reserved=3D0</a>
 */<br>
&gt; ++<br>
&gt; ++#ifndef CONSTANT_TIME_H<br>
&gt; ++#define CONSTANT_TIME_H<br>
&gt; ++<br>
&gt; ++#include &lt;stdlib.h&gt;<br>
&gt; ++#include &lt;string.h&gt;<br>
&gt; ++<br>
&gt; ++#if !defined(inline)<br>
&gt; ++#if defined(__STDC_VERSION__) &amp;&amp; __STDC_VERSION__ &gt;=3D 19=
9901L<br>
&gt; ++#define constant_inline inline<br>
&gt; ++#elif defined(__GNUC__) &amp;&amp; __GNUC__ &gt;=3D 2<br>
&gt; ++#elif defined(__GNUC__) &amp;&amp; __GNUC__ &gt;=3D 2<br>
&gt; ++#elif defined(_MSC_VER)<br>
&gt; ++#define constant_inline __inline<br>
&gt; ++#else<br>
&gt; ++#define constant_inline<br>
&gt; ++#endif<br>
&gt; ++#else=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /* use what caller wants as inline=C2=A0 may be from config.h */<br>
&gt; ++#define constant_inline inline /* inline */<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++/*-<br>
&gt; ++ * The boolean methods return a bitmask of all ones (0xff...f) for t=
rue<br>
&gt; ++ * and 0 for false. For example,<br>
&gt; ++ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (a &lt; b) {<br>
&gt; ++ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c =3D a;<br>
&gt; ++ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {<br>
&gt; ++ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c =3D b;<br>
&gt; ++ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++ * can be written as<br>
&gt; ++ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int lt =3D constant_time_l=
t(a, b);<br>
&gt; ++ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c =3D constant_time_select(lt, a, b=
);<br>
&gt; ++ */<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++value_barrier(unsigned int a)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 volatile unsigned int r =3D a;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline size_t<br>
&gt; ++value_barrier_s(size_t a)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 volatile size_t r =3D a;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* MSB */<br>
&gt; ++static constant_inline size_t<br>
&gt; ++constant_time_msb_s(size_t a)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0 - (a &gt;&gt; (sizeof(a) * 8=
 - 1));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_msb(unsigned int a)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0 - (a &gt;&gt; (sizeof(a) * 8=
 - 1));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Select */<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_select(unsigned int mask, unsigned int a, unsigned int=
 b)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (value_barrier(mask) &amp; a) =
| (value_barrier(~mask) &amp; b);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned char<br>
&gt; ++constant_time_select_8(unsigned char mask, unsigned char a, unsigned=
 char b)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (unsigned char)constant_time_s=
elect(mask, a, b);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline size_t<br>
&gt; ++constant_time_select_s(size_t mask, size_t a, size_t b)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (value_barrier_s(mask) &amp; a=
) | (value_barrier_s(~mask) &amp; b);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Zero */<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_is_zero(unsigned int a)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return constant_time_msb(~a &amp; (a =
- 1));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline size_t<br>
&gt; ++constant_time_is_zero_s(size_t a)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return constant_time_msb_s(~a &amp; (=
a - 1));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Comparison*/<br>
&gt; ++static constant_inline size_t<br>
&gt; ++constant_time_lt_s(size_t a, size_t b)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return constant_time_msb_s(a ^ ((a ^ =
b) | ((a - b) ^ b)));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_lt(unsigned int a, unsigned int b)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return constant_time_msb(a ^ ((a ^ b)=
 | ((a - b) ^ b)));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_ge(unsigned int a, unsigned int b)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ~constant_time_lt(a, b);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Equality*/<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_eq(unsigned int a, unsigned int b)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return constant_time_is_zero(a ^ b);<=
br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline size_t<br>
&gt; ++constant_time_eq_s(size_t a, size_t b)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return constant_time_is_zero_s(a ^ b)=
;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++#endif /* CONSTANT_TIME_H */<br>
&gt; +diff --git a/src/libopensc/internal.h b/src/libopensc/internal.h<br>
&gt; +index 7531260c14..2a98f0e966 100644<br>
&gt; +--- a/src/libopensc/internal.h<br>
&gt; ++++ b/src/libopensc/internal.h<br>
&gt; +@@ -166,8 +166,8 @@ int _sc_card_add_xeddsa_alg(struct sc_ca<br>
&gt; +<br>
&gt; + int sc_pkcs1_strip_01_padding(struct sc_context *ctx, const u8 *in_d=
at, size_t in_len,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u8 *out_dat, size_t *out_len);<br>
&gt; +-int sc_pkcs1_strip_02_padding(struct sc_context *ctx, const u8 *data=
, size_t len,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 u8 *out_dat, size_t *out_len);<br>
&gt; ++int sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsig=
ned int n, const u8 *data,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned int data_len, u8 *out, unsigned int *out_len);<br>
&gt; + int sc_pkcs1_strip_digest_info_prefix(unsigned int *algorithm,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 const u8 *in_dat, size_t in_len, u8 *out_dat, size_t *out_l=
en);<br>
&gt; +<br>
&gt; +diff --git a/src/libopensc/padding.c b/src/libopensc/padding.c<br>
&gt; +index ca47733a4e..ddb3061134 100644<br>
&gt; +--- a/src/libopensc/padding.c<br>
&gt; ++++ b/src/libopensc/padding.c<br>
&gt; +@@ -32,10 +32,13 @@<br>
&gt; + #include &lt;string.h&gt;<br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; +<br>
&gt; ++#include &quot;common/constant-time.h&quot;<br>
&gt; + #include &quot;internal.h&quot;<br>
&gt; +<br>
&gt; + /* TODO doxygen comments */<br>
&gt; +<br>
&gt; ++#define SC_PKCS1_PADDING_MIN_SIZE 11<br>
&gt; ++<br>
&gt; + /*<br>
&gt; +=C2=A0 * Prefixes for pkcs-v1 signatures<br>
&gt; +=C2=A0 */<br>
&gt; +@@ -143,45 +146,82 @@ sc_pkcs1_strip_01_padding(struct sc_context *ct=
x, const u8 *in_dat, size_t in_le<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return SC_SUCCESS;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-<br>
&gt; +-/* remove pkcs1 BT02 padding (adding BT02 padding is currently not<b=
r>
&gt; +- * needed/implemented) */<br>
&gt; ++/* Remove pkcs1 BT02 padding (adding BT02 padding is currently not<b=
r>
&gt; ++ * needed/implemented) in constant-time.<br>
&gt; ++ * Original source: <a href=3D"https://github.com/openssl/openssl/bl=
ob/9890cc42daff5e2d0cad01ac4bf78c391f599a6e/crypto/rsa/rsa_pk1.c#L171" targ=
et=3D"_blank" rel=3D"noreferrer">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenssl%2Fopenssl%2Fblob%2F9890cc42daff5e2d0cad01ac4bf78c391f599a6e%2=
Fcrypto%2Frsa%2Frsa_pk1.c%23L171&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7=
Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C=
0%7C638585474039208698%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Dri2Mtwz%2Fa=
vHG13ACpSdlI3ucHbNqOtofLco53NB%2B6KM%3D&amp;reserved=3D0</a>
 */<br>
&gt; + int<br>
&gt; +-sc_pkcs1_strip_02_padding(sc_context_t *ctx, const u8 *data, size_t =
len, u8 *out, size_t *out_len)<br>
&gt; ++sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsigned =
int n, const u8 *data, unsigned int data_len, u8 *out, unsigned int *out_le=
n)<br>
&gt; + {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int=C2=A0=C2=A0=C2=A0 n =3D =
0;<br>
&gt; +-<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i =3D 0;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 *msg, *msg_orig =3D NULL;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int good, found_zero_byte, m=
ask;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int zero_index =3D 0, msg_in=
dex, mlen =3D -1, len =3D 0;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LOG_FUNC_CALLED(ctx);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (data =3D=3D NULL || len &lt; 3)<b=
r>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (data =3D=3D NULL || data_len &lt;=
=3D 0 || data_len &gt; n || n &lt; SC_PKCS1_PADDING_MIN_SIZE)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* skip leading zero byte */<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*data =3D=3D 0) {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 data++;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 len--;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg =3D msg_orig =3D calloc(n, sizeof=
(u8));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (msg =3D=3D NULL)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We can not check length of in=
put data straight away and still we need to read<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * from input even when the inpu=
t is not as long as needed to keep the time constant.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If data has wrong size, it is=
 padded by zeroes from left and the following checks<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * do not pass.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 len =3D data_len;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (data +=3D len, msg +=3D n, i =3D=
 0; i &lt; n; i++) {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mask =3D ~constant_time_is_zero(len);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 len -=3D 1 &amp; mask;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 data -=3D 1 &amp; mask;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 *--msg =3D *data &amp; mask;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // check first byte to be 0x00<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good =3D constant_time_is_zero(msg[0]=
);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // check second byte to be 0x02<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good &amp;=3D constant_time_eq(msg[1]=
, 2);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // find zero byte after random data i=
n padding<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found_zero_byte =3D 0;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 2; i &lt; n; i++) {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned int equals0 =3D constant_time_is_zero(msg[i]);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 zero_index =3D constant_time_select(~found_zero_byte &amp; equ=
als0, i, zero_index);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 found_zero_byte |=3D equals0;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (data[0] !=3D 0x02)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* skip over padding bytes */<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (n =3D 1; n &lt; len &amp;&amp; d=
ata[n]; n++)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Must be at least 8 pad bytes */<br=
>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (n &gt;=3D len || n &lt; 9)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n++;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (out =3D=3D NULL)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* just check the padding */<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 LOG_FUNC_RETURN(ctx, SC_SUCCESS);<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Now move decrypted contents to hea=
d of buffer */<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*out_len &lt; len - n)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *out_len =3D len - n;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memmove(out, data + n, *out_len);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // zero_index stands for index of las=
t found zero<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good &amp;=3D constant_time_ge(zero_i=
ndex, 2 + 8);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // start of the actual message in dat=
a<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg_index =3D zero_index + 1;<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // length of message<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mlen =3D data_len - msg_index;<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // check that message fits into out b=
uffer<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good &amp;=3D constant_time_ge(*out_l=
en, mlen);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // move the result in-place by |num|-=
SC_PKCS1_PADDING_MIN_SIZE-|mlen| bytes to the left.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *out_len =3D constant_time_select(con=
stant_time_lt(n - SC_PKCS1_PADDING_MIN_SIZE, *out_len),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n - SC_PKCS1_P=
ADDING_MIN_SIZE, *out_len);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (msg_index =3D 1; msg_index &lt; =
n - SC_PKCS1_PADDING_MIN_SIZE; msg_index &lt;&lt;=3D 1) {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mask =3D ~constant_time_eq(msg_index &amp; (n - SC_PKCS1_PADDI=
NG_MIN_SIZE - mlen), 0);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 for (i =3D SC_PKCS1_PADDING_MIN_SIZE; i &lt; n - msg_index; i+=
+)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg[i] =3D con=
stant_time_select_8(mask, msg[i + msg_index], msg[i]);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // move message into out buffer, if g=
ood<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i &lt; *out_len; i++) {=
<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned int msg_index;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 // when out is longer than message in data, use some bogus ind=
ex in msg<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mask =3D good &amp; constant_time_lt(i, mlen);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 msg_index =3D constant_time_select(mask, i + SC_PKCS1_PADDING_=
MIN_SIZE, 0); // to now overflow msg buffer<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 out[i] =3D constant_time_select_8(mask, msg[msg_index], out[i]=
);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_log(ctx, &quot;stripped output(%&q=
uot;SC_FORMAT_LEN_SIZE_T&quot;u): %s&quot;, len - n,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sc_dump_hex(out, len - n));<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LOG_FUNC_RETURN(ctx, len - n);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(msg_orig);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return constant_time_select(good, mle=
n, SC_ERROR_WRONG_PADDING);<br>
&gt; + }<br>
&gt; +<br>
&gt; + /* add/remove DigestInfo prefix */<br>
&gt; +diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c<=
br>
&gt; +index 2ac6ca7ddf..a019af460f 100644<br>
&gt; +--- a/src/libopensc/pkcs15-sec.c<br>
&gt; ++++ b/src/libopensc/pkcs15-sec.c<br>
&gt; +@@ -308,8 +308,9 @@ int sc_pkcs15_decipher(struct sc_pkcs15_<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Strip any padding */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pad_flags &amp; SC_ALGORITHM=
_RSA_PAD_PKCS1) {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 size_t s =3D r;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 r =3D sc_pkcs1_strip_02_padding(ctx, out, s, out, &amp;s);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 int s =3D r;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 int key_size =3D alg_info-&gt;key_length;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 r =3D sc_pkcs1_strip_02_padding_constant_time(ctx, key_size / =
8, out, s, out, &amp;s);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 LOG_TEST_RET(ctx, r, &quot;Invalid PKCS#1 padding&quot;);<b=
r>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.=
c<br>
&gt; +index 3391994abe..5248d9758a 100644<br>
&gt; +--- a/src/minidriver/minidriver.c<br>
&gt; ++++ b/src/minidriver/minidriver.c<br>
&gt; +@@ -4582,9 +4582,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 &quot;sc_pkcs15_decipher: DECRYPT-INFO dwVersion=3D%l=
u\n&quot;,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (unsigned long)pInfo-&gt;dwVersion);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pInfo-&gt;dwPaddingType =3D=3D CAR=
D_PADDING_PKCS1)=C2=A0=C2=A0 {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 size_t temp =3D pInfo-&gt;cbData;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned int temp =3D pInfo-&gt;cbData;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 logprintf(pCardData, 2, &quot;sc_pkcs15_decipher: stripping PKCS1=
 padding\n&quot;);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 r =3D sc_pkcs1_strip_02_padding(vs-&gt;ctx, pbuf2, pInfo-&gt;cbData,=
 pbuf2, &amp;temp);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 r =3D sc_pkcs1_strip_02_padding_constant_time(vs-&gt;ctx, prkey_info=
-&gt;modulus_length / 8, pbuf2, pInfo-&gt;cbData, pbuf2, &amp;temp);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pInfo-&gt;cbData =3D (DWORD) temp;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (r &lt; 0)=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logprintf(pCardDa=
ta, 2, &quot;Cannot strip PKCS1 padding: %i\n&quot;, r);<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..1d8bc1259<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch<br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +From 1a6a18c51a1d6239850b61d19aed6424afd4912f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;<=
a href=3D"mailto:vhanulik@redhat.com" target=3D"_blank" rel=3D"noreferrer">=
vhanulik@redhat.com</a>&gt;<br>
&gt; +Date: Thu, 16 Nov 2023 10:38:12 +0100<br>
&gt; +Subject: [PATCH] pkcs15-sec: Remove logging after PKCS#1 v1.5 depaddi=
ng<br>
&gt; +<br>
&gt; +To prevent Marvin attack on RSA PKCS#1 v1.5 padding<br>
&gt; +when logging the return value, signaling the padding error.<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/1a6a18c51a1d6239850b61d19aed6424afd4912f" target=3D"_bl=
ank" rel=3D"noreferrer">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F1a6=
a18c51a1d6239850b61d19aed6424afd4912f&amp;data=3D05%7C02%7Cnikhil.r%40kpit.=
com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638585474039211871%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3D85lGNh=
d1ZVO%2BryUZRPhW%2FOZou8jP6r6Zm8TeDi%2FRgCI%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;<a href=3D"mailto:nikhil.r@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">nikhil.r@kpit.com</a>&gt;<br>
&gt; +Comment: Refreshed hunk to match latest kirkstone<br>
&gt; +---<br>
&gt; + src/libopensc/pkcs15-sec.c | 9 +++++----<br>
&gt; + 1 file changed, 5 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c<=
br>
&gt; +index a019af460f..f7ee819d65 100644<br>
&gt; +--- a/src/libopensc/pkcs15-sec.c<br>
&gt; ++++ b/src/libopensc/pkcs15-sec.c<br>
&gt; +@@ -308,13 +308,14 @@ int sc_pkcs15_decipher(struct sc_pkcs15_<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Strip any padding */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pad_flags &amp; SC_ALGORITHM=
_RSA_PAD_PKCS1) {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 int s =3D r;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 int key_size =3D alg_info-&gt;key_length;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned int s =3D r;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned int key_size =3D (unsigned int)alg_info-&gt;key_lengt=
h;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 r =3D sc_pkcs1_strip_02_padding_constant_time(ctx, key_size=
 / 8, out, s, out, &amp;s);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 LOG_TEST_RET(ctx, r, &quot;Invalid PKCS#1 padding&quot;);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* for keeping PKCS#1 v1.5 depadding constant-time, do not log=
 error here */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LOG_FUNC_RETURN(ctx, r);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* do not log error code to prevent s=
ide channel attack */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;<br>
&gt; + }<br>
&gt; +<br>
&gt; + /* derive one key from another. RSA can use decipher, so this is for=
 only ECDH<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..d3846e5da<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch<br>
&gt; @@ -0,0 +1,105 @@<br>
&gt; +From a8ac5930ab8f2da5cb93793d05389761c342f995 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;<=
a href=3D"mailto:vhanulik@redhat.com" target=3D"_blank" rel=3D"noreferrer">=
vhanulik@redhat.com</a>&gt;<br>
&gt; +Date: Thu, 16 Nov 2023 15:49:15 +0100<br>
&gt; +Subject: [PATCH] framework-pkcs15.c: Handle PKCS#1 v1.5 depadding<br>
&gt; + constant-time<br>
&gt; +<br>
&gt; +In order to not disclose time side-channel when the depadding<br>
&gt; +fails, do the same operations as for case when depadding ends<br>
&gt; +with success.<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/a8ac5930ab8f2da5cb93793d05389761c342f995" target=3D"_bl=
ank" rel=3D"noreferrer">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2Fa8a=
c5930ab8f2da5cb93793d05389761c342f995&amp;data=3D05%7C02%7Cnikhil.r%40kpit.=
com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638585474039215146%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Dx206N6=
Zb8coR7iTMmKuZRhlAlymSDrm83Py%2FtzaKWq8%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;<a href=3D"mailto:nikhil.r@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">nikhil.r@kpit.com</a>&gt;<br>
&gt; +Comment: Refreshed hunks to match latest kirkstone<br>
&gt; +---<br>
&gt; + src/pkcs11/framework-pkcs15.c | 54 ++++++++++++++++++++++++++-------=
--<br>
&gt; + 1 file changed, 41 insertions(+), 13 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkc=
s15.c<br>
&gt; +index f75a3dbaec..632681df63 100644<br>
&gt; +--- a/src/pkcs11/framework-pkcs15.c<br>
&gt; ++++ b/src/pkcs11/framework-pkcs15.c<br>
&gt; +@@ -18,6 +18,7 @@<br>
&gt; +=C2=A0 * Foundation, Inc., <a href=3D"https://www.google.com/maps/sea=
rch/59+Temple+Place,+Suite+330,+Boston,+MA+02111-1307+USA?entry=3Dgmail&amp=
;source=3Dg">59 Temple Place, Suite 330, Boston, MA</a>=C2=A0 <a href=3D"ht=
tps://www.google.com/maps/search/59+Temple+Place,+Suite+330,+Boston,+MA+021=
11-1307+USA?entry=3Dgmail&amp;source=3Dg">02111-1307</a>=C2=A0 <a href=3D"h=
ttps://www.google.com/maps/search/59+Temple+Place,+Suite+330,+Boston,+MA+02=
111-1307+USA?entry=3Dgmail&amp;source=3Dg">USA</a><br>
&gt; +=C2=A0 */<br>
&gt; +<br>
&gt; ++#include &quot;common/constant-time.h&quot;<br>
&gt; + #include &quot;config.h&quot;<br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; + #include &lt;string.h&gt;<br>
&gt; +@@ -4341,7 +4342,8 @@<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pkcs15_fw_data *fw_data =
=3D NULL;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pkcs15_prkey_object *prke=
y;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned char decrypted[512]; /*=
 FIXME: Will not work for keys above 4096 bits */<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=C2=A0=C2=A0=C2=A0=C2=A0 buff_too_=
small, rv, flags =3D 0, prkey_has_path =3D 0;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int rv, flags =3D 0, prkey_has_path =
=3D 0;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CK_ULONG mask, good, rv_pkcs11;<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_log(context, &quot;Initiating=
 decryption.&quot;);<br>
&gt; +<br>
&gt; +@@ -4415,27 +4417,53 @@<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rv =3D sc_pkcs15_decipher(fw_dat=
a-&gt;p15_card, prkey-&gt;prv_p15obj, flags,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pEncryptedD=
ata, ulEncryptedDataLen, decrypted, sizeof(decrypted));<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rv &lt; 0 &amp;&amp; !sc_pkcs11_c=
onf.lock_login &amp;&amp; !prkey_has_path)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* skip for PKCS#1 v1.5 padding preve=
nt side channel attack */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(flags &amp; SC_ALGORITHM_RSA_PA=
D_PKCS1) &amp;&amp;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rv &lt; 0 &amp=
;&amp; !sc_pkcs11_conf.lock_login &amp;&amp; !prkey_has_path)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (reselect_app_df(fw_data-&gt;p15_card) =3D=3D SC_SUCCESS=
)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rv =3D sc_p=
kcs15_decipher(fw_data-&gt;p15_card, prkey-&gt;prv_p15obj, flags,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pEncryptedData, ulEncryptedDataLen, decrypted, sizeof(decrypted))=
;<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_unlock(p11card-&gt;card);<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_log(context, &quot;Decryption comp=
lete. Result %d.&quot;, rv);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_log(context, &quot;Decryption comp=
lete.&quot;);<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rv &lt; 0)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return sc_to_cryptoki_error(rv, &quot;C_Decrypt&quot;);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Handle following code in constant-=
time<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to prevent Marvin attack for =
PKCS#1 v1.5 padding. */<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buff_too_small =3D (*pulDataLen &lt; =
(CK_ULONG)rv);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *pulDataLen =3D rv;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pData =3D=3D NULL_PTR)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return CKR_OK;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (buff_too_small)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return CKR_BUFFER_TOO_SMALL;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(pData, decrypted, *pulDataLen)=
;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* only padding error must be handled=
 in constant-time way,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * other error can be returned s=
traight away */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((~constant_time_eq_s(rv, SC_ERROR=
_WRONG_PADDING) &amp; constant_time_lt_s(sizeof(decrypted), rv)))<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return sc_to_cryptoki_error(rv, &quot;C_Decrypt&quot;);<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return CKR_OK;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* check rv for padding error */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good =3D ~constant_time_eq_s(rv, SC_E=
RROR_WRONG_PADDING);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rv_pkcs11 =3D sc_to_cryptoki_error(SC=
_ERROR_WRONG_PADDING, &quot;C_Decrypt&quot;);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rv_pkcs11 =3D constant_time_select_s(=
good, CKR_OK, rv_pkcs11);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pData =3D=3D NULL_PTR) {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* set length only if no error */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 *pulDataLen =3D constant_time_select_s(good, rv, *pulDataLen);=
<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* return error only if original rv &lt; 0 */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return rv_pkcs11;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* check whether *pulDataLen &lt; rv =
and set return value for small output buffer */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mask =3D good &amp; constant_time_lt_=
s(*pulDataLen, rv);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rv_pkcs11 =3D constant_time_select_s(=
mask, CKR_BUFFER_TOO_SMALL, rv_pkcs11);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good &amp;=3D ~mask;<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* move everything from decrypted int=
o out buffer constant-time, if rv is ok */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (CK_ULONG i =3D 0; i &lt; *pulDat=
aLen; i++) { /* iterate over whole pData to not disclose real depadded leng=
th */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 CK_ULONG msg_index;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mask =3D good &amp; constant_time_lt_s(i, sizeof(decrypted));=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 i should be in the bounds of decrypted */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mask &amp;=3D constant_time_lt_s(i, constant_time_select_s(goo=
d, rv, 0)); /* check that is in bounds of depadded message */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 msg_index =3D constant_time_select_s(mask, i, 0);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 pData[i] =3D constant_time_select_8(mask, decrypted[msg_index]=
, pData[i]);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *pulDataLen =3D constant_time_select_=
s(good, rv, *pulDataLen);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* do not log error code to prevent s=
ide channel attack */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rv_pkcs11;<br>
&gt; + }<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..e113df7c4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +From 32cdab44f6b1e6343f029879a8ab32de4f32743f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;<=
a href=3D"mailto:vhanulik@redhat.com" target=3D"_blank" rel=3D"noreferrer">=
vhanulik@redhat.com</a>&gt;<br>
&gt; +Date: Mon, 8 Jan 2024 14:59:22 +0100<br>
&gt; +Subject: [PATCH] mechanism: Handle PKCS#1 v1.5 depadding constant-tim=
e<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/32cdab44f6b1e6343f029879a8ab32de4f32743f" target=3D"_bl=
ank" rel=3D"noreferrer">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F32c=
dab44f6b1e6343f029879a8ab32de4f32743f&amp;data=3D05%7C02%7Cnikhil.r%40kpit.=
com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638585474039218933%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DwlIwj0=
1UWFsUnKMzR9qAW0hHzK7kSjAygzZQatz%2BG8A%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;<a href=3D"mailto:nikhil.r@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">nikhil.r@kpit.com</a>&gt;<br>
&gt; +Comment: 1 hunk removed and refreshed hunks to match latest kirkstone=
<br>
&gt; +---<br>
&gt; + src/pkcs11/mechanism.c | 19 ++++++++++++++-----<br>
&gt; + 1 file changed, 14 insertions(+), 5 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c<br>
&gt; +index 03495265a4..d3f0434231 100644<br>
&gt; +--- a/src/pkcs11/mechanism.c<br>
&gt; ++++ b/src/pkcs11/mechanism.c<br>
&gt; +@@ -23,6 +23,7 @@<br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; + #include &lt;string.h&gt;<br>
&gt; +<br>
&gt; ++#include &quot;common/constant-time.h&quot;<br>
&gt; + #include &quot;sc-pkcs11.h&quot;<br>
&gt; +<br>
&gt; + /* Also used for verification data */<br>
&gt; +@@ -844,7 +845,9 @@ sc_pkcs11_decr(struct sc_pkcs11_session<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rv =3D op-&gt;type-&gt;decrypt(o=
p, pEncryptedData, ulEncryptedDataLen,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pData, pulDataLen);<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rv !=3D CKR_BUFFER_TOO_SMALL &amp=
;&amp; pData !=3D NULL)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* terminate session for any return v=
alue except CKR_BUFFER_TOO_SMALL,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * perform check in time side-ch=
annel free way to prevent Marvin attack */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!constant_time_eq_s(rv, CKR_BUFFE=
R_TOO_SMALL) &amp;&amp; pData !=3D NULL)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 session_stop_operation(session, SC_PKCS11_OPERATION_DECRYPT=
);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rv;<br>
&gt; +@@ -1107,6 +1107,10 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pulDataLen)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *pulDataLen =3D ulDataLen;<br>
&gt; +<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Skip DecryptFinalize for PKCS#1 v1=
.5 padding to prevent time side-channel leakage */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (((CK_MECHANISM_PTR)&amp;operation=
-&gt;mechanism)-&gt;mechanism =3D=3D CKM_RSA_PKCS)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return rv;<br>
&gt; ++<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rv !=3D CKR_OK)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return rv;<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..7bb862194<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch<br>
&gt; @@ -0,0 +1,115 @@<br>
&gt; +From 1fe1a78610b00b9db83a03396762c72c1371bd02 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;<=
a href=3D"mailto:vhanulik@redhat.com" target=3D"_blank" rel=3D"noreferrer">=
vhanulik@redhat.com</a>&gt;<br>
&gt; +Date: Wed, 22 Nov 2023 15:02:57 +0100<br>
&gt; +Subject: [PATCH] minidriver: Make CardRSADecrypt constant-time<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/1fe1a78610b00b9db83a03396762c72c1371bd02" target=3D"_bl=
ank" rel=3D"noreferrer">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F1fe=
1a78610b00b9db83a03396762c72c1371bd02&amp;data=3D05%7C02%7Cnikhil.r%40kpit.=
com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638585474039222236%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3D45wf78=
tNtkWO15anb%2FntZ%2BKbbZaqLE3aKnfLhVot0bI%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;<a href=3D"mailto:nikhil.r@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">nikhil.r@kpit.com</a>&gt;<br>
&gt; +Comment: Refreshed hunks to match latest kirkstone<br>
&gt; +---<br>
&gt; + src/minidriver/minidriver.c | 37 +++++++++++++++++++++++------------=
--<br>
&gt; + 1 file changed, 23 insertions(+), 14 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.=
c<br>
&gt; +index 5248d9758a..b99b6cff89 100644<br>
&gt; +--- a/src/minidriver/minidriver.c<br>
&gt; ++++ b/src/minidriver/minidriver.c<br>
&gt; +@@ -41,6 +41,7 @@<br>
&gt; + #include &quot;cardmod.h&quot;<br>
&gt; +<br>
&gt; + #include &quot;common/compat_strlcpy.h&quot;<br>
&gt; ++#include &quot;common/constant-time.h&quot;<br>
&gt; + #include &quot;libopensc/asn1.h&quot;<br>
&gt; + #include &quot;libopensc/cardctl.h&quot;<br>
&gt; + #include &quot;libopensc/opensc.h&quot;<br>
&gt; +@@ -4463,13 +4464,15 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D<br>
&gt; +<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DWORD dwret;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r, opt_crypt_flags =3D 0;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r, opt_crypt_flags =3D 0, good =
=3D 0;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned ui;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VENDOR_SPECIFIC *vs;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sc_pkcs15_prkey_info *prk=
ey_info;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BYTE *pbuf =3D NULL, *pbuf2 =3D =
NULL;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sc_pkcs15_object *pkey =
=3D NULL;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sc_algorithm_info *alg_in=
fo =3D NULL;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int wrong_padding =3D 0;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int pbufLen =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MD_FUNC_CALLED(pCardData, 1);<br=
>
&gt; +<br>
&gt; +@@ -4570,11 +4573,11 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 goto err;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pbufLen =3D pInfo-&gt;cbData;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (alg_info-&gt;flags &amp; SC_=
ALGORITHM_RSA_RAW)=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 logprintf(pCardData, 2, &quot;sc_pkcs15_decipher: using RSA=
-RAW mechanism\n&quot;);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 r =3D sc_pkcs15_decipher(vs-&gt;p15card, pkey, opt_crypt_fl=
ags, pbuf, pInfo-&gt;cbData, pbuf2, pInfo-&gt;cbData);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 logprintf(pCardData, 2, &quot;sc_pkcs15_decipher returned %d\n=
&quot;, r);<br>
&gt; +-<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* do not log return value to not leak it */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (r &gt; 0) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Need to =
handle padding */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pInfo-&=
gt;dwVersion &gt;=3D CARD_RSA_KEY_DECRYPT_INFO_VERSION_TWO) {<br>
&gt; +@@ -4586,13 +4589,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 logprintf(pCardData, 2, &quot;sc_pkcs15_decipher: stripping PKCS1=
 padding\n&quot;);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 r =3D sc_pkcs1_strip_02_padding_constant_time(vs-&gt;ctx, prkey_i=
nfo-&gt;modulus_length / 8, pbuf2, pInfo-&gt;cbData, pbuf2, &amp;temp);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pInfo-&gt;cbData =3D (DWORD) temp;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (r &lt; 0)=C2=A0=C2=A0 {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logprintf(pCardData,=
 2, &quot;Cannot strip PKCS1 padding: %i\n&quot;, r);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pCardData-&gt;pfnCsp=
Free(pbuf);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pCardData-&gt;pfnCsp=
Free(pbuf2);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dwret =3D SCARD_F_IN=
TERNAL_ERROR;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 wrong_padding =3D constant_time_eq_s(r, SC_ERROR_WRONG_PADDING);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* continue without returning error to not leak that padding is wron=
g<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 to prevent time side-channel leak for Marvin attac=
k*/<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (pInfo-&gt;dwPaddingType =3D=
=3D CARD_PADDING_OAEP)=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /* TODO: Handle OAEP padding if present - can call PFN_CSP_UNPAD_=
DATA */<br>
&gt; +@@ -4640,28 +4639,38 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 goto err;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( r &lt; 0)=C2=A0=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good =3D constant_time_eq_s(r, 0);<br=
>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* if no error or padding error, do n=
ot return here to prevent Marvin attack */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(good | wrong_padding) &amp;&amp=
; r &lt; 0)=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 logprintf(pCardData, 2, &quot;sc_pkcs15_decipher error(%i):=
 %s\n&quot;, r, sc_strerror(r));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pCardData-&gt;pfnCspFree(pbuf);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pCardData-&gt;pfnCspFree(pbuf2);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dwret =3D md_translate_OpenSC_to_Windows_error(r, SCARD_E_I=
NVALID_VALUE);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 goto err;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dwret =3D constant_time_select_s(good=
, SCARD_S_SUCCESS, SCARD_F_INTERNAL_ERROR);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logprintf(pCardData, 2, &quot;de=
crypted data(%lu):\n&quot;,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned long)pInfo-&gt;cbData);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loghex(pCardData, 7, pbuf2, pInf=
o-&gt;cbData);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*inversion donnees */<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for(ui =3D 0; ui &lt; pInfo-&gt;cbDat=
a; ui++)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 pInfo-&gt;pbData[ui] =3D pbuf2[pInfo-&gt;cbData-ui-1];<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* copy data in constant-time way to =
prevent leak */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (ui =3D 0; ui &lt; pbufLen; ui++)=
 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned int mask, msg_index, inv_ui;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mask =3D good &amp; constant_time_lt_s(ui, pInfo-&gt;cbData); =
/* ui should be in the bounds of pbuf2 */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 inv_ui =3D pInfo-&gt;cbData - ui - 1;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 msg_index =3D constant_time_select_s(mask, inv_ui, 0);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 pInfo-&gt;pbData[ui] =3D constant_time_select_8(mask, pbuf2[ms=
g_index], pInfo-&gt;pbData[ui]);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pCardData-&gt;pfnCspFree(pbuf);<=
br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pCardData-&gt;pfnCspFree(pbuf2);=
<br>
&gt; +<br>
&gt; + err:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unlock(pCardData);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MD_FUNC_RETURN(pCardData, 1, dwret);<=
br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* do not log return value to not lea=
k it */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dwret;<br>
&gt; + }<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..5deeacc25<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +From 306dc92bd4d2d74203f53cf3d9ea68c223115375 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;<=
a href=3D"mailto:vhanulik@redhat.com" target=3D"_blank" rel=3D"noreferrer">=
vhanulik@redhat.com</a>&gt;<br>
&gt; +Date: Fri, 24 Nov 2023 20:59:07 +0100<br>
&gt; +Subject: [PATCH] pkcs11-object: Remove return value logging<br>
&gt; +<br>
&gt; +To prevent Marvin attack on RSA PKCS#1 v1.5 padding<br>
&gt; +when logging the return value, signaling the padding error.<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/306dc92bd4d2d74203f53cf3d9ea68c223115375" target=3D"_bl=
ank" rel=3D"noreferrer">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F306=
dc92bd4d2d74203f53cf3d9ea68c223115375&amp;data=3D05%7C02%7Cnikhil.r%40kpit.=
com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638585474039225383%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DWw6twd=
IVhAGYFgLBGs0hZp2udnjM2hXy4hl9mzFGEy0%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;<a href=3D"mailto:nikhil.r@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">nikhil.r@kpit.com</a>&gt;<br>
&gt; +Comment: Two hunks removed from pkcs11-object.c and refreshed sc-pkcs=
11.h<br>
&gt; +---<br>
&gt; + src/pkcs11/pkcs11-object.c | 9 ++++++---<br>
&gt; + src/pkcs11/sc-pkcs11.h=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++++<br>
&gt; + 2 files changed, 11 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/pkcs11/pkcs11-object.c b/src/pkcs11/pkcs11-object.c<=
br>
&gt; +index f04c0b4c56..b023911213 100644<br>
&gt; +--- a/src/pkcs11/pkcs11-object.c<br>
&gt; ++++ b/src/pkcs11/pkcs11-object.c<br>
&gt; +@@ -930,7 +930,8 @@ CK_RV C_Decrypt(CK_SESSION_HANDLE hSessi<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 rv =3D reset_login_state(session-&gt;slot, rv);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_log(context, &quot;C_Decrypt() =3D=
 %s&quot;, lookup_enum ( RV_T, rv ));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* do not log error code to prevent s=
ide channel attack */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SC_LOG(&quot;C_Decrypt()&quot;);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_pkcs11_unlock();<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rv;<br>
&gt; + }<br>
&gt; +diff --git a/src/pkcs11/sc-pkcs11.h b/src/pkcs11/sc-pkcs11.h<br>
&gt; +index 66dfcdde67..510017ed2a 100644<br>
&gt; +--- a/src/pkcs11/sc-pkcs11.h<br>
&gt; ++++ b/src/pkcs11/sc-pkcs11.h<br>
&gt; +@@ -226,6 +226,11 @@<br>
&gt; + };<br>
&gt; + typedef struct sc_pkcs11_slot sc_pkcs11_slot_t;<br>
&gt; +<br>
&gt; ++#define SC_LOG(fmt) \<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do { \<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 sc_log(context, (fmt)); \<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } while (0)<br>
&gt; ++<br>
&gt; + /* Debug virtual slots. S is slot to be highlighted or NULL<br>
&gt; +=C2=A0 * C is a comment format string and args It will be preceded by=
 &quot;VSS &quot; */<br>
&gt; + #define DEBUG_VSS(S, ...) do { sc_log(context,&quot;VSS &quot; __VA_=
ARGS__); _debug_virtual_slots(S); } while (0)<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..7b41abc0e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +From aa6bf2b65fe432e8f234a132268b79ea54d5d74b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;<=
a href=3D"mailto:vhanulik@redhat.com" target=3D"_blank" rel=3D"noreferrer">=
vhanulik@redhat.com</a>&gt;<br>
&gt; +Date: Fri, 24 Nov 2023 21:00:23 +0100<br>
&gt; +Subject: [PATCH] misc: Compare return value constant-time<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/aa6bf2b65fe432e8f234a132268b79ea54d5d74b" target=3D"_bl=
ank" rel=3D"noreferrer">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2Faa6=
bf2b65fe432e8f234a132268b79ea54d5d74b&amp;data=3D05%7C02%7Cnikhil.r%40kpit.=
com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638585474039228489%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DFuhfgr=
vC6wIKW%2F8FyZLmFAPVx3AC0%2F4JC%2FJQvNu4hWs%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;<a href=3D"mailto:nikhil.r@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">nikhil.r@kpit.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/pkcs11/misc.c | 3 ++-<br>
&gt; + 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/pkcs11/misc.c b/src/pkcs11/misc.c<br>
&gt; +index 5ca1176b1d..1d893d6181 100644<br>
&gt; +--- a/src/pkcs11/misc.c<br>
&gt; ++++ b/src/pkcs11/misc.c<br>
&gt; +@@ -23,6 +23,7 @@<br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; + #include &lt;string.h&gt;<br>
&gt; +<br>
&gt; ++#include &quot;common/constant-time.h&quot;<br>
&gt; + #include &quot;sc-pkcs11.h&quot;<br>
&gt; +<br>
&gt; + #define DUMP_TEMPLATE_MAX=C2=A0=C2=A0=C2=A0=C2=A0 32<br>
&gt; +@@ -174,7 +175,7 @@ CK_RV reset_login_state(struct sc_pkcs11_slot *sl=
ot, CK_RV rv)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slot-&gt;p1=
1card-&gt;framework-&gt;logout(slot);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (rv =3D=3D CKR_USER_NOT_LOGGED_IN) {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (constant_time_eq_s(rv, CKR_USER_NOT_LOGGED_IN)) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slot-&gt;lo=
gin_user =3D -1;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pop_all_log=
in_states(slot);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..3ad681ecb<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch<br>
&gt; @@ -0,0 +1,71 @@<br>
&gt; +From fd80ba7c00bb87f52a63f628509955ccee5b09e4 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;<=
a href=3D"mailto:vhanulik@redhat.com" target=3D"_blank" rel=3D"noreferrer">=
vhanulik@redhat.com</a>&gt;<br>
&gt; +Date: Mon, 5 Feb 2024 13:33:05 +0100<br>
&gt; +Subject: [PATCH] Fix constant-time comparison of negative values<br>
&gt; +<br>
&gt; +Thanks Coverity CID 414687<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/3016/commits/fd80ba7c00bb87f52a63f628509955ccee5b09e4" target=3D"_bl=
ank" rel=3D"noreferrer">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F3016%2Fcommits%2Ffd8=
0ba7c00bb87f52a63f628509955ccee5b09e4&amp;data=3D05%7C02%7Cnikhil.r%40kpit.=
com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638585474039232655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DJRq1GC=
bjG37VCUIyggF%2FUtBtUYYmuw2Iun8lOnIxFj4%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;<a href=3D"mailto:nikhil.r@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">nikhil.r@kpit.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/common/constant-time.h=C2=A0=C2=A0=C2=A0 | 6 ++++++<br>
&gt; + src/minidriver/minidriver.c=C2=A0=C2=A0 | 4 ++--<br>
&gt; + src/pkcs11/framework-pkcs15.c | 4 ++--<br>
&gt; + 3 files changed, 10 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/common/constant-time.h b/src/common/constant-time.h<=
br>
&gt; +index 40c3e500c2..3f4446d4d8 100644<br>
&gt; +--- a/src/common/constant-time.h<br>
&gt; ++++ b/src/common/constant-time.h<br>
&gt; +@@ -125,4 +125,10 @@ constant_time_eq_s(size_t a, size_t b)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return constant_time_is_zero_s(a=
 ^ b);<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_eq_i(int a, int b)<br>
&gt; ++{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return constant_time_eq((unsigned int=
)a, (unsigned int)b);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + #endif /* CONSTANT_TIME_H */<br>
&gt; +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.=
c<br>
&gt; +index a3c738966b..d146b42549 100644<br>
&gt; +--- a/src/minidriver/minidriver.c<br>
&gt; ++++ b/src/minidriver/minidriver.c<br>
&gt; +@@ -4660,7 +4660,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCa=
rdData,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 logprintf(pCardData, 2, &quot;sc_pkcs15_decipher: stripping PKCS1=
 padding\n&quot;);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 r =3D sc_pkcs1_strip_02_padding_constant_time(vs-&gt;ctx, prkey_i=
nfo-&gt;modulus_length / 8, pbuf2, pInfo-&gt;cbData, pbuf2, &amp;temp);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pInfo-&gt;cbData =3D (DWORD) temp;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 wrong_padding =3D constant_time_eq_s(r, SC_ERROR_WRONG_PADDING);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 wrong_padding =3D constant_time_eq_i(r, SC_ERROR_WRONG_PADDING);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /* continue without returning error to not leak that padding is w=
rong<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 to prevent time side-channel leak for Marvin at=
tack*/<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +@@ -4710,7 +4710,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCa=
rdData,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 goto err;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good =3D constant_time_eq_s(r, 0);<br=
>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good =3D constant_time_eq_i(r, 0);<br=
>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* if no error or padding error,=
 do not return here to prevent Marvin attack */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(good | wrong_padding) &amp=
;&amp; r &lt; 0)=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 logprintf(pCardData, 2, &quot;sc_pkcs15_decipher error(%i):=
 %s\n&quot;, r, sc_strerror(r));<br>
&gt; +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkc=
s15.c<br>
&gt; +index cb4df7a64f..11cfc51273 100644<br>
&gt; +--- a/src/pkcs11/framework-pkcs15.c<br>
&gt; ++++ b/src/pkcs11/framework-pkcs15.c<br>
&gt; +@@ -4627,11 +4627,11 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_session=
 *session, void *obj,<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* only padding error must be ha=
ndled in constant-time way,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * other error can be retur=
ned straight away */<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((~constant_time_eq_s(rv, SC_ERROR=
_WRONG_PADDING) &amp; constant_time_lt_s(sizeof(decrypted), rv)))<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((~constant_time_eq_i(rv, SC_ERROR=
_WRONG_PADDING) &amp; constant_time_lt_s(sizeof(decrypted), (size_t)rv)))<b=
r>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return sc_to_cryptoki_error(rv, &quot;C_Decrypt&quot;);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* check rv for padding error */=
<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good =3D ~constant_time_eq_s(rv, SC_E=
RROR_WRONG_PADDING);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good =3D ~constant_time_eq_i(rv, SC_E=
RROR_WRONG_PADDING);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rv_pkcs11 =3D sc_to_cryptoki_err=
or(SC_ERROR_WRONG_PADDING, &quot;C_Decrypt&quot;);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rv_pkcs11 =3D constant_time_sele=
ct_s(good, CKR_OK, rv_pkcs11);<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/<a href=3D"http://opensc_0=
.22.0.bb" target=3D"_blank" rel=3D"noreferrer">opensc_0.22.0.bb</a> b/meta-=
oe/recipes-support/opensc/<a href=3D"http://opensc_0.22.0.bb" target=3D"_bl=
ank" rel=3D"noreferrer">opensc_0.22.0.bb</a><br>
&gt; index 770c2d686..16b3ec292 100644<br>
&gt; --- a/meta-oe/recipes-support/opensc/<a href=3D"http://opensc_0.22.0.b=
b" target=3D"_blank" rel=3D"noreferrer">opensc_0.22.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/opensc/<a href=3D"http://opensc_0.22.0.b=
b" target=3D"_blank" rel=3D"noreferrer">opensc_0.22.0.bb</a><br>
&gt; @@ -23,6 +23,15 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.co=
m/OpenSC/OpenSC;branch=3Dmaster;protocol=3Dhttps" target=3D"_blank" rel=3D"=
noreferrer">github.com/OpenSC/OpenSC;branch=3Dmaster;protocol=3Dhttps</a> \=
<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 <a rel=3D"noreferrer">file://CVE-2023-40661-5.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 <a rel=3D"noreferrer">file://CVE-2023-40661-6.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 <a rel=3D"noreferrer">file://CVE-2023-40661-7.patch</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=
=3D"noreferrer">file://CVE-2023-5992-1.patch</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=
=3D"noreferrer">file://CVE-2023-5992-2.patch</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=
=3D"noreferrer">file://CVE-2023-5992-3.patch</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=
=3D"noreferrer">
file://0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch</a> =
\<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=
=3D"noreferrer">file://CVE-2023-5992-4.patch</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=
=3D"noreferrer">file://CVE-2023-5992-5.patch</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=
=3D"noreferrer">file://CVE-2023-5992-6.patch</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=
=3D"noreferrer">file://CVE-2023-5992-7.patch</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=
=3D"noreferrer">file://CVE-2023-5992-8.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0=C2=A0 # CVE-2021-34193 is a duplicate CVE covering the 5 individ=
ual<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111583): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111583" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/111583</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107747046/693=
2718" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/107747046/6932718</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:nikhilar2410@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">nikhilar2410@gmail.com</a>]=
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000005a1f7a0620a64b9c--

