Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC52210F3DC4
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 01:14:23 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3214.1774660458125856008
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 18:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y1wKZKY+;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64e8cdafeffso4069708d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 18:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774660457; cv=none;
        d=google.com; s=arc-20240605;
        b=G/4pleKL4DK3des7gddhn/0QGghjOSBnfRMPNTLdlKfZS4Nk8/Ys1bjAn+rtD9fzVn
         S0JohQ1QAI4+eFqa997wBeU1Fz0dh2dXmssOcWCGZkHo2DMZrEREyhyTAZT5aCmeHtNm
         7yYzmaQMrJbujQWlhmpqPKjZ8/uQvgU+kfL1mELLCXlvZjjjhRfJTk7NAiCm+3bhBTW9
         ww2zHrZo80/2YoH0TbRZ0KGDFBMUe7FPNnpj8TMpkvJ1BGIxIE6mS9xQVR4w0tCG34pP
         rzXFZo1URo04Dx5Gvd4vfug/lZqf8KeIa2CPoZEiXuggoKFVqWHq7Wmoq2qqxc6ZFaoj
         PURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5ZUFg0UCU9GFYRSiT1n+vfhjYlM5Oiwc+/tYnJLCKkk=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=B5wklgsSJnDZECznl/Q3SXREfsrB9NyEUT+DiH7NA+ZUbx//8JCrIWTjj2H+nDWQj+
         pDBpGa112WB5i0cmbCJES7CAsY0JmZEMurl0eEKARO/dWlIIPvQUNBXR9evzOnzZzxkQ
         MZxGpLBvVX0d+z3oyzSrY1cm7z7fltmnBOLubA7IEZNO3qsThGzCeCcvTwPf3jCqsjHc
         RoGtgQ7F+iu4bV29faZql1AlnIGKHG4xUAc9t5XUfEfXlIOPJ36zFep5WSlGt5wrdA3U
         81XSTVI/0gAmfDvd+8L4nckVAYrwNTFViQ6udOIbIpUobht8RDnKkM851BFbAMIgjMvg
         BWtA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774660457; x=1775265257; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZUFg0UCU9GFYRSiT1n+vfhjYlM5Oiwc+/tYnJLCKkk=;
        b=Y1wKZKY+ltTyKBcblSgo9+fmPZzrNjvWsY+pN1q5L982RZVxmRp+AJRjePbdeYseq9
         3p3BGVs7VYVEkBdlVvaGVRqu3ht3q50+TsOm+OxSb2YQpbgNyxQzhtOuciDOXj3vJDM5
         YiL4XV8oYOGp/mQaRN/Dl6FwHateRpkD0VwfGY1DE8urckgxjrPtNWUtdrurkU503Wjx
         aaQPj7x1lL6Saty77f8PwQFasyPgVur27mHpBXASO4wb9HoyfIFgt+2gqJDd5VaIzVQW
         ltPYy0eiHupVJ4enj6CjGfyUzc3x+G0m0xxqYLks701mBSmhC2EbEyfJR2pOqbLBTOui
         Posw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774660457; x=1775265257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZUFg0UCU9GFYRSiT1n+vfhjYlM5Oiwc+/tYnJLCKkk=;
        b=iwBap2R6egPsubFIhLcYUvn7pYXybooiddXZ9D5xwYm4i9Pb/Y04102suCeHRWZn94
         +1E69qjnKCmfF+3to7mBr9sta6FQuAbq3Q+bmNV+fl9XuRo6mohQCUE1p3N7b8hh2AdB
         X8YBvKqQHUqua8FvPi8RvqeexGg5n3rPRc1qACgnQhd3bsiQohnfYTklBOdWnoeRkHQK
         SHOJd+Wva9hTHfe9vNTm+GjnS6n4PQ1Ji+m15mDWBA6//DMwgd0WfZJPl1Mr7ixfVuZd
         WSo+hJouM4RzvfXsYzsotePTHGHwbnQ+9a7DSW5j8sgAt7t//gv/Js06NQnoy8gM4YwQ
         62zg==
X-Gm-Message-State: AOJu0Yxcekd8mPKVm1hVdrcio3IoUnQj5Hb1gP58FL12rasmRUgl7Sjk
	t5YzWIG3pnlYxTjmfr7ezmyTRbECehAfbR3tR/yo10pSyiVCl50wcy1lm/Bwh9I9L8cWtohQ/Jr
	6/sybe1r5SQ+xJgD2jXzdtOKZB7A+oao=
X-Gm-Gg: ATEYQzx7ZEcRFUSQdSRi3o6MP+TWrjQHBEacQ6eMDTsEFjqyKiYSDpg6Ak09F5n7MFS
	xKk3deTJbeVPVZJn6JloBnWM3+Pim2Ujz6MMaOoUqgXPDjfrf3iBvtKqYtzipc2BZZfh8I8ztFS
	fHTz5Spfe1S+I0JmjYT1501yVAUX27Pm+IRli3MV7FZPB54vEwnKHzXDHNqXuXYxr30RJQR1OYv
	+mnAL3Syee4RkHpXt8gjTtTo+7t5I3VyQyCw42NloxMasPNhh5hUQtvJpEsHwM9azUVygseBsIc
	ER5EXoFets9dO7GGqR989ZxPFhgzwnM8vdmjiENBx4braKTP9ToSw59m8BNGgbz5fUfQJJ8XhTf
	Gi4X0W10KY5aaZL6CfUtVUEGy
X-Received: by 2002:a05:690e:e88:b0:64e:e6ca:1564 with SMTP id
 956f58d0204a3-64fee2f0767mr7245369d50.34.1774660457029; Fri, 27 Mar 2026
 18:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260328002345.450561-1-f_l_k@t-online.de>
In-Reply-To: <20260328002345.450561-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Mar 2026 18:13:50 -0700
X-Gm-Features: AQROBzCMt25_1Hs1VDFBkSECZw0unwl8hnrCjF2yoJImc0QSoy1R5ywpKqdjQzo
Message-ID: <CAMKF1so8wk1gmWLAGuH4TyqQ+twCx3x7aQ3cj2_UxFw_6q5mWw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xdg-desktop-portal: update 1.20.1 -> 1.21.0
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002365d5064e0b5618"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 01:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125796

--0000000000002365d5064e0b5618
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

isn't 1.21 a pre-release and perhaps wait for 1.22 to come out ?

On Fri, Mar 27, 2026 at 5:23=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> New Features:
>
> - Add the `has_current_page` and `has_selected_pages` options to the Prin=
t
>   Portal (#1777)
> - Allow running the tests with Valgrind's memcheck (#1770)
> - Add the `ConfigureShortcuts` method to the Global Shortcuts Portal
> (#1661)
> - Send activation tokens in the actiavated and deactiavated signals on th=
e
>   Global Shortcuts Portal (#1792)
> - Add a new reduced motion setting to the Settings Portal (#1840)
> - Support linyaps applications (#1846)
> - Add missing cell broadcast severities to the Notification Portal (#1738=
)
>
> Enhancements:
>
> - Code cleanup (#1574, #1809, #1771, #1727)
> - Code refactoring (#1805, #1815, #1819, #1686)
> - Documentation improvements (#1712, #1759, #1776, #1795, #1798, #1866)
> - New and updated translations (#1735, #1760, #1765, #1774, #1780, #1781,
>   #1786, #1787, #1789, #1797, #1800, #1801, #1802, #1811, #1833, #1826,
>   #1852, #1841, #1843, #1851, #1869, #1860, #1788)
> - Improve various permission dialog texts (#1769, #1327, #1804)
> - Release procedure clarifications (#1710, #1714)
> - Updates to ASAN suppressions (#1711)
> - Make XdpAppInfo more testable (#1627)
> - Use the new `PIDFD_GET_PID_NAMESPACE` ioctl to get the pidns (#1713)
> - Improvements to the heuristics to translate a path in the sandbox to a
> path on
>   the host (#1571)
> - Improve the mocking of the GeoClue service (#1695)
> - Make the camera permissions per-App on the host again (#1762)
> - Clean up permissions and desktop IDs usage (#1772, #1773)
> - Improve PID translations for host Apps (#1785)
> - Show an appropriate error when access to remote documents fails (#823)
> - Require a valid AppID from apps in `RequestBackground` to enable
> autostart
>   (#1793)
> - Require a valid AppID from apps to use the Global Shortcuts Portal
> (#1817)
> - Test and document Notification Portal backward compatibilities (#1823)
> - Improve the heuristic to detect the App ID for host apps (#1595)
> - Add Merge Requirements documentation (#1775)
> - Initialize the Secret Portal asynchronously to avoid blocking when the
> secret
>   service is not available (#1814)
> - Do not allow requesting a zero capability from the Input Capture Portal
>   (#1880)
> - Require GLib version 2.76 and drop the related compatibility code (#173=
0)
>
> Bug Fixes:
>
> - Fix a crash when loading information from Flatpak apps (#1720)
> - Fix fd handling to prevent EBADF errors (#1721)
> - Add a fallback code path for GLib older than 2.76 (#1728)
> - Don't require a .desktop file for Flatpak and Snap apps (#1729)
> - Fix a crash when calling `GlobalShortcuts.BindShortcuts` with an empty
> list
>   (#1732)
> - Fix a crash when passing Request token handles which contain `-` (#1748=
)
> - Fix tests on systems without access to /proc/cmdline (#1766)
> - Stop accidentally running pytests of subprojects (#1767)
> - Give up trying to unmount an existing fuse mount when shutting down the
>   Document Portal (#1799)
> - Fix compilation on Debian Testing, caused by a wrong cast (#1625)
> - Fix ownership of pidfd for XdpAppInfos (#1810)
> - Fix uninitialized variables (#1825)
> - Do not give access to read-only USB devices when read-write access was
>   requested (#1794)
> - Do not kill PID 0 and handle races properly (#1864)
> - Fix forwarding the `available-source-types` and `available-cursor-modes=
`
> from
>   the backend (#1868)
> - Ensure valid WAYLAND_DISPLAY/DISPLAY by launching after the graphical
> session
>   target (#1830)
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-desktop-portal_1.20.3.bb =3D> xdg-desktop-portal_1.21.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/xdg-desktop-portal/{
> xdg-desktop-portal_1.20.3.bb =3D> xdg-desktop-portal_1.21.0.bb} (93%)
>
> diff --git a/meta-oe/recipes-support/xdg-desktop-portal/
> xdg-desktop-portal_1.20.3.bb b/meta-oe/recipes-support/xdg-desktop-portal=
/
> xdg-desktop-portal_1.21.0.bb
> similarity index 93%
> rename from meta-oe/recipes-support/xdg-desktop-portal/
> xdg-desktop-portal_1.20.3.bb
> rename to meta-oe/recipes-support/xdg-desktop-portal/
> xdg-desktop-portal_1.21.0.bb
> index e0aca558fd..cb34441f81 100644
> --- a/meta-oe/recipes-support/xdg-desktop-portal/
> xdg-desktop-portal_1.20.3.bb
> +++ b/meta-oe/recipes-support/xdg-desktop-portal/
> xdg-desktop-portal_1.21.0.bb
> @@ -27,11 +27,11 @@ RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKEND=
S}
> fuse3-utils"
>  inherit meson pkgconfig python3native features_check
>
>  SRC_URI =3D " \
> -       git://
> github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=3Dxdg-d=
esktop-portal-1.20
> \
> +       git://
> github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=3Dmain;=
tag=3D${PV}
> <http://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dmain;tag=3D$%7BPV%7D>
> \
>         file://0001-meson.build-add-a-hack-for-crosscompile.patch \
>  "
>
> -SRCREV =3D "23a76c392170dbbd26230f85ef56c3a57e52b857"
> +SRCREV =3D "d49f4cb0ea1d6ddc02949a9631626668cd7fc4fc"
>
>  FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125792):
> https://lists.openembedded.org/g/openembedded-devel/message/125792
> Mute This Topic: https://lists.openembedded.org/mt/118544591/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002365d5064e0b5618
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">isn&#39;t 1.21 a pre-release and perhaps wait for 1.22 to =
come out ?</div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 27, 2026 at 5:23=E2=80=AFPM Mar=
kus Volk via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-=
online.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">New Features:<br>
<br>
- Add the `has_current_page` and `has_selected_pages` options to the Print<=
br>
=C2=A0 Portal (#1777)<br>
- Allow running the tests with Valgrind&#39;s memcheck (#1770)<br>
- Add the `ConfigureShortcuts` method to the Global Shortcuts Portal (#1661=
)<br>
- Send activation tokens in the actiavated and deactiavated signals on the<=
br>
=C2=A0 Global Shortcuts Portal (#1792)<br>
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
=C2=A0 #1786, #1787, #1789, #1797, #1800, #1801, #1802, #1811, #1833, #1826=
,<br>
=C2=A0 #1852, #1841, #1843, #1851, #1869, #1860, #1788)<br>
- Improve various permission dialog texts (#1769, #1327, #1804)<br>
- Release procedure clarifications (#1710, #1714)<br>
- Updates to ASAN suppressions (#1711)<br>
- Make XdpAppInfo more testable (#1627)<br>
- Use the new `PIDFD_GET_PID_NAMESPACE` ioctl to get the pidns (#1713)<br>
- Improvements to the heuristics to translate a path in the sandbox to a pa=
th on<br>
=C2=A0 the host (#1571)<br>
- Improve the mocking of the GeoClue service (#1695)<br>
- Make the camera permissions per-App on the host again (#1762)<br>
- Clean up permissions and desktop IDs usage (#1772, #1773)<br>
- Improve PID translations for host Apps (#1785)<br>
- Show an appropriate error when access to remote documents fails (#823)<br=
>
- Require a valid AppID from apps in `RequestBackground` to enable autostar=
t<br>
=C2=A0 (#1793)<br>
- Require a valid AppID from apps to use the Global Shortcuts Portal (#1817=
)<br>
- Test and document Notification Portal backward compatibilities (#1823)<br=
>
- Improve the heuristic to detect the App ID for host apps (#1595)<br>
- Add Merge Requirements documentation (#1775)<br>
- Initialize the Secret Portal asynchronously to avoid blocking when the se=
cret<br>
=C2=A0 service is not available (#1814)<br>
- Do not allow requesting a zero capability from the Input Capture Portal<b=
r>
=C2=A0 (#1880)<br>
- Require GLib version 2.76 and drop the related compatibility code (#1730)=
<br>
<br>
Bug Fixes:<br>
<br>
- Fix a crash when loading information from Flatpak apps (#1720)<br>
- Fix fd handling to prevent EBADF errors (#1721)<br>
- Add a fallback code path for GLib older than 2.76 (#1728)<br>
- Don&#39;t require a .desktop file for Flatpak and Snap apps (#1729)<br>
- Fix a crash when calling `GlobalShortcuts.BindShortcuts` with an empty li=
st<br>
=C2=A0 (#1732)<br>
- Fix a crash when passing Request token handles which contain `-` (#1748)<=
br>
- Fix tests on systems without access to /proc/cmdline (#1766)<br>
- Stop accidentally running pytests of subprojects (#1767)<br>
- Give up trying to unmount an existing fuse mount when shutting down the<b=
r>
=C2=A0 Document Portal (#1799)<br>
- Fix compilation on Debian Testing, caused by a wrong cast (#1625)<br>
- Fix ownership of pidfd for XdpAppInfos (#1810)<br>
- Fix uninitialized variables (#1825)<br>
- Do not give access to read-only USB devices when read-write access was<br=
>
=C2=A0 requested (#1794)<br>
- Do not kill PID 0 and handle races properly (#1864)<br>
- Fix forwarding the `available-source-types` and `available-cursor-modes` =
from<br>
=C2=A0 the backend (#1868)<br>
- Ensure valid WAYLAND_DISPLAY/DISPLAY by launching after the graphical ses=
sion<br>
=C2=A0 target (#1830)<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...-<a href=3D"http://desktop-portal_1.20.3.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">desktop-portal_1.20.3.bb</a> =3D&gt; <a href=3D"http://xdg-=
desktop-portal_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank">xdg-desktop-=
portal_1.21.0.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/xdg-desktop-portal/{<a href=3D"http://=
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
@@ -27,11 +27,11 @@ RDEPENDS:${PN} =3D &quot;bubblewrap rtkit ${PORTAL_BACK=
ENDS} fuse3-utils&quot;<br>
=C2=A0inherit meson pkgconfig python3native features_check<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/flatpak/xdg-=
desktop-portal.git;protocol=3Dhttps;branch=3Dxdg-desktop-portal-1.20" rel=
=3D"noreferrer" target=3D"_blank">github.com/flatpak/xdg-desktop-portal.git=
;protocol=3Dhttps;branch=3Dxdg-desktop-portal-1.20</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/flatpak/xdg-=
desktop-portal.git;protocol=3Dhttps;branch=3Dmain;tag=3D$%7BPV%7D" rel=3D"n=
oreferrer" target=3D"_blank">github.com/flatpak/xdg-desktop-portal.git;prot=
ocol=3Dhttps;branch=3Dmain;tag=3D${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson.build-add-a-hack-for-crosscom=
pile.patch \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;23a76c392170dbbd26230f85ef56c3a57e52b857&quot;<br>
+SRCREV =3D &quot;d49f4cb0ea1d6ddc02949a9631626668cd7fc4fc&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot;${libdir}/systemd ${datadir}/dbus-1&quot;<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125792): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125792" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125792</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118544591/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118544591/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002365d5064e0b5618--

