Return-Path: <venkattalluri5559@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F2DECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 07:21:41 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web12.3883.1662708098080208044
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Sep 2022 00:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LFFQukm+;
 spf=pass (domain: gmail.com, ip: 209.85.219.42,
 mailfrom: venkattalluri5559@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id m9so601520qvv.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Sep 2022 00:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mcXbvE/zqR2mfj4Yfb3qcm6mnTJFLzirwsJv2UTLzS0=;
        b=LFFQukm+Q2DQvTy7AWk3zslM0pTDuiASX43Cu0gqZPn/J7f1SkZp7tXc/c4EmfqWhl
         3GMS4zlpvgHJsbMOpfEmZK+D9F7ejyECvJhGt3ZYfvSiDdxNd+wu+YGkf+iXiWSzoJ6V
         ToMb2i4+ky5rVUz5XenuduUfsBy+RejFGFtxHtu1l8lV1eCrI1efEGxYK2Iw0DoN1REJ
         qsldUr3weqKcerWucqqoxvzojVu0nplWufnac9qR92YwuruiVCGDiYw1MELHMzN/VVF/
         AuLwIPWModLztsyYuVod7KT4+CITs/G1S7rt4AhsjP6+AbdKkErWC+N3CtUegbs56AJJ
         EuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mcXbvE/zqR2mfj4Yfb3qcm6mnTJFLzirwsJv2UTLzS0=;
        b=FdaMGZw5jNYwrQ+UToq7VoW6UeESjTiraAd8jReafq0TZh4tjSTGWgVwSkXetN9mMm
         CoTW858WPD4L2QInNVSEnJAYOuOc0AcEqNqWeFbRkrm4cQQQ40/S6N2pxWTxHAgM9mM8
         vPk/jQcqEFKq7FAkTRS+luPA9M2KjON9uToG1UfzupLpNUfSaCltvEeVaGQy9udTRo+R
         ZqaAAdOQ+l0Bwja23xOtqzSEzIxlTYEU9GUPf+droxzJgUu9ht0h1a0FOP3eiQPKAn3P
         1NeAhG/qgxWP7oXMuEiUUNJzb8tBOQZFy0xEtP9xUkjIZTGw6vlvXpkceklsfLOAMr2T
         WnIA==
X-Gm-Message-State: ACgBeo1TazHCoH6zk1dwl8xDOYavJijL+mEWYrdFW61GrXnpQPK2Vi4i
	XBR/yG8uyiHP0YMhW/ndJGxXPL4goHbCNBzf9Ps=
X-Google-Smtp-Source: 
 AA6agR4E0+/jkMmRLONhxOhGR/6kLGUYHhJqM/RUp2ajuJHsqsRcqkxzyGhEDqpkGNukn/rX4iG4mmKiaEB1Ng9uBoY=
X-Received: by 2002:a05:6214:ca3:b0:4ac:8411:c296 with SMTP id
 s3-20020a0562140ca300b004ac8411c296mr3591644qvs.65.1662708096865; Fri, 09 Sep
 2022 00:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220907171023.31485-1-virendra.thakur@kpit.com>
 <1712DD9BF4FC7E86.20168@lists.openembedded.org>
In-Reply-To: <1712DD9BF4FC7E86.20168@lists.openembedded.org>
From: venkatakoteswararao talluri <venkattalluri5559@gmail.com>
Date: Fri, 9 Sep 2022 12:51:25 +0530
Message-ID: 
 <CABbzySasmSmb71Sps7+tJApEQGbgNAhJAayPDN+2ir6yLzL87Q@mail.gmail.com>
Subject: Re: [oe][meta-java][dunfell][PATCH ] cacao-initial-native: exclude
 BB_NUMBER_THREADS from sstate hash
To: venkatakoteswararao talluri <venkattalluri5559@gmail.com>
Cc: virendra.thakur@kpit.com, openembedded-devel@lists.openembedded.org,
	Virendra Thakur <virendrak@kpit.com>
Content-Type: multipart/alternative; boundary="0000000000007a986d05e83965da"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Sep 2022 07:21:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98731

--0000000000007a986d05e83965da
Content-Type: text/plain; charset="UTF-8"

Hi All,
Can you please respond on this.

On Thu, Sep 8, 2022, 4:31 PM venkatakoteswararao talluri via
lists.openembedded.org <venkattalluri5559=gmail.com@lists.openembedded.org>
wrote:

> Hi All,
>
> I'm trying to build sysbench_1.0.20.bb on QCS610 codebase but I'm getting
> following error so can you please help me to solve this issue.
> Image:qti-multimedia-image
> Target:qcs610-odk-64
>
> Error log:
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'luajit' (but /var/lib/jenkins/workspace/QCS610_OpenQ_Linux_1.x_Internal_/qcs610-le-1-0_ap_standard_oem/apps_proc/poky/meta-qti-bsp/recipes-products/images/qti-multimedia-image.bb RDEPENDS on or otherwise requires it)
> luajit was skipped: incompatible with host aarch64-oe-linux (not in COMPATIBLE_HOST)
> NOTE: Runtime target 'luajit' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['luajit']
> ERROR: Required build target 'qti-multimedia-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['qti-multimedia-image', 'luajit']
>
>
> Please find the attached sysbench_1.0.20.bb file.
>
>
> Thanks,
>
> Venkata Talluri
>
>
> On Wed, Sep 7, 2022 at 10:40 PM Virendra Thakur via lists.openembedded.org
> <virendra.thakur=kpit.com@lists.openembedded.org> wrote:
>
>> From: Virendra Thakur <virendrak@kpit.com>
>>
>> The sstate-cache for cacao-initial-native is not shareable across
>> multiple machines because the parallelisation configuration of Bitbake
>> is being embedded into the sstate hash of cacao-initial-native.
>>
>> Exclude BB_NUMBER_THREADS from the do_install sstate hashing to avoid
>> this issue.
>>
>> Commit message adapted from a5257d41f32812bc9426183cc8d2b6f07617b0d5.
>>
>> Signed-off-by: Virendra Thakur <virendrak@kpit.com>
>> ---
>>  recipes-core/cacao/cacao-initial-native_0.98.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb
>> b/recipes-core/cacao/cacao-initial-native_0.98.bb
>> index 8432456..1bf822d 100644
>> --- a/recipes-core/cacao/cacao-initial-native_0.98.bb
>> +++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
>> @@ -40,5 +40,7 @@ do_configure:append() {
>>    sed -i -e "s|exec cacao \\$|exec cacao-initial \\$|" src/scripts/
>> java.in
>>  }
>>
>> +do_compile[vardepsexclude] += "BB_NUMBER_THREADS"
>> +
>>  SRC_URI[md5sum] = "8b8907c8b925761c9410bcadb9705346"
>>  SRC_URI[sha256sum] =
>> "cb9363add825cedf77764fc49a223aaf43f0a9f485b711ba8c92f16b13fff188"
>> --
>> 2.17.1
>>
>> This message contains information that may be privileged or confidential
>> and is the property of the KPIT Technologies Ltd. It is intended only for
>> the person to whom it is addressed. If you are not the intended recipient,
>> you are not authorized to read, print, retain copy, disseminate,
>> distribute, or use this message or any part thereof. If you receive this
>> message in error, please notify the sender immediately and delete all
>> copies of this message. KPIT Technologies Ltd. does not accept any
>> liability for virus infected mails.
>>
>>
>>
>>
> --
> Venkata Talluri
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98720):
> https://lists.openembedded.org/g/openembedded-devel/message/98720
> Mute This Topic: https://lists.openembedded.org/mt/93529818/7150353
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> venkattalluri5559@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007a986d05e83965da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi All,<div dir=3D"auto">Can you please respond on this.<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Sep 8, 2022, 4:31 PM venkatakoteswararao talluri via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;venkattal=
luri5559=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>I&#39;m trying to b=
uild <a href=3D"http://sysbench_1.0.20.bb" target=3D"_blank" rel=3D"norefer=
rer">sysbench_1.0.20.bb</a> on QCS610 codebase but I&#39;m getting followin=
g error so can you please help me to solve this issue.</div><div>Image:qti-=
multimedia-image <br></div><div>Target:qcs610-odk-64<br></div><div><br></di=
v><div>Error log:</div><div><pre>NOTE: Resolving any missing task queue dep=
endencies
ERROR: Nothing RPROVIDES &#39;luajit&#39; (but /var/lib/jenkins/workspace/Q=
CS610_OpenQ_Linux_1.x_Internal_/qcs610-le-1-0_ap_standard_oem/apps_proc/pok=
y/meta-qti-bsp/recipes-products/images/<a href=3D"http://qti-multimedia-ima=
ge.bb" target=3D"_blank" rel=3D"noreferrer">qti-multimedia-image.bb</a> RDE=
PENDS on or otherwise requires it)
luajit was skipped: incompatible with host aarch64-oe-linux (not in COMPATI=
BLE_HOST)
NOTE: Runtime target &#39;luajit&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;luajit&#39;]
ERROR: Required build target &#39;qti-multimedia-image&#39; has no buildabl=
e providers.
Missing or unbuildable dependency chain was: [&#39;qti-multimedia-image&#39=
;, &#39;luajit&#39;]<br><br><br></pre><pre>Please find the attached <a href=
=3D"http://sysbench_1.0.20.bb" target=3D"_blank" rel=3D"noreferrer">sysbenc=
h_1.0.20.bb</a> file.<br><br><br></pre><pre>Thanks,<br></pre><pre>Venkata T=
alluri<br></pre></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Sep 7, 2022 at 10:40 PM Virendra Thakur via <=
a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferre=
r">lists.openembedded.org</a> &lt;virendra.thakur=3D<a href=3D"mailto:kpit.=
com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">kpit.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">From: Virendra Thakur &lt;<a href=3D"mailto:virendrak@=
kpit.com" target=3D"_blank" rel=3D"noreferrer">virendrak@kpit.com</a>&gt;<b=
r>
<br>
The sstate-cache for cacao-initial-native is not shareable across<br>
multiple machines because the parallelisation configuration of Bitbake<br>
is being embedded into the sstate hash of cacao-initial-native.<br>
<br>
Exclude BB_NUMBER_THREADS from the do_install sstate hashing to avoid<br>
this issue.<br>
<br>
Commit message adapted from a5257d41f32812bc9426183cc8d2b6f07617b0d5.<br>
<br>
Signed-off-by: Virendra Thakur &lt;<a href=3D"mailto:virendrak@kpit.com" ta=
rget=3D"_blank" rel=3D"noreferrer">virendrak@kpit.com</a>&gt;<br>
---<br>
=C2=A0recipes-core/cacao/<a href=3D"http://cacao-initial-native_0.98.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">cacao-initial-native_0.98.bb<=
/a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-core/cacao/<a href=3D"http://cacao-initial-native_0.98=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cacao-initial-native_0=
.98.bb</a> b/recipes-core/cacao/<a href=3D"http://cacao-initial-native_0.98=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cacao-initial-native_0=
.98.bb</a><br>
index 8432456..1bf822d 100644<br>
--- a/recipes-core/cacao/<a href=3D"http://cacao-initial-native_0.98.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">cacao-initial-native_0.98.bb<=
/a><br>
+++ b/recipes-core/cacao/<a href=3D"http://cacao-initial-native_0.98.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">cacao-initial-native_0.98.bb<=
/a><br>
@@ -40,5 +40,7 @@ do_configure:append() {<br>
=C2=A0 =C2=A0sed -i -e &quot;s|exec cacao \\$|exec cacao-initial \\$|&quot;=
 src/scripts/<a href=3D"http://java.in" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">java.in</a><br>
=C2=A0}<br>
<br>
+do_compile[vardepsexclude] +=3D &quot;BB_NUMBER_THREADS&quot;<br>
+<br>
=C2=A0SRC_URI[md5sum] =3D &quot;8b8907c8b925761c9410bcadb9705346&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;cb9363add825cedf77764fc49a223aaf43f0a9f4=
85b711ba8c92f16b13fff188&quot;<br>
--<br>
2.17.1<br>
<br>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.<br>
<br>
<br>
<br>
</blockquote></div>
<br>-- <br>Venkata Talluri
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98720): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98720" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/98720</a><b=
r>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93529818/7150=
353" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/93529818/7150353</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:venkattalluri=
5559@gmail.com" target=3D"_blank" rel=3D"noreferrer">venkattalluri5559@gmai=
l.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007a986d05e83965da--

