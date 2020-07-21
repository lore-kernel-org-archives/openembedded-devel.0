Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.11873.1595302417921483695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 20:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KDSOAvE8;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id el4so8697467qvb.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2020 20:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y3lQowpnNxVaiwNLHlmPhw4coz+/cs/iyNDzzBeZkJY=;
        b=KDSOAvE8mLdUplrl23pTsVhGoC4hyspknWjuwpPuILVOoC+u//Cmm0Qi6R69Spwj9b
         igMK83CC23U4O69xcFxCpHAuCy1ns3tfMfFobzUZgF4Pvlp3wrz7ngQQdhAG1ohfV1df
         rZphEUbNHmQU6zfB6wjkdBbF5Spen/Nzme8hajZQw3QgqsHH0V88iaZXBO9s5/DWOeHv
         RQ4Rkaqdgz1ui2ED+yDdwbVI3oNJeDDSaWvXEfc9VwGyiU2iql3qLJPDPRgP/ZqtLjCO
         hQDdrAibKnlvt5R7J4t3jP1Kmkx9U7PT1ejpuEAswbR5Q9e0YQ6UccCtsx2BqJTo1Eyj
         zgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y3lQowpnNxVaiwNLHlmPhw4coz+/cs/iyNDzzBeZkJY=;
        b=s+fzl4YgDbiJw6YlWoYBidoDrt4tpMeByo3czz/Gd1w6FQJCM5ZvEn8YBkESemam66
         o8yLFBkJLTt54wgEvu/3h3HUAPApFl+n3s3I0J4/wJePt0lZWXctiUS8F/tn6Ah7KJAy
         MhV8lCRvswBcmy2E7ZhfV3f4RNpWxfWq/UURt6XIm7Y5IfrNZgeffhT1MKwEva+9yHnK
         g8WCvht75/ZnxsTp9joNjnyhdZ7wrIb+EV9yjuXyIO8qmB9JhoKTnFfQ654YJeDlcZ5/
         BZUm73Tv6mpYwZIkL/GjERpbfPFMyq3ZQlHtGJz+LJK7EZjzz9gjaGAVKdQNNkbVJE3c
         KTvA==
X-Gm-Message-State: AOAM5309IMcOaFSngPemcNWPOzuYMbNiHEsSWTxLBGRG2fNIj3Y6rJzp
	c/Zmh5S1Kde/d0P2T22JxUtojyxbIc1Xbv8yf0k=
X-Google-Smtp-Source: ABdhPJwYQNMcq7Y4eRO7CEsgriFd/jMr0sp+eMvLogPDp91eLJ52yMsuZI27g0u9GjYTw4cTJzsKeqMSU0mWRkyfECo=
X-Received: by 2002:a0c:bd15:: with SMTP id m21mr25294528qvg.61.1595302416949;
 Mon, 20 Jul 2020 20:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200720221946.33011-1-jpitti@cisco.com> <CAMKF1squtZehqYZADc91pDLZjT6a+QYBRive=6jed7SM5THPNQ@mail.gmail.com>
 <ad4d0d2661b08a6c6a278d54a8bf5eb1af3fa3f7.camel@cisco.com>
In-Reply-To: <ad4d0d2661b08a6c6a278d54a8bf5eb1af3fa3f7.camel@cisco.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Jul 2020 20:33:26 -0700
Message-ID: <CAMKF1spKtU6Q-ejeMgVoUiGrPxmiFBEzTuVRSo=+G+dSjW0OWQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] netkit-telnetd: Fix buffer overflow in netoprintf
To: "Julius Hemanth Pitti (jpitti)" <jpitti@cisco.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Content-Type: multipart/alternative; boundary="000000000000df275205aaeb4958"

--000000000000df275205aaeb4958
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 20, 2020 at 6:14 PM Julius Hemanth Pitti (jpitti) <
jpitti@cisco.com> wrote:

> On Mon, 2020-07-20 at 15:48 -0700, Khem Raj wrote:
> > On Mon, Jul 20, 2020 at 3:27 PM Julius Hemanth Pitti <
> > jpitti@cisco.com> wrote:
> > >
> > > netoprintf() was not handling a case where
> > > return value of vsnprintf is greater than
> > > "size"(2nd argument), results in buffer overflow
> > > while adjusting "nfrontp" pointer to point
> > > beyond "netobuf" buffer.
> > >
> > > Here is one such case where "nfrontp"
> > > crossed boundaries of "netobuf", and
> > > pointing to another global variable.
> > >
> > > (gdb) p &netobuf[8255]
> > > $5 = 0x55c93afe8b1f <netobuf+8255> ""
> > > (gdb) p nfrontp
> > > $6 = 0x55c93afe8c20 <terminaltype> "\377"
> > > (gdb) p &terminaltype
> > > $7 = (char **) 0x55c93afe8c20 <terminaltype>
> > > (gdb)
> > >
> > > This resulted in crash of telnetd service
> > > with segmentation fault.
> > >
> >
> > it seems like one. Can you also reproduce it with something like
> > fedora ?
> >
>
> I looked at latest centos and ubuntu, their refactored code do not have
> this bug.


I would prefer to share the refactored code which avoids this problem

>
>
> > > Signed-off-by: Julius Hemanth Pitti <jpitti@cisco.com>
> > > ---
> > >  ....c-Fix-buffer-overflow-in-netoprintf.patch | 56
> > > +++++++++++++++++++
> > >  .../netkit-telnet/netkit-telnet_0.17.bb       |  1 +
> > >  2 files changed, 57 insertions(+)
> > >  create mode 100644 meta-networking/recipes-netkit/netkit-
> > > telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-
> > > netoprintf.patch
> > >
> > > diff --git a/meta-networking/recipes-netkit/netkit-
> > > telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-
> > > netoprintf.patch b/meta-networking/recipes-netkit/netkit-
> > > telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-
> > > netoprintf.patch
> > > new file mode 100644
> > > index 000000000..8f983e40a
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-netkit/netkit-telnet/files/0001-
> > > telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch
> > > @@ -0,0 +1,56 @@
> > > +From 9c81c8e5bc7782e8ae12c078615abc3c896059f2 Mon Sep 17 00:00:00
> > > 2001
> > > +From: Julius Hemanth Pitti <jpitti@cisco.com>
> > > +Date: Tue, 14 Jul 2020 22:34:19 -0700
> > > +Subject: [PATCH] telnetd/utility.c: Fix buffer overflow in
> > > netoprintf
> > > +
> > > +As per man page of vsnprintf, when formated
> > > +string size is greater than "size"(2nd argument),
> > > +then vsnprintf returns size of formated string,
> > > +not "size"(2nd argument).
> > > +
> > > +netoprintf() was not handling a case where
> > > +return value of vsnprintf is greater than
> > > +"size"(2nd argument), results in buffer overflow
> > > +while adjusting "nfrontp" pointer to point
> > > +beyond "netobuf" buffer.
> > > +
> > > +Here is one such case where "nfrontp"
> > > +crossed boundaries of "netobuf", and
> > > +pointing to another global variable.
> > > +
> > > +(gdb) p &netobuf[8255]
> > > +$5 = 0x55c93afe8b1f <netobuf+8255> ""
> > > +(gdb) p nfrontp
> > > +$6 = 0x55c93afe8c20 <terminaltype> "\377"
> > > +(gdb) p &terminaltype
> > > +$7 = (char **) 0x55c93afe8c20 <terminaltype>
> > > +(gdb)
> > > +
> > > +This resulted in crash of telnetd service
> > > +with segmentation fault.
> > > +
> > > +Though this is DoS security bug, I couldn't
> > > +find any CVE ID for this.
> > > +
> > > +Upstream-Status: Pending
> > > +
> > > +Signed-off-by: Julius Hemanth Pitti <jpitti@cisco.com>
> > > +---
> > > + telnetd/utility.c | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/telnetd/utility.c b/telnetd/utility.c
> > > +index b9a46a6..4811f14 100644
> > > +--- a/telnetd/utility.c
> > > ++++ b/telnetd/utility.c
> > > +@@ -66,7 +66,7 @@ netoprintf(const char *fmt, ...)
> > > +       len = vsnprintf(nfrontp, maxsize, fmt, ap);
> > > +       va_end(ap);
> > > +
> > > +-      if (len<0 || len==maxsize) {
> > > ++      if (len<0 || len>=maxsize) {
> > > +        /* didn't fit */
> > > +        netflush();
> > > +       }
> > > +--
> > > +2.19.1
> > > diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-
> > > telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-
> > > telnet/netkit-telnet_0.17.bb
> > > index 0e92add63..08dd532b6 100644
> > > --- a/meta-networking/recipes-netkit/netkit-telnet/netkit-
> > > telnet_0.17.bb
> > > +++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-
> > > telnet_0.17.bb
> > > @@ -13,6 +13,7 @@ SRC_URI = "
> > > http://ftp.linux.org.uk/pub/linux/Networking/netkit/${BP}.tar.gz \
> > >             file://0001-telnet-telnetd-Fix-print-format-
> > > strings.patch \
> > >             file://0001-telnet-telnetd-Fix-deadlock-on-
> > > cleanup.patch \
> > >             file://CVE-2020-10188.patch \
> > > +           file://0001-telnetd-utility.c-Fix-buffer-overflow-in-
> > > netoprintf.patch \
> > >             "
> > >
> > >  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/"
> > > --
> > > 2.19.1
> > >
>

--000000000000df275205aaeb4958
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 20, 2020 at 6:14 PM Julius Hemanth Pitti (jpitt=
i) &lt;<a href=3D"mailto:jpitti@cisco.com">jpitti@cisco.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Mon, 2020-07-20 at 15:48 -0700, =
Khem Raj wrote:<br>
&gt; On Mon, Jul 20, 2020 at 3:27 PM Julius Hemanth Pitti &lt;<br>
&gt; <a href=3D"mailto:jpitti@cisco.com" target=3D"_blank">jpitti@cisco.com=
</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; netoprintf() was not handling a case where<br>
&gt; &gt; return value of vsnprintf is greater than<br>
&gt; &gt; &quot;size&quot;(2nd argument), results in buffer overflow<br>
&gt; &gt; while adjusting &quot;nfrontp&quot; pointer to point<br>
&gt; &gt; beyond &quot;netobuf&quot; buffer.<br>
&gt; &gt; <br>
&gt; &gt; Here is one such case where &quot;nfrontp&quot;<br>
&gt; &gt; crossed boundaries of &quot;netobuf&quot;, and<br>
&gt; &gt; pointing to another global variable.<br>
&gt; &gt; <br>
&gt; &gt; (gdb) p &amp;netobuf[8255]<br>
&gt; &gt; $5 =3D 0x55c93afe8b1f &lt;netobuf+8255&gt; &quot;&quot;<br>
&gt; &gt; (gdb) p nfrontp<br>
&gt; &gt; $6 =3D 0x55c93afe8c20 &lt;terminaltype&gt; &quot;\377&quot;<br>
&gt; &gt; (gdb) p &amp;terminaltype<br>
&gt; &gt; $7 =3D (char **) 0x55c93afe8c20 &lt;terminaltype&gt;<br>
&gt; &gt; (gdb)<br>
&gt; &gt; <br>
&gt; &gt; This resulted in crash of telnetd service<br>
&gt; &gt; with segmentation fault.<br>
&gt; &gt; <br>
&gt; <br>
&gt; it seems like one. Can you also reproduce it with something like<br>
&gt; fedora ?<br>
&gt; <br>
<br>
I looked at latest centos and ubuntu, their refactored code do not have<br>
this bug.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I would=
 prefer to share the refactored code which avoids this problem=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
<br>
&gt; &gt; Signed-off-by: Julius Hemanth Pitti &lt;<a href=3D"mailto:jpitti@=
cisco.com" target=3D"_blank">jpitti@cisco.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ....c-Fix-buffer-overflow-in-netoprintf.patch | 56<br>
&gt; &gt; +++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../netkit-telnet/<a href=3D"http://netkit-telnet_0.17.bb" =
rel=3D"noreferrer" target=3D"_blank">netkit-telnet_0.17.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 2 files changed, 57 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta-networking/recipes-netkit/netkit-<b=
r>
&gt; &gt; telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-<br>
&gt; &gt; netoprintf.patch<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-networking/recipes-netkit/netkit-<br>
&gt; &gt; telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-<br>
&gt; &gt; netoprintf.patch b/meta-networking/recipes-netkit/netkit-<br>
&gt; &gt; telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-<br>
&gt; &gt; netoprintf.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000..8f983e40a<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-networking/recipes-netkit/netkit-telnet/files/0001-<br=
>
&gt; &gt; telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch<br>
&gt; &gt; @@ -0,0 +1,56 @@<br>
&gt; &gt; +From 9c81c8e5bc7782e8ae12c078615abc3c896059f2 Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; +From: Julius Hemanth Pitti &lt;<a href=3D"mailto:jpitti@cisco.co=
m" target=3D"_blank">jpitti@cisco.com</a>&gt;<br>
&gt; &gt; +Date: Tue, 14 Jul 2020 22:34:19 -0700<br>
&gt; &gt; +Subject: [PATCH] telnetd/utility.c: Fix buffer overflow in<br>
&gt; &gt; netoprintf<br>
&gt; &gt; +<br>
&gt; &gt; +As per man page of vsnprintf, when formated<br>
&gt; &gt; +string size is greater than &quot;size&quot;(2nd argument),<br>
&gt; &gt; +then vsnprintf returns size of formated string,<br>
&gt; &gt; +not &quot;size&quot;(2nd argument).<br>
&gt; &gt; +<br>
&gt; &gt; +netoprintf() was not handling a case where<br>
&gt; &gt; +return value of vsnprintf is greater than<br>
&gt; &gt; +&quot;size&quot;(2nd argument), results in buffer overflow<br>
&gt; &gt; +while adjusting &quot;nfrontp&quot; pointer to point<br>
&gt; &gt; +beyond &quot;netobuf&quot; buffer.<br>
&gt; &gt; +<br>
&gt; &gt; +Here is one such case where &quot;nfrontp&quot;<br>
&gt; &gt; +crossed boundaries of &quot;netobuf&quot;, and<br>
&gt; &gt; +pointing to another global variable.<br>
&gt; &gt; +<br>
&gt; &gt; +(gdb) p &amp;netobuf[8255]<br>
&gt; &gt; +$5 =3D 0x55c93afe8b1f &lt;netobuf+8255&gt; &quot;&quot;<br>
&gt; &gt; +(gdb) p nfrontp<br>
&gt; &gt; +$6 =3D 0x55c93afe8c20 &lt;terminaltype&gt; &quot;\377&quot;<br>
&gt; &gt; +(gdb) p &amp;terminaltype<br>
&gt; &gt; +$7 =3D (char **) 0x55c93afe8c20 &lt;terminaltype&gt;<br>
&gt; &gt; +(gdb)<br>
&gt; &gt; +<br>
&gt; &gt; +This resulted in crash of telnetd service<br>
&gt; &gt; +with segmentation fault.<br>
&gt; &gt; +<br>
&gt; &gt; +Though this is DoS security bug, I couldn&#39;t<br>
&gt; &gt; +find any CVE ID for this.<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Pending<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Julius Hemanth Pitti &lt;<a href=3D"mailto:jpitti=
@cisco.com" target=3D"_blank">jpitti@cisco.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + telnetd/utility.c | 2 +-<br>
&gt; &gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/telnetd/utility.c b/telnetd/utility.c<br>
&gt; &gt; +index b9a46a6..4811f14 100644<br>
&gt; &gt; +--- a/telnetd/utility.c<br>
&gt; &gt; ++++ b/telnetd/utility.c<br>
&gt; &gt; +@@ -66,7 +66,7 @@ netoprintf(const char *fmt, ...)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D vsnprintf(nfrontp, maxsize, f=
mt, ap);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(ap);<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 if (len&lt;0 || len=3D=3Dmaxsize) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (len&lt;0 || len&gt;=3Dmaxsize) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* didn&#39;t fit */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 netflush();<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +--<br>
&gt; &gt; +2.19.1<br>
&gt; &gt; diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-=
<br>
&gt; &gt; <a href=3D"http://telnet_0.17.bb" rel=3D"noreferrer" target=3D"_b=
lank">telnet_0.17.bb</a> b/meta-networking/recipes-netkit/netkit-<br>
&gt; &gt; telnet/<a href=3D"http://netkit-telnet_0.17.bb" rel=3D"noreferrer=
" target=3D"_blank">netkit-telnet_0.17.bb</a><br>
&gt; &gt; index 0e92add63..08dd532b6 100644<br>
&gt; &gt; --- a/meta-networking/recipes-netkit/netkit-telnet/netkit-<br>
&gt; &gt; <a href=3D"http://telnet_0.17.bb" rel=3D"noreferrer" target=3D"_b=
lank">telnet_0.17.bb</a><br>
&gt; &gt; +++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-<br>
&gt; &gt; <a href=3D"http://telnet_0.17.bb" rel=3D"noreferrer" target=3D"_b=
lank">telnet_0.17.bb</a><br>
&gt; &gt; @@ -13,6 +13,7 @@ SRC_URI =3D &quot;<br>
&gt; &gt; <a href=3D"http://ftp.linux.org.uk/pub/linux/Networking/netkit/$%=
7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://ftp.linux.org.u=
k/pub/linux/Networking/netkit/${BP}.tar.gz</a> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-telnet=
-telnetd-Fix-print-format-<br>
&gt; &gt; strings.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-telnet=
-telnetd-Fix-deadlock-on-<br>
&gt; &gt; cleanup.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-10=
188.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-telnetd-uti=
lity.c-Fix-buffer-overflow-in-<br>
&gt; &gt; netoprintf.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;${DEBIAN_MIRROR}/main/n/netkit=
-telnet/&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.19.1<br>
&gt; &gt; <br>
</blockquote></div></div>

--000000000000df275205aaeb4958--
