Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1801.1792739182809626607
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 00:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Dn5SumOF;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ad98c3fb15so4855637b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 00:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792739182; cv=none;
        d=google.com; s=arc-20260327;
        b=UOhEwW4SmZXW1EdMzweG7sL9BXovQT+gGlF8F9imocTnTkcwgLIc0A0NdYlbG9nWs6
         t5XoLodcHAs3uoyk0R0IStoQ0ETry0/isQyoq3qmWMLnJZl1x954TCskgK2ds+1porNy
         ecbtvpSkZyj8AhPCAiFF1xXruJGRYlZPiS3QQLkriHohGCfKBgEVWuNKykQn7fQXcp0A
         ETv/RV8vKEJ9l074bYvnKKnj0j5mI664AlkX3c4LaL6WUkj8clg7SkwHalIT+anleCwp
         5d9T9QPhwBDQvdTWTz4brbajpRzf2bzK4iYDlVr16mT3WTNc9a63Z7tFlRr+k24OqA9p
         ZzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OH+qldPnwy5u1u7gWqcJZk9YYatpTj4YehILLisMGD0=;
        fh=L5sSjfTM0vn1sQVdwyTo1CyWIgPu+BMpabB7oqvaHJ4=;
        b=W4/+iRFtZ7PIhY1G5I8XGF1gdhx4HxpxTUONj6rwdGw1VHgt6LjyhOvhOQvVBbsLhn
         Jog+bYyUCPZos4B4LPw1hG4Jh6zNqSt8eZlDQ/vIQJ2B4pHoFZN9KDIh1FLDdgbehwFD
         UObtOGKepbkchVtEiRaHvfZZ5TQTm7TItwm0q5/wdGN+t9/6aS7/3dHDlf483xQA1dR9
         efijJNsSFV2GBsTrmzNrR8DoCgDRGIGb6zdvDvpsuos53yYzZFDkCdFbEP3f5FsfZuyt
         2lkY0091rt0cJdyx80gNMWFIfnrXzKTeCx5yUDLVUbL4VR68JPnRNV/q9zPOXeq6pvS+
         J87g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739182; x=1793343982; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OH+qldPnwy5u1u7gWqcJZk9YYatpTj4YehILLisMGD0=;
        b=Dn5SumOFKLaQTLJ4eT0PyWtcKaD8NunG4paJ8r+Shnkpvb9z8B/9cyKSadLwlsgcQx
         4uKUANldbdsJCKwRLEsL/7eWYmnl6WR6+6qZTX95ffNVvAvEZwtesLYW6PXJml/yqyTA
         8xphy/lNm2zhZvrHn1sO9fzAzM3jyDixiHsBX4UiMl1S0L79+OrDrCYfFfczhGYa1TVa
         GHXdaPATxE1S7LhyS9laGD/hERDyP7L2v+z0Rf7zsLiHEbtI5jkW9anh3j/8EdhCXOh3
         WBDFtk1Y+08SxggenbopSb4WBDZ4wVoun7hdLYbcCSYD6rus7a3Zdd/QjDOIDByDxHqf
         sWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739182; x=1793343982;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OH+qldPnwy5u1u7gWqcJZk9YYatpTj4YehILLisMGD0=;
        b=hupXiO4x29ZX7My/Vc0dtUWfzwkgWXrNbuHkM5+ztFC9UCmH/fuMLJBzqu9qX5EGcb
         cOi55jqKCSLtXUNGZHKRwohE1pavTBF/J7tPnAHCCNG/HmwJztglqilHYekuM0zD5NuZ
         g0/xLTjW23xamDZL6d68g6GXOIVDSxXDhZdavT2uyZCbDSkE3xv0RgEJ6hq3L6Bx5/vj
         6lLzScT7GTd6Jb49nebKHsnOovhmGuV3HTF4QgMTJAbx71gZv0fjl2Vsg5wCUZc9D92w
         qMh37LfR8M8XeguKD3IPlIFbdPN69j06ytgLALIhATuU4p4K5QjKV1ipO47VwaqyR+V3
         pX/Q==
X-Forwarded-Encrypted: i=1; AKwUvBz5HlVwmf+tHIlJB6sw0/QNgdR94In14ByZJexXOTm9Q8go2I5ApPSjbzsJRFgmqxGurdZp3i6DA1JwxhPnFiVnovM=@lists.openembedded.org
X-Gm-Message-State: AFq9FYL1Rbey3k67WAlrG2qv/pD33O8tNdM9/ax2PXjNq6meQjKR4Q5w
	aOiGwzd1ufkiEa4I+0XsvHeOXrjsoXD0hmorzBMBpuSdPJeHp5pQQUUwqq2YinNpZgFbTmrQlLb
	cfAWxoSRx39wSmnH2hL5suhOEnrL1+vY=
X-Gm-Gg: AYBFou1VXv/17KIV/bDAYwbfoSCdK9OU3es3xq9rj+xIwzXho/iFpV91ou4QUvICtJW
	lfC6qZ76Rf6jD/sMwiDv3QCgFsR+OsC5HqZksXWmOGn/erzemXok2UhDaqsb2uWPWAUVvC7SZk0
	relO7Zz44JnXcc6/JviiWlsZ48v/1mYXgAzkNwOYD/a+vwZ+Wt4qN6Cp9yjP+8bo1SfSW73q0XS
	YOISeVoq8ozVK4R0HS4sH/4O9JSJpCLPS3gzZcuvWyR9dkb7A6loWFu6h6p0ZAbrJfvci3c7EPz
	ps3LflHdaqIg+56Fj5BbuCgmDfeLIfFB61wrj6R6i6lXOfnRgV+eRJTfVE7PRV4xqbzxfrSc6hy
	xMxXTfTTqFWeMWj1WiJBsVe/KYqdKRcz+Rzzg/Mdory/aaiaD1YVr5+ZbZqir0FZs/xpNc4Sz1P
	KSiYG5AlmP6unLQpY+DHwLYyv6LlULFxE5EkNxixZ8xhFdQLq8Qg7VBaWGMjWDTvWFMfBgzyq2R
	uuM9ilwvqcp1165UyXes4OxVJbMLYK7ka/gSPfJgJ8fH3Geqb3Keew2lz/kb8gbPo6spWgaPyad
	t+GuRrt8f6XzrRkbQXTpMHtoNJK7KWmjWQHEVUKPlXBM0Rc+e1wsKEcEvneAZgpFPbB/Alo2HOO
	ID7+6k48+jh4NUW45WJOd3Q==
X-Received: by 2002:a05:690c:868a:20b0:8b0:d9c9:3fa9 with SMTP id
 00721157ae682-8b157ca7c8cmr10334307b3.3.1792739181853; Fri, 23 Oct 2026
 00:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261021135357.14928-1-marek.vasut@mailbox.org>
 <6f762fe7-ddf1-49bf-96bb-8e1d75f575c8@gmail.com> <d1168121-cced-4238-8dee-9c1b1169e484@mailbox.org>
 <5a50bdd9-6d29-4066-82f0-c13811810760@gmail.com> <0eba48ad-5c1f-4041-8f8b-c261f18d29d6@mailbox.org>
 <282c4aa2-503e-4d5a-bf52-2434667ccfc6@gmail.com>
In-Reply-To: <282c4aa2-503e-4d5a-bf52-2434667ccfc6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Oct 2026 00:05:55 -0700
X-Gm-Features: AclHuK_r2MhE29NAj18i7QPnTncBdGkTZ06Op18_LPuAeBeF88VPP0Wcvb6INdo
Message-ID: <CAMKF1soxtKk655kfj+2WNeEL9zOgAHcSYCkRqGF0b9UMmkrTjQ@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] overlayfs-tools: Inhibit tests on configure
To: uvv.mail@gmail.com
Cc: Marek Vasut <marek.vasut@mailbox.org>, openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Ankur Tyagi <ankur.tyagi85@gmail.com>, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000001c0045065e7c9ee8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 07:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131354

--0000000000001c0045065e7c9ee8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 11:24=E2=80=AFPM Vyacheslav Yurkov via
lists.openembedded.org <uvv.mail=3Dgmail.com@lists.openembedded.org> wrote:

> On 22.10.2026 17:13, Marek Vasut wrote:
> > Can you try this:
> >
> > "
> > # conf/local.conf
> > MACHINE ??=3D "qemux86-64"
> > USER_CLASSES ?=3D "buildstats"
> > PATCHRESOLVE =3D "noop"
> > BB_DISKMON_DIRS ??=3D "\
> >     STOPTASKS,${TMPDIR},1G,100K \
> >     STOPTASKS,${DL_DIR},1G,100K \
> >     STOPTASKS,${SSTATE_DIR},1G,100K \
> >     STOPTASKS,/tmp,100M,100K \
> >     HALT,${TMPDIR},100M,1K \
> >     HALT,${DL_DIR},100M,1K \
> >     HALT,${SSTATE_DIR},100M,1K \
> >     HALT,/tmp,10M,1K"
> >
> > CONF_VERSION =3D "2"
> > "
> >
> > "
> > # conf/bblayers.conf
> > LCONF_VERSION =3D "7"
> > BBPATH =3D "${TOPDIR}"
> > BBFILES ?=3D ""
> > BBLAYERS ?=3D " \
> >   /oe-core___wrynose-6.0/meta \
> >   /meta-openembedded___wrynose-6.0/meta-oe/ \
> >   /meta-openembedded___wrynose-6.0/meta-python/ \
> >   /meta-openembedded___wrynose-6.0/meta-networking/ \
> >   /meta-openembedded___wrynose-6.0/meta-filesystems/ \
> >   "
> > "
> >
> > $ . oe-init-build-env /path/to/builddir
> > $ MACHINE=3D"qemux86-64" DISTRO=3D"nodistro" bitbake -c configure
> > overlayfs-tools
> >
> > ?
> >
> > Also, please run 'which sudo' and check whether sudo isn't actually
> > installed on your build machine (it is NOT installed on mine, because
> > it is a minimal container)
>
> Thanks, I guess the container without a `sudo` is the reason (somehow I
> always had it in mines).
>
> If you are OK with this fix
> https://github.com/kmxz/overlayfs-tools/pull/34 , we can bump a revision
> after that.
>

This means no ptests ?


>
> Slava
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131324):
> https://lists.openembedded.org/g/openembedded-devel/message/131324
> Mute This Topic: https://lists.openembedded.org/mt/121866846/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001c0045065e7c9ee8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 22,=
 2026 at 11:24=E2=80=AFPM Vyacheslav Yurkov via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;uvv.mail=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 22.10.=
2026 17:13, Marek Vasut wrote:<br>
&gt; Can you try this:<br>
&gt;<br>
&gt; &quot;<br>
&gt; # conf/local.conf<br>
&gt; MACHINE ??=3D &quot;qemux86-64&quot;<br>
&gt; USER_CLASSES ?=3D &quot;buildstats&quot;<br>
&gt; PATCHRESOLVE =3D &quot;noop&quot;<br>
&gt; BB_DISKMON_DIRS ??=3D &quot;\<br>
&gt; =C2=A0=C2=A0=C2=A0 STOPTASKS,${TMPDIR},1G,100K \<br>
&gt; =C2=A0=C2=A0=C2=A0 STOPTASKS,${DL_DIR},1G,100K \<br>
&gt; =C2=A0=C2=A0=C2=A0 STOPTASKS,${SSTATE_DIR},1G,100K \<br>
&gt; =C2=A0=C2=A0=C2=A0 STOPTASKS,/tmp,100M,100K \<br>
&gt; =C2=A0=C2=A0=C2=A0 HALT,${TMPDIR},100M,1K \<br>
&gt; =C2=A0=C2=A0=C2=A0 HALT,${DL_DIR},100M,1K \<br>
&gt; =C2=A0=C2=A0=C2=A0 HALT,${SSTATE_DIR},100M,1K \<br>
&gt; =C2=A0=C2=A0=C2=A0 HALT,/tmp,10M,1K&quot;<br>
&gt;<br>
&gt; CONF_VERSION =3D &quot;2&quot;<br>
&gt; &quot;<br>
&gt;<br>
&gt; &quot;<br>
&gt; # conf/bblayers.conf<br>
&gt; LCONF_VERSION =3D &quot;7&quot;<br>
&gt; BBPATH =3D &quot;${TOPDIR}&quot;<br>
&gt; BBFILES ?=3D &quot;&quot;<br>
&gt; BBLAYERS ?=3D &quot; \<br>
&gt; =C2=A0 /oe-core___wrynose-6.0/meta \<br>
&gt; =C2=A0 /meta-openembedded___wrynose-6.0/meta-oe/ \<br>
&gt; =C2=A0 /meta-openembedded___wrynose-6.0/meta-python/ \<br>
&gt; =C2=A0 /meta-openembedded___wrynose-6.0/meta-networking/ \<br>
&gt; =C2=A0 /meta-openembedded___wrynose-6.0/meta-filesystems/ \<br>
&gt; =C2=A0 &quot;<br>
&gt; &quot;<br>
&gt;<br>
&gt; $ . oe-init-build-env /path/to/builddir<br>
&gt; $ MACHINE=3D&quot;qemux86-64&quot; DISTRO=3D&quot;nodistro&quot; bitba=
ke -c configure <br>
&gt; overlayfs-tools<br>
&gt;<br>
&gt; ?<br>
&gt;<br>
&gt; Also, please run &#39;which sudo&#39; and check whether sudo isn&#39;t=
 actually <br>
&gt; installed on your build machine (it is NOT installed on mine, because =
<br>
&gt; it is a minimal container)<br>
<br>
Thanks, I guess the container without a `sudo` is the reason (somehow I <br=
>
always had it in mines).<br>
<br>
If you are OK with this fix <br>
<a href=3D"https://github.com/kmxz/overlayfs-tools/pull/34" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/kmxz/overlayfs-tools/pull/34</a> ,=
 we can bump a revision <br>
after that.<br></blockquote><div><br></div><div>This means no ptests=C2=A0?=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Slava<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131324): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131324" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131324</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121866846/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121866846/1997914</a><br>
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

--0000000000001c0045065e7c9ee8--
