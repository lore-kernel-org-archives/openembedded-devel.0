Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02219C531D0
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 15:42:31 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.410.1784994145416144386
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2026 08:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IDEMfaoE;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664ce3000e6so1165104d50.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2026 08:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784994144; cv=none;
        d=google.com; s=arc-20260327;
        b=exEqkffioISaYm1fmMygMcwe96IGTVTQ2ZurVwHbwwlN/5FD9UzImnqpAKU0sp7lDo
         AAM6CA7zSgqEWLgz9Km1xIuSKzUKNtnLWwu/p3bGMcYctN+CblZz6S/lErwVXaH2W70F
         RcLRxJ/XS5VR9enndS+70hAScXJprTxAFgHo5CBqgSP1gl1V1meTEioFcy/zUQEO+pay
         bB9+Qd6xFmOF8cbe+j6Zc1RPBJpaueGV3/vGwvg7I8hJzdIgw2MXFWweGx6T6wVIyp+g
         qBIMigHQK0nidXP2rp14duuHGwUlySim6b9My4VJZpwMMyf/o65kDog901OQPfvK3VMS
         wB+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HwzBhNEIbVFQOj2oUTatNI2uAffMOiNwtRvxA/FcZUM=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=OPftHbegEnAvh1Xuwog+GdLVIcbSdSYxnPGu3TS6hfCPbYl8lfxNNkasLvCcVffV38
         IJ6O292JGvyqxCI/Zg4kK5kKSTXceIjIDCK0tZNz4Ipppm7MYRu0GITf2TtKOsJnS2QQ
         YHuhV/PQKBecLa1lZv+K3MExJ5WTB8Owhp0vvhYENx1vdcewDsoRo0gfuN51hpMxrxAK
         v8LcYy153pavvzcSJF9WwF1LoyeXldcw9aylXhK8gQAq5PbQJ8hDBbkKVsu21hsfqjti
         UlxFKYcp0KBt+7WrikHp1x2LuIqg+PtC+2HILAxbeOMsp3N1ybGfb5Av7A5AinNkh4gS
         112w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784994144; x=1785598944; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HwzBhNEIbVFQOj2oUTatNI2uAffMOiNwtRvxA/FcZUM=;
        b=IDEMfaoEuxecyeP/K9LAq8WMOS84E+IIsPYOPiCZvi525Lka7WbW2jgS3Ys73o/O0v
         EITwgqS/VYBtKCY27OWo1T0YPzguYQrE42E846WZBitZ4PNf5GEMqxWVRqma7aOabMyf
         IUpWYJZd101Wp8vYxrfeNGKyJ+1heAgzYuvw87OFmYA1u3q/Uw6TAsrJ+EQ6c+9SQUtx
         p4MHeuizHWAzRu+a1Jj8w5M9uus7tXkbDmuvXyEBOFHFCyW4WUaK5tyJwXVXzV9iwKOI
         VLi/1t7asL8OQz+6YSiE9Uwwy/0MMSXRPQWY3p2RzHHeGbkyA+CkH4ZejxiJHUfBmlUo
         SXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784994144; x=1785598944;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HwzBhNEIbVFQOj2oUTatNI2uAffMOiNwtRvxA/FcZUM=;
        b=Q4QhTu7kPopKls6UZ+PQXdxV1ukYH5avdKu8+OqvWX6QPa7fpsfFRnjcB/0tNB5ujg
         mwLFn3vRqMHTTZeOBcGzRGsxscutQaatdrbeddIDQ1Qr3cBbgSvsB3971rKj+eM2vPGb
         Dxma2fFYgIa+VMARadvG4smVrXT2VyaPvsZ/XAwvQugovSZPh+7ceH74qnv76Gmo5XaO
         fGa0diDhYWS1poywW4thw/WaAySM8NcS+r3ytX5aAAwp94E835u8NFffIIVkPCOO1Tbf
         JvH1Af//XstE394ZlxNHEmBxN6YsFPavsMkEJvKwKdSZ9mP4sDBpbKKbqpFErSkbErfa
         3DHw==
X-Gm-Message-State: AOJu0Yw4yX7FkVU/RaDuLnJuAoJW1VAUXGewhOXhMW/Ymn5emlgjL5iH
	W1ScVmyved7hyLoFKo1Ym/7RtxpMGrNKAXj7s0n8bzJ3bwswtDZuumtaCYUsuEmDWPcoHW2i/oO
	btnN3Q3//lZA5Jy7G6VDpOQ85ToGvMDE=
X-Gm-Gg: AR+sD10A8+wntxk6aNxncsPF8CBcl+aIMHTQ4cEFJwJTkkU6OqmzWWc+LPbWB8h2Gmi
	zZZXjja/ti2t7s4fXflCcUq+ypMraqp1VhRvoI2/s5ZJP82jy2Lbf0oNHkHnn4yrQuydz/h5qE1
	+i5srF7LEfIS6HNFTvGMXjMQ8gn2hij945XOOj9SZiADcgHlsn0eeNbC/6Fx1tQot0T3DCW8QmJ
	V/OVhiCXg+5OL0/sWD0dT1ucPScMJOlqQrh9esap3E1kSP8DB3Sm2ReoBPb2l7eyvYk8vENbEHJ
	RnuJCdqXw50L0+AkP55GYAMSUO+MICPG47i05iP4IFfE8rKUQ8RQwH+lCWUesHgnT4LOCu0VFfk
	uWtSfZSh4qBtpiJJC6hARw8P1KAPcZKIksaeISs7966imeVh3G4o7EIMR9HJ5
X-Received: by 2002:a53:d0d2:0:b0:668:8c1f:f28a with SMTP id
 956f58d0204a3-668c7c0e6d6mr456430d50.75.1784994144165; Sat, 25 Jul 2026
 08:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260725094508.166565-1-f_l_k@t-online.de>
In-Reply-To: <20260725094508.166565-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Jul 2026 08:41:57 -0700
X-Gm-Features: AUfX_mzFTlR0nCWuJuIr133l-Z3YMA96gUUTe-9D81m7gYTsHWp9a_bG0CjpR4c
Message-ID: <CAMKF1spW8hp-e_TJQvX4v9T5nDx7P7thJ97ZNFXHZNEP6h2PRw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] malcontent: update 1.13.1 -> 1.14.0
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e3a44006577155b2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2026 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128446

--000000000000e3a44006577155b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 2:45=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> - add missing dependencies
> - fetch missing subprojects
> - LIC_FILES_CHKSUM has changed but LICENSE is still LGPL-2.1
>
> Overview of changes in malcontent 0.14.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * Bugs fixed:
>   - #89 After reworking user selector and navigation, removing currently
> viewed
>     users isn't handled (Philip Withnall)
>   - #101 Integrate NSS web filtering module in flatpak (Philip Withnall)
>   - #122 Allow viewing screen time usage when using malcontent-control as=
 a
>     child user (Philip Withnall)
>   - #129 Hide level bar if there=E2=80=99s no data available yet
>   - #133 EstimatedTimesChanged signal is not emitted after a screen time
>     extension request is granted (Philip Withnall)
>   - !292 docs: Add diagram and some more notes to screen time design
> document
>   - !293 malcontent-client: Improve some error messages for invalid comma=
nd
>     lines
>   - !294 build: Post-release version bump
>   - !295 po: Fix a few localisation problems
>   - !296 Update Chinese translation
>   - !297 docs: Add a diagram of web filtering IPC
>   - !298 Update Czech translation
>   - !299 updated ru.po
>   - !300 Replace sl.po with translation update
>   - !305 Update Czech translation
>   - !306 Update Chinese translation
>   - !307 Update Georgian translation
>   - !309 Update Slovenian (sl) translation
>   - !311 build: Use system libcdb library if available
>   - !312 malcontent-webd-update/tests: Only install webd template if test=
s
> are
>     installed
>   - !314 nss/tests/nss-objdump: Also allow linker library
>   - !315 Update Swedish translation
>   - !316 build/ci: Minor cleanups related to docs
>   - !317 Update Kazakh translation
>
> * Translation updates:
>   - Chinese (China) (lumingzh)
>   - Czech (AsciiWolf)
>   - Georgian (NorwayFun)
>   - Kazakh (Baurzhan Muftakhidinov)
>   - Russian (Ser82-png)
>   - Slovenian (filmsi)
>   - Swedish (Anders Jonsson)
>
> Overview of changes in malcontent 0.14.alpha
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * This is an unstable development release previewing some new features; a
> lot of
>   things have changed around, so it=E2=80=99s expected that there may be =
some
> packaging
>   issues; please file an issue on
>   https://gitlab.freedesktop.org/pwithnall/malcontent/-/issues if so
>
> * Add developer API documentation
>
> * Refresh UI
>
> * Add support for screen time limits
>
> * Add backend for web filtering
>
> * Bugs fixed:
>   - #2 Build developer documentation (Philip Withnall)
>   - #73 Updated sl.po translationn
>   - #74 Add family API (Philip Withnall)
>   - #75 Ensure MctSessionLimits can do daily time limit and bedtime
> schedule
>     (Philip Withnall)
>   - #76 Add org.freedesktop.MalcontentTimer1.Parent API for querying chil=
d
>     computer usage (Philip Withnall)
>   - #80 Refresh UI for unlock page
>   - #81 Rework user selector
>   - #83 Add screen time subpage with basic screen limits options
>   - #84 Add screen time chart
>   - #88 Implement NSS web filtering module and filter list daemon (Philip
>     Withnall)
>   - #91 Port documentation comments to gi-docgen format
>   - #95 Build sysext image in CI for integration testing with gnome-shell
>     (Philip Withnall)
>   - #96 Selecting username from commandline fails (Ignacy Kuchci=C5=84ski=
)
>   - #97 Add org.freedesktop.MalcontentTimer1.Child API for extending a
> child=E2=80=99s
>     session time (Philip Withnall)
>   - #98 After adding screen time subpage, the previous value of
> bedtime/screen
>     limit are not preserved (Philip Withnall)
>   - #100 Bump the app copyright date (Philip Withnall)
>   - #102 Add tests for filter list parsing code in malcontent-webd (Phili=
p
>     Withnall)
>   - #107 Follow-up from "Add screen time chart"
>   - #109 Set a default daily screen time limit value
>   - #110 Show logged-in child accounts in the parental controls applicati=
on
>   - #111 Screen time summary level bar overflows
>   - #112 Fix assertion when closing the application (Philip Withnall)
>   - #113 Investigate gtklevelbar breaking
>   - #115 Improve documentation of the malcontent-client record-usage
> command
>     (Philip Withnall)
>   - #117 Emit EstimatedTimesChanged signal from malcontent-timerd if
> session
>     limits settings change (Philip Withnall)
>   - #118 Malcontent-timerd daemon error on GNOME OS child account login
> (Philip
>     Withnall)
>   - #119 Fix duration picker breaking in 12-hour clock mode
>   - #120 Update Turkish translation
>   - !189 build: Post-release version bump
>   - !190 Bulgarian translation by kraftwerk
>   - !191 malcontent-control: Port about dialog to AdwAboutDialog
>   - !192 ci: Add various linting tests for shell and Python
>   - !193 malcontent-client: Add support for setting a session limit polic=
y
>   - !194 Improve REUSE license/copyright tagging somewhat
>   - !195 Update Georgian translation
>   - !196 malcontent-timerd: Add initial implementation of timer daemon
>   - !197 po: Add new malcontent-timerd files to POTFILES.in
>   - !198 updated ru.po
>   - !200 ui: Fix wrong a11y role in button
>   - !202 nss: Add a new libnss_malcontent.so.2 NSS module for web filteri=
ng
>   - !204 libmalcontent: Add web filtering settings storage and API
>   - !205 malcontent-client: Add {get,set}-web-filter commands
>   - !210 Add icons to libmalcontent-ui gresources
>   - !211 docs: Add Code of Conduct
>   - !213 Add missing mct_session_limits_equal() and mct_web_filter_equal(=
)
>     functions
>   - !214 manager: Rework change notification from AccountsService and
> support
>     notification for session limits and web filters
>   - !215 Various minor type and terminology fixes
>   - !216 user-selector: Factor out getuid() calls into a :current-user
> property
>   - !217 Fix icons in dark theme
>   - !218 tools: Add a sysext build tool
>   - !219 malcontent-control: Add D-Bus service file
>   - !220 malcontent-control: Change component type to "desktop-applicatio=
n"
>   - !221 accounts-service: Make extension symlinks relative
>   - !222 Handle external changes to users and settings
>   - !224 Fix waiting asynchronously for user manager
>   - !225 malcontent-webd: Add initial implementation of web filtering
> daemon
>   - !226 Adjust malcontent-timer for shell integration
>   - !227 po: Add missing files to POTFILES.in
>   - !228 Replace sl.po; this is the updated translation (100%).
>   - !229 nss: Add unit tests for NSS module
>   - !230 Update of sl.po
>   - !231 malcontent-timer: Remove an invalid attribute from a D-Bus XML
> file
>   - !232 tests: Add test for the sandboxing of malcontent-webd.service an=
d
>     malcontent-timerd.service
>   - !233 Update Czech translation
>   - !235 Malcontent client improvements
>   - !236 Update Polish translation 250828
>   - #83 Add screen time subpage with basic screen limits options
>   - #84 Add screen time chart
>   - #88 Implement NSS web filtering module and filter list daemon (Philip
>     Withnall)
>   - #91 Port documentation comments to gi-docgen format
>   - #95 Build sysext image in CI for integration testing with gnome-shell
>     (Philip Withnall)
>   - #96 Selecting username from commandline fails (Ignacy Kuchci=C5=84ski=
)
>   - #97 Add org.freedesktop.MalcontentTimer1.Child API for extending a
> child=E2=80=99s
>     session time (Philip Withnall)
>   - #98 After adding screen time subpage, the previous value of
> bedtime/screen
>     limit are not preserved (Philip Withnall)
>   - #100 Bump the app copyright date (Philip Withnall)
>   - #102 Add tests for filter list parsing code in malcontent-webd (Phili=
p
>     Withnall)
>   - #107 Follow-up from "Add screen time chart"
>   - #109 Set a default daily screen time limit value
>   - #110 Show logged-in child accounts in the parental controls applicati=
on
>   - #111 Screen time summary level bar overflows
>   - #112 Fix assertion when closing the application (Philip Withnall)
>   - #113 Investigate gtklevelbar breaking
>   - #115 Improve documentation of the malcontent-client record-usage
> command
>     (Philip Withnall)
>   - #117 Emit EstimatedTimesChanged signal from malcontent-timerd if
> session
>     limits settings change (Philip Withnall)
>   - #118 Malcontent-timerd daemon error on GNOME OS child account login
> (Philip
>     Withnall)
>   - #119 Fix duration picker breaking in 12-hour clock mode
>   - #120 Update Turkish translation
>   - !189 build: Post-release version bump
>   - !190 Bulgarian translation by kraftwerk
>   - !191 malcontent-control: Port about dialog to AdwAboutDialog
>   - !192 ci: Add various linting tests for shell and Python
>   - !193 malcontent-client: Add support for setting a session limit polic=
y
>   - !194 Improve REUSE license/copyright tagging somewhat
>   - !195 Update Georgian translation
>   - !196 malcontent-timerd: Add initial implementation of timer daemon
>   - !197 po: Add new malcontent-timerd files to POTFILES.in
>   - !198 updated ru.po
>   - !200 ui: Fix wrong a11y role in button
>   - !202 nss: Add a new libnss_malcontent.so.2 NSS module for web filteri=
ng
>   - !204 libmalcontent: Add web filtering settings storage and API
>   - !205 malcontent-client: Add {get,set}-web-filter commands
>   - !210 Add icons to libmalcontent-ui gresources
>   - !211 docs: Add Code of Conduct
>   - !213 Add missing mct_session_limits_equal() and mct_web_filter_equal(=
)
>     functions
>   - !214 manager: Rework change notification from AccountsService and
> support
>     notification for session limits and web filters
>   - !215 Various minor type and terminology fixes
>   - !216 user-selector: Factor out getuid() calls into a :current-user
> property
>   - !217 Fix icons in dark theme
>   - !218 tools: Add a sysext build tool
>   - !219 malcontent-control: Add D-Bus service file
>   - !220 malcontent-control: Change component type to "desktop-applicatio=
n"
>   - !221 accounts-service: Make extension symlinks relative
>   - !222 Handle external changes to users and settings
>   - !224 Fix waiting asynchronously for user manager
>   - !225 malcontent-webd: Add initial implementation of web filtering
> daemon
>   - !226 Adjust malcontent-timer for shell integration
>   - !227 po: Add missing files to POTFILES.in
>   - !228 Replace sl.po; this is the updated translation (100%).
>   - !229 nss: Add unit tests for NSS module
>   - !230 Update of sl.po
>   - !231 malcontent-timer: Remove an invalid attribute from a D-Bus XML
> file
>   - !232 tests: Add test for the sandboxing of malcontent-webd.service an=
d
>     malcontent-timerd.service
>   - !233 Update Czech translation
>   - !235 Malcontent client improvements
>   - !236 Update Polish translation 250828
>   - !237 docs: Add web filtering design document
>   - !238 docs: Add a document about system integration (packaging)
>   - !240 Update Czech translation
>   - !241 malcontent-client: Fix --help output for set-web-filter subcomma=
nd
>   - !242 Calculate next session times in malcontent-timer
>   - !243 Update Czech translation
>   - !245 po: Add false positves to POTFILES.skip
>   - !246 Update Polish translation 250907
>   - !247 manager: Handle UnknownInterface error from AccountsService
>   - !249 Minor malcontent-webd fixes
>   - !251 docs: Mention the update-error file in malcontent-webd.8
>   - !252 libmalcontent-ui: Update documentation to use gi-docgen
>   - !254 docs: Add some reference links to screen time design document
>   - !255 Update Chinese translation
>   - !256 Update Slovenian translation
>   - !257 libmalcontent-timer: Retry queries if the timer store is busy
>   - !258 time-page: Prevent calling unref on a NULL pointer
>   - !259 malcontent-webd-update: Disable timeout when updating filters
>   - !260 malcontent-webd: Relax UMask in service file
>   - !261 Update Czech translation
>   - !262 po: Add missing file to POTFILES.in
>   - !263 Update Chinese translation
>   - !264 build: Use exposed interfaces directory
>   - !265 libmalcontent-ui: Add missing gir include path
>   - !266 Minor fixes for malcontent-control
>   - !268 Replace sl.po with translation update.
>   - !269 Russian translation updated
>   - !270 Update Czech translation
>   - !271 Update Chinese translation
>   - !272 Updated RU against most recent pot
>   - !273 Statically link libgsystemservice
>   - !274 Various minor fixes and build system tests
>   - !277 l10n: Replace sl.po (Slovenian)
>   - !279 Update Swedish translation
>   - !282 tests: Add unit tests for `MctExtensionAgentObject`
>   - !286 libmalcontent: Port remaining doc comments to gi-docgen format
>   - !289 malcontent-control: Fix a crash when quitting just after making
> changes
>   - !291 po: Update Bulgarian translation
>
> * Translation updates:
>   - Bulgarian (twlvnn, twlvnn kraftwerk)
>   - Chinese (China) (lumingzh)
>   - Czech (AsciiWolf)
>   - Georgian (NorwayFun)
>   - Polish (Piotr Dr=C4=85g)
>   - Russian (Julia Dronova, Ser82-png)
>   - Slovenian (filmsi, Martin Srebotnjak)
>   - Swedish (Anders Jonsson)
>   - Turkish (Sabri =C3=9Cnal)
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-gnome/malcontent/malcontent-ui.bb |  4 ++--
>  .../recipes-gnome/malcontent/malcontent.bb    | 16 +++++++-------
>  .../recipes-gnome/malcontent/malcontent.inc   | 21 ++++++++++++++++---
>  3 files changed, 29 insertions(+), 12 deletions(-)
>
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
> b/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
> index 8630822939..d0a975a457 100644
> --- a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
> @@ -1,7 +1,5 @@
>  SUMMARY =3D "User-Interface for malcontent."
>  HOMEPAGE =3D "https://gitlab.freedesktop.org/pwithnall/malcontent"
> -LICENSE =3D "LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
>
>  require malcontent.inc
>
> @@ -20,6 +18,8 @@ DEPENDS +=3D " \
>         flatpak \
>         libadwaita \
>         gtk4 \
> +       gi-docgen-native \
> +       gnome-desktop \
>  "
>
>  GIR_MESON_OPTION =3D ""
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.bb
> b/meta-oe/recipes-gnome/malcontent/malcontent.bb
> index 9da95329a8..579b0f6ffe 100644
> --- a/meta-oe/recipes-gnome/malcontent/malcontent.bb
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent.bb
> @@ -1,7 +1,5 @@
>  SUMMARY =3D "malcontent implements support for restricting the type of
> content."
>  HOMEPAGE =3D "https://gitlab.freedesktop.org/pwithnall/malcontent"
> -LICENSE =3D "LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
>
>  require malcontent.inc
>
> @@ -13,6 +11,8 @@ DEPENDS =3D " \
>         itstool-native \
>         libpam \
>         polkit \
> +       gi-docgen-native \
>

why not inherit gi-docgen class here.


> +       libsoup \
>  "
>
>  GIR_MESON_OPTION =3D ""
> @@ -27,9 +27,11 @@ PACKAGECONFIG[ui] =3D ",,,malcontent-ui"
>  EXTRA_OEMESON =3D "-Dui=3Ddisabled -Dpamlibdir=3D${base_libdir}/security=
"
>
>  FILES:${PN} +=3D " \
> -       ${base_libdir}/security/pam_malcontent.so \
> -       ${datadir}/accountsservice \
> -       ${datadir}/help \
> -       ${datadir}/dbus-1 \
> -       ${datadir}/polkit-1 \
> +    ${nonarch_libdir}/sysusers.d \
> +    ${systemd_system_unitdir} \
> +    ${base_libdir}/security/pam_malcontent.so \
> +    ${datadir}/accountsservice \
> +    ${datadir}/help \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/polkit-1 \
>  "
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.inc
> b/meta-oe/recipes-gnome/malcontent/malcontent.inc
> index 7cb052d69c..de5da10193 100644
> --- a/meta-oe/recipes-gnome/malcontent/malcontent.inc
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent.inc
> @@ -1,3 +1,18 @@
> -SRC_URI =3D "git://
> gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=3Dhttps;branch=
=3Dmalcontent-0.13
> "
> -SRCREV =3D "090042fec5181621e2fd8cfef9fc446ed86db98b"
> -PV =3D "0.13.1"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D310c7c93cf5181c6b0cc8229a1f3c=
6f6"
> +
> +SRC_URI =3D "git://
> gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=3Dhttps;nobranch=
=3D1;tag=3D${PV};name=3Dmalcontent
> <http://gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=3Dhttps;=
nobranch=3D1;tag=3D$%7BPV%7D;name=3Dmalcontent>
> "
> +SRC_URI +=3D "git://
> gitlab.gnome.org/pwithnall/libgsystemservice.git;name=3Dlibgsystemservice=
;subdir=3D${S}/subprojects/libgsystemservice;protocol=3Dhttps;nobranch=3D1
> <http://gitlab.gnome.org/pwithnall/libgsystemservice.git;name=3Dlibgsyste=
mservice;subdir=3D$%7BS%7D/subprojects/libgsystemservice;protocol=3Dhttps;n=
obranch=3D1>
> "
> +SRC_URI +=3D "git://
> gitlab.gnome.org/GNOME/gvdb.git;protocol=3Dhttps;subdir=3D${S}/subproject=
s/gvdb;name=3Dgvdb;nobranch=3D1
> <http://gitlab.gnome.org/GNOME/gvdb.git;protocol=3Dhttps;subdir=3D$%7BS%7=
D/subprojects/gvdb;name=3Dgvdb;nobranch=3D1>
> "
> +SRC_URI +=3D "
> https://www.corpit.ru/mjt/tinycdb/tinycdb-0.81.tar.gz;subdir=3D${S}/subpr=
ojects;name=3Dtinycdb
> "
> +SRCREV_malcontent =3D "d28f6635359d02d1068d8b21fb5810e5074b7903"
> +SRCREV_libgsystemservice =3D "f4c5764652b5f347347b459ee011e4f02b29c3a0"
> +SRCREV_gvdb =3D "466fc22016cf0981424e7121557611942191992f"
> +SRC_URI[tinycdb.sha256sum] =3D
> "469de2d445bf54880f652f4b6dc95c7cdf6f5502c35524a45b2122d70d47ebc2"
> +SRCREV_FORMAT =3D "malcontent"
> +
> +PV =3D "0.14.0"
>

I think this should be reflected in the name of recipe itself.


> +
> +do_configure:prepend() {
> +    cp ${S}/subprojects/packagefiles/tinycdb/meson.build
> ${S}/subprojects/tinycdb-0.81
> +}
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128445):
> https://lists.openembedded.org/g/openembedded-devel/message/128445
> Mute This Topic: https://lists.openembedded.org/mt/120438102/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e3a44006577155b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 25,=
 2026 at 2:45=E2=80=AFAM Markus Volk via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.d=
e@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">- add missing d=
ependencies<br>
- fetch missing subprojects<br>
- LIC_FILES_CHKSUM has changed but LICENSE is still LGPL-2.1<br>
<br>
Overview of changes in malcontent 0.14.0<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
* Bugs fixed:<br>
=C2=A0 - #89 After reworking user selector and navigation, removing current=
ly viewed<br>
=C2=A0 =C2=A0 users isn&#39;t handled (Philip Withnall)<br>
=C2=A0 - #101 Integrate NSS web filtering module in flatpak (Philip Withnal=
l)<br>
=C2=A0 - #122 Allow viewing screen time usage when using malcontent-control=
 as a<br>
=C2=A0 =C2=A0 child user (Philip Withnall)<br>
=C2=A0 - #129 Hide level bar if there=E2=80=99s no data available yet<br>
=C2=A0 - #133 EstimatedTimesChanged signal is not emitted after a screen ti=
me<br>
=C2=A0 =C2=A0 extension request is granted (Philip Withnall)<br>
=C2=A0 - !292 docs: Add diagram and some more notes to screen time design d=
ocument<br>
=C2=A0 - !293 malcontent-client: Improve some error messages for invalid co=
mmand<br>
=C2=A0 =C2=A0 lines<br>
=C2=A0 - !294 build: Post-release version bump<br>
=C2=A0 - !295 po: Fix a few localisation problems<br>
=C2=A0 - !296 Update Chinese translation<br>
=C2=A0 - !297 docs: Add a diagram of web filtering IPC<br>
=C2=A0 - !298 Update Czech translation<br>
=C2=A0 - !299 updated ru.po<br>
=C2=A0 - !300 Replace sl.po with translation update<br>
=C2=A0 - !305 Update Czech translation<br>
=C2=A0 - !306 Update Chinese translation<br>
=C2=A0 - !307 Update Georgian translation<br>
=C2=A0 - !309 Update Slovenian (sl) translation<br>
=C2=A0 - !311 build: Use system libcdb library if available<br>
=C2=A0 - !312 malcontent-webd-update/tests: Only install webd template if t=
ests are<br>
=C2=A0 =C2=A0 installed<br>
=C2=A0 - !314 nss/tests/nss-objdump: Also allow linker library<br>
=C2=A0 - !315 Update Swedish translation<br>
=C2=A0 - !316 build/ci: Minor cleanups related to docs<br>
=C2=A0 - !317 Update Kazakh translation<br>
<br>
* Translation updates:<br>
=C2=A0 - Chinese (China) (lumingzh)<br>
=C2=A0 - Czech (AsciiWolf)<br>
=C2=A0 - Georgian (NorwayFun)<br>
=C2=A0 - Kazakh (Baurzhan Muftakhidinov)<br>
=C2=A0 - Russian (Ser82-png)<br>
=C2=A0 - Slovenian (filmsi)<br>
=C2=A0 - Swedish (Anders Jonsson)<br>
<br>
Overview of changes in malcontent 0.14.alpha<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
* This is an unstable development release previewing some new features; a l=
ot of<br>
=C2=A0 things have changed around, so it=E2=80=99s expected that there may =
be some packaging<br>
=C2=A0 issues; please file an issue on<br>
=C2=A0 <a href=3D"https://gitlab.freedesktop.org/pwithnall/malcontent/-/iss=
ues" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/pw=
ithnall/malcontent/-/issues</a> if so<br>
<br>
* Add developer API documentation<br>
<br>
* Refresh UI<br>
<br>
* Add support for screen time limits<br>
<br>
* Add backend for web filtering<br>
<br>
* Bugs fixed:<br>
=C2=A0 - #2 Build developer documentation (Philip Withnall)<br>
=C2=A0 - #73 Updated sl.po translationn<br>
=C2=A0 - #74 Add family API (Philip Withnall)<br>
=C2=A0 - #75 Ensure MctSessionLimits can do daily time limit and bedtime sc=
hedule<br>
=C2=A0 =C2=A0 (Philip Withnall)<br>
=C2=A0 - #76 Add org.freedesktop.MalcontentTimer1.Parent API for querying c=
hild<br>
=C2=A0 =C2=A0 computer usage (Philip Withnall)<br>
=C2=A0 - #80 Refresh UI for unlock page<br>
=C2=A0 - #81 Rework user selector<br>
=C2=A0 - #83 Add screen time subpage with basic screen limits options<br>
=C2=A0 - #84 Add screen time chart<br>
=C2=A0 - #88 Implement NSS web filtering module and filter list daemon (Phi=
lip<br>
=C2=A0 =C2=A0 Withnall)<br>
=C2=A0 - #91 Port documentation comments to gi-docgen format<br>
=C2=A0 - #95 Build sysext image in CI for integration testing with gnome-sh=
ell<br>
=C2=A0 =C2=A0 (Philip Withnall)<br>
=C2=A0 - #96 Selecting username from commandline fails (Ignacy Kuchci=C5=84=
ski)<br>
=C2=A0 - #97 Add org.freedesktop.MalcontentTimer1.Child API for extending a=
 child=E2=80=99s<br>
=C2=A0 =C2=A0 session time (Philip Withnall)<br>
=C2=A0 - #98 After adding screen time subpage, the previous value of bedtim=
e/screen<br>
=C2=A0 =C2=A0 limit are not preserved (Philip Withnall)<br>
=C2=A0 - #100 Bump the app copyright date (Philip Withnall)<br>
=C2=A0 - #102 Add tests for filter list parsing code in malcontent-webd (Ph=
ilip<br>
=C2=A0 =C2=A0 Withnall)<br>
=C2=A0 - #107 Follow-up from &quot;Add screen time chart&quot;<br>
=C2=A0 - #109 Set a default daily screen time limit value<br>
=C2=A0 - #110 Show logged-in child accounts in the parental controls applic=
ation<br>
=C2=A0 - #111 Screen time summary level bar overflows<br>
=C2=A0 - #112 Fix assertion when closing the application (Philip Withnall)<=
br>
=C2=A0 - #113 Investigate gtklevelbar breaking<br>
=C2=A0 - #115 Improve documentation of the malcontent-client record-usage c=
ommand<br>
=C2=A0 =C2=A0 (Philip Withnall)<br>
=C2=A0 - #117 Emit EstimatedTimesChanged signal from malcontent-timerd if s=
ession<br>
=C2=A0 =C2=A0 limits settings change (Philip Withnall)<br>
=C2=A0 - #118 Malcontent-timerd daemon error on GNOME OS child account logi=
n (Philip<br>
=C2=A0 =C2=A0 Withnall)<br>
=C2=A0 - #119 Fix duration picker breaking in 12-hour clock mode<br>
=C2=A0 - #120 Update Turkish translation<br>
=C2=A0 - !189 build: Post-release version bump<br>
=C2=A0 - !190 Bulgarian translation by kraftwerk<br>
=C2=A0 - !191 malcontent-control: Port about dialog to AdwAboutDialog<br>
=C2=A0 - !192 ci: Add various linting tests for shell and Python<br>
=C2=A0 - !193 malcontent-client: Add support for setting a session limit po=
licy<br>
=C2=A0 - !194 Improve REUSE license/copyright tagging somewhat<br>
=C2=A0 - !195 Update Georgian translation<br>
=C2=A0 - !196 malcontent-timerd: Add initial implementation of timer daemon=
<br>
=C2=A0 - !197 po: Add new malcontent-timerd files to POTFILES.in<br>
=C2=A0 - !198 updated ru.po<br>
=C2=A0 - !200 ui: Fix wrong a11y role in button<br>
=C2=A0 - !202 nss: Add a new libnss_malcontent.so.2 NSS module for web filt=
ering<br>
=C2=A0 - !204 libmalcontent: Add web filtering settings storage and API<br>
=C2=A0 - !205 malcontent-client: Add {get,set}-web-filter commands<br>
=C2=A0 - !210 Add icons to libmalcontent-ui gresources<br>
=C2=A0 - !211 docs: Add Code of Conduct<br>
=C2=A0 - !213 Add missing mct_session_limits_equal() and mct_web_filter_equ=
al()<br>
=C2=A0 =C2=A0 functions<br>
=C2=A0 - !214 manager: Rework change notification from AccountsService and =
support<br>
=C2=A0 =C2=A0 notification for session limits and web filters<br>
=C2=A0 - !215 Various minor type and terminology fixes<br>
=C2=A0 - !216 user-selector: Factor out getuid() calls into a :current-user=
 property<br>
=C2=A0 - !217 Fix icons in dark theme<br>
=C2=A0 - !218 tools: Add a sysext build tool<br>
=C2=A0 - !219 malcontent-control: Add D-Bus service file<br>
=C2=A0 - !220 malcontent-control: Change component type to &quot;desktop-ap=
plication&quot;<br>
=C2=A0 - !221 accounts-service: Make extension symlinks relative<br>
=C2=A0 - !222 Handle external changes to users and settings<br>
=C2=A0 - !224 Fix waiting asynchronously for user manager<br>
=C2=A0 - !225 malcontent-webd: Add initial implementation of web filtering =
daemon<br>
=C2=A0 - !226 Adjust malcontent-timer for shell integration<br>
=C2=A0 - !227 po: Add missing files to POTFILES.in<br>
=C2=A0 - !228 Replace sl.po; this is the updated translation (100%).<br>
=C2=A0 - !229 nss: Add unit tests for NSS module<br>
=C2=A0 - !230 Update of sl.po<br>
=C2=A0 - !231 malcontent-timer: Remove an invalid attribute from a D-Bus XM=
L file<br>
=C2=A0 - !232 tests: Add test for the sandboxing of malcontent-webd.service=
 and<br>
=C2=A0 =C2=A0 malcontent-timerd.service<br>
=C2=A0 - !233 Update Czech translation<br>
=C2=A0 - !235 Malcontent client improvements<br>
=C2=A0 - !236 Update Polish translation 250828<br>
=C2=A0 - #83 Add screen time subpage with basic screen limits options<br>
=C2=A0 - #84 Add screen time chart<br>
=C2=A0 - #88 Implement NSS web filtering module and filter list daemon (Phi=
lip<br>
=C2=A0 =C2=A0 Withnall)<br>
=C2=A0 - #91 Port documentation comments to gi-docgen format<br>
=C2=A0 - #95 Build sysext image in CI for integration testing with gnome-sh=
ell<br>
=C2=A0 =C2=A0 (Philip Withnall)<br>
=C2=A0 - #96 Selecting username from commandline fails (Ignacy Kuchci=C5=84=
ski)<br>
=C2=A0 - #97 Add org.freedesktop.MalcontentTimer1.Child API for extending a=
 child=E2=80=99s<br>
=C2=A0 =C2=A0 session time (Philip Withnall)<br>
=C2=A0 - #98 After adding screen time subpage, the previous value of bedtim=
e/screen<br>
=C2=A0 =C2=A0 limit are not preserved (Philip Withnall)<br>
=C2=A0 - #100 Bump the app copyright date (Philip Withnall)<br>
=C2=A0 - #102 Add tests for filter list parsing code in malcontent-webd (Ph=
ilip<br>
=C2=A0 =C2=A0 Withnall)<br>
=C2=A0 - #107 Follow-up from &quot;Add screen time chart&quot;<br>
=C2=A0 - #109 Set a default daily screen time limit value<br>
=C2=A0 - #110 Show logged-in child accounts in the parental controls applic=
ation<br>
=C2=A0 - #111 Screen time summary level bar overflows<br>
=C2=A0 - #112 Fix assertion when closing the application (Philip Withnall)<=
br>
=C2=A0 - #113 Investigate gtklevelbar breaking<br>
=C2=A0 - #115 Improve documentation of the malcontent-client record-usage c=
ommand<br>
=C2=A0 =C2=A0 (Philip Withnall)<br>
=C2=A0 - #117 Emit EstimatedTimesChanged signal from malcontent-timerd if s=
ession<br>
=C2=A0 =C2=A0 limits settings change (Philip Withnall)<br>
=C2=A0 - #118 Malcontent-timerd daemon error on GNOME OS child account logi=
n (Philip<br>
=C2=A0 =C2=A0 Withnall)<br>
=C2=A0 - #119 Fix duration picker breaking in 12-hour clock mode<br>
=C2=A0 - #120 Update Turkish translation<br>
=C2=A0 - !189 build: Post-release version bump<br>
=C2=A0 - !190 Bulgarian translation by kraftwerk<br>
=C2=A0 - !191 malcontent-control: Port about dialog to AdwAboutDialog<br>
=C2=A0 - !192 ci: Add various linting tests for shell and Python<br>
=C2=A0 - !193 malcontent-client: Add support for setting a session limit po=
licy<br>
=C2=A0 - !194 Improve REUSE license/copyright tagging somewhat<br>
=C2=A0 - !195 Update Georgian translation<br>
=C2=A0 - !196 malcontent-timerd: Add initial implementation of timer daemon=
<br>
=C2=A0 - !197 po: Add new malcontent-timerd files to POTFILES.in<br>
=C2=A0 - !198 updated ru.po<br>
=C2=A0 - !200 ui: Fix wrong a11y role in button<br>
=C2=A0 - !202 nss: Add a new libnss_malcontent.so.2 NSS module for web filt=
ering<br>
=C2=A0 - !204 libmalcontent: Add web filtering settings storage and API<br>
=C2=A0 - !205 malcontent-client: Add {get,set}-web-filter commands<br>
=C2=A0 - !210 Add icons to libmalcontent-ui gresources<br>
=C2=A0 - !211 docs: Add Code of Conduct<br>
=C2=A0 - !213 Add missing mct_session_limits_equal() and mct_web_filter_equ=
al()<br>
=C2=A0 =C2=A0 functions<br>
=C2=A0 - !214 manager: Rework change notification from AccountsService and =
support<br>
=C2=A0 =C2=A0 notification for session limits and web filters<br>
=C2=A0 - !215 Various minor type and terminology fixes<br>
=C2=A0 - !216 user-selector: Factor out getuid() calls into a :current-user=
 property<br>
=C2=A0 - !217 Fix icons in dark theme<br>
=C2=A0 - !218 tools: Add a sysext build tool<br>
=C2=A0 - !219 malcontent-control: Add D-Bus service file<br>
=C2=A0 - !220 malcontent-control: Change component type to &quot;desktop-ap=
plication&quot;<br>
=C2=A0 - !221 accounts-service: Make extension symlinks relative<br>
=C2=A0 - !222 Handle external changes to users and settings<br>
=C2=A0 - !224 Fix waiting asynchronously for user manager<br>
=C2=A0 - !225 malcontent-webd: Add initial implementation of web filtering =
daemon<br>
=C2=A0 - !226 Adjust malcontent-timer for shell integration<br>
=C2=A0 - !227 po: Add missing files to POTFILES.in<br>
=C2=A0 - !228 Replace sl.po; this is the updated translation (100%).<br>
=C2=A0 - !229 nss: Add unit tests for NSS module<br>
=C2=A0 - !230 Update of sl.po<br>
=C2=A0 - !231 malcontent-timer: Remove an invalid attribute from a D-Bus XM=
L file<br>
=C2=A0 - !232 tests: Add test for the sandboxing of malcontent-webd.service=
 and<br>
=C2=A0 =C2=A0 malcontent-timerd.service<br>
=C2=A0 - !233 Update Czech translation<br>
=C2=A0 - !235 Malcontent client improvements<br>
=C2=A0 - !236 Update Polish translation 250828<br>
=C2=A0 - !237 docs: Add web filtering design document<br>
=C2=A0 - !238 docs: Add a document about system integration (packaging)<br>
=C2=A0 - !240 Update Czech translation<br>
=C2=A0 - !241 malcontent-client: Fix --help output for set-web-filter subco=
mmand<br>
=C2=A0 - !242 Calculate next session times in malcontent-timer<br>
=C2=A0 - !243 Update Czech translation<br>
=C2=A0 - !245 po: Add false positves to POTFILES.skip<br>
=C2=A0 - !246 Update Polish translation 250907<br>
=C2=A0 - !247 manager: Handle UnknownInterface error from AccountsService<b=
r>
=C2=A0 - !249 Minor malcontent-webd fixes<br>
=C2=A0 - !251 docs: Mention the update-error file in malcontent-webd.8<br>
=C2=A0 - !252 libmalcontent-ui: Update documentation to use gi-docgen<br>
=C2=A0 - !254 docs: Add some reference links to screen time design document=
<br>
=C2=A0 - !255 Update Chinese translation<br>
=C2=A0 - !256 Update Slovenian translation<br>
=C2=A0 - !257 libmalcontent-timer: Retry queries if the timer store is busy=
<br>
=C2=A0 - !258 time-page: Prevent calling unref on a NULL pointer<br>
=C2=A0 - !259 malcontent-webd-update: Disable timeout when updating filters=
<br>
=C2=A0 - !260 malcontent-webd: Relax UMask in service file<br>
=C2=A0 - !261 Update Czech translation<br>
=C2=A0 - !262 po: Add missing file to POTFILES.in<br>
=C2=A0 - !263 Update Chinese translation<br>
=C2=A0 - !264 build: Use exposed interfaces directory<br>
=C2=A0 - !265 libmalcontent-ui: Add missing gir include path<br>
=C2=A0 - !266 Minor fixes for malcontent-control<br>
=C2=A0 - !268 Replace sl.po with translation update.<br>
=C2=A0 - !269 Russian translation updated<br>
=C2=A0 - !270 Update Czech translation<br>
=C2=A0 - !271 Update Chinese translation<br>
=C2=A0 - !272 Updated RU against most recent pot<br>
=C2=A0 - !273 Statically link libgsystemservice<br>
=C2=A0 - !274 Various minor fixes and build system tests<br>
=C2=A0 - !277 l10n: Replace sl.po (Slovenian)<br>
=C2=A0 - !279 Update Swedish translation<br>
=C2=A0 - !282 tests: Add unit tests for `MctExtensionAgentObject`<br>
=C2=A0 - !286 libmalcontent: Port remaining doc comments to gi-docgen forma=
t<br>
=C2=A0 - !289 malcontent-control: Fix a crash when quitting just after maki=
ng changes<br>
=C2=A0 - !291 po: Update Bulgarian translation<br>
<br>
* Translation updates:<br>
=C2=A0 - Bulgarian (twlvnn, twlvnn kraftwerk)<br>
=C2=A0 - Chinese (China) (lumingzh)<br>
=C2=A0 - Czech (AsciiWolf)<br>
=C2=A0 - Georgian (NorwayFun)<br>
=C2=A0 - Polish (Piotr Dr=C4=85g)<br>
=C2=A0 - Russian (Julia Dronova, Ser82-png)<br>
=C2=A0 - Slovenian (filmsi, Martin Srebotnjak)<br>
=C2=A0 - Swedish (Anders Jonsson)<br>
=C2=A0 - Turkish (Sabri =C3=9Cnal)<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../recipes-gnome/malcontent/<a href=3D"http://malcontent-ui.bb" rel=
=3D"noreferrer" target=3D"_blank">malcontent-ui.bb</a> |=C2=A0 4 ++--<br>
=C2=A0.../recipes-gnome/malcontent/<a href=3D"http://malcontent.bb" rel=3D"=
noreferrer" target=3D"_blank">malcontent.bb</a>=C2=A0 =C2=A0 | 16 +++++++--=
-----<br>
=C2=A0.../recipes-gnome/malcontent/malcontent.inc=C2=A0 =C2=A0| 21 ++++++++=
++++++++---<br>
=C2=A03 files changed, 29 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-gnome/malcontent/<a href=3D"http://malcontent-=
ui.bb" rel=3D"noreferrer" target=3D"_blank">malcontent-ui.bb</a> b/meta-oe/=
recipes-gnome/malcontent/<a href=3D"http://malcontent-ui.bb" rel=3D"norefer=
rer" target=3D"_blank">malcontent-ui.bb</a><br>
index 8630822939..d0a975a457 100644<br>
--- a/meta-oe/recipes-gnome/malcontent/<a href=3D"http://malcontent-ui.bb" =
rel=3D"noreferrer" target=3D"_blank">malcontent-ui.bb</a><br>
+++ b/meta-oe/recipes-gnome/malcontent/<a href=3D"http://malcontent-ui.bb" =
rel=3D"noreferrer" target=3D"_blank">malcontent-ui.bb</a><br>
@@ -1,7 +1,5 @@<br>
=C2=A0SUMMARY =3D &quot;User-Interface for malcontent.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://gitlab.freedesktop.org/pwithnal=
l/malcontent" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/pwithnall/malcontent</a>&quot;<br>
-LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c&quot;<br>
<br>
=C2=A0require malcontent.inc<br>
<br>
@@ -20,6 +18,8 @@ DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 flatpak \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libadwaita \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk4 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gi-docgen-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gnome-desktop \<br>
=C2=A0&quot;<br>
<br>
=C2=A0GIR_MESON_OPTION =3D &quot;&quot;<br>
diff --git a/meta-oe/recipes-gnome/malcontent/<a href=3D"http://malcontent.=
bb" rel=3D"noreferrer" target=3D"_blank">malcontent.bb</a> b/meta-oe/recipe=
s-gnome/malcontent/<a href=3D"http://malcontent.bb" rel=3D"noreferrer" targ=
et=3D"_blank">malcontent.bb</a><br>
index 9da95329a8..579b0f6ffe 100644<br>
--- a/meta-oe/recipes-gnome/malcontent/<a href=3D"http://malcontent.bb" rel=
=3D"noreferrer" target=3D"_blank">malcontent.bb</a><br>
+++ b/meta-oe/recipes-gnome/malcontent/<a href=3D"http://malcontent.bb" rel=
=3D"noreferrer" target=3D"_blank">malcontent.bb</a><br>
@@ -1,7 +1,5 @@<br>
=C2=A0SUMMARY =3D &quot;malcontent implements support for restricting the t=
ype of content.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://gitlab.freedesktop.org/pwithnal=
l/malcontent" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/pwithnall/malcontent</a>&quot;<br>
-LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c&quot;<br>
<br>
=C2=A0require malcontent.inc<br>
<br>
@@ -13,6 +11,8 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 itstool-native \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libpam \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 polkit \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gi-docgen-native \<br></blockquote><div><br></d=
iv><div>why not inherit gi-docgen class here.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libsoup \<br>
=C2=A0&quot;<br>
<br>
=C2=A0GIR_MESON_OPTION =3D &quot;&quot;<br>
@@ -27,9 +27,11 @@ PACKAGECONFIG[ui] =3D &quot;,,,malcontent-ui&quot;<br>
=C2=A0EXTRA_OEMESON =3D &quot;-Dui=3Ddisabled -Dpamlibdir=3D${base_libdir}/=
security&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${base_libdir}/security/pam_malcontent.so \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/accountsservice \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/help \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/polkit-1 \<br>
+=C2=A0 =C2=A0 ${nonarch_libdir}/sysusers.d \<br>
+=C2=A0 =C2=A0 ${systemd_system_unitdir} \<br>
+=C2=A0 =C2=A0 ${base_libdir}/security/pam_malcontent.so \<br>
+=C2=A0 =C2=A0 ${datadir}/accountsservice \<br>
+=C2=A0 =C2=A0 ${datadir}/help \<br>
+=C2=A0 =C2=A0 ${datadir}/dbus-1 \<br>
+=C2=A0 =C2=A0 ${datadir}/polkit-1 \<br>
=C2=A0&quot;<br>
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.inc b/meta-oe/reci=
pes-gnome/malcontent/malcontent.inc<br>
index 7cb052d69c..de5da10193 100644<br>
--- a/meta-oe/recipes-gnome/malcontent/malcontent.inc<br>
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.inc<br>
@@ -1,3 +1,18 @@<br>
-SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/pwithnall=
/malcontent.git;protocol=3Dhttps;branch=3Dmalcontent-0.13" rel=3D"noreferre=
r" target=3D"_blank">gitlab.freedesktop.org/pwithnall/malcontent.git;protoc=
ol=3Dhttps;branch=3Dmalcontent-0.13</a>&quot;<br>
-SRCREV =3D &quot;090042fec5181621e2fd8cfef9fc446ed86db98b&quot;<br>
-PV =3D &quot;0.13.1&quot;<br>
+LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D310c7c93cf5181c6b0cc8229a1=
f3c6f6&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/pwithnall=
/malcontent.git;protocol=3Dhttps;nobranch=3D1;tag=3D$%7BPV%7D;name=3Dmalcon=
tent" rel=3D"noreferrer" target=3D"_blank">gitlab.freedesktop.org/pwithnall=
/malcontent.git;protocol=3Dhttps;nobranch=3D1;tag=3D${PV};name=3Dmalcontent=
</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://gitlab.gnome.org/pwithnall/libg=
systemservice.git;name=3Dlibgsystemservice;subdir=3D$%7BS%7D/subprojects/li=
bgsystemservice;protocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=3D=
"_blank">gitlab.gnome.org/pwithnall/libgsystemservice.git;name=3Dlibgsystem=
service;subdir=3D${S}/subprojects/libgsystemservice;protocol=3Dhttps;nobran=
ch=3D1</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://gitlab.gnome.org/GNOME/gvdb.git=
;protocol=3Dhttps;subdir=3D$%7BS%7D/subprojects/gvdb;name=3Dgvdb;nobranch=
=3D1" rel=3D"noreferrer" target=3D"_blank">gitlab.gnome.org/GNOME/gvdb.git;=
protocol=3Dhttps;subdir=3D${S}/subprojects/gvdb;name=3Dgvdb;nobranch=3D1</a=
>&quot;<br>
+SRC_URI +=3D &quot;<a href=3D"https://www.corpit.ru/mjt/tinycdb/tinycdb-0.=
81.tar.gz;subdir=3D$%7BS%7D/subprojects;name=3Dtinycdb" rel=3D"noreferrer" =
target=3D"_blank">https://www.corpit.ru/mjt/tinycdb/tinycdb-0.81.tar.gz;sub=
dir=3D${S}/subprojects;name=3Dtinycdb</a>&quot;<br>
+SRCREV_malcontent =3D &quot;d28f6635359d02d1068d8b21fb5810e5074b7903&quot;=
<br>
+SRCREV_libgsystemservice =3D &quot;f4c5764652b5f347347b459ee011e4f02b29c3a=
0&quot;<br>
+SRCREV_gvdb =3D &quot;466fc22016cf0981424e7121557611942191992f&quot;<br>
+SRC_URI[tinycdb.sha256sum] =3D &quot;469de2d445bf54880f652f4b6dc95c7cdf6f5=
502c35524a45b2122d70d47ebc2&quot;<br>
+SRCREV_FORMAT =3D &quot;malcontent&quot;<br>
+<br>
+PV =3D &quot;0.14.0&quot;<br></blockquote><div><br></div><div>I think this=
 should be reflected in the name of recipe itself.=C2=A0</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+do_configure:prepend() {<br>
+=C2=A0 =C2=A0 cp ${S}/subprojects/packagefiles/tinycdb/meson.build ${S}/su=
bprojects/tinycdb-0.81<br>
+}<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128445): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128445" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128445</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120438102/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120438102/1997914</a><br>
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

--000000000000e3a44006577155b2--

