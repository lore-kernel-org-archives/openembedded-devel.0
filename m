Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EB5C28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:18:43 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.7353.1742289521559416957
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout11.t-online.de (Postfix) with SMTP id 4D0CFA06
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 10:17:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.59]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuT52-2eYOYs0; Tue, 18 Mar 2025 10:17:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/4] gnome-online-accounts: update 3.52.2 -> 3.54.1
Date: Tue, 18 Mar 2025 10:18:25 +0100
Message-ID: <20250318091827.831270-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318091827.831270-1-f_l_k@t-online.de>
References: <20250318091827.831270-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1742289468-62FF35D8-F9A7F46A/0/0 CLEAN NORMAL
X-TOI-MSGID: 7ff7aa21-25ae-41b1-8beb-d628cccb811f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 09:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116054

Overview of changes in 3.54.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Bugs fixed:
  - #114 Fix unescaped characters in IMAP and SMTP logins
  - #391 Nextcloud 'Cannot find WebDAV endpoint' error
  - !319 goaproviderdialog: don't update the error revealer until set
  - !320 goaoauth2provider: rewrite the D-Bus helper as a per-task servic=
e
  - !323 goagoogleprovider: drop the client secret and deprecate the opti=
on

* Translation updates:
  - Bokm=C3=A5l, Norwegian (Brage Fuglseth)
  - Catalan (Jordi Mas i Hernandez)
  - Danish (Ask Hjorth Larsen)
  - Hungarian (Bal=C3=A1zs =C3=9Ar)
  - Korean (Seong-ho Cho)
  - Nepali (Pawan Chitrakar)
  - Panjabi (A S Alam)
  - Spanish (Daniel Mustieles)

Overview of changes in 3.53.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Bugs fixed:
  - !306 goaoauth2provider: handle OAuth2 error responses
  - !307 docs: update README
  - !308 goabackend: drop GoaHTTPClient
  - !309 examples: drop g_error() usage
  - !311 oauth2handler: Replace libsecret with dbus (Jan-Michael Brummer)

* Translation updates:
  - Basque (Asier Sarasua Garmendia)
  - Bulgarian (twlvnn kraftwerk)
  - Chinese (China) (Luming Zh)
  - Czech (Daniel Rusek)
  - Finnish (Jiri Gr=C3=B6nroos)
  - French (Ir=C3=A9n=C3=A9e THIRION)
  - Galician (Fran Dieguez)
  - Georgian (Ekaterine Papava)
  - Hebrew (Yosef Or Boczko)
  - Indonesian (Andika Triwidada)
  - Lithuanian (Aurimas =C4=8Cernius)
  - Occitan (post 1500) (Quentin PAG=C3=88S)
  - Panjabi (A S Alam)
  - Persian (Danial Behzadi)
  - Polish (Piotr Dr=C4=85g)
  - Portuguese (Hugo Carvalho)
  - Portuguese (Brazil) (=C3=81lvaro Burns)
  - Swedish (Anders Jonsson)
  - Ukrainian (Yuri Chornoivan)

Overview of changes in 3.53.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Bugs fixed:
  - !286 onedrive: Use presentation id in OneDrive uri

* Translation updates:
  - Russian (Artur S0)
  - Slovenian (Martin)

Overview of changes in 3.53.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Bugs fixed:
  - #113 Add GUI field for PresentationIdentity to be able to set a custo=
m name
    / nickname for an online account
  - #357 Also offer an oauth2 sign-in link that can be copied instead of =
only
    directly opening in external browser?
  - #367 Non-actionable "Account Action Required" notification when accou=
nt
    requires VPN
  - #383 imap: Remove / Demote "None" encryption option
  - #384 Unable to Sign In to Microsoft Exchange account on Gnome 46 24.0=
4.1
  - #386 segfault after signing into Fedora account
  - #389 Missing kerberos password not detected
  - #392 Fail faster - don't wait 120 seconds to timeout and return an er=
ror on
    initial authentication
  - !282 goadaemon: add a timeout for credential checks
  - !288 goaoauthprovider: fix expected NULL GError
  - !290 docs: add issue templates
  - !293 goadavclient.c: add WebDAV default candidate to test
  - !300 ci: add support for new release service
  - !303 goadaemon: Changes around "no provider" runtime warnings

* Translation updates:
  - Catalan (Jordi Mas i Hernandez)
  - Dutch (Nathan Follens)
  - Friulian (Fabio Tomat)
  - Hebrew (Yaron Shahrabani)
  - Latvian (R=C5=ABdolfs Mazurs)
  - Russian (Artur S0)
  - Serbian (=D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=
=D1=9B)
  - Slovenian (Martin)
  - Thai (Aefgh Threenine)
  - Turkish (Sabri =C3=9Cnal)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nline-accounts_3.52.2.bb =3D> gnome-online-accounts_3.54.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-acco=
unts_3.52.2.bb =3D> gnome-online-accounts_3.54.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.52.2.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.54.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-a=
ccounts_3.52.2.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-acc=
ounts_3.54.1.bb
index 214476f900..69bd6a9a80 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.52.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.54.1.bb
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKA=
GECONFIG', 'goabackend',
=20
 DEPENDS +=3D "gdk-pixbuf dbus glib-2.0 gcr keyutils"
=20
-SRC_URI[archive.sha256sum] =3D "fb413f48deefbb9fc3002a91579dee947ceeed41=
f49c2f51317af7489b676f67"
+SRC_URI[archive.sha256sum] =3D "9d058b3aac8b2d8b6b2ae7cb57c8a8abe539e73c=
88220c315b5b99f87ce6efd8"
=20
 PACKAGECONFIG ?=3D "goabackend kerberos owncloud google windows_live"
=20
--=20
2.48.1


