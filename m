Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582BAC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 12:00:50 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.2424.1667995241871798978
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 04:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FWQuFeGG;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so2374173wmi.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 04:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Je/3tqDSitBfWbWKxqNDQDbGL1MpQGuqg1s0D8fS7Vw=;
        b=FWQuFeGGRgIqhG1DBCA5Pn6DZYeIxs3BiagcVxDDiv3Zk0qciIOyUp2ggMWrOxZR1K
         6PDCeGycCiHId6/FM9WTuzKdt8nz+MkLzQEnFjVpUhJT3bvX6SyCxfHmHiDf+2uvIB++
         a3t0poAsGmk5s1ZrJGneO0+urYTKTF8ooz4TcuHMDum8rcPWOk5mAou+7ZWQN+yEcT4b
         T6VSC3xmJj2uLxacOTY+XnkYpzKQUBCmLwEqhmwYxlMjgLHicjcQP6C7ddc/BEtGXunD
         o/9t2EGumcXFIJaZ26UvY9qy4zSusSZ4SYNsv4wR5ktqj3uwNRKh6x2RzAgJxGJvZSem
         zO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Je/3tqDSitBfWbWKxqNDQDbGL1MpQGuqg1s0D8fS7Vw=;
        b=MKsn2gKqYOgeUGp9fSR2AlDo9PmPkji8JTipLD5zW8IqF0w7gUm+l6VBeKNFJ2jjfz
         +4x8g9pSmwPNMBgDRD+EkcjEuMgVUxbBJKfoWbV81fFX8cdqDYMNTJgNGaC1j3/xMxlM
         JZeK3THhIIiQVIIZKTtsqjm9w1RT3Eb/wUrgc8txzFtrGXJUB3jXhzDVy07gWQOYyfvL
         OvHe5vaCTxpw5S1o78pB87MnjXAlU/XsyNoOudzk/DcxvwcNKOPGHFewfCDTdgRRJBZj
         +tcsHgiKPnpf3rtuxkmHsQyq9gB8wADxVoaRGPZQDDgpNxUV2HGef0dIN0cQZ8VmtvKe
         gDzQ==
X-Gm-Message-State: ACrzQf1IrsVOrEGcfDPwVDI0F69WSo/9d2r8FHsMoDlgUWZI9pCaIuG+
	BUp3D+ywG7ZjDbF4AidoxenLVtWbmeTC9BFel08=
X-Google-Smtp-Source: AMsMyM6BGf+6Qo4KDKaArZqrxoJGMpzpNF4BlepDWWxg8dJSu4Cg6bV1Vfu5EhvAn2T7UmX1e06a+W7+G1k8kKiH5V4=
X-Received: by 2002:a05:600c:4313:b0:3cf:894d:1d05 with SMTP id
 p19-20020a05600c431300b003cf894d1d05mr25078931wme.32.1667995240119; Wed, 09
 Nov 2022 04:00:40 -0800 (PST)
MIME-Version: 1.0
References: <20221109114320.772827-1-akuster808@gmail.com>
In-Reply-To: <20221109114320.772827-1-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 Nov 2022 13:00:28 +0100
Message-ID: <CA+chaQf-qMx2S7ew1WKLw-KRjtThAWaS7n-eqmOXxU0hhyK0NA@mail.gmail.com>
Subject: Re: [oe] [master][langdale]meta-oe][PATCH] monkey: skip recipe
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c643b905ed086734"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 12:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99494

--000000000000c643b905ed086734
Content-Type: text/plain; charset="UTF-8"

> git tag produces a detached head so no viable replacement can be found

nobranch seems reasonable solution for tag not included in any branch

but v1.6.9 tag also appears in 1.6 branch, so it shouldn't be even needed
monkey $ git branch -a --contains v1.6.9
  remotes/origin/1.6
  remotes/origin/cgi_cookie
  remotes/origin/cgi_symlink
  remotes/origin/coro
  remotes/origin/request_done


On Wed, Nov 9, 2022 at 12:43 PM Armin Kuster <akuster808@gmail.com> wrote:

> Package SRC-URI appears to be dead and the git tag produces a detached
> head so no viable replacement can be found. see email
>
> https://lists.openembedded.org/g/openembedded-devel/message/99433?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cmonkey%2C20%2C2%2C0%2C94844107
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb | 1 -
>  meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb            | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-core/packagesgroups/
> packagegroup-meta-webserver.bb
> b/meta-webserver/recipes-core/packagesgroups/
> packagegroup-meta-webserver.bb
> index e775cdb50e..fbcf7c547c 100644
> --- a/meta-webserver/recipes-core/packagesgroups/
> packagegroup-meta-webserver.bb
> +++ b/meta-webserver/recipes-core/packagesgroups/
> packagegroup-meta-webserver.bb
> @@ -23,7 +23,6 @@ RDEPENDS:packagegroup-meta-webserver-http = "\
>      apache2 \
>      ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2",
> "cherokee", "", d)} \
>      hiawatha \
> -    monkey \
>      nginx \
>      nginx \
>      sthttpd \
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> index 8e58a7d4e2..771d1ed39e 100644
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> @@ -86,3 +86,6 @@ CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
>                     ${sysconfdir}/monkey/plugins/auth/monkey.users \
>                     "
>
> +
> +SKIP_RECIPE[monkey] ?= "Upstream SRC_URI dead and t tag version produces
> a detached head "
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99493):
> https://lists.openembedded.org/g/openembedded-devel/message/99493
> Mute This Topic: https://lists.openembedded.org/mt/94910769/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c643b905ed086734
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; git tag produces a detached head so no viable replace=
ment can be found<div><br></div><div>nobranch seems reasonable solution for=
 tag not included in any branch</div><div><br></div><div>but v1.6.9 tag als=
o appears in 1.6 branch, so it shouldn&#39;t be even needed</div><div>monke=
y $ git branch -a --contains v1.6.9<br>=C2=A0 remotes/origin/1.6<br>=C2=A0 =
remotes/origin/cgi_cookie<br>=C2=A0 remotes/origin/cgi_symlink<br>=C2=A0 re=
motes/origin/coro<br>=C2=A0 remotes/origin/request_done</div><div><br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed, Nov 9, 2022 at 12:43 PM Armin Kuster &lt;<a href=3D"mailto:akuster=
808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Package SRC-URI appears to be dead and t=
he git tag produces a detached head so no viable replacement can be found. =
see email<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/9943=
3?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cmonkey%2C20%2C2%2C0%2C9484=
4107" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g=
/openembedded-devel/message/99433?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%=
2C0%2Cmonkey%2C20%2C2%2C0%2C94844107</a><br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" tar=
get=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-core/packagesgroups/<a href=3D"http://packagegroup-meta-w=
ebserver.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-webserv=
er.bb</a> | 1 -<br>
=C2=A0meta-webserver/recipes-httpd/monkey/<a href=3D"http://monkey_1.6.9.bb=
" rel=3D"noreferrer" target=3D"_blank">monkey_1.6.9.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
=C2=A02 files changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-webserver/recipes-core/packagesgroups/<a href=3D"http://p=
ackagegroup-meta-webserver.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-webserver.bb</a> b/meta-webserver/recipes-core/packagesgroups/<a=
 href=3D"http://packagegroup-meta-webserver.bb" rel=3D"noreferrer" target=
=3D"_blank">packagegroup-meta-webserver.bb</a><br>
index e775cdb50e..fbcf7c547c 100644<br>
--- a/meta-webserver/recipes-core/packagesgroups/<a href=3D"http://packageg=
roup-meta-webserver.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-m=
eta-webserver.bb</a><br>
+++ b/meta-webserver/recipes-core/packagesgroups/<a href=3D"http://packageg=
roup-meta-webserver.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-m=
eta-webserver.bb</a><br>
@@ -23,7 +23,6 @@ RDEPENDS:packagegroup-meta-webserver-http =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0apache2 \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;BBFILE_COLLECTIONS&quot;, &q=
uot;meta-python2&quot;, &quot;cherokee&quot;, &quot;&quot;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0hiawatha \<br>
-=C2=A0 =C2=A0 monkey \<br>
=C2=A0 =C2=A0 =C2=A0nginx \<br>
=C2=A0 =C2=A0 =C2=A0nginx \<br>
=C2=A0 =C2=A0 =C2=A0sthttpd \<br>
diff --git a/meta-webserver/recipes-httpd/monkey/<a href=3D"http://monkey_1=
.6.9.bb" rel=3D"noreferrer" target=3D"_blank">monkey_1.6.9.bb</a> b/meta-we=
bserver/recipes-httpd/monkey/<a href=3D"http://monkey_1.6.9.bb" rel=3D"nore=
ferrer" target=3D"_blank">monkey_1.6.9.bb</a><br>
index 8e58a7d4e2..771d1ed39e 100644<br>
--- a/meta-webserver/recipes-httpd/monkey/<a href=3D"http://monkey_1.6.9.bb=
" rel=3D"noreferrer" target=3D"_blank">monkey_1.6.9.bb</a><br>
+++ b/meta-webserver/recipes-httpd/monkey/<a href=3D"http://monkey_1.6.9.bb=
" rel=3D"noreferrer" target=3D"_blank">monkey_1.6.9.bb</a><br>
@@ -86,3 +86,6 @@ CONFFILES:${PN} =3D &quot;${sysconfdir}/monkey/monkey.con=
f \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sys=
confdir}/monkey/plugins/auth/monkey.users \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;<br>
<br>
+<br>
+SKIP_RECIPE[monkey] ?=3D &quot;Upstream SRC_URI dead and t tag version pro=
duces a detached head &quot;<br>
+<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99493): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99493" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99493</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94910769/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94910769/3617156</a><br>
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

--000000000000c643b905ed086734--

