Return-Path: <geoffhp@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 169F87C39B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 18:14:00 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id h19so3455097ljj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 11:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=sc7EnJ4JRMShvV4S4h/Xw3yw4g9x5SsOM0SxJSykJFk=;
	b=M33VvYZWuFvOPJ9N9A34cRrjA94TkDcH9nuD0FJnVce+WtZHyDtSn4n3QSZhLTMIDr
	FYQKy0va9qeqZMADY05N7WDcASpOOXZc4q7WLnhJo/KBBVrE9jp/nfoJ8HwtcEsESc3M
	ziso9jRvpAopQQiCMoGseSkDMrkcP+3OM25adVeZLxnCkdcxjkylWAxpsqv7QKtfABuD
	f61q7c4nNm+okE0T6sENg1rq/M/1r5LzXY6Q+y76v0pqbgYvvBbY0cz2eRT3+rvuwRpu
	Q7OUjU8AH5DaxA0BrpHNjeSzaVyoSIliSnypcxfNG1nQiKcBK0cb6FVTnOaa313pkD9h
	Y9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=sc7EnJ4JRMShvV4S4h/Xw3yw4g9x5SsOM0SxJSykJFk=;
	b=pEpzbXJMYk/fT8OVZAs97RwWUW50l6pjiWQzCchC3gF4m8NMZRDN4xWAxWOcR7RqQg
	hTAyxOU0Ekixxh3XMNonkOxpQA6D9/MNATfg8rwMCFlYNof30D5lq5oxD+Qg4XSuPBLz
	ZzFifyh4pEm+/5Eihzzj3gBrikjalNAqZC4bkRYW9QOsphwwDUruoiGamCiKpiF2IUPw
	3Q3EaRX4TxC5H9tPqPv5k40+SyfNfY9y5esHUTrWuuu9qHSRVw+u7IEg7I+La2bAo1Xq
	BT7Q7mimnfQulIcThvJkhoWRYRmwNNMzY4c6R5P3ITIAKjxaikBtEFoYalzVX+ZvBDLv
	rAaA==
X-Gm-Message-State: APjAAAWrVjXmntKJe+j6+oLcxTNY7+aPOTvgiLT3z4Loqe0sLlMVLdO2
	ebOgbH/5FnH+3KtFFm+aL0vo19cQ6338R0dzcdVJVU/A
X-Google-Smtp-Source: APXvYqwofI1xu4agxNDpHcheykMZhISvP8BuZ1wYPcCb9NVkiAObVEFxKAmZwR32MAbWg6q06oSaRo10x9zQMVx4oCA=
X-Received: by 2002:a2e:6545:: with SMTP id z66mr46088094ljb.146.1559153641125;
	Wed, 29 May 2019 11:14:01 -0700 (PDT)
MIME-Version: 1.0
From: Geoff Parker <geoffhp@gmail.com>
Date: Wed, 29 May 2019 11:13:49 -0700
Message-ID: <CAHNuFGLy41mmeMnR2iRbJWYQSU9egnv9bNuF_hUoBhpUH7p+tQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][warrior] update python3-websockets from v4.0.1 to 5.0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 May 2019 18:14:01 -0000
Content-Type: text/plain; charset="UTF-8"

python3-websockets version 4.01 will throw this error
when used with Python 3.7.

 File "/usr/lib/python3.7/site-packages/websockets/compatibility.py", line 15
   asyncio_ensure_future = asyncio.async           # Python < 3.5
                                       ^
   SyntaxError: invalid syntax

This was fixed upstream in a commit applied 3 commits since the 4.0.1 tag.

 https://github.com/aaugustin/websockets/commit/9f566c5d12eae1258aa6f1991fe8cf0a7d390f97

Signed-off-by: Geoff Parker <geoffhp@gmail.com>
---
...ython3-websockets_4.0.1.bb => python3-websockets_5.0.1.bb} | 4 ++--
1 file changed, 2 insertions(+), 2 deletions(-)
rename meta-python/recipes-devtools/python/{python3-websockets_4.0.1.bb
=> python3-websockets_5.0.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
b/meta-python/recipes-devtools/python/python3-websockets_5.0.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-websockets_5.0.1.bb
index 414129c59..151dee2d5 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_5.0.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =
"file://LICENSE;md5=5070256738c06d2e59adbec1f4057dac"

inherit pypi setuptools3

-SRC_URI[md5sum] = "9e8c6b3c70def4146d75fbb0f52bdfc7"
-SRC_URI[sha256sum] =
"da4d4fbe059b0453e726d6d993760065d69b823a27efc3040402a6fcfe6a1ed9"
+SRC_URI[md5sum] = "cd2f92f07bca588acd9238b18f6cfbcf"
+SRC_URI[sha256sum] =
"a49d315db5a7a19d55422e1678e8a1c3b9661d7296bef3179fa620cf80b12674"

BBCLASSEXTEND = "native nativesdk"

--
2.20.1

