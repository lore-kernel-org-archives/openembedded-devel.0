Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.14612.1611781065845549141
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 12:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=E/Id6mYN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10RKviM1052841;
	Wed, 27 Jan 2021 14:57:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1611781064;
	bh=z59frnj5UDInECwQIBcV4lSeM59o+/xvt0ApT95WF5g=;
	h=Subject:From:To:CC:References:Date:In-Reply-To;
	b=E/Id6mYNoWRYj75TKbjeHZ4rdsaQ6E/rUN8gJJJIzFXBh43k+ycnaTMgvUoSEoNN3
	 pDbD8VbI11t0nj7CW26aIRQu/k6hM0l9UMmDSjzknbitg27myDWU43hd9H4NDjC/Nz
	 l3k5g+qkhriPibB0/tW6GN7IvkA2NR+MvE1GCaLo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10RKvi9H076480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Jan 2021 14:57:44 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 Jan 2021 14:57:44 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 Jan 2021 14:57:44 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10RKvhB7033405;
	Wed, 27 Jan 2021 14:57:43 -0600
Subject: Re: [RFC] Issues with mariadb-10.4.17 and aarch64
From: "Dan Murphy" <dmurphy@ti.com>
To: akuster808 <akuster808@gmail.com>
CC: <Openembedded-issues@lists.openembedded.org>,
        <openembedded-devel@lists.openembedded.org>
References: <6cde28bf-c69d-1d42-785e-dc228202e357@ti.com>
 <d7ff8010-d45d-6274-ef69-1fd482314224@gmail.com>
 <1539367b-171b-d8c7-ec99-dadbf27ad598@ti.com>
Message-ID: <5b050fe2-cc18-64da-7731-1855fede0eb2@ti.com>
Date: Wed, 27 Jan 2021 14:57:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1539367b-171b-d8c7-ec99-dadbf27ad598@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------021623DA6A88A7B41AA03E05"
Content-Language: en-US

--------------021623DA6A88A7B41AA03E05
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 10RKviM1052841

Armin

On 1/25/21 1:01 PM, Dan Murphy wrote:
>
> Armin
>
> On 1/25/21 11:57 AM, akuster808 wrote:
>> Dan,
>>
>>
>> On 1/25/21 9:45 AM, Dan Murphy wrote:
>>> Hello
>>>
>>> I was wondering if there has been any reports of the mariadb update o=
n
>>> the dunfell branch causing issues with 64bit compilers when the 'pam'
>>> is set for DISTRO_FEATURES
>>>
>> I am not aware of any.
>>> There does not seem to be a compilation issue but more of an
>>> installation issue in which the lib/security directory is not being
>>> created.
>>>
>>> We are seeing issues in our arago distro with the following errors
>>>
>>> mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-t=
mp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/sec=
urity': No such file or directory
>>> *09:38:06* WARNING: /OE/arago-dunfell-next-build/build-AARCH64_1/arag=
o-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.d=
o_install.5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/build-AARCH=
64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/i=
mage/lib/security /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-=
external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'
>> I would be surprised if this was just limited to Arm64.
>>
>> Would enabling "PAM" and appending mariadb to an image reproduce this?
>
> Sorry I did not specify when the error occurred.=C2=A0 This happens dur=
ing=20
> the build time not run time.
>
> 32bit ARM builds perform the install just fine
>
> *12:53:25* NOTE: recipe mariadb-native-10.4.17-r0: task do_install: Suc=
ceeded
>
>
> 64bit not so much
>
> *09:38:03* ERROR: mariadb-10.4.17-r0 do_install: Execution of '/OE/arag=
o-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aa=
rch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379' failed with exit=
 code 1:

Actually yes this is specific to 64 bits.=C2=A0 The lib/security director=
y=20
for 64 bit builds does not exist it is in lib64/security.=C2=A0 So the=20
do_install fails because it is looking in the wrong location.

Not sure how to fix this.

Dan


--------------021623DA6A88A7B41AA03E05
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 10RKviM1052841

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Armin<br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/25/21 1:01 PM, Dan Murphy wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:1539367b-171b-d8c7-ec99-dadbf27ad598@ti.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <p>Armin<br>
      </p>
      <div class=3D"moz-cite-prefix">On 1/25/21 11:57 AM, akuster808
        wrote:<br>
      </div>
      <blockquote type=3D"cite"
        cite=3D"mid:d7ff8010-d45d-6274-ef69-1fd482314224@gmail.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">Dan,


On 1/25/21 9:45 AM, Dan Murphy wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Hello

I was wondering if there has been any reports of the mariadb update on
the dunfell branch causing issues with 64bit compilers when the 'pam'
is set for DISTRO_FEATURES

</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">I am not aware of any.
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">There does not seem to b=
e a compilation issue but more of an
installation issue in which the lib/security directory is not being
created.

We are seeing issues in our arago distro with the following errors

mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-e=
xternal-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/securit=
y': No such file or directory
*09:38:06* WARNING: /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tm=
p-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_in=
stall.5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/build-AARCH64_1=
/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image=
/lib/security /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-exte=
rnal-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">I would be surprised if th=
is was just limited to Arm64.

Would enabling "PAM" and appending mariadb to an image reproduce this?</p=
re>
      </blockquote>
      <p>Sorry I did not specify when the error occurred.=C2=A0 This happ=
ens
        during the build time not run time.</p>
      <p>32bit ARM builds perform the install just fine</p>
      <pre style=3D"box-sizing: border-box; white-space: pre-wrap; overfl=
ow-wrap: break-word; margin: 0px; color: rgb(51, 51, 51); font-size: 14px=
; font-style: normal; font-variant-ligatures: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align:=
 start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial;"><span cl=
ass=3D"timestamp" style=3D"box-sizing: border-box;"><b style=3D"box-sizin=
g: border-box;">12:53:25</b> </span>NOTE: recipe mariadb-native-10.4.17-r=
0: task do_install: Succeeded
</pre>
      <p><br>
      </p>
      <p>64bit not so much</p>
      <pre style=3D"box-sizing: border-box; white-space: pre-wrap; overfl=
ow-wrap: break-word; margin: 0px; color: rgb(51, 51, 51); font-size: 14px=
; font-style: normal; font-variant-ligatures: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align:=
 start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial;"><span cl=
ass=3D"timestamp" style=3D"box-sizing: border-box;"><b style=3D"box-sizin=
g: border-box;">09:38:03</b> </span>ERROR: mariadb-10.4.17-r0 do_install:=
 Execution of '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-ext=
ernal-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install=
.5379' failed with exit code 1:</pre>
    </blockquote>
    <br>
    <p>Actually yes this is specific to 64 bits.=C2=A0 The lib/security
      directory for 64 bit builds does not exist it is in
      lib64/security.=C2=A0 So the do_install fails because it is looking=
 in
      the wrong location.</p>
    <p>Not sure how to fix this.</p>
    <p>Dan</p>
  </body>
</html>

--------------021623DA6A88A7B41AA03E05--
