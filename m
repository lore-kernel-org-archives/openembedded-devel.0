Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF4BD116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:27:51 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3405.1764361667537215501
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=jan.claussen10@web.de header.s=s29768273 header.b=NA9XHDb1;
 spf=pass (domain: web.de, ip: 212.227.17.11, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1764361665; x=1764966465; i=jan.claussen10@web.de;
	bh=7GYVa1h+sA+Yhg6g62POlN87d9yrtwDddh2qA9suRGw=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NA9XHDb1+tZXvRZFbifmI2tD67EHNFvWLNuJT7hI4LFkEZxQ4F4nBDZOxxqj6uP4
	 Oec38ZJIizTV3RfKn+94nUxAG9y8CkZZieLe5m+Tho0I674a9WcTDrwvh8YzHVufu
	 x3SYtS9SWc67prY34f+OUS2VSxibbQVJrHWspDvfoDGMJanIWBMbA92duAPEC8iwv
	 p1gGuhlPYCguxSSp4aQ0w39Ai8O3VnYsydKkv+Lf29l+JMfZJcP4JF/XjetIpfuun
	 ja+DSh2TMOJj8qTWarzyTNsXkiaMZodXbMf2FPf62m/f/0ClWyh7TpBl7sXgZ2nq5
	 q9t8RzRpFSmGKdnQIw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.184.20] ([192.196.196.197]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MsaRt-1wDcM60Ahv-015viQ; Fri, 28
 Nov 2025 21:27:45 +0100
Content-Type: multipart/alternative;
 boundary="------------NjuhE40fNOcazp96djLJKE9Q"
Message-ID: <35b21d06-11cb-4327-a80b-4ebeffdbad0d@web.de>
Date: Fri, 28 Nov 2025 21:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][master][PATCH] python3-soundcard: Add recipe
To: Martin Jansa <martin.jansa@gmail.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20251128115800.2757259-1-jan.claussen10@web.de>
 <CAMKF1soRo6=R=mCu=tah=SvEECFxrwONKxPA3OzXCi9MQXcYsA@mail.gmail.com>
 <CA+chaQcTCvLQjvfCVJGYgYPUMDK8rQGM_QOZQ+t=pv+jzkbW8w@mail.gmail.com>
Content-Language: de-DE, en-US
From: =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
In-Reply-To: <CA+chaQcTCvLQjvfCVJGYgYPUMDK8rQGM_QOZQ+t=pv+jzkbW8w@mail.gmail.com>
X-Provags-ID: V03:K1:AWdU9geMJMtWmU4RR3sAbDsNrj3tWXB7ImL8vpVvRzHOKyoiBOF
 /AINdZE7f8zLXPHT3WRwwQL5rYQRv+9lwVnj81hkE7oLukgZM0M8Szq6rMETzRAGvHmXjYn
 InKT/JokGSuGjVLzA0Hfcw29NWk3vpK7LZAdeHHFoSLZicN73O+1jBDcSNX2O2pNSvK9w3V
 4iSl2gM5kKjUQfFqT2Swg==
UI-OutboundReport: notjunk:1;M01:P0:oTNEKV/+tIs=;998CCqO3EdIMJMC5tClowFUxZld
 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
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122150

This is a multi-part message in MIME format.
--------------NjuhE40fNOcazp96djLJKE9Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

@Martin: Thanks, for pointing that out

I fixed the recipe added inherit features_check. Should maybe also add a=
=20
meaningful commit message, but I didn't know what to add.


Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 =C2=A0.../python/python3-soundcard_0.4.5.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 16 ++++++++++++++++
 =C2=A01 file changed, 16 insertions(+)
 =C2=A0create mode 100644=20
meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb

diff --git=20
a/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb=20
b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
new file mode 100644
index 0000000000..e25f13a116
=2D-- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Python library for accessing soundcards"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De39df1540c06c17ca310ce87c36b04=
2c"
+
+SRC_URI[sha256sum] =3D=20
"07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08f54b832a56946aa"
+
+inherit pypi setuptools3 features_check
+
+REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
+
+RDEPENDS:${PN} +=3D " \
+=C2=A0 =C2=A0 libpulse \
+=C2=A0 =C2=A0 pulseaudio-server \
+=C2=A0 =C2=A0 python3-cffi \
+=C2=A0 =C2=A0 python3-numpy \
+"
=2D-=20
2.52.0

Am 28.11.25 um 21:18 schrieb Martin Jansa:
> And REQUIRED_DISTRO_FEATURES =3D "pulseaudio" probably doesn't do
> anything without features_check inherit
>
> On Fri, Nov 28, 2025 at 9:01=E2=80=AFPM Khem Raj via lists.openembedded.=
org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>> results in
>>
>> ERROR: ParseError at /mnt/b/yoe/master/sources/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-soundcard_0.4.5.bb:13: Unparsed line=
s /mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools=
/python/python3-soundcard_0.4.5.bb: ['RDEPENDS:${PN} +=3D " ', '    libpul=
se ']
>> ERROR: Parsing halted due to errors, see error messages above
>>
>>
>> On Fri, Nov 28, 2025 at 3:58=E2=80=AFAM Jan Clau=C3=9Fen via lists.open=
embedded.org<jan.claussen10=3Dweb.de@lists.openembedded.org> wrote:
>>> Signed-off-by: Jan Clau=C3=9Fen<jan.claussen10@web.de>
>>> ---
>>>   .../python/python3-soundcard_0.4.5.bb                | 12 ++++++++++=
++
>>>   1 file changed, 12 insertions(+)
>>>   create mode 100644 meta-python/recipes-devtools/python/python3-sound=
card_0.4.5.bb
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python3-soundcard_0.4=
.5.bb b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
>>> new file mode 100644
>>> index 0000000000..632b54eaef
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
>>> @@ -0,0 +1,12 @@
>>> +SUMMARY =3D "Python library for accessing soundcards"
>>> +LICENSE =3D "BSD-3-Clause"
>>> +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3De39df1540c06c17ca310ce87c36=
b042c"
>>> +
>>> +SRC_URI[sha256sum] =3D "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d=
2e08f54b832a56946aa"
>>> +
>>> +inherit pypi setuptools3
>>> +
>>> +REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
>>> +
>>> +RDEPENDS:${PN} +=3D " \
>>> +    libpulse \
>>> +    pulseaudio-server \
>>> +    python3-cffi \
>>> +    python3-numpy \
>>> +"
>>
>>
>>
>>> --
>>> 2.52.0
>>>
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#122127):https://lists.openembedded.org/g/openembedd=
ed-devel/message/122127
>> Mute This Topic:https://lists.openembedded.org/mt/116512050/3617156
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--------------NjuhE40fNOcazp96djLJKE9Q
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body text=3D"#e8edf2" bgcolor=3D"#31313a">
    <p>@Martin: Thanks, for pointing that out<br>
      <br>
      I fixed the recipe added inherit features_check. Should maybe also
      add a meaningful commit message, but I didn't know what to add.=C2=
=A0<br>
      <br>
      <br>
      Signed-off-by: Jan Clau=C3=9Fen <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:jan.claussen10@web.de">&lt;jan.claussen10@web.de&gt;</a><br>
      ---<br>
      =C2=A0.../python/python3-soundcard_0.4.5.bb=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 16
      ++++++++++++++++<br>
      =C2=A01 file changed, 16 insertions(+)<br>
      =C2=A0create mode 100644
      meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb<br>
      <br>
      diff --git
      a/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
      b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb<br>
      new file mode 100644<br>
      index 0000000000..e25f13a116<br>
      --- /dev/null<br>
      +++
      b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb<br>
      @@ -0,0 +1,16 @@<br>
      +SUMMARY =3D "Python library for accessing soundcards"<br>
      +LICENSE =3D "BSD-3-Clause"<br>
      +LIC_FILES_CHKSUM =3D
      <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE;md5=3De39d=
f1540c06c17ca310ce87c36b042c">"file://LICENSE;md5=3De39df1540c06c17ca310ce=
87c36b042c"</a><br>
      +<br>
      +SRC_URI[sha256sum] =3D
      "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08f54b832a56946aa"<b=
r>
      +<br>
      +inherit pypi setuptools3 features_check<br>
      +<br>
      +REQUIRED_DISTRO_FEATURES =3D "pulseaudio"<br>
      +<br>
      +RDEPENDS:${PN} +=3D " \<br>
      +=C2=A0 =C2=A0 libpulse \<br>
      +=C2=A0 =C2=A0 pulseaudio-server \<br>
      +=C2=A0 =C2=A0 python3-cffi \<br>
      +=C2=A0 =C2=A0 python3-numpy \<br>
      +"<br>
      --=C2=A0<br>
      2.52.0</p>
    <div class=3D"moz-cite-prefix">Am 28.11.25 um 21:18 schrieb Martin
      Jansa:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CA+chaQcTCvLQjvfCVJGYgYPUMDK8rQGM_QOZQ+t=3Dpv+jzkbW8w@mail.gma=
il.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">And REQUIRED_DISTRO_FEATURES =
=3D "pulseaudio" probably doesn't do
anything without features_check inherit

On Fri, Nov 28, 2025 at 9:01=E2=80=AFPM Khem Raj via lists.openembedded.or=
g
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raj.khem=3Dgmail.com@lis=
ts.openembedded.org">&lt;raj.khem=3Dgmail.com@lists.openembedded.org&gt;</=
a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
results in

ERROR: ParseError at /mnt/b/yoe/master/sources/meta-openembedded/meta-pyth=
on/recipes-devtools/python/python3-soundcard_0.4.5.bb:13: Unparsed lines /=
mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/py=
thon/python3-soundcard_0.4.5.bb: ['RDEPENDS:${PN} +=3D " ', '    libpulse =
']
ERROR: Parsing halted due to errors, see error messages above


On Fri, Nov 28, 2025 at 3:58=E2=80=AFAM Jan Clau=C3=9Fen via lists.openemb=
edded.org <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jan.claussen10=
=3Dweb.de@lists.openembedded.org">&lt;jan.claussen10=3Dweb.de@lists.openem=
bedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">
Signed-off-by: Jan Clau=C3=9Fen <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:jan.claussen10@web.de">&lt;jan.claussen10@web.de&gt;</a>
=2D--
 .../python/python3-soundcard_0.4.5.bb                | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-soundcard_=
0.4.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.b=
b b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
new file mode 100644
index 0000000000..632b54eaef
=2D-- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Python library for accessing soundcards"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LI=
CENSE;md5=3De39df1540c06c17ca310ce87c36b042c">"file://LICENSE;md5=3De39df1=
540c06c17ca310ce87c36b042c"</a>
+
+SRC_URI[sha256sum] =3D "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08=
f54b832a56946aa"
+
+inherit pypi setuptools3
+
+REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
+
+RDEPENDS:${PN} +=3D " \
+    libpulse \
+    pulseaudio-server \
+    python3-cffi \
+    python3-numpy \
+"
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">



</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">
=2D-
2.52.0




</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#122127): <a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://lists.openembedded.org/g/openembedded-devel/message/122127">https://=
lists.openembedded.org/g/openembedded-devel/message/122127</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.=
openembedded.org/mt/116512050/3617156">https://lists.openembedded.org/mt/1=
16512050/3617156</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembe=
dded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.open=
embedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/=
openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------NjuhE40fNOcazp96djLJKE9Q--

