Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4407C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 02:25:13 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.2307.1708655105416440906
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 18:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QTGYL22h;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso358497276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 18:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708655104; x=1709259904; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X1jAxjatctqv9DbKsvqrSdfl+t0zdbtzbopcuDASPu4=;
        b=QTGYL22hSBF5vnd3bR/HlePXGAte/9/7RsnT94Lei5VVL1vHRn388GXXIvPiwI1lDl
         WaeUAD2xSRJhsAMxXj4xQ1cWy9d3V0YbLv8vlOViTiSBBLRks6M9hODQT+35ExhfiAYB
         9JG8zBEasagBPFah9Vg0ftsLHgWHYCwFe5EkBmrEpVtrsV/UZ21Eg6Hk3jLUlECYopvS
         uG7h9g0ryAwOBbh5DvUaMjmZ+WsaH7beh6LgyXP6HytHrIvb38Jm0B734wiyT0KyrYzm
         mBq4DQzkWwPf+oCWcV+YtNVbjfJOUQUteOSlQKimnjwyqPBg176tuWIZ9VAL//7FrUAJ
         pLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708655104; x=1709259904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1jAxjatctqv9DbKsvqrSdfl+t0zdbtzbopcuDASPu4=;
        b=dDmPAkqexj9FC/nE6rcUSIyO+zbGKvvTBYS92dRi6lk/qgSp3HnadWqhaApCR822n6
         PLPe+A8KqwFBtTBc4DreiF3nBq5TnjMiPrDgdhu2mL3zzIHemQgn9hK9Juvmg6Tq0XpZ
         zPI5YrNM2SBSg4fJ3S5HOSV8FsMIbVkfJgcpVA0ruR/deH+P0pxRfMjRcd7/DracG3n8
         1QHJKSaRuMAbfqd4+ys6FSapUclwO+YMuxd9yoqTKBShhx40hL7H9c16LDtt21IXcKj1
         dgGiT7TFumC4I86zE7nsvXqujOZzMpBWR0kTs7neYFn4M9hQH0c5h0z+XebONIfc8j0o
         54Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVSM0rF+TlTsnnmHaFkDzptNk5lnPzhQNkXTW5lATfIzi6P/ksemLRZNjUuUZ9V7ATYGJ8WHdbNo9h5tVwVNDSHCDvh9yuWjOAomDOVZmEP93gxmqKmHtJHOw==
X-Gm-Message-State: AOJu0YxFDGuhYdItWG+sTN+tthXrDy86ZtD7bVhZ9h0dhKZLmTsJ2UmN
	gL3j6t+tw2RN6XAvqqwduM2i4zAu37pP/qQeCF5mgo8u7+x+0tnm83LARdk8yqcJwj0xVqhpN4l
	l2KZMhcr33oRb9/MYkEW2E2Wh+c7iYxuB
X-Google-Smtp-Source: AGHT+IE2Rq2PDUnl8sjQBxFp4ABCe/xE1z+L++NbarwGzEFgYW9ekbBsU4OZVP97PAU8S0LeqQ0b4E8WLoyTjvOBiE4=
X-Received: by 2002:a25:d888:0:b0:dcc:417f:a85c with SMTP id
 p130-20020a25d888000000b00dcc417fa85cmr1046902ybg.50.1708655104425; Thu, 22
 Feb 2024 18:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20240222205827.2813212-1-raj.khem@gmail.com> <20240222205827.2813212-4-raj.khem@gmail.com>
 <17B65B4590A0B8D2.24621@lists.openembedded.org>
In-Reply-To: <17B65B4590A0B8D2.24621@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 22 Feb 2024 18:24:53 -0800
Message-ID: <CANx9H-Dqu74yQ-jfG31h=EWoTqvGbfa2FXmtUHrznYTSpXWZrg@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 4/4] meta-filesystems: Add meta-filesystems-image-ptest
To: ticotimo@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008b04d606120344a6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 02:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109000

--0000000000008b04d606120344a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 5:57=E2=80=AFPM Tim Orling via lists.openembedded.o=
rg
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Thu, Feb 22, 2024 at 12:58=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>
>> This will help in running ptests like core layer, right now there are
>> just 3 but I hope to get more contributions now that infra is in place
>>
>> to run all ptests
>>
>> bitbake meta-filesystems-image-ptest-all
>>
>> to run a single recipe ptests
>>
>> bitbake meta-filesystems-image-ptest-fuse3
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../ptest-packagelists-meta-filesystems.inc   | 18 +++++++++
>>  .../meta-filesystems-image-ptest-all.bb       | 25 ++++++++++++
>>  .../meta-filesystems-image-ptest-fast.bb      |  5 +++
>>  .../images/meta-filesystems-image-ptest.bb    | 40 +++++++++++++++++++
>>  4 files changed, 88 insertions(+)
>>  create mode 100644
>> meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
>>  create mode 100644 meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest-all.bb
>>  create mode 100644 meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest-fast.bb
>>  create mode 100644 meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest.bb
>>
>> diff --git
>> a/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
>> b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
>> new file mode 100644
>> index 0000000000..f57bbab930
>> --- /dev/null
>> +++
>> b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
>> @@ -0,0 +1,18 @@
>> +#
>> +# Lists of the ptest in meta-filesystems, sorted into two sets by the
>> time they take
>> +# Please keep these sorted in alphabetical order
>> +#
>> +# A first pass at getting all meta-filesystems recipes which inherit
>> ptest
>> +# meta_filesystems_ptest_recipes=3D$(bitbake-layers show-recipes
>> --recipes-only --layer meta-filesystems --inherits ptest --bare | sed -e
>> '1,/=3D=3D=3D Matching recipes: =3D=3D=3D/d')
>> +# ptests which take less than ~30s each
>> +
>> +PTESTS_FAST_META_FILESYSTEMS =3D "\
>> +    e2tools \
>> +    fuse3 \
>> +"
>> +
>> +PTESTS_SLOW_META_FILESYSTEMS =3D "\
>> +"
>> +PTESTS_PROBLEMS_META_FILESYSTEMS =3D "\
>> +    sshfs-fuse \
>> +"
>> diff --git a/meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest-all.bb
>> b/meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest-all.bb
>> new file mode 100644
>> index 0000000000..ffbfa1a3f6
>> --- /dev/null
>> +++ b/meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest-all.bb
>> @@ -0,0 +1,25 @@
>> +DESCRIPTION =3D "Recipe to trigger execution of all meta-filesystems pt=
est
>> images."
>> +HOMEPAGE =3D "https://www.openembedded.org/"
>> +
>> +LICENSE =3D "MIT"
>> +
>> +inherit features_check nopackages
>> +REQUIRED_DISTRO_FEATURES =3D "ptest"
>> +
>> +require conf/include/ptest-packagelists-meta-filesystems.inc
>> +
>> +# Include the full set of ptests
>> +PTESTS_META_FILESYSTEMS =3D "${PTESTS_FAST_META_FILESYSTEMS}
>> ${PTESTS_SLOW_META_FILESYSTEMS} ${PTESTS_PROBLEMS_META_FILESYSTEMS}"
>> +
>> +do_testimage[noexec] =3D "1"
>> +do_testimage[depends] =3D "${@'
>> '.join(['meta-filesystems-image-ptest-'+x+':do_testimage' for x in
>> d.getVar('PTESTS_META_FILESYSTEMS').split()])}"
>> +
>> +do_build[depends] =3D "${@'
>> '.join(['meta-filesystems-image-ptest-'+x+':do_build' for x in
>> d.getVar('PTESTS_META_FILESYSTEMS').split()])}"
>> +
>> +# normally image.bbclass would do this
>> +EXCLUDE_FROM_WORLD =3D "1"
>> +
>> +python () {
>> +    if bb.utils.contains('IMAGE_CLASSES', 'testimage', True, False, d):
>> +        bb.build.addtask("do_testimage", "", "", d)
>> +}
>> diff --git a/meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest-fast.bb
>> b/meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest-fast.bb
>> new file mode 100644
>> index 0000000000..0eb5344d9e
>> --- /dev/null
>> +++ b/meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest-fast.bb
>> @@ -0,0 +1,5 @@
>> +require meta-filesystems-image-ptest-all.bb
>> +
>> +DESCRIPTION =3D "Recipe to trigger execution of all fast meta-filesyste=
ms
>> ptest images."
>> +
>> +PTESTS_META_OE =3D "${PTESTS_FAST_META_FILESYSTEMS}"
>
> this should probably be PTESTS_META_FILESYSTEMS =3D
> Unless we want to expand the scope.
>

Also, THANK YOU for taking the example of meta-oe, meta-perl and
meta-python to another layer. I would love to see this extend to every
layer.


>> diff --git a/meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest.bb
>> b/meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest.bb
>> new file mode 100644
>> index 0000000000..90d6a92c1b
>> --- /dev/null
>> +++ b/meta-filesystems/recipes-filesystems/images/
>> meta-filesystems-image-ptest.bb
>> @@ -0,0 +1,40 @@
>> +inherit features_check
>> +REQUIRED_DISTRO_FEATURES =3D "ptest"
>> +
>> +require recipes-core/images/core-image-minimal.bb
>> +require conf/include/ptest-packagelists-meta-filesystems.inc
>> +
>> +SUMMARY =3D "meta-filesystems ptest test image"
>> +
>> +DESCRIPTION +=3D "Also including the ${MCNAME} ptest package."
>> +HOMEPAGE =3D "https://www.openembedded.org/"
>> +
>> +PTESTS_META_FILESYSTEMS =3D "${PTESTS_SLOW_META_FILESYSTEMS}
>> ${PTESTS_FAST_META_FILESYSTEMS} ${PTESTS_PROBLEMS_META_FILESYSTEMS}"
>> +
>> +IMAGE_INSTALL:append =3D " ${MCNAME}-ptest openssh"
>> +
>> +BBCLASSEXTEND =3D "${@' '.join(['mcextend:'+x for x in
>> d.getVar('PTESTS_META_FILESYSTEMS').split()])}"
>> +
>> +# The image can be sufficiently large (~1.8GB) that we need to be
>> careful that it fits in a live
>> +# image (which has a 4GB limit), so nullify the overhead factor (1.3x
>> out of the
>> +# box) and explicitly add up to 1500MB.
>> +IMAGE_OVERHEAD_FACTOR =3D "1.0"
>> +IMAGE_ROOTFS_EXTRA_SPACE =3D "324288"
>> +# If a particular ptest needs more space, it can be customized:
>> +#IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-<pn> =3D "1024288"
>> +
>> +# ptests need more memory than standard to avoid the OOM killer
>> +QB_MEM =3D "-m 1024"
>> +# If a particular ptest needs more memroy, it can be customized:
>> +#QB_MEM:virtclass-mcextend-<pn> =3D "-m 4096"
>> +
>> +TEST_SUITES =3D "ping ssh parselogs ptest"
>> +
>> +# Sadly at the moment the full set of ptests is not robust enough and
>> sporadically fails in random places
>> +PTEST_EXPECT_FAILURE =3D "1"
>> +
>> +python () {
>> +    if not d.getVar("MCNAME"):
>> +        raise bb.parse.SkipRecipe("No class extension set")
>> +}
>> +
>> --
>> 2.43.2
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108998):
> https://lists.openembedded.org/g/openembedded-devel/message/108998
> Mute This Topic: https://lists.openembedded.org/mt/104516897/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008b04d606120344a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 22, 2024 at 5:57=E2=80=AFPM Tim Orling via <a h=
ref=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ticoti=
mo=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;padding-left:1ex;border-left-color:rgb(204,204,204)"><div><br></div><div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Feb 22, 2024 at 12:58=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div></=
div></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)">This will help i=
n running ptests like core layer, right now there are<br>
just 3 but I hope to get more contributions now that infra is in place<br>
<br>
to run all ptests<br>
<br>
bitbake meta-filesystems-image-ptest-all<br>
<br>
to run a single recipe ptests<br>
<br>
bitbake meta-filesystems-image-ptest-fuse3<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../ptest-packagelists-meta-filesystems.inc=C2=A0 =C2=A0| 18 ++++++++=
+<br>
=C2=A0.../<a href=3D"http://meta-filesystems-image-ptest-all.bb" rel=3D"nor=
eferrer" target=3D"_blank">meta-filesystems-image-ptest-all.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 25 ++++++++++++<br>
=C2=A0.../<a href=3D"http://meta-filesystems-image-ptest-fast.bb" rel=3D"no=
referrer" target=3D"_blank">meta-filesystems-image-ptest-fast.bb</a>=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 5 +++<br>
=C2=A0.../images/<a href=3D"http://meta-filesystems-image-ptest.bb" rel=3D"=
noreferrer" target=3D"_blank">meta-filesystems-image-ptest.bb</a>=C2=A0 =C2=
=A0 | 40 +++++++++++++++++++<br>
=C2=A04 files changed, 88 insertions(+)<br>
=C2=A0create mode 100644 meta-filesystems/conf/include/ptest-packagelists-m=
eta-filesystems.inc<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/images/<a hre=
f=3D"http://meta-filesystems-image-ptest-all.bb" rel=3D"noreferrer" target=
=3D"_blank">meta-filesystems-image-ptest-all.bb</a><br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/images/<a hre=
f=3D"http://meta-filesystems-image-ptest-fast.bb" rel=3D"noreferrer" target=
=3D"_blank">meta-filesystems-image-ptest-fast.bb</a><br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/images/<a hre=
f=3D"http://meta-filesystems-image-ptest.bb" rel=3D"noreferrer" target=3D"_=
blank">meta-filesystems-image-ptest.bb</a><br>
<br>
diff --git a/meta-filesystems/conf/include/ptest-packagelists-meta-filesyst=
ems.inc b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems=
.inc<br>
new file mode 100644<br>
index 0000000000..f57bbab930<br>
--- /dev/null<br>
+++ b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc=
<br>
@@ -0,0 +1,18 @@<br>
+#<br>
+# Lists of the ptest in meta-filesystems, sorted into two sets by the time=
 they take<br>
+# Please keep these sorted in alphabetical order<br>
+#<br>
+# A first pass at getting all meta-filesystems recipes which inherit ptest=
<br>
+# meta_filesystems_ptest_recipes=3D$(bitbake-layers show-recipes --recipes=
-only --layer meta-filesystems --inherits ptest --bare | sed -e &#39;1,/=3D=
=3D=3D Matching recipes: =3D=3D=3D/d&#39;)<br>
+# ptests which take less than ~30s each<br>
+<br>
+PTESTS_FAST_META_FILESYSTEMS =3D &quot;\<br>
+=C2=A0 =C2=A0 e2tools \<br>
+=C2=A0 =C2=A0 fuse3 \<br>
+&quot;<br>
+<br>
+PTESTS_SLOW_META_FILESYSTEMS =3D &quot;\<br>
+&quot;<br>
+PTESTS_PROBLEMS_META_FILESYSTEMS =3D &quot;\<br>
+=C2=A0 =C2=A0 sshfs-fuse \<br>
+&quot;<br>
diff --git a/meta-filesystems/recipes-filesystems/images/<a href=3D"http://=
meta-filesystems-image-ptest-all.bb" rel=3D"noreferrer" target=3D"_blank">m=
eta-filesystems-image-ptest-all.bb</a> b/meta-filesystems/recipes-filesyste=
ms/images/<a href=3D"http://meta-filesystems-image-ptest-all.bb" rel=3D"nor=
eferrer" target=3D"_blank">meta-filesystems-image-ptest-all.bb</a><br>
new file mode 100644<br>
index 0000000000..ffbfa1a3f6<br>
--- /dev/null<br>
+++ b/meta-filesystems/recipes-filesystems/images/<a href=3D"http://meta-fi=
lesystems-image-ptest-all.bb" rel=3D"noreferrer" target=3D"_blank">meta-fil=
esystems-image-ptest-all.bb</a><br>
@@ -0,0 +1,25 @@<br>
+DESCRIPTION =3D &quot;Recipe to trigger execution of all meta-filesystems =
ptest images.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://www.openembedded.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://www.openembedded.org/</a>&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+<br>
+inherit features_check nopackages<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;ptest&quot;<br>
+<br>
+require conf/include/ptest-packagelists-meta-filesystems.inc<br>
+<br>
+# Include the full set of ptests<br>
+PTESTS_META_FILESYSTEMS =3D &quot;${PTESTS_FAST_META_FILESYSTEMS} ${PTESTS=
_SLOW_META_FILESYSTEMS} ${PTESTS_PROBLEMS_META_FILESYSTEMS}&quot;<br>
+<br>
+do_testimage[noexec] =3D &quot;1&quot;<br>
+do_testimage[depends] =3D &quot;${@&#39; &#39;.join([&#39;meta-filesystems=
-image-ptest-&#39;+x+&#39;:do_testimage&#39; for x in d.getVar(&#39;PTESTS_=
META_FILESYSTEMS&#39;).split()])}&quot;<br>
+<br>
+do_build[depends] =3D &quot;${@&#39; &#39;.join([&#39;meta-filesystems-ima=
ge-ptest-&#39;+x+&#39;:do_build&#39; for x in d.getVar(&#39;PTESTS_META_FIL=
ESYSTEMS&#39;).split()])}&quot;<br>
+<br>
+# normally image.bbclass would do this<br>
+EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 if bb.utils.contains(&#39;IMAGE_CLASSES&#39;, &#39;testimage=
&#39;, True, False, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&quot;do_testimage&quot;, &qu=
ot;&quot;, &quot;&quot;, d)<br>
+}<br>
diff --git a/meta-filesystems/recipes-filesystems/images/<a href=3D"http://=
meta-filesystems-image-ptest-fast.bb" rel=3D"noreferrer" target=3D"_blank">=
meta-filesystems-image-ptest-fast.bb</a> b/meta-filesystems/recipes-filesys=
tems/images/<a href=3D"http://meta-filesystems-image-ptest-fast.bb" rel=3D"=
noreferrer" target=3D"_blank">meta-filesystems-image-ptest-fast.bb</a><br>
new file mode 100644<br>
index 0000000000..0eb5344d9e<br>
--- /dev/null<br>
+++ b/meta-filesystems/recipes-filesystems/images/<a href=3D"http://meta-fi=
lesystems-image-ptest-fast.bb" rel=3D"noreferrer" target=3D"_blank">meta-fi=
lesystems-image-ptest-fast.bb</a><br>
@@ -0,0 +1,5 @@<br>
+require <a href=3D"http://meta-filesystems-image-ptest-all.bb" rel=3D"nore=
ferrer" target=3D"_blank">meta-filesystems-image-ptest-all.bb</a><br>
+<br>
+DESCRIPTION =3D &quot;Recipe to trigger execution of all fast meta-filesys=
tems ptest images.&quot;<br>
+<br>
+PTESTS_META_OE =3D &quot;${PTESTS_FAST_META_FILESYSTEMS}&quot;</blockquote=
></div></div><div><div class=3D"gmail_quote"><div dir=3D"auto">this should =
probably be PTESTS_META_FILESYSTEMS =3D</div><div dir=3D"auto">Unless we wa=
nt to expand the scope.</div></div></div></blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto">Also, THANK YOU for taking the example of meta-oe,=
 meta-perl and meta-python to another layer. I would love to see this exten=
d to every layer.</div><div dir=3D"auto"><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div><d=
iv class=3D"gmail_quote"><div dir=3D"auto"></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"au=
to"><br></blockquote></div></div><div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)" dir=3D"auto">
diff --git a/meta-filesystems/recipes-filesystems/images/<a href=3D"http://=
meta-filesystems-image-ptest.bb" rel=3D"noreferrer" target=3D"_blank">meta-=
filesystems-image-ptest.bb</a> b/meta-filesystems/recipes-filesystems/image=
s/<a href=3D"http://meta-filesystems-image-ptest.bb" rel=3D"noreferrer" tar=
get=3D"_blank">meta-filesystems-image-ptest.bb</a><br>
new file mode 100644<br>
index 0000000000..90d6a92c1b<br>
--- /dev/null<br>
+++ b/meta-filesystems/recipes-filesystems/images/<a href=3D"http://meta-fi=
lesystems-image-ptest.bb" rel=3D"noreferrer" target=3D"_blank">meta-filesys=
tems-image-ptest.bb</a><br>
@@ -0,0 +1,40 @@<br>
+inherit features_check<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;ptest&quot;<br>
+<br>
+require recipes-core/images/<a href=3D"http://core-image-minimal.bb" rel=
=3D"noreferrer" target=3D"_blank">core-image-minimal.bb</a><br>
+require conf/include/ptest-packagelists-meta-filesystems.inc<br>
+<br>
+SUMMARY =3D &quot;meta-filesystems ptest test image&quot;<br>
+<br>
+DESCRIPTION +=3D &quot;Also including the ${MCNAME} ptest package.&quot;<b=
r>
+HOMEPAGE =3D &quot;<a href=3D"https://www.openembedded.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://www.openembedded.org/</a>&quot;<br>
+<br>
+PTESTS_META_FILESYSTEMS =3D &quot;${PTESTS_SLOW_META_FILESYSTEMS} ${PTESTS=
_FAST_META_FILESYSTEMS} ${PTESTS_PROBLEMS_META_FILESYSTEMS}&quot;<br>
+<br>
+IMAGE_INSTALL:append =3D &quot; ${MCNAME}-ptest openssh&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;${@&#39; &#39;.join([&#39;mcextend:&#39;+x for x i=
n d.getVar(&#39;PTESTS_META_FILESYSTEMS&#39;).split()])}&quot;<br>
+<br>
+# The image can be sufficiently large (~1.8GB) that we need to be careful =
that it fits in a live<br>
+# image (which has a 4GB limit), so nullify the overhead factor (1.3x out =
of the<br>
+# box) and explicitly add up to 1500MB.<br>
+IMAGE_OVERHEAD_FACTOR =3D &quot;1.0&quot;<br>
+IMAGE_ROOTFS_EXTRA_SPACE =3D &quot;324288&quot;<br>
+# If a particular ptest needs more space, it can be customized:<br>
+#IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-&lt;pn&gt; =3D &quot;1024288&=
quot;<br>
+<br>
+# ptests need more memory than standard to avoid the OOM killer<br>
+QB_MEM =3D &quot;-m 1024&quot;<br>
+# If a particular ptest needs more memroy, it can be customized:<br>
+#QB_MEM:virtclass-mcextend-&lt;pn&gt; =3D &quot;-m 4096&quot;<br>
+<br>
+TEST_SUITES =3D &quot;ping ssh parselogs ptest&quot;<br>
+<br>
+# Sadly at the moment the full set of ptests is not robust enough and spor=
adically fails in random places<br>
+PTEST_EXPECT_FAILURE =3D &quot;1&quot;<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 if not d.getVar(&quot;MCNAME&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;No class exten=
sion set&quot;)<br>
+}<br>
+<br>
-- <br>
2.43.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div><div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"></blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108998): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108998" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108998</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104516897/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104516897/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000008b04d606120344a6--

