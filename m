Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC49E6FE2C
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 13:27:36 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.21134.1695389246558841540
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 06:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L+60sp3Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-404314388ceso23995865e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695389245; x=1695994045; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vJZ6u6Oqm81cZ0cyVroLhb8rnsGqwt5e/JzQMaA/eqM=;
        b=L+60sp3Z4FtLOvJQlY3sq1GzYlydcbeinMfyJQZudqAoMKoIXOxJbrRvzVLdoogWuC
         HYlQk4kjSmfkfa/2YrOlf8ywWqiTLYLkosuxfgOOZ0Ktr1it9U3e+BxUPgew+xHyB7HB
         YheOoqcnNVncOnIwlmaXQhmrT3QmVrWe1O4vRZCRtje6GrHTJXapxQKuj2ypt/yWKAca
         nw7uMWTunspZR7fZofAeOqa7R2FplcfacZRcMSIsxzgj+fC+QUswoQqE28KBzPVqeB9+
         G9GwEYgNGi0YhIz96pu6cGR0fkQotBX2mCcYIjHwgUTtoSK4gGIVyDSWmsKNVegnpyr3
         ujFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695389245; x=1695994045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJZ6u6Oqm81cZ0cyVroLhb8rnsGqwt5e/JzQMaA/eqM=;
        b=czu++Vwh10glW5Pz6Zh2iKnsx/2rvhS2z9aMhD0rgIuxDayA0Ng2qYwaTYatYaUYxJ
         sQ2Bnxfjrl1IpH/05x86nE4mJdQs/5tczi475q1AI+DCLrStYy+viZHAnCwukKvmc7e2
         BCzge7EaMPbM9VGxtYL8kM2UCyWJGZGKkpZ1ynFAoLTA2DIL430/mKSnpBmcnY/CTN9C
         YX7K/M0NPtshAtQbT4iHRWYtpMtSHjoNr22befqxwLO0m6EikyaEUsF/GHyUpSLygpUA
         2YSCllQJR7ay4r50K0q/UwVt3WM5UL/orQhdtyeQe5iXOVc0EPUP9ImWwYilgPBXRGoO
         P4Fg==
X-Gm-Message-State: AOJu0Yw2likyjye5tBbYc+kzU/jAJS/thTYPqL+APU5E5Inw1o1nHAJd
	hJWtF1NAxGU3Tw/po0qvZqCsc5QjE678dzFu/Fg=
X-Google-Smtp-Source: AGHT+IHlcJCDnYOMISRhS23VfI9b/OUewlu/WUXQBPAoaXyEAo0+fjeu9CfUBelJ9MNghvm2W1U6AxqbV2rUJNMbV3g=
X-Received: by 2002:a5d:53c3:0:b0:317:573c:1314 with SMTP id
 a3-20020a5d53c3000000b00317573c1314mr7758631wrw.58.1695389244445; Fri, 22 Sep
 2023 06:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230918045713.1751183-1-raj.khem@gmail.com> <17873606747C854E.23138@lists.openembedded.org>
In-Reply-To: <17873606747C854E.23138@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Sep 2023 15:27:10 +0200
Message-ID: <CA+chaQdCn+kdDGMawP=roOdYLD=0RfDWyXefoi5y-LCbPzaWtw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mongodb: Upgrade to 4.4.24
To: martin.jansa@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000abd8520605f29186"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 13:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105067

--000000000000abd8520605f29186
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's caused by:
https://github.com/mongodb/mongo/commit/f872d0b4efeba4f45961fca175e9bb3c656=
75d5f
I've reported the issue in:
https://jira.mongodb.org/browse/SERVER-73007

lets see what upstream does, I guess they don't care about 32bit targets
anymore (or at least aren't testing them much).

On Fri, Sep 22, 2023 at 1:46=E2=80=AFPM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> I'll check what changed, but just FYI in some world builds I'm now seeing
> mongodb failure:
>
> src/mongo/util/net/http_client_curl.cpp: In function 'size_t
> mongo::{anonymous}::ReadMemoryCallback(char*, size_t, size_t, void*)':
> src/mongo/util/net/http_client_curl.cpp:172:21: error: no matching
> function for call to 'min(size_t, long unsigned int)'
>   172 |             std::min(size * nitems, static_cast<unsigned
> long>(bufReader->remaining()));
>       |
> ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
>
> looks like only 32bit builds are affected.
>
> On Mon, Sep 18, 2023 at 6:57=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../mongodb/mongodb/PTHREAD_STACK_MIN.patch   | 19 -------------------
>>  .../recipes-dbs/mongodb/mongodb_git.bb        |  7 +++----
>>  2 files changed, 3 insertions(+), 23 deletions(-)
>>  delete mode 100644
>> meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD_S=
TACK_MIN.patch
>>
>> diff --git
>> a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD=
_STACK_MIN.patch
>> b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD=
_STACK_MIN.patch
>> deleted file mode 100644
>> index f08177d7b4..0000000000
>> ---
>> a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD=
_STACK_MIN.patch
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -PTHREAD_STACK_MIN is no longer a compile time define in glibc 2.34+ and
>> since
>> -we only care for glibc and musl where PTHREAD_STACK_MIN is always
>> defined there
>> -is no need to check for constant called PTHREAD_STACK_MIN since its
>> already defined
>> -this fix may not work for wider audience but for OE needs its sufficien=
t
>> -
>> -Upstream-Status: Inappropriate [OE-only fix]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---- a/src/third_party/boost-1.70.0/boost/thread/pthread/thread_data.hpp
>> -+++ b/src/third_party/boost-1.70.0/boost/thread/pthread/thread_data.hpp
>> -@@ -57,9 +57,7 @@ namespace boost
>> - #else
>> -           std::size_t page_size =3D ::sysconf( _SC_PAGESIZE);
>> - #endif
>> --#if PTHREAD_STACK_MIN > 0
>> -           if (size<PTHREAD_STACK_MIN) size=3DPTHREAD_STACK_MIN;
>> --#endif
>> -           size =3D ((size+page_size-1)/page_size)*page_size;
>> -           int res =3D pthread_attr_setstacksize(&val_, size);
>> -           BOOST_VERIFY(!res && "pthread_attr_setstacksize failed");
>> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/
>> mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/
>> mongodb_git.bb
>> index 21051a8958..f1a508f3f2 100644
>> --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/
>> mongodb_git.bb
>> +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/
>> mongodb_git.bb
>> @@ -11,9 +11,9 @@ DEPENDS =3D "openssl libpcap zlib boost curl python3 \
>>
>>  inherit scons dos2unix siteinfo python3native systemd useradd
>>
>> -PV =3D "4.4.19"
>> -#v4.4.18
>> -SRCREV =3D "9a996e0ad993148b9650dc402e6d3b1804ad3b8a"
>> +PV =3D "4.4.24"
>> +#v4.4.24
>> +SRCREV =3D "0b86b9b7b42ad9970c5f818c527dd86c0634243a"
>>  SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dv4.4;protocol=
=3Dhttps
>> \
>>
>> file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
>>             file://0001-Use-long-long-instead-of-int64_t.patch \
>> @@ -29,7 +29,6 @@ SRC_URI =3D "git://
>> github.com/mongodb/mongo.git;branch=3Dv4.4;protocol=3Dhttps \
>>             file://0001-include-needed-c-header.patch \
>>             file://disable_runtime_check.patch \
>>             file://ppc64_ARCH_BITS.patch \
>> -           file://PTHREAD_STACK_MIN.patch \
>>
>> file://0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch \
>>
>> file://0001-server-Adjust-the-cache-alignment-assumptions.patch \
>>
>> file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
>> --
>> 2.42.0
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105058):
> https://lists.openembedded.org/g/openembedded-devel/message/105058
> Mute This Topic: https://lists.openembedded.org/mt/101427962/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000abd8520605f29186
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s caused by:<div><a href=3D"https://github.com/mong=
odb/mongo/commit/f872d0b4efeba4f45961fca175e9bb3c65675d5f">https://github.c=
om/mongodb/mongo/commit/f872d0b4efeba4f45961fca175e9bb3c65675d5f</a><br></d=
iv><div>I&#39;ve reported the issue in:</div><div><a href=3D"https://jira.m=
ongodb.org/browse/SERVER-73007">https://jira.mongodb.org/browse/SERVER-7300=
7</a><br></div><div><br></div><div>lets see what upstream does, I guess the=
y don&#39;t care about 32bit targets anymore (or at least aren&#39;t testin=
g them much).</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Fri, Sep 22, 2023 at 1:46=E2=80=AFPM Martin Jansa via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;m=
artin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com=
@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr">I&#39;ll check what changed, but ju=
st FYI in some world builds I&#39;m now seeing mongodb failure:<div><br></d=
iv><div>src/mongo/util/net/http_client_curl.cpp: In function &#39;size_t mo=
ngo::{anonymous}::ReadMemoryCallback(char*, size_t, size_t, void*)&#39;:<br=
>src/mongo/util/net/http_client_curl.cpp:172:21: error: no matching functio=
n for call to &#39;min(size_t, long unsigned int)&#39;<br>=C2=A0 172 | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 std::min(size * nitems, static_cast&=
lt;unsigned long&gt;(bufReader-&gt;remaining()));<br>=C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br></div><div><br></div><div>loo=
ks like only 32bit builds are affected.</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 18, 2023 at 6:57=
=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../mongodb/mongodb/PTHREAD_STACK_MIN.patch=C2=A0 =C2=A0| 19 --------=
-----------<br>
=C2=A0.../recipes-dbs/mongodb/<a href=3D"http://mongodb_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">mongodb_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 7 +++----<br>
=C2=A02 files changed, 3 insertions(+), 23 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mon=
godb/mongodb/PTHREAD_STACK_MIN.patch<br>
<br>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
/PTHREAD_STACK_MIN.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/m=
ongodb/mongodb/PTHREAD_STACK_MIN.patch<br>
deleted file mode 100644<br>
index f08177d7b4..0000000000<br>
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREA=
D_STACK_MIN.patch<br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-PTHREAD_STACK_MIN is no longer a compile time define in glibc 2.34+ and si=
nce<br>
-we only care for glibc and musl where PTHREAD_STACK_MIN is always defined =
there<br>
-is no need to check for constant called PTHREAD_STACK_MIN since its alread=
y defined<br>
-this fix may not work for wider audience but for OE needs its sufficient<b=
r>
-<br>
-Upstream-Status: Inappropriate [OE-only fix]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---- a/src/third_party/boost-1.70.0/boost/thread/pthread/thread_data.hpp<br=
>
-+++ b/src/third_party/boost-1.70.0/boost/thread/pthread/thread_data.hpp<br=
>
-@@ -57,9 +57,7 @@ namespace boost<br>
- #else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::size_t page_size =3D ::sysco=
nf( _SC_PAGESIZE);<br>
- #endif<br>
--#if PTHREAD_STACK_MIN &gt; 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size&lt;PTHREAD_STACK_MIN) si=
ze=3DPTHREAD_STACK_MIN;<br>
--#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D ((size+page_size-1)/page=
_size)*page_size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int res =3D pthread_attr_setstack=
size(&amp;val_, size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BOOST_VERIFY(!res &amp;&amp; &quo=
t;pthread_attr_setstacksize failed&quot;);<br>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/<a href=
=3D"http://mongodb_git.bb" rel=3D"noreferrer" target=3D"_blank">mongodb_git=
.bb</a> b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/<a href=3D=
"http://mongodb_git.bb" rel=3D"noreferrer" target=3D"_blank">mongodb_git.bb=
</a><br>
index 21051a8958..f1a508f3f2 100644<br>
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/<a href=3D"htt=
p://mongodb_git.bb" rel=3D"noreferrer" target=3D"_blank">mongodb_git.bb</a>=
<br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/<a href=3D"htt=
p://mongodb_git.bb" rel=3D"noreferrer" target=3D"_blank">mongodb_git.bb</a>=
<br>
@@ -11,9 +11,9 @@ DEPENDS =3D &quot;openssl libpcap zlib boost curl python3=
 \<br>
<br>
=C2=A0inherit scons dos2unix siteinfo python3native systemd useradd<br>
<br>
-PV =3D &quot;4.4.19&quot;<br>
-#v4.4.18<br>
-SRCREV =3D &quot;9a996e0ad993148b9650dc402e6d3b1804ad3b8a&quot;<br>
+PV =3D &quot;4.4.24&quot;<br>
+#v4.4.24<br>
+SRCREV =3D &quot;0b86b9b7b42ad9970c5f818c527dd86c0634243a&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/mongodb/mongo.gi=
t;branch=3Dv4.4;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/mongodb/mongo.git;branch=3Dv4.4;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Tell-scons-to-use-bui=
ld-settings-from-environment-va.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-long-long-instead=
-of-int64_t.patch \<br>
@@ -29,7 +29,6 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/mong=
odb/mongo.git;branch=3Dv4.4;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">github.com/mongodb/mongo.git;branch=3Dv4.4;protocol=3Dhttps</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-include-needed-c-head=
er.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable_runtime_check.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ppc64_ARCH_BITS.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://PTHREAD_STACK_MIN.patch \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-add-explict-static_ca=
st-size_t-to-maxMemoryUsageByte.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-server-Adjust-the-cac=
he-alignment-assumptions.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-The-std-lib-unary-bin=
ary_function-base-classes-are-d.patch \<br>
-- <br>
2.42.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105058): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105058" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105058</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101427962/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101427962/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000abd8520605f29186--

