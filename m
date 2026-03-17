Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F79FF6E6D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:25 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86397.1773779363729737287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m4tl2hi7;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ad8435f46so6753002d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773779363; cv=none;
        d=google.com; s=arc-20240605;
        b=gtH1j+auKCT8W4hVY+6vx6xgxzJ0FuZFOyDcU5d21JPtSCBOFTI0TgvqbEgGmH4Kah
         +1dFkHDzqwAEU/wBQoqxCX/uwU5LkTEwEh37hd4fjVxmqawE1b8Biw8/KBFScQMgXcjp
         x2WW9Pz+pxfl3r66xsDBL/9GiBr9WfoGghX+FD2GwebUmenQKRXQgK1lXS1SwGCms42R
         kS7YNkEd7gVQioAr/RByqo/Hsro6SiIBk8UEyb5y+JlUE9ZcTwbd3Z84Df9ASLGAWYGt
         9KqG2K4uclQizhDZvkImjiqwXmjuXk5W2C6t5by1zluTn4RuiNUpluQwkCrsEPr7qcUN
         xcWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P+rjANcWwMkjlAEHrpiLvIyQXHfSv2L/dQ2xjrYQGIs=;
        fh=MWpPOHkCXe0pFwtyVtShChIDmquBPWcpv+alA0IHIdg=;
        b=e8fhCQHT2jE2m0W8qc+5iUUj+cf2No9P8BDOx2r1ByTqZx5CA2MAWGh3ZOShY89+4L
         MotvRtwVl4RB/bA1GTEjNuAi01hG1oOQr7cTggRsSAPW3BEqTBbWMH8EFdZH5DLxAOPS
         0yqf7X9+Mg4mgrWUk7EaWLCeljjUpcycGG3zog2TtM+/RU2+TDFTh8wQipWbJRjPOVHD
         Wxti8waiUAe6bQkIlg+VigzpXrgwRPzOXPw2Ztof6JPHgXNrtUbnlY/i6A1CIeg+OL1G
         N7wpGQeHYxLZ+5vYvL0KjAzCFkOfD018m7Jy4o1pKjQYfpEkm45Y2cuix+R3fU9Zw1Cs
         Gljw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779363; x=1774384163; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P+rjANcWwMkjlAEHrpiLvIyQXHfSv2L/dQ2xjrYQGIs=;
        b=m4tl2hi7yuAwPSe6vNB/sbRzVjPpQfqnDwgP38HkgIuEARPTXzRU5L/jTcRYz1jmC9
         rnZpvq/WK4dkBu4z3e7OnVAkxGMBfK3ZHdcjAGqD2O7olFXcjhzzzIEI7lqmTEshoP+P
         Cg0Nl0TnT60UEEMZ0z29sBCS4rMRrYidgvXkBCRHr0RqppJlepuCdeLMXcx2San5fE1w
         l6sp0jKTk25OoSLfX4NeLrzP7WvICBiAz8B5hlubXJ1lYWW3+giS1GEcrlmizaj5Ye5J
         YTMDKYE9XL1IUbZfHsSWmxEbnzgenMMHeAu0f42/GgJKuswCaT//xGTaLca+XJmGGvKy
         P4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779363; x=1774384163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+rjANcWwMkjlAEHrpiLvIyQXHfSv2L/dQ2xjrYQGIs=;
        b=HahLuKlHF+hYBXX6/FdfGIC32BWEY1XQBq2scXurOfYbCJ5yKSvY7RAOpouxMZuztF
         LtVCVgmxYq/mm5L3YDXO8p1+wZIszHHBJtoIN86DSc3w6nxCczOaD5tLA2Ra0HhP4XmT
         +FWsgAFjib5hViFgb1yo9+gwlQAPRmzk9KD7KMK1sv3/avXHmO6aQSd2+MfS4I8QZyyl
         tPx/sZEYa3QWBjk9Et0UyXOu5emz93HP6F1wBL3CYIJWXs7vOgCTfpHE73zsd/jn2kbM
         CQU7Pkk7MtGpdQqYclpHWQlrXsl5rIdo3k+quI4zZv7RcUGE/sqM1UzHY0UpkOjYuN8N
         JXCg==
X-Forwarded-Encrypted: i=1; AJvYcCX2fib5SGXwcJe86b0oG4ZUXVYZLFGD54ckiH4YRaMfbwzC0scgnotuL2XtLxLG3jzuvByd6cl0yvJEMPAOxdfuxkg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzFOoPZzp+Ug9IwWByN6O38KObSwi/jJ2F4HIjcfrQfD5s7d7y8
	EvPDbdLXe9/8OO0nXoqcPhyWc5UoPEM1imkLqx3TCJi1gxWeuM+sUdwO46WoOwV5k83AhL9VPIO
	TrdGHLjcXx4Y1CfrMPwwia+YvXkz9ibk=
X-Gm-Gg: ATEYQzyS1TxsSg4C7+eGQjHlbzFE48YdqVHLexKGbnxtKN7PpsOtt0Mc//vvrA/27SF
	lIMD8zyhXxRhFBu1A3n8GHN4hna7f1+8xDIYBgHObwEu8tHUt03qnvS/1styyTv8MONE6N8fd+x
	wulXeFaWlxfRTdEMZNxG6NGenhObA14cBURPdmNoq827/EwqxLv53tcge5Yui4phzUNn+RuB762
	opMQiKkrIVnAYiaQ8QHOIcF5mXU3kc4zh1QNf0JsmQdSL9Gv7M4Hn+b/3ICDbszPtp0Xv4JlwE4
	XqWL63UkuYnqt/VZoIxp/lq1jnZ4I1HseDUWCHQv29g7t9/2wHsddnHFzYL5AyRQ2mnwVcJQ7oi
	DaKsSn574bv5EcBW5TeVGoKOi
X-Received: by 2002:a53:bbd0:0:b0:64a:db82:a0bf with SMTP id
 956f58d0204a3-64e912f2812mr1111992d50.5.1773779362536; Tue, 17 Mar 2026
 13:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260305201754.151603-1-skandigraun@gmail.com>
 <20260305201754.151603-3-skandigraun@gmail.com> <V542CT.KE4IFLMSTCWD2@t-online.de>
 <4ba11fc4-05a8-4a78-8b82-2a1e4aad59c7@gmail.com>
In-Reply-To: <4ba11fc4-05a8-4a78-8b82-2a1e4aad59c7@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Mar 2026 13:28:55 -0700
X-Gm-Features: AaiRm50w0RIQDkb7-1yTeWzAeOXiK9Yc4jeDrEJjnnBVhnhLtp8i9_iTbL-Vht8
Message-ID: <CAMKF1sq3vYuiL3=HO7O6hotNkAdKSdjL-cv021=F3QXJu3qUKQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 3/3] samba: upgrade 4.19.9 -> 4.23.5
To: skandigraun@gmail.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d0623b064d3e309b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125334

--000000000000d0623b064d3e309b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:53=E2=80=AFAM Gyorgy Sarvari via lists.openembed=
ded.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> On 3/17/26 19:46, Markus Volk wrote:
> > On Thu, Mar 5 2026 at 21:17:51 +01:00:00, Gyorgy Sarvari via
> > lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> wrote:
> >> SAMBA4_IDMAP_MODULES
> >
> > I see an error with this update:
> > ERROR: samba-4.23.6-r0 do_compile: Execution of '/home/flk/bitbake-
> > builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/temp/
> > run.do_compile.1254855' failed with exit code 1
> > ERROR: Logfile of failure stored in: /home/flk/bitbake-builds/poky/
> >
> build/tmp/work/corei7-64-oe-linux/samba/4.23.6/temp/log.do_compile.125485=
5
> > Log data follows:
> > | DEBUG: Executing shell function do_compile
> > | Waf: Entering directory `/home/flk/bitbake-builds/poky/build/tmp/work=
/
> > corei7-64-oe-linux/samba/4.23.6/sources/samba-4.23.6/bin/default'
> > | Selected system MIT krb5 libraries, Heimdal use is disabled
> > | Checking project rules ...
> > | Project rules pass
> > | [3427/3555] Processing manpages/smb.conf.5: docs-xml/manpages/
> > smb.conf.5.xml bin/default/docs-xml/smbdotconf/parameters.all.xml bin/
> > default/docs-xml/build/DTD/samba.build.pathconfig docs-xml/build/DTD/
> > samba.entities bin/default/docs-xml/build/DTD/samba.build.version ->
> > bin/default/docs-xml/manpages/smb.conf.5
> > | runtime error: file file:///home/flk/bitbake-builds/poky/build/tmp/
> > work/corei7-64-oe-linux/samba/4.23.6/recipe-sysroot-native/usr/share/
> > xml/docbook/xsl-stylesheets-1.79.1/lib/lib.xsl <file:///home/flk/
> > bitbake-builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/
> > recipe-sysroot-native/usr/share/xml/docbook/xsl-stylesheets-1.79.1/lib/
> > lib.xsl> line 58 element choose
> > | xsltApplySequenceConstructor: A potential infinite template recursion
> > was detected.
> > | You can adjust xsltMaxDepth (--maxdepth) in order to raise the maximu=
m
> > number of nested template calls and variables/params (currently set to
> > 3000).
>
>
> :)
> Interesting, because I have seen this too, but then it suddenly
> disappeared, though I spent like an hour on it trying to get back,
> because I found a patch to fix this...
>
> Anyway, will take a look at it - thank you for testing it.
>

I will hold off this one for now then.


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125332):
> https://lists.openembedded.org/g/openembedded-devel/message/125332
> Mute This Topic: https://lists.openembedded.org/mt/118158979/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d0623b064d3e309b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17,=
 2026 at 11:53=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 3/17/2=
6 19:46, Markus Volk wrote:<br>
&gt; On Thu, Mar 5 2026 at 21:17:51 +01:00:00, Gyorgy Sarvari via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br>
&gt;&gt; SAMBA4_IDMAP_MODULES<br>
&gt; <br>
&gt; I see an error with this update:<br>
&gt; ERROR: samba-4.23.6-r0 do_compile: Execution of &#39;/home/flk/bitbake=
-<br>
&gt; builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/temp/<br>
&gt; run.do_compile.1254855&#39; failed with exit code 1<br>
&gt; ERROR: Logfile of failure stored in: /home/flk/bitbake-builds/poky/<br=
>
&gt; build/tmp/work/corei7-64-oe-linux/samba/4.23.6/temp/log.do_compile.125=
4855<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing shell function do_compile<br>
&gt; | Waf: Entering directory `/home/flk/bitbake-builds/poky/build/tmp/wor=
k/<br>
&gt; corei7-64-oe-linux/samba/4.23.6/sources/samba-4.23.6/bin/default&#39;<=
br>
&gt; | Selected system MIT krb5 libraries, Heimdal use is disabled<br>
&gt; | Checking project rules ...<br>
&gt; | Project rules pass<br>
&gt; | [3427/3555] Processing manpages/smb.conf.5: docs-xml/manpages/<br>
&gt; smb.conf.5.xml bin/default/docs-xml/smbdotconf/parameters.all.xml bin/=
<br>
&gt; default/docs-xml/build/DTD/samba.build.pathconfig docs-xml/build/DTD/<=
br>
&gt; samba.entities bin/default/docs-xml/build/DTD/samba.build.version -&gt=
;<br>
&gt; bin/default/docs-xml/manpages/smb.conf.5<br>
&gt; | runtime error: file file:///home/flk/bitbake-builds/poky/build/tmp/<=
br>
&gt; work/corei7-64-oe-linux/samba/4.23.6/recipe-sysroot-native/usr/share/<=
br>
&gt; xml/docbook/xsl-stylesheets-1.79.1/lib/lib.xsl &lt;file:///home/flk/<b=
r>
&gt; bitbake-builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/<br=
>
&gt; recipe-sysroot-native/usr/share/xml/docbook/xsl-stylesheets-1.79.1/lib=
/<br>
&gt; lib.xsl&gt; line 58 element choose<br>
&gt; | xsltApplySequenceConstructor: A potential infinite template recursio=
n<br>
&gt; was detected.<br>
&gt; | You can adjust xsltMaxDepth (--maxdepth) in order to raise the maxim=
um<br>
&gt; number of nested template calls and variables/params (currently set to=
<br>
&gt; 3000).<br>
<br>
<br>
:)<br>
Interesting, because I have seen this too, but then it suddenly<br>
disappeared, though I spent like an hour on it trying to get back,<br>
because I found a patch to fix this...<br>
<br>
Anyway, will take a look at it - thank you for testing it.<br></blockquote>=
<div><br></div><div>I will hold off this one for now then.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125332): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125332" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125332</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118158979/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118158979/1997914</a><br>
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

--000000000000d0623b064d3e309b--

