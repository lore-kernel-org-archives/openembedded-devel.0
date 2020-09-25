Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.4159.1600995152034278557
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 17:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08P0qSrH018427
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 24 Sep 2020 17:52:28 -0700 (PDT)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 24 Sep 2020
 17:52:27 -0700
Subject: Re: [oe] [meta-networking][PATCH] crda: rdepends on wireless-regdb-static
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200924093539.23693-1-kai.kang@windriver.com>
 <CALbNGRS_hYCpvLcnsdXL9Pj-gFx0vGEGHgxyBVJonKTfPE8VOA@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <92d5d20b-4c01-80ce-0ea5-56428cd08a28@windriver.com>
Date: Fri, 25 Sep 2020 08:51:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRS_hYCpvLcnsdXL9Pj-gFx0vGEGHgxyBVJonKTfPE8VOA@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------67651F7A856589B04E1434F0"
Content-Language: en-US

--------------67651F7A856589B04E1434F0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 08P0qSrH018427

On 9/25/20 5:36 AM, Andreas M=C3=BCller wrote:
> On Thu, Sep 24, 2020 at 11:36 AM kai <kai.kang@windriver.com> wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> The wireless-regdb has been moved to oe-core. According the commit
>> message:
>>
>> wireless-regdb-static should be used with kernel >=3D 4.15.
>> wireless-regdb can be used with older kernels and is mostly
>> irrelevant here, but keeping it in meta-networking would
>> create needless recipe duplication.
>>
>> it should replace runtime dependency wireless-regdb with
>> wireless-regdb-static.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-networking/recipes-connectivity/crda/crda_3.18.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/m=
eta-networking/recipes-connectivity/crda/crda_3.18.bb
>> index b380eaf94..e59d2f437 100644
>> --- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
>> +++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
>> @@ -35,4 +35,4 @@ do_install() {
>>       oe_runmake SBINDIR=3D${sbindir}/ install
>>   }
>>
>> -RDEPENDS_${PN} =3D "udev wireless-regdb"
>> +RDEPENDS_${PN} =3D "udev wireless-regdb-static"
> It was wrong/at least dangerous before this - but the operator '+=3D'
> should be used

Hi Andreas,

Thanks for your comment.

I do not get your point why it is dangerous. From output of 'bitbake -e=20
crda', RDEPENDS_crda is evaluated by:

# $RDEPENDS_crda [2 operations]
#=C2=A0=C2=A0 set=20
/buildarea6/kkang/Yocto/meta-openembedded/meta-networking/recipes-connecti=
vity/crda/crda_3.18.bb:38
#=C2=A0=C2=A0=C2=A0=C2=A0 "udev wireless-regdb-static"
#=C2=A0=C2=A0 rename from RDEPENDS_${PN} data.py:104 [expandKeys]
#=C2=A0=C2=A0=C2=A0=C2=A0 "udev wireless-regdb-static"
# pre-expansion value:
#=C2=A0=C2=A0 "udev wireless-regdb-static"
RDEPENDS_crda=3D"udev wireless-regdb-static"

It does not show differences compares to other recipes that=20
"RDEPENDS_${PN} =3D" widely used.

Regards,
Kai

>
> Andreas
>
>=20
>

--=20
Kai Kang
Wind River Linux


--------------67651F7A856589B04E1434F0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 08P0qSrH018427

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 9/25/20 5:36 AM, Andreas M=C3=BCller
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CALbNGRS_hYCpvLcnsdXL9Pj-gFx0vGEGHgxyBVJonKTfPE8VOA@mail.gmail=
.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Thu, Sep 24, 2020 at 11:36=
 AM kai <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang@windrive=
r.com">&lt;kai.kang@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Robert Yang <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:liezhi=
.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a>

The wireless-regdb has been moved to oe-core. According the commit
message:

wireless-regdb-static should be used with kernel &gt;=3D 4.15.
wireless-regdb can be used with older kernels and is mostly
irrelevant here, but keeping it in meta-networking would
create needless recipe duplication.

it should replace runtime dependency wireless-regdb with
wireless-regdb-static.

Signed-off-by: Robert Yang <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:liezhi.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a>
Signed-off-by: Kai Kang <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta=
-networking/recipes-connectivity/crda/crda_3.18.bb
index b380eaf94..e59d2f437 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -35,4 +35,4 @@ do_install() {
     oe_runmake SBINDIR=3D${sbindir}/ install
 }

-RDEPENDS_${PN} =3D "udev wireless-regdb"
+RDEPENDS_${PN} =3D "udev wireless-regdb-static"
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">It was wrong/at least dangero=
us before this - but the operator '+=3D'
should be used</pre>
    </blockquote>
    <p>Hi Andreas,</p>
    <p>Thanks for your comment.<br>
    </p>
    <p>I do not get your point why it is dangerous. From output of
      'bitbake -e crda', RDEPENDS_crda is evaluated by:</p>
    <p># $RDEPENDS_crda [2 operations]<br>
      #=C2=A0=C2=A0 set
/buildarea6/kkang/Yocto/meta-openembedded/meta-networking/recipes-connecti=
vity/crda/crda_3.18.bb:38<br>
      #=C2=A0=C2=A0=C2=A0=C2=A0 "udev wireless-regdb-static"<br>
      #=C2=A0=C2=A0 rename from RDEPENDS_${PN} data.py:104 [expandKeys]<br=
>
      #=C2=A0=C2=A0=C2=A0=C2=A0 "udev wireless-regdb-static"<br>
      # pre-expansion value:<br>
      #=C2=A0=C2=A0 "udev
wireless-regdb-static"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      <br>
      RDEPENDS_crda=3D"udev wireless-regdb-static"</p>
    <p>It does not show differences compares to other recipes that
      "RDEPENDS_${PN} =3D" widely used.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CALbNGRS_hYCpvLcnsdXL9Pj-gFx0vGEGHgxyBVJonKTfPE8VOA@mail.gmail=
.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Andreas
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------67651F7A856589B04E1434F0--
