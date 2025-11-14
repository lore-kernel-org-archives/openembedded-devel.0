Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E299CDE00D
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 04:30:56 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10905.1763094655204040586
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 20:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PSpxckiE;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-640d8b78608so1211627d50.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 20:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763094654; x=1763699454; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E2RKz0eYvtUaiWzSHDv+P63Bxgb/v60Mo2eHDnUbYs8=;
        b=PSpxckiE3iaRJ30gUzk9QGlTitQ5lyBHfLwLnRGNDCE9lkxHgOi/ZR2FwbJhFeQssW
         9cDtj1FRfzDfdm9Pxby0znr2OahmgirvuIHORtFhSlOHmgesrJzRBR57KkS9qfuwyp2k
         sUk8EJU/++tuHXqUDqKqaml7ybe+6RF+mmQQgCvRSvDY8ZTpk47APUs8XODOh5gKBo5P
         uehq1bQITZ9Ox/7ziDDM8Y//xgHC0MGt9I2VKvkqwoNOutWv+F9Q89erB1hpaDAhv0e2
         e8OBujp1OPYDjiaYIUitoRhOhD49OqTdIjwHI+VbU29t8dByFHxIIa4LNP6wv+0+4o1z
         5GQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763094654; x=1763699454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2RKz0eYvtUaiWzSHDv+P63Bxgb/v60Mo2eHDnUbYs8=;
        b=n0bqnNODiO3vNRSgqj8C4xDrEiEX854j6owGxBgp3iBt3sfxNJuDg5Do02BPxF1t3T
         FicDok6UuZMTX/+crjy9DlIRaeGA9mwTdxawKW2D2n60vBiniIApMia2UGbzRJY0yIf6
         y4Aqcg/III2fjF6PFf1URbijSM62ZsoWlpJutdrA2bapws1XciYBxfUzbRE96IEWMy5J
         aa1up6H0s/6gUOqLGxC2zxuC0lFQuOW5VzBuxBA9+u41sgeW1FKu4iKJGzKl2yej+ua2
         YlHiCStd3ILuA8Xxx3OID5yAINweBnucVwFg6n5sJBB1XK0AHtX5Mi7joZN+bZ8IQHix
         1uzg==
X-Gm-Message-State: AOJu0YycB4f0n3QWHgib5LdYDKJCWY9NAFXG7S8gGd8On5Cg4ta4DS1J
	VpHH3iCki7kCj61+xXmDyPANrofXXGIeJAoKAaDpaCm0oMgAeum0v0q3QQax7dpXtok11fsJzjO
	dLblka2hcY817xkbwCGvp0bGOurZeh3O1yrYVdDU=
X-Gm-Gg: ASbGnctWMTeC3YO/B7/cEd2YEXoZ5GnZwAn0BphWNzt4xyvuG8s+uqWAEKtc0Ntc1s1
	nFcmkjQnOUqh3M0hEJmptB6ZVncKe7RxdBYeMsbXZI6hkh3EVM4n5zOWF+gKVkDUvpNYJAGaq4s
	yUXkjDuuzwqITBt9J3uG8hb2whd1LbDWwO/KMdoOoEQqXnH0IJnbRvDFayQb7qUpzuJPTVroeg8
	Z3zfC9kn1nK0tYtt4bbBDheLLwXlM20QiPLqNoqGdGm9b1g0wIHp7ma/T5HrJxi42ufb9U4cCIi
	faUSxRPqliivWOl0KYc3onndXxom8oN5ejLGiZ6u4yipkNSn1oo4C9NOTE5uMPI2D7H36U5kIbe
	q/MnYoogc+CXb5A/Ii2veIGH8qHjz12ZcvVo=
X-Google-Smtp-Source: AGHT+IH/fXomfKVLLSuM/rnZQ0S0k6fIGMnbdoF7IsWr0LHVvLysCUWF3v8Lfdz/ZlAp1HYIPHhqXy7F6MOw22AQq6s=
X-Received: by 2002:a05:690c:7089:b0:786:5926:edab with SMTP id
 00721157ae682-78929e5ff95mr18539687b3.17.1763094654259; Thu, 13 Nov 2025
 20:30:54 -0800 (PST)
MIME-Version: 1.0
References: <20251114035030.4042745-1-ankur.tyagi85@gmail.com> <20251114035030.4042745-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20251114035030.4042745-2-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 20:30:28 -0800
X-Gm-Features: AWmQ_bkKXmx5cNkYbf1VBUeaOrM67wlk95zVHFXB-ZKVVNrzkYPvU7uVVMCCh0k
Message-ID: <CAMKF1som4dJ60f=0nv4Mb_ZDZPRmQ9WqJRER=XoSWeJTL1akEQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/5] libtracefs: upgrade 1.8.1 -> 1.8.2
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000092948106438676d9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 04:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121683

--00000000000092948106438676d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 7:50=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> New version added trace_sql.bash for tracefs_sql() bash completions.
>
> Changelog:
>
> https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=3Dlibt=
racefs-1.8.2
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../libtracefs/{libtracefs_1.8.1.bb =3D> libtracefs_1.8.2.bb}   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.8.1.bb =3D>
> libtracefs_1.8.2.bb} (89%)
>
> diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
> b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
> similarity index 89%
> rename from meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
> rename to meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
> index 6b9e8b9b38..bc7311a634 100644
> --- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
> +++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSES/GPL-2.0;md5=3De6a75371ba4d16749254a51215d13f97
>  SECTION =3D "libs"
>  DEPENDS =3D "libtraceevent bison-native flex-native"
>
> -SRCREV =3D "417c2e3aa21af670cc5c13db633dd35292f2d0fa"
> +SRCREV =3D "03790961bf2e83b7b61fb6d326fb1076a4293adb"
>  SRC_URI =3D "git://
> git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=3D${BPN};proto=
col=3Dhttps
> <http://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=3D$%7B=
BPN%7D;protocol=3Dhttps>
> \
>
> file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
>             "
> @@ -19,3 +19,5 @@ inherit pkgconfig
>  do_install() {
>      oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgconfi=
g
>  }
> +
> +FILES:${PN} +=3D "${datadir}/bash-completion"
>

perhaps using inherit bash-completion is all you need.


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121678):
> https://lists.openembedded.org/g/openembedded-devel/message/121678
> Mute This Topic: https://lists.openembedded.org/mt/116287242/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000092948106438676d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13,=
 2025 at 7:50=E2=80=AFPM Ankur Tyagi via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ankur=
 Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">ank=
ur.tyagi85@gmail.com</a>&gt;<br>
<br>
New version added trace_sql.bash for tracefs_sql() bash completions.<br>
<br>
Changelog:<br>
<a href=3D"https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/=
?h=3Dlibtracefs-1.8.2" rel=3D"noreferrer" target=3D"_blank">https://git.ker=
nel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=3Dlibtracefs-1.8.2</a><=
br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../libtracefs/{<a href=3D"http://libtracefs_1.8.1.bb" rel=3D"norefer=
rer" target=3D"_blank">libtracefs_1.8.1.bb</a> =3D&gt; <a href=3D"http://li=
btracefs_1.8.2.bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.2.bb=
</a>}=C2=A0 =C2=A0| 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-kernel/libtracefs/{<a href=3D"http://libtracef=
s_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.1.bb</a> =
=3D&gt; <a href=3D"http://libtracefs_1.8.2.bb" rel=3D"noreferrer" target=3D=
"_blank">libtracefs_1.8.2.bb</a>} (89%)<br>
<br>
diff --git a/meta-oe/recipes-kernel/libtracefs/<a href=3D"http://libtracefs=
_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.1.bb</a> b/m=
eta-oe/recipes-kernel/libtracefs/<a href=3D"http://libtracefs_1.8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">libtracefs_1.8.2.bb</a><br>
similarity index 89%<br>
rename from meta-oe/recipes-kernel/libtracefs/<a href=3D"http://libtracefs_=
1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.1.bb</a><br>
rename to meta-oe/recipes-kernel/libtracefs/<a href=3D"http://libtracefs_1.=
8.2.bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.2.bb</a><br>
index 6b9e8b9b38..bc7311a634 100644<br>
--- a/meta-oe/recipes-kernel/libtracefs/<a href=3D"http://libtracefs_1.8.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.1.bb</a><br>
+++ b/meta-oe/recipes-kernel/libtracefs/<a href=3D"http://libtracefs_1.8.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.2.bb</a><br>
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSES/GPL-2.0;md5=3De6=
a75371ba4d16749254a51215d13f97<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
=C2=A0DEPENDS =3D &quot;libtraceevent bison-native flex-native&quot;<br>
<br>
-SRCREV =3D &quot;417c2e3aa21af670cc5c13db633dd35292f2d0fa&quot;<br>
+SRCREV =3D &quot;03790961bf2e83b7b61fb6d326fb1076a4293adb&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/libs=
/libtrace/libtracefs.git;branch=3D$%7BBPN%7D;protocol=3Dhttps" rel=3D"noref=
errer" target=3D"_blank">git.kernel.org/pub/scm/libs/libtrace/libtracefs.gi=
t;branch=3D${BPN};protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-makefile-Do-not-prese=
rve-ownership-in-cp-command.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
@@ -19,3 +19,5 @@ inherit pkgconfig<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${lib=
dir}/pkgconfig<br>
=C2=A0}<br>
+<br>
+FILES:${PN} +=3D &quot;${datadir}/bash-completion&quot;<br></blockquote><d=
iv><br></div><div>perhaps using inherit bash-completion is all you need.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121678): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121678" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121678</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116287242/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116287242/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000092948106438676d9--

