Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663BEC00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 12:16:20 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.6137.1659701771309103716
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Aug 2022 05:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ro3AUd/j;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id v3so3126062wrp.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Aug 2022 05:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=x2mh90kyLi9cQsgHkaE1cXfQHwVn3oaEAb0kxNW0mcg=;
        b=Ro3AUd/jVAMnhcoW8E+A3IvXnLoW1vmJmTJKYg3FAw0LfKZBTn4+rWcm2Q4hjALCkS
         2hGkxfu+zYegzGHKRum2nTgBZwlMuYkhfe7RXRGd5W//Zc7zYrMMUZoy+wtihp12XEBM
         qGykMNsI3BBZJLiRakQCgvLMtnUEu06ISRRgFkdrVoJvOLjjY50NzwPS52fAS4vf6FRk
         8uvg0Y7jUsRaw8dJfTDWPM015+0TB5ovx9SpATxqDolxLTPdQ4wOPQkzEwVJyONH4an5
         DoSwtG7OBs3zhs0tyklvBDwLkeIw/26SML0+8C8qbpTxlLJag5BWeOB7H93Eyx6Y2l56
         OTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=x2mh90kyLi9cQsgHkaE1cXfQHwVn3oaEAb0kxNW0mcg=;
        b=WfzLDlJLoE65oIzACQ2cwr2P5MSQ/r+AcbNbR2UmwpJnwU3dzWbCCh4fxyEtFjwWxX
         H+YENJCDP6N1M1506q31XAMCjSR/A+OT8aPzVOTHS7OpRNSL3tN6K7kRblwl4FrwNjkB
         +DruwTjNRYQQ8FSoPGjyT2On6TdohZuZGf7QySn1nVyStSCnEcI+ExYqYhn7x4DJDQW2
         zJsD974W4r8B22PpeDAuHZ0kZJTuM68AdYTBcd5jfIUfBmq9VmQrHTqnBOB2tDBaQdge
         tlgfa4CKJ951cDqjlvlenMqgJKTozOvoDRHkZVzs6Pry8jViJc/xFlFBpIWUfoeatBrL
         G/3w==
X-Gm-Message-State: ACgBeo1W/f3qHq+6PIjv9ys64sF2OBpXD4CWN6gItaiSMxuFnP2KP1h+
	pwcJBT46GwJByNIuZTpT+DYhcttgLj0J68pI3iU=
X-Google-Smtp-Source: 
 AA6agR6e2SuO3t7Q6PcrRITXoIJPxR1uFd070bBzKtw0/+7zORmPACKnw8SmGaYklHVbQRYTduNlDV7rhvep35A7+aY=
X-Received: by 2002:a5d:6e8d:0:b0:21e:48a4:b267 with SMTP id
 k13-20020a5d6e8d000000b0021e48a4b267mr3854210wrz.507.1659701769602; Fri, 05
 Aug 2022 05:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <16FEDE6CB32D82CD.2437@lists.openembedded.org>
In-Reply-To: <16FEDE6CB32D82CD.2437@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 5 Aug 2022 14:15:28 +0200
Message-ID: 
 <CA+chaQfkVRDPiCV+cdBU15EWaYOvduXYswCZ4UzYDcSS6WkhcA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] glmark2: fix compatibility with
 python-3.11
To: Martin.Jansa@gmail.com, akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000690b9905e57d6e9d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Aug 2022 12:16:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98135

--000000000000690b9905e57d6e9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Tue, Jul 5, 2022 at 9:31 AM Martin Jansa via lists.openembedded.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...b-fix-compatibility-with-python-3.11.patch | 76 +++++++++++++++++++
>  .../recipes-benchmark/glmark2/glmark2_git.bb  |  3 +-
>  2 files changed, 78 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-compatibility-wit=
h-python-3.11.patch
>
> diff --git
> a/meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-compatibility-w=
ith-python-3.11.patch
> b/meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-compatibility-w=
ith-python-3.11.patch
> new file mode 100644
> index 0000000000..c56fa64e58
> --- /dev/null
> +++
> b/meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-compatibility-w=
ith-python-3.11.patch
> @@ -0,0 +1,76 @@
> +From b85ba8c3ff3fb9ae708576ccef03434d2ef73054 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Tue, 14 Jun 2022 09:54:18 +0000
> +Subject: [PATCH] waflib: fix compatibility with python-3.11
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +*
> https://docs.python.org/3.11/whatsnew/3.11.html#changes-in-the-python-api
> +
> +  open(), io.open(), codecs.open() and fileinput.FileInput no longer
> +  accept 'U' (=E2=80=9Cuniversal newline=E2=80=9D) in the file mode. Thi=
s flag was
> +  deprecated since Python 3.3. In Python 3, the =E2=80=9Cuniversal newli=
ne=E2=80=9D is
> +  used by default when a file is open in text mode. The newline paramete=
r
> +  of open() controls how universal newlines works. (Contributed by Victo=
r
> +  Stinner in bpo-37330.)
> +
> +* fixes:
> +Waf: The wscript in
> '/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glmark2/2021.12-r0/git'
> is unreadable
> +Traceback (most recent call last):
> +  File
> "/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glmark2/2021.12-r0/git/waflib/Scripting.py",
> line 104, in waf_entry_point
> +
> set_main_module(os.path.normpath(os.path.join(Context.run_dir,Context.WSC=
RIPT_FILE)))
> +
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^
> +  File
> "/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glmark2/2021.12-r0/git/waflib/Scripting.py",
> line 135, in set_main_module
> +    Context.g_module=3DContext.load_module(file_path)
> +                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +  File
> "/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glmark2/2021.12-r0/git/waflib/Context.py",
> line 343, in load_module
> +    code=3DUtils.readf(path,m=3D'rU',encoding=3Dencoding)
> +         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +  File
> "/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glmark2/2021.12-r0/git/waflib/Utils.py",
> line 117, in readf
> +    f=3Dopen(fname,m)
> +      ^^^^^^^^^^^^^
> +ValueError: invalid mode: 'rUb'
> +
> +Upstream-Status: Submitted [https://github.com/glmark2/glmark2/pull/178]
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + waflib/ConfigSet.py | 2 +-
> + waflib/Context.py   | 4 ++--
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/waflib/ConfigSet.py b/waflib/ConfigSet.py
> +index 16142a2..87de4ad 100644
> +--- a/waflib/ConfigSet.py
> ++++ b/waflib/ConfigSet.py
> +@@ -140,7 +140,7 @@ class ConfigSet(object):
> +               Utils.writef(filename,''.join(buf))
> +       def load(self,filename):
> +               tbl=3Dself.table
> +-              code=3DUtils.readf(filename,m=3D'rU')
> ++              code=3DUtils.readf(filename,m=3D'r')
> +               for m in re_imp.finditer(code):
> +                       g=3Dm.group
> +                       tbl[g(2)]=3Deval(g(3))
> +diff --git a/waflib/Context.py b/waflib/Context.py
> +index 8f2cbfb..f3e35ae 100644
> +--- a/waflib/Context.py
> ++++ b/waflib/Context.py
> +@@ -109,7 +109,7 @@ class Context(ctx):
> +                               cache[node]=3DTrue
> +                               self.pre_recurse(node)
> +                               try:
> +-
> function_code=3Dnode.read('rU',encoding)
> ++
> function_code=3Dnode.read('r',encoding)
> +
>  exec(compile(function_code,node.abspath(),'exec'),self.exec_dict)
> +                               finally:
> +                                       self.post_recurse(node)
> +@@ -340,7 +340,7 @@ def load_module(path,encoding=3DNone):
> +               pass
> +       module=3Dimp.new_module(WSCRIPT_FILE)
> +       try:
> +-              code=3DUtils.readf(path,m=3D'rU',encoding=3Dencoding)
> ++              code=3DUtils.readf(path,encoding=3Dencoding)
> +       except EnvironmentError:
> +               raise Errors.WafError('Could not read the file %r'%path)
> +       module_dir=3Dos.path.dirname(path)
> diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> index 1406f68b05..188d4e5bdf 100644
> --- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> +++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> @@ -18,7 +18,8 @@ SRC_URI =3D " \
>      file://0001-fix-dispmanx-build.patch \
>      file://0002-run-dispmanx-fullscreen.patch \
>      file://0001-libmatrix-Include-missing-utility-header.patch \
> -    "
> +    file://0001-waflib-fix-compatibility-with-python-3.11.patch \
> +"
>  SRCREV =3D "0858b450cd88c84a15b99dda9698d44e7f7e8c70"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97713):
> https://lists.openembedded.org/g/openembedded-devel/message/97713
> Mute This Topic: https://lists.openembedded.org/mt/92180553/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000690b9905e57d6e9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jul 5, 2022 at 9:31 AM Martin Jansa via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;Martin.J=
ansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Ja=
nsa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0...b-fix-compatibility-with-python-3.11.patch | 76 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-benchmark/glmark2/<a href=3D"http://glmark2_git.bb" rel=
=3D"noreferrer" target=3D"_blank">glmark2_git.bb</a>=C2=A0 |=C2=A0 3 +-<br>
=C2=A02 files changed, 78 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-wafli=
b-fix-compatibility-with-python-3.11.patch<br>
<br>
diff --git a/meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-compat=
ibility-with-python-3.11.patch b/meta-oe/recipes-benchmark/glmark2/files/00=
01-waflib-fix-compatibility-with-python-3.11.patch<br>
new file mode 100644<br>
index 0000000000..c56fa64e58<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-compatibility=
-with-python-3.11.patch<br>
@@ -0,0 +1,76 @@<br>
+From b85ba8c3ff3fb9ae708576ccef03434d2ef73054 Mon Sep 17 00:00:00 2001<br>
+From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D=
"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+Date: Tue, 14 Jun 2022 09:54:18 +0000<br>
+Subject: [PATCH] waflib: fix compatibility with python-3.11<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+* <a href=3D"https://docs.python.org/3.11/whatsnew/3.11.html#changes-in-th=
e-python-api" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/=
3.11/whatsnew/3.11.html#changes-in-the-python-api</a><br>
+<br>
+=C2=A0 open(), io.open(), codecs.open() and fileinput.FileInput no longer<=
br>
+=C2=A0 accept &#39;U&#39; (=E2=80=9Cuniversal newline=E2=80=9D) in the fil=
e mode. This flag was<br>
+=C2=A0 deprecated since Python 3.3. In Python 3, the =E2=80=9Cuniversal ne=
wline=E2=80=9D is<br>
+=C2=A0 used by default when a file is open in text mode. The newline param=
eter<br>
+=C2=A0 of open() controls how universal newlines works. (Contributed by Vi=
ctor<br>
+=C2=A0 Stinner in bpo-37330.)<br>
+<br>
+* fixes:<br>
+Waf: The wscript in &#39;/OE/build/luneos-langdale/webos-ports/tmp-glibc/w=
ork/core2-64-webos-linux/glmark2/2021.12-r0/git&#39; is unreadable<br>
+Traceback (most recent call last):<br>
+=C2=A0 File &quot;/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/cor=
e2-64-webos-linux/glmark2/2021.12-r0/git/waflib/Scripting.py&quot;, line 10=
4, in waf_entry_point<br>
+=C2=A0 =C2=A0 set_main_module(os.path.normpath(os.path.join(Context.run_di=
r,Context.WSCRIPT_FILE)))<br>
+=C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^<br>
+=C2=A0 File &quot;/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/cor=
e2-64-webos-linux/glmark2/2021.12-r0/git/waflib/Scripting.py&quot;, line 13=
5, in set_main_module<br>
+=C2=A0 =C2=A0 Context.g_module=3DContext.load_module(file_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
+=C2=A0 File &quot;/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/cor=
e2-64-webos-linux/glmark2/2021.12-r0/git/waflib/Context.py&quot;, line 343,=
 in load_module<br>
+=C2=A0 =C2=A0 code=3DUtils.readf(path,m=3D&#39;rU&#39;,encoding=3Dencoding=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^<br>
+=C2=A0 File &quot;/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/cor=
e2-64-webos-linux/glmark2/2021.12-r0/git/waflib/Utils.py&quot;, line 117, i=
n readf<br>
+=C2=A0 =C2=A0 f=3Dopen(fname,m)<br>
+=C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^<br>
+ValueError: invalid mode: &#39;rUb&#39;<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/glmark2/glmark2/=
pull/178" rel=3D"noreferrer" target=3D"_blank">https://github.com/glmark2/g=
lmark2/pull/178</a>]<br>
+Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+---<br>
+ waflib/ConfigSet.py | 2 +-<br>
+ waflib/Context.py=C2=A0 =C2=A0| 4 ++--<br>
+ 2 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/waflib/ConfigSet.py b/waflib/ConfigSet.py<br>
+index 16142a2..87de4ad 100644<br>
+--- a/waflib/ConfigSet.py<br>
++++ b/waflib/ConfigSet.py<br>
+@@ -140,7 +140,7 @@ class ConfigSet(object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Utils.writef(filena=
me,&#39;&#39;.join(buf))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0def load(self,filename):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tbl=3Dself.table<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code=3DUtils.readf(filen=
ame,m=3D&#39;rU&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code=3DUtils.readf(filen=
ame,m=3D&#39;r&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for m in re_imp.fin=
diter(code):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g=3Dm.group<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tbl[g(2)]=3Deval(g(3))<br>
+diff --git a/waflib/Context.py b/waflib/Context.py<br>
+index 8f2cbfb..f3e35ae 100644<br>
+--- a/waflib/Context.py<br>
++++ b/waflib/Context.py<br>
+@@ -109,7 +109,7 @@ class Context(ctx):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache[node]=3DTrue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pre_recurse(node)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 function_code=
=3Dnode.read(&#39;rU&#39;,encoding)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 function_code=
=3Dnode.read(&#39;r&#39;,encoding)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec(comp=
ile(function_code,node.abspath(),&#39;exec&#39;),self.exec_dict)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0finally:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.post=
_recurse(node)<br>
+@@ -340,7 +340,7 @@ def load_module(path,encoding=3DNone):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0module=3Dimp.new_module(WSCRIPT_FILE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code=3DUtils.readf(path,=
m=3D&#39;rU&#39;,encoding=3Dencoding)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code=3DUtils.readf(path,=
encoding=3Dencoding)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0except EnvironmentError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise Errors.WafErr=
or(&#39;Could not read the file %r&#39;%path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0module_dir=3Dos.path.dirname(path)<br>
diff --git a/meta-oe/recipes-benchmark/glmark2/<a href=3D"http://glmark2_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">glmark2_git.bb</a> b/meta-oe/rec=
ipes-benchmark/glmark2/<a href=3D"http://glmark2_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">glmark2_git.bb</a><br>
index 1406f68b05..188d4e5bdf 100644<br>
--- a/meta-oe/recipes-benchmark/glmark2/<a href=3D"http://glmark2_git.bb" r=
el=3D"noreferrer" target=3D"_blank">glmark2_git.bb</a><br>
+++ b/meta-oe/recipes-benchmark/glmark2/<a href=3D"http://glmark2_git.bb" r=
el=3D"noreferrer" target=3D"_blank">glmark2_git.bb</a><br>
@@ -18,7 +18,8 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-fix-dispmanx-build.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0002-run-dispmanx-fullscreen.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-libmatrix-Include-missing-utility-header.pa=
tch \<br>
-=C2=A0 =C2=A0 &quot;<br>
+=C2=A0 =C2=A0 file://0001-waflib-fix-compatibility-with-python-3.11.patch =
\<br>
+&quot;<br>
=C2=A0SRCREV =3D &quot;0858b450cd88c84a15b99dda9698d44e7f7e8c70&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97713): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97713" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97713</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92180553/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92180553/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000690b9905e57d6e9d--

