Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FF8C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 10:02:43 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.3766.1657188157372698147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 03:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b8YSmRdV;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id r9so21571974ljp.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 03:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=th0iG3sgd+YN/9EjLQqI5aH9CJa7Xy2G9f0K7KGqwgY=;
        b=b8YSmRdV39D9WlLXFqG6C8KFGnDf3AGMLkInCGrBMligAF+6PPymtMtol1N5XGzQiH
         GY0aSzl1xinyom4VUHOe5hhm25px9ixIGaWNYQ9WjG03+Tc0V1xlyqzIdCau4IMy/crk
         3fRdzF+LZZ88q4DxzfdwlUvhmdrtQ3e68afpL+qV237MKJJfbOpRJXIfN66KOhWVEeMV
         nRPZ/boiqNJ1/M4T8qgViunDQwYJF/spv3BmAP0N6wJgKN5h63VFu3Aa8+9xrxZ54PIw
         hFqujvNNZLL0WCHrWBPdwdbv1qqW8LmcdIqWBuz0XDuPV1RED74J1Yenb4cQo8Uif1r8
         wquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=th0iG3sgd+YN/9EjLQqI5aH9CJa7Xy2G9f0K7KGqwgY=;
        b=49ulfi2/qTtfLn98N5FqvDhdttirVNBC1wWfYhkESZgNFToL+1hqUPctW0XN6HKB2P
         jzV5i1dLi77FiB0jumGCjUDSkauxl0zIynOB/Umie2hOnAOQ8dUZ/LDI7uh7YsPXEHU4
         F7lHvUHAwdyjX6vngodJrEZ/tUX1McO3ITwWBK4UMRwqyYJTbflTGlo6qEGB9yYBveLh
         uI7wPGVt6qLw0iJtwZMsQin8Sy/t83r9wpDa6q3ynQtQ4ZybXMreK27j8vZxQjb3ozIY
         Puo1dVOr87h5smlfz2xCrWaBy6KWDvSKFNxzEKwlzqWgQCWJOu5IgHGnmJTVtrrGqkil
         Bb1w==
X-Gm-Message-State: AJIora8644g1QM59ZuTP/Qy+ODvQyCWFz8hDx8jWYrHE7bWWlZIh8Gt6
	1F37xcXUPgukdt7G7hda/cztRnL+SPVJj7rHvrY=
X-Google-Smtp-Source: 
 AGRyM1sEv6xfkamPPAC2LvEW9bT7pyZhHZoLb8r5zVycmp+/WhOcrQzYQrLgTdgaT1I8qtRSQEiTyrVuRPX3K35vJxw=
X-Received: by 2002:a2e:9592:0:b0:25a:6df5:5534 with SMTP id
 w18-20020a2e9592000000b0025a6df55534mr27171211ljh.117.1657188155336; Thu, 07
 Jul 2022 03:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220707082615.2499743-1-adrian.freihofer@siemens.com>
In-Reply-To: <20220707082615.2499743-1-adrian.freihofer@siemens.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 7 Jul 2022 11:02:16 +0100
Message-ID: 
 <CANPvuRmjgZ8X+M9OS41JwsdTEH7-s4wMH8SoCYG2_7DBMViUXw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][master][PATCH] firewalld: upgrade 1.1.1 ->
 1.2.0
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000532c0e05e3342f65"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 10:02:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97776

--000000000000532c0e05e3342f65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

Adrian Freihofer <adrian.freihofer@gmail.com> escreveu no dia quinta,
7/07/2022 =C3=A0(s) 09:26:

> Firewalld:
> This is a feature release. It also includes all bug fixes since v1.1.0.
> Details are here: https://firewalld.org/2022/07/firewalld-1-2-0-release
>
> Recipe:
> Firewalld defaults to create a log file for debug messages. This is
> basically an empty file until firewalld's log level is configured to
> debug level. Writing log files requies something like log-rotate to
> prevent full disks. The default for OE is to not create files and send
> all log messages to syslog (journald).
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  .../{firewalld_1.1.1.bb =3D> firewalld_1.2.0.bb}  | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>  rename
> meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld=
/{
> firewalld_1.1.1.bb =3D> firewalld_1.2.0.bb} (93%)
>
> diff --git
> a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewal=
ld/
> firewalld_1.1.1.bb
> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewal=
ld/
> firewalld_1.2.0.bb
> similarity index 93%
> rename from
> meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld=
/
> firewalld_1.1.1.bb
> rename to
> meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld=
/
> firewalld_1.2.0.bb
> index 00e851f45..58ed2d5bd 100644
> ---
> a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewal=
ld/
> firewalld_1.1.1.bb
> +++
> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewal=
ld/
> firewalld_1.2.0.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "\
>      file://firewalld.init \
>      file://run-ptest \
>  "
> -SRC_URI[sha256sum] =3D
> "1dcd314ff836b2ce69f15f60fc7d50bd77ed359d784f9b3c07f2d394ea570e4c"
> +SRC_URI[sha256sum] =3D
> "28fd90e88bda0dfd460f370f353474811b2e295d7eb27f0d7d18ffa3d786eeb7"
>
>  # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from
> gsettings.m4
>  DEPENDS =3D "intltool-native glib-2.0-native nftables"
> @@ -23,6 +23,9 @@ PACKAGECONFIG[docs] =3D
> "--with-xml-catalog=3D${STAGING_ETCDIR_NATIVE}/xml/catalog,-
>  PACKAGECONFIG[ipset] =3D
> "--with-ipset=3D${sbindir}/ipset,--without-ipset,,ipset"
>  PACKAGECONFIG[ebtables] =3D "--with-ebtables=3D${base_sbindir}/ebtables
> --with-ebtables-restore=3D${sbindir}/ebtables-legacy-restore,--without-eb=
tables
> --without-ebtables-restore,,ebtables"
>
> +# Default logging configuration: mixed syslog file console
> +FIREWALLD_DEFAULT_LOG_TARGET ??=3D "syslog"
> +
>  # The UIs are not yet tested and the dependencies are probably not quite
> correct yet.
>  # Splitting into separate packages is beneficial so that no dead code is
> transferred
>  # to the target device.
> @@ -31,7 +34,7 @@ PACKAGECONFIG[ebtables] =3D
> "--with-ebtables=3D${base_sbindir}/ebtables --with-ebtab
>  PACKAGECONFIG[qt5] =3D ""
>  PACKAGECONFIG[gtk] =3D ""
>
> -PACKAGES =3D+ "python3-firewall ${PN}-applet ${PN}-config ${PN}-offline-=
cmd
> ${PN}-zsh-completion"
> +PACKAGES =3D+ "python3-firewall ${PN}-applet ${PN}-config ${PN}-offline-=
cmd
> ${PN}-zsh-completion ${PN}-log-rotate"
>
>  # iptables, ip6tables, ebtables, and ipset *should* be unnecessary
>  # when the nftables backend is available, because nftables supersedes al=
l
> of them.
> @@ -132,6 +135,10 @@ FIREWALLD_KERNEL_MODULES ?=3D "\
>      sch_fq_codel \
>  "
>
> +do_configure:prepend() {
> +    export DEFAULT_LOG_TARGET=3D${FIREWALLD_DEFAULT_LOG_TARGET}
> +}
> +
>  do_install:append() {
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false',
> 'true', d)}; then
>          # firewalld ships an init script but it contains Red Hat-isms,
> replace it with our own
> @@ -237,6 +244,9 @@ FILES:${PN}-offline-cmd +=3D " \
>  "
>  RDEPENDS:${PN}-offline-cmd +=3D "python3-core"
>
> +SUMMARY:${PN}-offline-cmd =3D "${SUMMARY} (log-rotate configuration)"
>

It seams to me that it should be SUMMARY:${PN}-log-rotate

Jose


> +FILES:${PN}-log-rotate +=3D "${sysconfdir}/logrotate.d"
> +
>  # To get allmost all tests passing
>  # - Enable PACKAGECONFIG ipset, ebtable
>  # - Enough RAM QB_MEM =3D "-m 8192" (used f=C3=BCr fancy ipset tests)
> @@ -273,6 +283,9 @@ RDEPENDS:${PN} +=3D "\
>      python3-ctypes \
>      python3-pprint \
>  "
> +# If firewalld writes a log file rotation is needed
> +RRECOMMENDS:${PN} +=3D
> "${@bb.utils.contains_any('FIREWALLD_DEFAULT_LOG_TARGET', [ 'mixed', 'fil=
e'
> ], '${PN}-log-rotate', '', d)}"
> +
>  # Add required kernel modules. With Yocto kernel 5.15 this currently
> means:
>  # - features/nf_tables/nf_tables.scc
>  # - features/netfilter/netfilter.scc
> --
> 2.35.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97763):
> https://lists.openembedded.org/g/openembedded-devel/message/97763
> Mute This Topic: https://lists.openembedded.org/mt/92224514/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000532c0e05e3342f65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Adrian,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Adrian Freihofer &lt;<a href=3D"mailto:adri=
an.freihofer@gmail.com">adrian.freihofer@gmail.com</a>&gt; escreveu no dia =
quinta, 7/07/2022 =C3=A0(s) 09:26:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Firewalld:<br>
This is a feature release. It also includes all bug fixes since v1.1.0.<br>
Details are here: <a href=3D"https://firewalld.org/2022/07/firewalld-1-2-0-=
release" rel=3D"noreferrer" target=3D"_blank">https://firewalld.org/2022/07=
/firewalld-1-2-0-release</a><br>
<br>
Recipe:<br>
Firewalld defaults to create a log file for debug messages. This is<br>
basically an empty file until firewalld&#39;s log level is configured to<br=
>
debug level. Writing log files requies something like log-rotate to<br>
prevent full disks. The default for OE is to not create files and send<br>
all log messages to syslog (journald).<br>
<br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://firewalld_1.1.1.bb" rel=3D"noreferrer" target=
=3D"_blank">firewalld_1.1.1.bb</a> =3D&gt; <a href=3D"http://firewalld_1.2.=
0.bb" rel=3D"noreferrer" target=3D"_blank">firewalld_1.2.0.bb</a>}=C2=A0 | =
17 +++++++++++++++--<br>
=C2=A01 file changed, 15 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-networking/dynamic-layers/meta-python/recipes-connectivit=
y/firewalld/{<a href=3D"http://firewalld_1.1.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">firewalld_1.1.1.bb</a> =3D&gt; <a href=3D"http://firewalld_1.2=
.0.bb" rel=3D"noreferrer" target=3D"_blank">firewalld_1.2.0.bb</a>} (93%)<b=
r>
<br>
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivit=
y/firewalld/<a href=3D"http://firewalld_1.1.1.bb" rel=3D"noreferrer" target=
=3D"_blank">firewalld_1.1.1.bb</a> b/meta-networking/dynamic-layers/meta-py=
thon/recipes-connectivity/firewalld/<a href=3D"http://firewalld_1.2.0.bb" r=
el=3D"noreferrer" target=3D"_blank">firewalld_1.2.0.bb</a><br>
similarity index 93%<br>
rename from meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/firewalld/<a href=3D"http://firewalld_1.1.1.bb" rel=3D"noreferrer" target=
=3D"_blank">firewalld_1.1.1.bb</a><br>
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/f=
irewalld/<a href=3D"http://firewalld_1.2.0.bb" rel=3D"noreferrer" target=3D=
"_blank">firewalld_1.2.0.bb</a><br>
index 00e851f45..58ed2d5bd 100644<br>
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firew=
alld/<a href=3D"http://firewalld_1.1.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">firewalld_1.1.1.bb</a><br>
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firew=
alld/<a href=3D"http://firewalld_1.2.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">firewalld_1.2.0.bb</a><br>
@@ -10,7 +10,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://firewalld.init \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;1dcd314ff836b2ce69f15f60fc7d50bd77ed359d784f9=
b3c07f2d394ea570e4c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;28fd90e88bda0dfd460f370f353474811b2e295d7eb27=
f0d7d18ffa3d786eeb7&quot;<br>
<br>
=C2=A0# glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from g=
settings.m4<br>
=C2=A0DEPENDS =3D &quot;intltool-native glib-2.0-native nftables&quot;<br>
@@ -23,6 +23,9 @@ PACKAGECONFIG[docs] =3D &quot;--with-xml-catalog=3D${STAG=
ING_ETCDIR_NATIVE}/xml/catalog,-<br>
=C2=A0PACKAGECONFIG[ipset] =3D &quot;--with-ipset=3D${sbindir}/ipset,--with=
out-ipset,,ipset&quot;<br>
=C2=A0PACKAGECONFIG[ebtables] =3D &quot;--with-ebtables=3D${base_sbindir}/e=
btables --with-ebtables-restore=3D${sbindir}/ebtables-legacy-restore,--with=
out-ebtables --without-ebtables-restore,,ebtables&quot;<br>
<br>
+# Default logging configuration: mixed syslog file console<br>
+FIREWALLD_DEFAULT_LOG_TARGET ??=3D &quot;syslog&quot;<br>
+<br>
=C2=A0# The UIs are not yet tested and the dependencies are probably not qu=
ite correct yet.<br>
=C2=A0# Splitting into separate packages is beneficial so that no dead code=
 is transferred<br>
=C2=A0# to the target device.<br>
@@ -31,7 +34,7 @@ PACKAGECONFIG[ebtables] =3D &quot;--with-ebtables=3D${bas=
e_sbindir}/ebtables --with-ebtab<br>
=C2=A0PACKAGECONFIG[qt5] =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[gtk] =3D &quot;&quot;<br>
<br>
-PACKAGES =3D+ &quot;python3-firewall ${PN}-applet ${PN}-config ${PN}-offli=
ne-cmd ${PN}-zsh-completion&quot;<br>
+PACKAGES =3D+ &quot;python3-firewall ${PN}-applet ${PN}-config ${PN}-offli=
ne-cmd ${PN}-zsh-completion ${PN}-log-rotate&quot;<br>
<br>
=C2=A0# iptables, ip6tables, ebtables, and ipset *should* be unnecessary<br=
>
=C2=A0# when the nftables backend is available, because nftables supersedes=
 all of them.<br>
@@ -132,6 +135,10 @@ FIREWALLD_KERNEL_MODULES ?=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0sch_fq_codel \<br>
=C2=A0&quot;<br>
<br>
+do_configure:prepend() {<br>
+=C2=A0 =C2=A0 export DEFAULT_LOG_TARGET=3D${FIREWALLD_DEFAULT_LOG_TARGET}<=
br>
+}<br>
+<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39=
;systemd&#39;, &#39;false&#39;, &#39;true&#39;, d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# firewalld ships an init script but it c=
ontains Red Hat-isms, replace it with our own<br>
@@ -237,6 +244,9 @@ FILES:${PN}-offline-cmd +=3D &quot; \<br>
=C2=A0&quot;<br>
=C2=A0RDEPENDS:${PN}-offline-cmd +=3D &quot;python3-core&quot;<br>
<br>
+SUMMARY:${PN}-offline-cmd =3D &quot;${SUMMARY} (log-rotate configuration)&=
quot;<br></blockquote><div><br></div><div>It seams=C2=A0to me that it shoul=
d be SUMMARY:${PN}-log-rotate</div><div><br></div><div>Jose</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+FILES:${PN}-log-rotate +=3D &quot;${sysconfdir}/logrotate.d&quot;<br>
+<br>
=C2=A0# To get allmost all tests passing<br>
=C2=A0# - Enable PACKAGECONFIG ipset, ebtable<br>
=C2=A0# - Enough RAM QB_MEM =3D &quot;-m 8192&quot; (used f=C3=BCr fancy ip=
set tests)<br>
@@ -273,6 +283,9 @@ RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-ctypes \<br>
=C2=A0 =C2=A0 =C2=A0python3-pprint \<br>
=C2=A0&quot;<br>
+# If firewalld writes a log file rotation is needed<br>
+RRECOMMENDS:${PN} +=3D &quot;${@bb.utils.contains_any(&#39;FIREWALLD_DEFAU=
LT_LOG_TARGET&#39;, [ &#39;mixed&#39;, &#39;file&#39; ], &#39;${PN}-log-rot=
ate&#39;, &#39;&#39;, d)}&quot;<br>
+<br>
=C2=A0# Add required kernel modules. With Yocto kernel 5.15 this currently =
means:<br>
=C2=A0# - features/nf_tables/nf_tables.scc<br>
=C2=A0# - features/netfilter/netfilter.scc<br>
-- <br>
2.35.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97763): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97763" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97763</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92224514/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92224514/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000532c0e05e3342f65--

