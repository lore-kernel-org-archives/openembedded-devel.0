Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17391C25B4E
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 07:03:58 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.9670.1674543828953177203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jan 2023 23:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout09.t-online.de (Postfix) with SMTP id 18F5E11A40
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 08:03:46 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.201]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pKDLN-3bc3oO0; Tue, 24 Jan 2023 08:03:46 +0100
Date: Tue, 24 Jan 2023 08:03:40 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] cups-pk-helper: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <4AAZOR.OVO449BIZ6K01@t-online.de>
In-Reply-To: <173D283C72C80C46.686@lists.openembedded.org>
References: <20230124054024.11634-1-f_l_k@t-online.de>
	<173D283C72C80C46.686@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-NIFRadRYtDj1ASODGUij"
X-TOI-EXPURGATEID: 150726::1674543826-EAD5337F-40AAD85D/0/0 CLEAN NORMAL
X-TOI-MSGID: d65bdbe0-9996-4cdd-8066-404ae2762fae
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 07:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100716

--=-NIFRadRYtDj1ASODGUij
Content-Type: text/plain; charset=us-ascii; format=flowed

Another thing I've forgot since I created this recipe some time ago. 
There is an issue with gettext.
cups-pk-helper wants to created a localized 
'org.opensuse.cupspkhelper.mechanism.policy' file from an according 
policy.in.
For that it would be required to build polkit-native and then there's 
still a problem, because polkit installes the polkit.its file in 
${STAGING_DATADIR_NATIVE}/gettext while gettext creates a wrapper that 
uses ${STAGING_DATADIR_NATIVE}/gettext-${PV}and the needed its-rule 
still can't be found:

| 
/home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/cups-pk-helper/0.2.7-r0/recipe-sysroot-native/usr/bin/msgfmt: 
cannot locate ITS rules for 
../cups-pk-helper-0.2.7/src/org.opensuse.cupspkhelper.mechanism.policy.in
| [45/59] 
/home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/cups-pk-helper/0.2.7-r0/recipe-sysroot-native/usr/bin/gdbus-codegen 
--c-generate-autocleanup all --interface-prefix 
org.opensuse.CupsPkHelper. --c-namespace CphIface 
--c-generate-object-manager --header --output src/cph-iface-mechanism.h 
../cups-pk-helper-0.2.7/src/cups-pk-helper-mechanism.xml
| [46/59] 
/home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/cups-pk-helper/0.2.7-r0/recipe-sysroot-native/usr/bin/gdbus-codegen 
--c-generate-autocleanup all --interface-prefix 
org.opensuse.CupsPkHelper. --c-namespace CphIface 
--c-generate-object-manager --body --output src/cph-iface-mechanism.c 
../cups-pk-helper-0.2.7/src/cups-pk-helper-mechanism.xml
| ninja: build stopped: subcommand failed

I'd like to fix this but am unsure, what would be the best way to to 
it. Any suggestions ? I instinctively tend to completely wipe that 
${PV} from gettext directory because I really disslike dynamically 
changing directory names.

Another reasonable and simple fix for this is to patch meson not to try 
localization, just copy the policy.in file to policy and live with the 
fact, that its english only

Am Di, 24. Jan 2023 um 06:41:07 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> v2 adds polkit to REQUIRED_DISTRO_FEATURES
> 
> Am Di, 24. Jan 2023 um 06:40:24 +0100 schrieb Markus Volk 
> <f_l_k@t-online.de>:
>> cups-pk-helper is a runtime dependency for gnome-control-center
>> or system-config-printer.
>> 
>> Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>> ---
>>  .../recipes-printing/cups/cups-pk-helper_0.2.7.bb | 15 
>> +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>  create mode 100644 
>> meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
>> 
>> diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb 
>> b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
>> new file mode 100644
>> index 000000000..9639a123d
>> --- /dev/null
>> +++ b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
>> @@ -0,0 +1,15 @@
>> +DESCRIPTION = "CUPS polkit helper"
>> +HOMEPAGE = 
>> "<https://www.freedesktop.org/software/cups-pk-helper/releases/>"
>> +LICENSE = "GPL-2.0-only"
>> +LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
>> <file://copying;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
>> +
>> +DEPENDS = "cups polkit glib-2.0 xz intltool-native"
>> +
>> +inherit meson pkgconfig gettext features_check
>> +
>> +REQUIRED_DISTRO_FEATURES = "polkit"
>> +
>> +SRC_URI = 
>> "https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk-helper-${PV}.tar.xz 
>> <https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk-helper-$%7BPV%7D.tar.xz>"
>> +SRC_URI[sha256sum] = 
>> "66070ddb448fe9fcee76aa26be2ede5a80f85563e3a4afd59d2bfd79fbe2e831"
>> +
>> +FILES:${PN} += "${datadir}"
>> --
>> 2.34.1
>> 


--=-NIFRadRYtDj1ASODGUij
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Another thing I've forgot since I =
created this recipe some time ago. There is an issue with gettext.</div><di=
v>cups-pk-helper wants to created a localized 'org.opensuse.cupspkhelper.me=
chanism.policy' file from an according policy.in.</div><div>For that it wou=
ld be required to build polkit-native and then there's still a problem, bec=
ause polkit installes the polkit.its file in ${STAGING_DATADIR_NATIVE}/gett=
ext while gettext creates a wrapper that uses ${STAGING_DATADIR_NATIVE}/get=
text-${PV}and the needed its-rule still can't be found:</div><div><br></div=
><div>| /home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/cups-pk-he=
lper/0.2.7-r0/recipe-sysroot-native/usr/bin/msgfmt: cannot locate ITS rules=
 for ../cups-pk-helper-0.2.7/src/org.opensuse.cupspkhelper.mechanism.policy=
.in</div><div>| [45/59] /home/flk/poky/build-intel/tmp/work/corei7-64-poky-=
linux/cups-pk-helper/0.2.7-r0/recipe-sysroot-native/usr/bin/gdbus-codegen -=
-c-generate-autocleanup all --interface-prefix org.opensuse.CupsPkHelper. -=
-c-namespace CphIface --c-generate-object-manager --header --output src/cph=
-iface-mechanism.h ../cups-pk-helper-0.2.7/src/cups-pk-helper-mechanism.xml=
</div><div>| [46/59] /home/flk/poky/build-intel/tmp/work/corei7-64-poky-lin=
ux/cups-pk-helper/0.2.7-r0/recipe-sysroot-native/usr/bin/gdbus-codegen --c-=
generate-autocleanup all --interface-prefix org.opensuse.CupsPkHelper. --c-=
namespace CphIface --c-generate-object-manager --body --output src/cph-ifac=
e-mechanism.c ../cups-pk-helper-0.2.7/src/cups-pk-helper-mechanism.xml</div=
><div>| ninja: build stopped: subcommand failed</div><div><br></div><div>I'=
d like to fix this but am unsure, what would be the best way to to it. Any =
suggestions ? I instinctively tend to completely wipe that ${PV} from gette=
xt directory because I really disslike dynamically changing directory names=
.&nbsp;</div><div><br></div><div>Another reasonable and simple fix for this=
 is to patch meson not to try localization, just copy the policy.in file to=
 policy and live with the fact, that its english only</div></div><div id=3D=
"geary-quote" dir=3D"auto"><br>Am Di, 24. Jan 2023 um 06:41:07 +0100 schrie=
b Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type=3D"cite"><div =
id=3D"geary-body" dir=3D"auto"><div>v2 adds polkit to REQUIRED_DISTRO_FEATU=
RES</div></div><div id=3D"geary-quote" dir=3D"auto"><br>Am Di, 24. Jan 2023=
 um 06:40:24 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><block=
quote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-sp=
aces;">cups-pk-helper is a runtime dependency for gnome-control-center
or system-config-printer.

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 .../recipes-printing/cups/cups-pk-helper_0.2.7.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb

diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb b/meta-o=
e/recipes-printing/cups/cups-pk-helper_0.2.7.bb
new file mode 100644
index 000000000..9639a123d
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
@@ -0,0 +1,15 @@
+DESCRIPTION =3D "CUPS polkit helper"
+HOMEPAGE =3D "<a href=3D"https://www.freedesktop.org/software/cups-pk-help=
er/releases/">https://www.freedesktop.org/software/cups-pk-helper/releases/=
</a>"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263" "=3D"">file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"=
</a>
+
+DEPENDS =3D "cups polkit glib-2.0 xz intltool-native"
+
+inherit meson pkgconfig gettext features_check
+
+REQUIRED_DISTRO_FEATURES =3D "polkit"
+
+SRC_URI =3D "<a href=3D"https://www.freedesktop.org/software/cups-pk-helpe=
r/releases/cups-pk-helper-${PV}.tar.xz">https://www.freedesktop.org/softwar=
e/cups-pk-helper/releases/cups-pk-helper-${PV}.tar.xz</a>"
+SRC_URI[sha256sum] =3D "66070ddb448fe9fcee76aa26be2ede5a80f85563e3a4afd59d=
2bfd79fbe2e831"
+
+FILES:${PN} +=3D "${datadir}"
<div>--=20
</div>2.34.1

</div></blockquote></div>
</blockquote></div>
--=-NIFRadRYtDj1ASODGUij--


