Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED3C10F3DC5
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 01:19:13 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3291.1774660750611147837
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 18:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=XQtk8cfH;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd97.mgt.mul.t-online.de (fwd97.aul.t-online.de [10.223.144.123])
	by mailout09.t-online.de (Postfix) with SMTP id C8CCB38E2A;
	Sat, 28 Mar 2026 02:19:08 +0100 (CET)
Received: from [192.168.178.63] ([84.163.35.64]) by fwd97.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w6IKN-2aUmoK0; Sat, 28 Mar 2026 02:19:04 +0100
Date: Sat, 28 Mar 2026 02:18:58 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] xdg-desktop-portal: update 1.20.1 -> 1.21.0
To: raj.khem@gmail.com
Cc: "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Message-Id: <MZ4LCT.ZHCX1X5FRI7F2@t-online.de>
In-Reply-To: <CAMKF1so8wk1gmWLAGuH4TyqQ+twCx3x7aQ3cj2_UxFw_6q5mWw@mail.gmail.com>
References: <20260328002345.450561-1-f_l_k@t-online.de>
	<CAMKF1so8wk1gmWLAGuH4TyqQ+twCx3x7aQ3cj2_UxFw_6q5mWw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-4zELxOdVGvOQ8t0opY4b"
X-TOI-EXPURGATEID: 150726::1774660744-037FC539-86E8AE36/0/0 CLEAN NORMAL
X-TOI-MSGID: 1dd6e0b9-f02c-4c47-9cbe-47ccc7b2db0c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774660748; i=f_l_k@t-online.de;
	bh=1YXr5+sjVDUvLUt36he2lzNqwfa5wXJy/2C5X3qtBS8=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=XQtk8cfHW7fzBbjKH6nEsSpT8r2V4FDC2sbASEiexDq8G6YKJGUci9eC/IbwzX+2V
	 M/rw4zSbgvQevbPOujilPS5bp/lGTSQ0cQEJs9yHKfddLZoDAbLOzKxcD6oKUYETys
	 vpvvzVkiQXCh/OtpVZ4VJlc1XoZ4VNCRuixKQ5O3MkSK6JtbalydNYUoR5kf49ll+L
	 ziHi99guud5JlMCKxepaRUlA3dpOI9CIDWVve68HW9keHFvbP8cYQOCIfSJDOta1wY
	 X+5wbj+ItZYjqt4Ww8elMYI+1Yx5n5LSh/Ksc1s4C23r6kDv1f6MrWWjGztVd5slvY
	 +ZHxNjF0L0l2A==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 01:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125797

--=-4zELxOdVGvOQ8t0opY4b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Yes, it is. I thought since we're also using the pre-release of flatpak=20
it would be the better fit. But I don't see any problems with the older=20
version either

Am Fr, 27. M=C3=A4r 2026 um 18:13:50 -07:00:00 schrieb Khem Raj via=20
lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org>:
> isn't 1.21 a pre-release and perhaps wait for 1.22 to come out ?
>=20
> On Fri, Mar 27, 2026 at 5:23=E2=80=AFPM Markus Volk via=20
> lists.openembedded.org <http://lists.openembedded.org/>=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:t-online.de@lists.openembedded.org>> wrote:
>> New Features:
>>=20
>>  - Add the `has_current_page` and `has_selected_pages` options to=20
>> the Print
>>    Portal (#1777)
>>  - Allow running the tests with Valgrind's memcheck (#1770)
>>  - Add the `ConfigureShortcuts` method to the Global Shortcuts=20
>> Portal (#1661)
>>  - Send activation tokens in the actiavated and deactiavated signals=20
>> on the
>>    Global Shortcuts Portal (#1792)
>>  - Add a new reduced motion setting to the Settings Portal (#1840)
>>  - Support linyaps applications (#1846)
>>  - Add missing cell broadcast severities to the Notification Portal=20
>> (#1738)
>>=20
>>  Enhancements:
>>=20
>>  - Code cleanup (#1574, #1809, #1771, #1727)
>>  - Code refactoring (#1805, #1815, #1819, #1686)
>>  - Documentation improvements (#1712, #1759, #1776, #1795, #1798,=20
>> #1866)
>>  - New and updated translations (#1735, #1760, #1765, #1774, #1780,=20
>> #1781,
>>    #1786, #1787, #1789, #1797, #1800, #1801, #1802, #1811, #1833,=20
>> #1826,
>>    #1852, #1841, #1843, #1851, #1869, #1860, #1788)
>>  - Improve various permission dialog texts (#1769, #1327, #1804)
>>  - Release procedure clarifications (#1710, #1714)
>>  - Updates to ASAN suppressions (#1711)
>>  - Make XdpAppInfo more testable (#1627)
>>  - Use the new `PIDFD_GET_PID_NAMESPACE` ioctl to get the pidns=20
>> (#1713)
>>  - Improvements to the heuristics to translate a path in the sandbox=20
>> to a path on
>>    the host (#1571)
>>  - Improve the mocking of the GeoClue service (#1695)
>>  - Make the camera permissions per-App on the host again (#1762)
>>  - Clean up permissions and desktop IDs usage (#1772, #1773)
>>  - Improve PID translations for host Apps (#1785)
>>  - Show an appropriate error when access to remote documents fails=20
>> (#823)
>>  - Require a valid AppID from apps in `RequestBackground` to enable=20
>> autostart
>>    (#1793)
>>  - Require a valid AppID from apps to use the Global Shortcuts=20
>> Portal (#1817)
>>  - Test and document Notification Portal backward compatibilities=20
>> (#1823)
>>  - Improve the heuristic to detect the App ID for host apps (#1595)
>>  - Add Merge Requirements documentation (#1775)
>>  - Initialize the Secret Portal asynchronously to avoid blocking=20
>> when the secret
>>    service is not available (#1814)
>>  - Do not allow requesting a zero capability from the Input Capture=20
>> Portal
>>    (#1880)
>>  - Require GLib version 2.76 and drop the related compatibility code=20
>> (#1730)
>>=20
>>  Bug Fixes:
>>=20
>>  - Fix a crash when loading information from Flatpak apps (#1720)
>>  - Fix fd handling to prevent EBADF errors (#1721)
>>  - Add a fallback code path for GLib older than 2.76 (#1728)
>>  - Don't require a .desktop file for Flatpak and Snap apps (#1729)
>>  - Fix a crash when calling `GlobalShortcuts.BindShortcuts` with an=20
>> empty list
>>    (#1732)
>>  - Fix a crash when passing Request token handles which contain `-`=20
>> (#1748)
>>  - Fix tests on systems without access to /proc/cmdline (#1766)
>>  - Stop accidentally running pytests of subprojects (#1767)
>>  - Give up trying to unmount an existing fuse mount when shutting=20
>> down the
>>    Document Portal (#1799)
>>  - Fix compilation on Debian Testing, caused by a wrong cast (#1625)
>>  - Fix ownership of pidfd for XdpAppInfos (#1810)
>>  - Fix uninitialized variables (#1825)
>>  - Do not give access to read-only USB devices when read-write=20
>> access was
>>    requested (#1794)
>>  - Do not kill PID 0 and handle races properly (#1864)
>>  - Fix forwarding the `available-source-types` and=20
>> `available-cursor-modes` from
>>    the backend (#1868)
>>  - Ensure valid WAYLAND_DISPLAY/DISPLAY by launching after the=20
>> graphical session
>>    target (#1830)
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   ...-desktop-portal_1.20.3.bb <http://desktop-portal_1.20.3.bb/> =3D>=20
>> xdg-desktop-portal_1.21.0.bb <http://xdg-desktop-portal_1.21.0.bb/>}=20
>> | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename=20
>> meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.20.3.bb=
=20
>> <http://xdg-desktop-portal_1.20.3.bb/> =3D>=20
>> xdg-desktop-portal_1.21.0.bb <http://xdg-desktop-portal_1.21.0.bb/>}=20
>> (93%)
>>=20
>>  diff --git=20
>> a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.3.b=
b=20
>> <http://xdg-desktop-portal_1.20.3.bb/>=20
>> b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.21.0.b=
b=20
>> <http://xdg-desktop-portal_1.21.0.bb/>
>>  similarity index 93%
>>  rename from=20
>> meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.3.bb=20
>> <http://xdg-desktop-portal_1.20.3.bb/>
>>  rename to=20
>> meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.21.0.bb=20
>> <http://xdg-desktop-portal_1.21.0.bb/>
>>  index e0aca558fd..cb34441f81 100644
>>  ---=20
>> a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.3.b=
b=20
>> <http://xdg-desktop-portal_1.20.3.bb/>
>>  +++=20
>> b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.21.0.b=
b=20
>> <http://xdg-desktop-portal_1.21.0.bb/>
>>  @@ -27,11 +27,11 @@ RDEPENDS:${PN} =3D "bubblewrap rtkit=20
>> ${PORTAL_BACKENDS} fuse3-utils"
>>   inherit meson pkgconfig python3native features_check
>>=20
>>   SRC_URI =3D " \
>>  -      =20
>> git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dxdg-desktop-portal-1.20=20
>> <http://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branc=
h=3Dxdg-desktop-portal-1.20>=20
>> \
>>  +      =20
>> git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dmain;tag=3D${PV}=20
>> <http://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branc=
h=3Dmain;tag=3D$%7BPV%7D>=20
>> \
>>          file://0001-meson.build-add-a-hack-for-crosscompile.patch \
>>   "
>>=20
>>  -SRCREV =3D "23a76c392170dbbd26230f85ef56c3a57e52b857"
>>  +SRCREV =3D "d49f4cb0ea1d6ddc02949a9631626668cd7fc4fc"
>>=20
>>   FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
>>=20
>>  --
>>  2.53.0
>>=20
>>=20
>>=20
>>=20


--=-4zELxOdVGvOQ8t0opY4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Yes, it is. I thought since we're =
also using the pre-release of flatpak it would be the better fit. But I don=
't see any problems with the older version either</div></div><div id=3D"gea=
ry-quote" dir=3D"auto"><br>Am Fr, 27. M=C3=A4r 2026 um 18:13:50 -07:00:00 s=
chrieb Khem Raj via lists.openembedded.org &lt;raj.khem=3Dgmail.com@lists.o=
penembedded.org&gt;:<br><blockquote type=3D"cite"><div dir=3D"ltr">isn't 1.=
21 a pre-release and perhaps wait for 1.22 to come out ?</div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Mar 27, 2026 at 5:23=E2=80=AFPM Markus Volk via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D=
"mailto:t-online.de@lists.openembedded.org">t-online.de@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">New Features:<br>
<br>
- Add the `has_current_page` and `has_selected_pages` options to the Print<=
br>
&nbsp; Portal (#1777)<br>
- Allow running the tests with Valgrind's memcheck (#1770)<br>
- Add the `ConfigureShortcuts` method to the Global Shortcuts Portal (#1661=
)<br>
- Send activation tokens in the actiavated and deactiavated signals on the<=
br>
&nbsp; Global Shortcuts Portal (#1792)<br>
- Add a new reduced motion setting to the Settings Portal (#1840)<br>
- Support linyaps applications (#1846)<br>
- Add missing cell broadcast severities to the Notification Portal (#1738)<=
br>
<br>
Enhancements:<br>
<br>
- Code cleanup (#1574, #1809, #1771, #1727)<br>
- Code refactoring (#1805, #1815, #1819, #1686)<br>
- Documentation improvements (#1712, #1759, #1776, #1795, #1798, #1866)<br>
- New and updated translations (#1735, #1760, #1765, #1774, #1780, #1781,<b=
r>
&nbsp; #1786, #1787, #1789, #1797, #1800, #1801, #1802, #1811, #1833, #1826=
,<br>
&nbsp; #1852, #1841, #1843, #1851, #1869, #1860, #1788)<br>
- Improve various permission dialog texts (#1769, #1327, #1804)<br>
- Release procedure clarifications (#1710, #1714)<br>
- Updates to ASAN suppressions (#1711)<br>
- Make XdpAppInfo more testable (#1627)<br>
- Use the new `PIDFD_GET_PID_NAMESPACE` ioctl to get the pidns (#1713)<br>
- Improvements to the heuristics to translate a path in the sandbox to a pa=
th on<br>
&nbsp; the host (#1571)<br>
- Improve the mocking of the GeoClue service (#1695)<br>
- Make the camera permissions per-App on the host again (#1762)<br>
- Clean up permissions and desktop IDs usage (#1772, #1773)<br>
- Improve PID translations for host Apps (#1785)<br>
- Show an appropriate error when access to remote documents fails (#823)<br=
>
- Require a valid AppID from apps in `RequestBackground` to enable autostar=
t<br>
&nbsp; (#1793)<br>
- Require a valid AppID from apps to use the Global Shortcuts Portal (#1817=
)<br>
- Test and document Notification Portal backward compatibilities (#1823)<br=
>
- Improve the heuristic to detect the App ID for host apps (#1595)<br>
- Add Merge Requirements documentation (#1775)<br>
- Initialize the Secret Portal asynchronously to avoid blocking when the se=
cret<br>
&nbsp; service is not available (#1814)<br>
- Do not allow requesting a zero capability from the Input Capture Portal<b=
r>
&nbsp; (#1880)<br>
- Require GLib version 2.76 and drop the related compatibility code (#1730)=
<br>
<br>
Bug Fixes:<br>
<br>
- Fix a crash when loading information from Flatpak apps (#1720)<br>
- Fix fd handling to prevent EBADF errors (#1721)<br>
- Add a fallback code path for GLib older than 2.76 (#1728)<br>
- Don't require a .desktop file for Flatpak and Snap apps (#1729)<br>
- Fix a crash when calling `GlobalShortcuts.BindShortcuts` with an empty li=
st<br>
&nbsp; (#1732)<br>
- Fix a crash when passing Request token handles which contain `-` (#1748)<=
br>
- Fix tests on systems without access to /proc/cmdline (#1766)<br>
- Stop accidentally running pytests of subprojects (#1767)<br>
- Give up trying to unmount an existing fuse mount when shutting down the<b=
r>
&nbsp; Document Portal (#1799)<br>
- Fix compilation on Debian Testing, caused by a wrong cast (#1625)<br>
- Fix ownership of pidfd for XdpAppInfos (#1810)<br>
- Fix uninitialized variables (#1825)<br>
- Do not give access to read-only USB devices when read-write access was<br=
>
&nbsp; requested (#1794)<br>
- Do not kill PID 0 and handle races properly (#1864)<br>
- Fix forwarding the `available-source-types` and `available-cursor-modes` =
from<br>
&nbsp; the backend (#1868)<br>
- Ensure valid WAYLAND_DISPLAY/DISPLAY by launching after the graphical ses=
sion<br>
&nbsp; target (#1830)<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
&nbsp;...-<a href=3D"http://desktop-portal_1.20.3.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">desktop-portal_1.20.3.bb</a> =3D&gt; <a href=3D"http://xdg-=
desktop-portal_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank">xdg-desktop-=
portal_1.21.0.bb</a>} | 4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
&nbsp;rename meta-oe/recipes-support/xdg-desktop-portal/{<a href=3D"http://=
xdg-desktop-portal_1.20.3.bb" rel=3D"noreferrer" target=3D"_blank">xdg-desk=
top-portal_1.20.3.bb</a> =3D&gt; <a href=3D"http://xdg-desktop-portal_1.21.=
0.bb" rel=3D"noreferrer" target=3D"_blank">xdg-desktop-portal_1.21.0.bb</a>=
} (93%)<br>
<br>
diff --git a/meta-oe/recipes-support/xdg-desktop-portal/<a href=3D"http://x=
dg-desktop-portal_1.20.3.bb" rel=3D"noreferrer" target=3D"_blank">xdg-deskt=
op-portal_1.20.3.bb</a> b/meta-oe/recipes-support/xdg-desktop-portal/<a hre=
f=3D"http://xdg-desktop-portal_1.21.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">xdg-desktop-portal_1.21.0.bb</a><br>
similarity index 93%<br>
rename from meta-oe/recipes-support/xdg-desktop-portal/<a href=3D"http://xd=
g-desktop-portal_1.20.3.bb" rel=3D"noreferrer" target=3D"_blank">xdg-deskto=
p-portal_1.20.3.bb</a><br>
rename to meta-oe/recipes-support/xdg-desktop-portal/<a href=3D"http://xdg-=
desktop-portal_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank">xdg-desktop-=
portal_1.21.0.bb</a><br>
index e0aca558fd..cb34441f81 100644<br>
--- a/meta-oe/recipes-support/xdg-desktop-portal/<a href=3D"http://xdg-desk=
top-portal_1.20.3.bb" rel=3D"noreferrer" target=3D"_blank">xdg-desktop-port=
al_1.20.3.bb</a><br>
+++ b/meta-oe/recipes-support/xdg-desktop-portal/<a href=3D"http://xdg-desk=
top-portal_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank">xdg-desktop-port=
al_1.21.0.bb</a><br>
@@ -27,11 +27,11 @@ RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKENDS}=
 fuse3-utils"<br>
&nbsp;inherit meson pkgconfig python3native features_check<br>
<br>
&nbsp;SRC_URI =3D " \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;git://<a href=3D"http://github.com/flatpak/xdg-=
desktop-portal.git;protocol=3Dhttps;branch=3Dxdg-desktop-portal-1.20" rel=
=3D"noreferrer" target=3D"_blank">github.com/flatpak/xdg-desktop-portal.git=
;protocol=3Dhttps;branch=3Dxdg-desktop-portal-1.20</a> \<br>
+&nbsp; &nbsp; &nbsp; &nbsp;git://<a href=3D"http://github.com/flatpak/xdg-=
desktop-portal.git;protocol=3Dhttps;branch=3Dmain;tag=3D$%7BPV%7D" rel=3D"n=
oreferrer" target=3D"_blank">github.com/flatpak/xdg-desktop-portal.git;prot=
ocol=3Dhttps;branch=3Dmain;tag=3D${PV}</a> \<br>
&nbsp; &nbsp; &nbsp; &nbsp; file://0001-meson.build-add-a-hack-for-crosscom=
pile.patch \<br>
&nbsp;"<br>
<br>
-SRCREV =3D "23a76c392170dbbd26230f85ef56c3a57e52b857"<br>
+SRCREV =3D "d49f4cb0ea1d6ddc02949a9631626668cd7fc4fc"<br>
<br>
&nbsp;FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>
--=-4zELxOdVGvOQ8t0opY4b--


