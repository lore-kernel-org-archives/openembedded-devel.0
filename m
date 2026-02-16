Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227FAE81A49
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 16:46:14 +0000 (UTC)
Subject: Re: [meta-oe][kirkstone][PATCH] rocksdb: Add an option to set static library
To: openembedded-devel@lists.openembedded.org
From: "aszh07" <mail2szahir@gmail.com>
X-Originating-Location: Singapore, SG (167.103.73.35)
X-Originating-Platform: Linux Chrome 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 08:46:05 -0800
References: <20260210133500.30649-1-zahir.basha@kpit.com> <700cc6f1-6aff-430a-8e8c-086df76cb5df@gmail.com>
In-Reply-To: <700cc6f1-6aff-430a-8e8c-086df76cb5df@gmail.com>
Message-ID: <920657.1771260365675421294@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="2Ze1hA79EnoFaQGjIIny"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 16:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124426

--2Ze1hA79EnoFaQGjIIny
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

As per these change, the static library option is turned off through Extra_=
OEMAKE config. The same way we had done in scarthgap and master branch.

Also We have confirmed that with the default setting ON, it generated a sta=
tic library without -DROCKSDB_BUILD_STATIC=3DOFF in the EXTRA_OECMAKE secti=
on of the recipe.

However, according to official upstream comments from RocksDB developers, i=
t shouldn't be ON by default as it breaks their Java build.

--2Ze1hA79EnoFaQGjIIny
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>As per these change, the static library option is turned off through E=
xtra_OEMAKE config. The same way we had done in scarthgap and master branch=
.<br /><br />Also We have confirmed that with the default setting ON, it ge=
nerated a static library without -DROCKSDB_BUILD_STATIC=3DOFF in the <span =
style=3D"color: #dbdde1; font-family: system-ui, 'Segoe UI', Roboto, 'Helve=
tica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color=
 Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size=
: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-alig=
n: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: =
0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-colo=
r: #252728; text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial; display: inline !important; float: non=
e;">EXTRA_OECMAKE</span> section of the recipe.&nbsp;<br /><br />However, a=
ccording to official upstream comments from RocksDB developers, it shouldn'=
t be ON by default as it breaks their Java build.</div>
</div>

--2Ze1hA79EnoFaQGjIIny--

