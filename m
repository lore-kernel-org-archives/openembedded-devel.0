Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7308DC433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 15:41:52 +0000 (UTC)
Subject: Re: [meta-python] [PATCH] python3-cbor2: upgrade 5.4.2 -> 5.4.3
To: openembedded-devel@lists.openembedded.org
From: "Ross Burton" <ross.burton@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Mac Safari 15.4
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 16 May 2022 08:41:43 -0700
References: <1652347207-2483-1-git-send-email-xuhuan.fnst@fujitsu.com>
In-Reply-To: <1652347207-2483-1-git-send-email-xuhuan.fnst@fujitsu.com>
Message-ID: <27367.1652715703703621650@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 15:41:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97135

Was this actually tested?

$ buildhistory-diff
Changes to packages/aarch64-linux/python3-cbor2-native (sysroot):
  /usr/lib/python3.10/site-packages/UNKNOWN-5.4.3.dist-info was added
  /usr/lib/python3.10/site-packages/UNKNOWN-5.4.3.dist-info/LICENSE.txt was=
 added
  /usr/lib/python3.10/site-packages/UNKNOWN-5.4.3.dist-info/METADATA was ad=
ded
  /usr/lib/python3.10/site-packages/UNKNOWN-5.4.3.dist-info/RECORD was adde=
d
  /usr/lib/python3.10/site-packages/UNKNOWN-5.4.3.dist-info/top_level.txt w=
as added
  /usr/lib/python3.10/site-packages/UNKNOWN-5.4.3.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/cbor2 was removed
  /usr/lib/python3.10/site-packages/cbor2-5.4.2.dist-info was removed
  /usr/lib/python3.10/site-packages/cbor2-5.4.2.dist-info/LICENSE.txt was r=
emoved
  /usr/lib/python3.10/site-packages/cbor2-5.4.2.dist-info/METADATA was remo=
ved
  /usr/lib/python3.10/site-packages/cbor2-5.4.2.dist-info/RECORD was remove=
d
  /usr/lib/python3.10/site-packages/cbor2-5.4.2.dist-info/top_level.txt was=
 removed
  /usr/lib/python3.10/site-packages/cbor2-5.4.2.dist-info/WHEEL was removed
  /usr/lib/python3.10/site-packages/cbor2/decoder.py was removed
  /usr/lib/python3.10/site-packages/cbor2/encoder.py was removed
  /usr/lib/python3.10/site-packages/cbor2/__init__.py was removed
  /usr/lib/python3.10/site-packages/cbor2/__pycache__ was removed
  /usr/lib/python3.10/site-packages/cbor2/__pycache__/decoder.cpython-310.p=
yc was removed
  /usr/lib/python3.10/site-packages/cbor2/__pycache__/encoder.cpython-310.p=
yc was removed
  /usr/lib/python3.10/site-packages/cbor2/__pycache__/__init__.cpython-310.=
pyc was removed
  /usr/lib/python3.10/site-packages/cbor2/__pycache__/tool.cpython-310.pyc =
was removed
  /usr/lib/python3.10/site-packages/cbor2/__pycache__/types.cpython-310.pyc=
 was removed
  /usr/lib/python3.10/site-packages/cbor2/tool.py was removed
  /usr/lib/python3.10/site-packages/cbor2/types.py was removed

The recipe simply installs the _cbor.so, and nothing else.

Can we have an emergency revert before this is fixed properly?

Ross

