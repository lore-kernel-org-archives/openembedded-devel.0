Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BD9F436B1
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 14:37:15 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46619.1776436626717725231
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 07:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TLS54XEc;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79db5e18ac6so19436577b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 07:37:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776436626; cv=none;
        d=google.com; s=arc-20240605;
        b=WmVRCQ2G595x3B5zE8hnVRU+EqPWy7gopH9Q4dBc4wxyf4OA9O3beklwzPegBFRKTN
         TJN9cdaiXuU5KwS+UNJIHaiBI4QlbwOi2lHGkuxgvTEESg0xKYxc1Czkvns9d2NK3NMR
         fCUwu+9It2zlbbwA5W+nCxWNMiN2ztV12R1/YpQ+i6DiXD41E5FIFIfaoPpPotuWLr3E
         I/o3w9Wf1o+BrUX0CNYZ9LL3SwshiA7e1zAS9kOqOYqoZ7RkLKdi2yj3hI5tUS2B3wxT
         rbcvNH7BD68eHJgo9CVVFhFaDyyjlBO3WFXzTDnnL6CRD5qmInQf3Umx+YRE3ROPcup8
         F9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vnVT442loPG1Mkn0edLe02HhzwgxtU2uScucufSQIlg=;
        fh=n14rdnlwf61wKsegF5kuNfTFl+YA1KqdL2OuyR0Lw0U=;
        b=MLUXXBVyXoYoYSSy3Ktz3o4OPzSYHzUt7425TIk8V1GAp/p2/YwtbIOOpXNdQfYkNG
         TPp2NLoJ/rv7tQtKAZfYI30PIF2+fcL7ZxMAb0Oiy18KgFXs0HjRyQWZmd9T0LWzhTh+
         CWKoBUAww4+5XPR4UygBT/eifMQhRrTQDXTDE/EJUmUmP7OA9MyoEM7kE29tZIM0Vhig
         7YPfZ4ILFGFfjQpYeyR61jQek6coeI4uzjZnTKk+T5LlDT5eNjYYXM8O8McuIT3CGlQt
         JcIMhe1Yboq8yydnOePXC5HRJonlG5ElZXnAI+DCSHLNh2pd6Hadnf/zPw6BfsQ0Me//
         rw/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776436626; x=1777041426; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vnVT442loPG1Mkn0edLe02HhzwgxtU2uScucufSQIlg=;
        b=TLS54XEcQ+RkY05SybmNP8VfKRA1NCpiAnVQdbMsorzyMU6tlGb25rhDS6eqCgTI32
         jmKR/LC5q4JOhYnB7t1wpJug370LTBphqGFW6ETNgOxp4/YkCNUgUzrCqYE+X7m60MR/
         u6XMNzPzpdW8AdL8yr49aLsW6Khr7UIgzy8sibVzZ5AAF6JS2gGV2rluMvaifUEf/wGG
         agIqd1qOqjbdueXo/GmoH3lD8etMNNCR/F7+ueW1pjGq6iWJNVlhKiclo8WRjGr7OyT8
         DwBnW0s1R740aAX/2C81tHQXZTE7mzdGLl6DDmvUlvTg4yUfIEu65hKSdbdjKV9Moi7o
         Y0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776436626; x=1777041426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnVT442loPG1Mkn0edLe02HhzwgxtU2uScucufSQIlg=;
        b=q9T8l07wPhO28CZ+PmM2k198XNjhnz5OSS1cKP4xJblO9PDEvAEaAcpBYyFbNR73Pp
         ZJSlJMCFII05XVyJ6rEsl6teaW2e4579rz5zLEc2DJU5YNMb+1jUFQdPQRQgf4sci0kE
         qQWevhix5L1icU5YjMMgxifjiliX/M45MtqZLwIBx9pftGNf3HPqcEOyP69VQogNLXtl
         oItvaY1P78PF6cPXsaUkK6IKMOrAcrCNpXxMmWmCoW2PKAg45y7EhHcokzEbEPscyc1a
         MLU94UBnoymHR+p55d72vYQzCpRnW17OiT7qBTpI0Vcnf/z7TxIuku2K+MFh4pd7lUw2
         4/fA==
X-Forwarded-Encrypted: i=1; AFNElJ9VYFDupmFFSP6Mh/uH/vc0m6G6KgWkIhujTJY8BB42MXmg24aA6mI1mSG3fcc+G5jLHFe4+2djxFcORPuFsa9tbNk=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz0YzLAhTEMpIUH5Y7iPsuuc3siX+X364F9Fyh5amh3UOyuCrdu
	kKt/62+73bIyuwcfXPhqNvRUWDEuR30lJRXJJVJ+kxrXx/6MoHwIBKaJXncOrkZ7Q32jRFdEnmJ
	SHxhLkV0fDY0oFgTCvI9FDCqT/Ut0XFM=
X-Gm-Gg: AeBDiesUVEOjFXd9DA6eM4yh7VKHnMhWWfeYxX8jfi+Y86wlfFy10/uDVE9x1SwznVL
	cxsfppz6IizVK7EgCvYwqIO95rGAqeOOB8Ae0L6iNHstrrTdl8k+6tsENFVY/h8CLA+RvWcA/LD
	xUmhY0OCYPrtjxqst8qXtTAQtOArq2+UvJzSKh6jwtnWhWbp6aFSssncaBOc5co5ALW3F9FN+ng
	EYUvazwKJyH0TlTncTnjHBEp3WN6XZ+ztR4m3DIARhzlwknTIemHbw8GjVYY1Dzzsdrm7A7VP9v
	xHzCbGv/nAXYzvlHlWyuE838NaZmizaOIvlS5U7BYa5unjXRA/0WcVFLFBvIs9kqrzIkfVO/ld5
	WkNO5ANAiBndWW4gjkqLyZsM73KqHU0vlHM759khf4GbZdHId4U1yki1FMqikQj/W2dcPfNmI3R
	BkkmoH+Jcji8A4uNY=
X-Received: by 2002:a05:690e:4144:b0:650:1c53:f3e2 with SMTP id
 956f58d0204a3-653118d5977mr1975946d50.8.1776436625512; Fri, 17 Apr 2026
 07:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260416072305.1447652-1-viswanath.kraleti@oss.qualcomm.com> <qk5zmrapwlvjskkrgmom7xfbipq3u44krrxzi36yor7awtepna@xpsfalqldxuc>
In-Reply-To: <qk5zmrapwlvjskkrgmom7xfbipq3u44krrxzi36yor7awtepna@xpsfalqldxuc>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Apr 2026 07:36:38 -0700
X-Gm-Features: AQROBzAoobPXU95XSbEmR9YZ5BkQrxx9PHZjS5-lakzo8C8fvd-YAeQld49lHb8
Message-ID: <CAMKF1srtWZHJv0fie0FDsAVY5CKJeQv35JmrMbirMZWfwMyW1Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] android-tools-conf-configfs: replace fixed
 sleep with UDC wait loop
To: dmitry.baryshkov@oss.qualcomm.com
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>, 
	Devendra Tewari <devendra.tewari@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000079ad2064fa8e288"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 14:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126443

--000000000000079ad2064fa8e288
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 4:03=E2=80=AFAM Dmitry Baryshkov via lists.openembe=
dded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> On Thu, Apr 16, 2026 at 12:53:05PM +0530, Viswanath Kraleti wrote:
> > The android-gadget-start script previously relied on a fixed `sleep 10`
> > delay for configuring the USB gadget UDC. This approach can either dela=
y
> > boot unnecessarily or still race with UDC or configfs initialization on
> > slower systems.
> >
> > Replace the fixed sleep with a limited time polling loop that waits for
> > both configfs and a valid UDC before configuring the USB ADB gadget.
> >
> > This makes USB gadget initialization more deterministic across platform=
s
> > without relying on arbitrary delays.
> >
> > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> > ---
> >  .../android-gadget-start                      | 35 +++++++++++++++++--
> >  1 file changed, 32 insertions(+), 3 deletions(-)
>
> CC'ing Devendra, who changed it from 3 to 10 seconds.
>
> What was the issue? Was it UDC device not being registered or was it
> something else?
>
> >
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/andr=
oid-gadget-start
> b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/andr=
oid-gadget-start
> > index 76b5e29624..ecc9a0ff84 100644
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/andr=
oid-gadget-start
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/andr=
oid-gadget-start
> > @@ -2,8 +2,37 @@
> >
> >  set -e
> >
> > -sleep 10
> > +n=3D0
> > +while true; do
> > +    # Pick first available UDC as default. Set UDC_NAME in env to
> override.
> > +    udcname=3D"${UDC_NAME:-$(ls -1 /sys/class/udc 2>/dev/null | head -=
n
> 1)}"
> >
> > -ls /sys/class/udc/ | head -n 1 | xargs echo -n >
> /sys/kernel/config/usb_gadget/adb/UDC
> > +    if [ $n -eq 30 ]; then
> > +        echo "Timeout waiting for UDC configuration"
> > +        exit 1
> > +    fi
>
> The more I look at it, the more it seems that whole ADB support should
> be rewritten to use udev and generators to start adb only once the UDC
> gets registered in the system (and start it for every UDC that is
> present).
>

Yes its evident from patches, that a number is being sought that works for
some
usecases and it might regress another one, and a different board might need
another
magic number. Using some event driven setup is the best thing to do here.


>
> > +
> > +    if [ ! -e /sys/kernel/config/usb_gadget/adb/UDC ]; then
>
> Why do you need this?
>
> > +        echo "Waiting for configfs usb_gadget to be initialized...
> ($n/30)"
> > +        sleep 1
> > +        n=3D$((n + 1))
> > +        continue
> > +    fi
> > +    configfs_udc=3D"$(cat /sys/kernel/config/usb_gadget/adb/UDC
> 2>/dev/null || true)"
> > +
> > +    if [ -n "$udcname" ] && [ "$configfs_udc" =3D "$udcname" ]; then
> > +        echo "UDC $udcname successfully configured for USB ADB Gadget"
> > +        break
> > +    fi
> > +
> > +    if [ -z "$udcname" ]; then
> > +        echo "Waiting for UDC to appear... ($n/30)"
> > +    else
> > +        echo "Setting UDC $udcname for USB ADB Gadget usage"
> > +        printf '%s' "$udcname" > /sys/kernel/config/usb_gadget/adb/UDC
> > +    fi
> > +
> > +    sleep 1
> > +    n=3D$((n + 1))
> > +done
> >
> > -echo "Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB Gadget
> usage"
> >
>
> --
> With best wishes
> Dmitry
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126404):
> https://lists.openembedded.org/g/openembedded-devel/message/126404
> Mute This Topic: https://lists.openembedded.org/mt/118854722/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000079ad2064fa8e288
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 16,=
 2026 at 4:03=E2=80=AFAM Dmitry Baryshkov via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;dmitry.baryshkov=3D<a href=3D"m=
ailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.opene=
mbedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Apr 16, 2026 at 12:53:05PM +0530, Viswanath Kraleti wrot=
e:<br>
&gt; The android-gadget-start script previously relied on a fixed `sleep 10=
`<br>
&gt; delay for configuring the USB gadget UDC. This approach can either del=
ay<br>
&gt; boot unnecessarily or still race with UDC or configfs initialization o=
n<br>
&gt; slower systems.<br>
&gt; <br>
&gt; Replace the fixed sleep with a limited time polling loop that waits fo=
r<br>
&gt; both configfs and a valid UDC before configuring the USB ADB gadget.<b=
r>
&gt; <br>
&gt; This makes USB gadget initialization more deterministic across platfor=
ms<br>
&gt; without relying on arbitrary delays.<br>
&gt; <br>
&gt; Signed-off-by: Viswanath Kraleti &lt;<a href=3D"mailto:viswanath.krale=
ti@oss.qualcomm.com" target=3D"_blank">viswanath.kraleti@oss.qualcomm.com</=
a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../android-gadget-start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 35 +++++++++++++++++--<br>
&gt;=C2=A0 1 file changed, 32 insertions(+), 3 deletions(-)<br>
<br>
CC&#39;ing Devendra, who changed it from 3 to 10 seconds.<br>
<br>
What was the issue? Was it UDC device not being registered or was it<br>
something else?<br>
<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf=
-configfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/and=
roid-tools-conf-configfs/android-gadget-start<br>
&gt; index 76b5e29624..ecc9a0ff84 100644<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-config=
fs/android-gadget-start<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-config=
fs/android-gadget-start<br>
&gt; @@ -2,8 +2,37 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 set -e<br>
&gt;=C2=A0 <br>
&gt; -sleep 10<br>
&gt; +n=3D0<br>
&gt; +while true; do<br>
&gt; +=C2=A0 =C2=A0 # Pick first available UDC as default. Set UDC_NAME in =
env to override.<br>
&gt; +=C2=A0 =C2=A0 udcname=3D&quot;${UDC_NAME:-$(ls -1 /sys/class/udc 2&gt=
;/dev/null | head -n 1)}&quot;<br>
&gt;=C2=A0 <br>
&gt; -ls /sys/class/udc/ | head -n 1 | xargs echo -n &gt; /sys/kernel/confi=
g/usb_gadget/adb/UDC<br>
&gt; +=C2=A0 =C2=A0 if [ $n -eq 30 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Timeout waiting for UDC config=
uration&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt; +=C2=A0 =C2=A0 fi<br>
<br>
The more I look at it, the more it seems that whole ADB support should<br>
be rewritten to use udev and generators to start adb only once the UDC<br>
gets registered in the system (and start it for every UDC that is<br>
present).<br></blockquote><div><br></div><div>Yes its evident from patches,=
 that a number is being sought that works for some</div><div>usecases and i=
t might regress another one, and a different board might need another</div>=
<div>magic number. Using some event driven setup is the best thing to do he=
re.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if [ ! -e /sys/kernel/config/usb_gadget/adb/UDC ]; then=
<br>
<br>
Why do you need this?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Waiting for configfs usb_gadge=
t to be initialized... ($n/30)&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 n=3D$((n + 1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 configfs_udc=3D&quot;$(cat /sys/kernel/config/usb_gadge=
t/adb/UDC 2&gt;/dev/null || true)&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if [ -n &quot;$udcname&quot; ] &amp;&amp; [ &quot;$conf=
igfs_udc&quot; =3D &quot;$udcname&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;UDC $udcname successfully conf=
igured for USB ADB Gadget&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if [ -z &quot;$udcname&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Waiting for UDC to appear... (=
$n/30)&quot;<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Setting UDC $udcname for USB A=
DB Gadget usage&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf &#39;%s&#39; &quot;$udcname&quot; =
&gt; /sys/kernel/config/usb_gadget/adb/UDC<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sleep 1<br>
&gt; +=C2=A0 =C2=A0 n=3D$((n + 1))<br>
&gt; +done<br>
&gt;=C2=A0 <br>
&gt; -echo &quot;Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB =
Gadget usage&quot;<br>
&gt; <br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126404): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126404" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126404</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118854722/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118854722/1997914</a><br>
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

--000000000000079ad2064fa8e288--

