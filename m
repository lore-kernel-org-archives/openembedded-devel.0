Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.437.1611601310083702970
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 11:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=e3lJzn9+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10PJ1mB1018765;
	Mon, 25 Jan 2021 13:01:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1611601308;
	bh=rc3J7K4cZaJ7q/CJ60g6Pw5Y/sFQRUXQfMbtOhPNRcU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=e3lJzn9+Dd0IE4bC6oI/S0hFTpMGv54jyKVKaHXrxld9D4pOCBxIwTo1nd2QJM2vG
	 J7iHWVuqbv5Yy5dDxjPoBbRIEvP0j/bULbOZxVMY3JyAijZYZCaM8QbgTTMjzzs+AE
	 vuncprGJTJqO2pqPs7QxH3E97AeyAmJZ7OB+5bf8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10PJ1mkX030291
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Jan 2021 13:01:48 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 Jan 2021 13:01:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 Jan 2021 13:01:48 -0600
Received: from [10.250.39.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10PJ1mYl107390;
	Mon, 25 Jan 2021 13:01:48 -0600
Subject: Re: [RFC] Issues with mariadb-10.4.17 and aarch64
To: akuster808 <akuster808@gmail.com>
CC: <Openembedded-issues@lists.openembedded.org>,
        <openembedded-devel@lists.openembedded.org>
References: <6cde28bf-c69d-1d42-785e-dc228202e357@ti.com>
 <d7ff8010-d45d-6274-ef69-1fd482314224@gmail.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <1539367b-171b-d8c7-ec99-dadbf27ad598@ti.com>
Date: Mon, 25 Jan 2021 13:01:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d7ff8010-d45d-6274-ef69-1fd482314224@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------DC0ADC6AC533E2FAF22CF2DD"
Content-Language: en-US

--------------DC0ADC6AC533E2FAF22CF2DD
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 10PJ1mB1018765

Armin

On 1/25/21 11:57 AM, akuster808 wrote:
> Dan,
>
>
> On 1/25/21 9:45 AM, Dan Murphy wrote:
>> Hello
>>
>> I was wondering if there has been any reports of the mariadb update on
>> the dunfell branch causing issues with 64bit compilers when the 'pam'
>> is set for DISTRO_FEATURES
>>
> I am not aware of any.
>> There does not seem to be a compilation issue but more of an
>> installation issue in which the lib/security directory is not being
>> created.
>>
>> We are seeing issues in our arago distro with the following errors
>>
>> mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tm=
p-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/secu=
rity': No such file or directory
>> *09:38:06* WARNING: /OE/arago-dunfell-next-build/build-AARCH64_1/arago=
-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do=
_install.5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/build-AARCH6=
4_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/im=
age/lib/security /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-e=
xternal-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'
> I would be surprised if this was just limited to Arm64.
>
> Would enabling "PAM" and appending mariadb to an image reproduce this?

Sorry I did not specify when the error occurred.=C2=A0 This happens durin=
g=20
the build time not run time.

32bit ARM builds perform the install just fine

*12:53:25* NOTE: recipe mariadb-native-10.4.17-r0: task do_install: Succe=
eded


64bit not so much

*09:38:03* ERROR: mariadb-10.4.17-r0 do_install: Execution of '/OE/arago-=
dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarc=
h64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379' failed with exit c=
ode 1:

Dan

>
> -armin
>>

--------------DC0ADC6AC533E2FAF22CF2DD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 10PJ1mB1018765

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Armin<br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/25/21 11:57 AM, akuster808 wrote:=
<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:d7ff8010-d45d-6274-ef69-1fd482314224@gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Dan,


On 1/25/21 9:45 AM, Dan Murphy wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Hello

I was wondering if there has been any reports of the mariadb update on
the dunfell branch causing issues with 64bit compilers when the 'pam'
is set for DISTRO_FEATURES

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I am not aware of any.
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
There does not seem to be a compilation issue but more of an
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
      <pre class=3D"moz-quote-pre" wrap=3D"">
I would be surprised if this was just limited to Arm64.

Would enabling "PAM" and appending mariadb to an image reproduce this?</p=
re>
    </blockquote>
    <p>Sorry I did not specify when the error occurred.=C2=A0 This happen=
s
      during the build time not run time.</p>
    <p>32bit ARM builds perform the install just fine</p>
    <pre style=3D"box-sizing: border-box; white-space: pre-wrap; overflow=
-wrap: break-word; margin: 0px; color: rgb(51, 51, 51); font-size: 14px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: no=
rmal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: s=
tart; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0p=
x; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; te=
xt-decoration-style: initial; text-decoration-color: initial;"><span clas=
s=3D"timestamp" style=3D"box-sizing: border-box;"><b style=3D"box-sizing:=
 border-box;">12:53:25</b> </span>NOTE: recipe mariadb-native-10.4.17-r0:=
 task do_install: Succeeded
</pre>
    <p><br>
    </p>
    <p>64bit not so much</p>
    <pre style=3D"box-sizing: border-box; white-space: pre-wrap; overflow=
-wrap: break-word; margin: 0px; color: rgb(51, 51, 51); font-size: 14px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: no=
rmal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: s=
tart; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0p=
x; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; te=
xt-decoration-style: initial; text-decoration-color: initial;"><span clas=
s=3D"timestamp" style=3D"box-sizing: border-box;"><b style=3D"box-sizing:=
 border-box;">09:38:03</b> </span>ERROR: mariadb-10.4.17-r0 do_install: E=
xecution of '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-exter=
nal-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5=
379' failed with exit code 1:</pre>
    <p>Dan<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:d7ff8010-d45d-6274-ef69-1fd482314224@gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

-armin
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------DC0ADC6AC533E2FAF22CF2DD--
