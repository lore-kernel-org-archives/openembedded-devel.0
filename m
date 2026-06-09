Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E305CD8CA7
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:25:48 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75496.1780997141687540254
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AVAzmZ5n;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-842204fcca4so365198b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 02:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780997141; x=1781601941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4syNLdw/8EPTlZs2bnNiwXpamLt4agIrFWHYzFPfNnI=;
        b=AVAzmZ5nK4ln7mau13mNFKt8hV+QYvtQGEIXbklN/R5k2jCEs8P/8i60XTRB1fiA5p
         hF6nlIVnM5P+P9OzFaTbF5s35zh2PpFsQMnMryKHb5aRdOBIggLJ428DijaX9BEdaWl/
         2GNqFzZqUGFuncoFAe/tuDkhSZL9lm4JM8auazwB5Zepn45YO51AFFp5MVwEAQvbrQyH
         icyQeJRMOSUdoVRbIPbZ+9tNxSvzgP5QgrZ6TnBjeLs3yfkQRJnD77YGLC4ESDELQGhw
         lDjyEK9iHjSfGnUMamcc2jfvMz+aQAaG3c1c/ETUK6kh1F9wFzRgD1/0RR0Jqk4TdzSV
         GjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997141; x=1781601941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4syNLdw/8EPTlZs2bnNiwXpamLt4agIrFWHYzFPfNnI=;
        b=CuFjzLo7KHBxUHh6T1aeSF6eyKKR3AF4LEINCeYZbv8r30098fIn0gl83Ghi7QxjAe
         7zxpAdbHogijw8jvDSP8evRUXxCKxM7+0Bw/mU8BNeDX2c9V28KGe6P07eqA/V4oxJC5
         XtELaGK5WCn+juXpovyFjwleu0fXf2HUsKh3jTw/7D6KT6bAPCmG/nOyw57CgFd7QX3o
         YUTqOGhTLpTSFJaGrAi35Ovtqik+oKK2FKrLjpqnY9wq4SAqECcv3QzhPJYfz3RdaGra
         KvXVzXGiE42fZ073NW4ZYIh9VhdfPxbsuZtJ0kK/ND0WtYJgqAPO5ZNOLKYoG0i+vfjG
         HjDA==
X-Gm-Message-State: AOJu0YzAd/E/47gdit0w2qnWvhe/pA6RiaEhhjG8lHZwpmY3lkDw50VX
	W18mkXob/ymJFo7PIrCS3KRjwSwzlLCHp5TXdoClYkxX7G/AhRTYnSf8/lT5gjfX/8rZYw==
X-Gm-Gg: Acq92OH7bqrdwjGhyXJgjdxxGboxii8v/pMBANl+rHgeHd1ObNharaSo4lEtFKc+ZUx
	UKageZlr9Xm4yLw1n6LKgX2z8ZiXx55Fqd2x6wRE6MRhI/Kgr+UrT2a6/n4o/wQE6vMHaSGDMUl
	f9BR5fG2hofyYP9oAwmVL3wIrS+ESQmvsfk8UFwLG383pPHG3SsQ+VZnYl8fgFSpBLzhIdOO+On
	CHbuXdvKG24a3ZQn0BXql2g8QRno2nqZx3RYepsut862B3VzOkgVkHY1Nahq//gusxWVAs7RBV2
	dQYylgWEv7OihXPnE6H4ntSLE4Trv/StQEl5wNNB8cXv9oeeOamBSC0LLahb91sq+bMTt0cSdw+
	fLkNZVvRSS6KBa+n9gInN3mtpokeRt0x3pg5xbcZXSaaqBqbKJ5PVQjCVgT6AJIsH1MRWONPWKG
	jxyswwY4Y/HL5FrtvHXzG7KlTwDgUR7Ra7KYhme0fAW/RcvcU1h0Ugy8SgmM2Okg==
X-Received: by 2002:a05:6a21:4d8e:b0:3b3:cff:cb54 with SMTP id adf61e73a8af0-3b4cd1ed3b0mr10343226637.2.1780997141104;
        Tue, 09 Jun 2026 02:25:41 -0700 (PDT)
Received: from L-15597L.www.tendawifi.com ([36.255.86.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043223sm16496633a12.8.2026.06.09.02.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:25:40 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin.Wankhade@kpit.com
Subject: [OE-core][scarthgap][PATCH V2 5/6] strongswan: Fix CVE-2026-35332
Date: Tue,  9 Jun 2026 14:54:06 +0530
Message-Id: <20260609092407.893299-5-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609092407.893299-1-nitin.wankhade333@gmail.com>
References: <20260609092407.893299-1-nitin.wankhade333@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 09:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127450

Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/1e0643bef105704337efc141a37dfcfbaa53cb1f]

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 ...accept-non-empty-ECDH-public-keys-wi.patch | 51 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch b/meta-networking/recipes-support/strongswan/strongswan/tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch
new file mode 100644
index 0000000000..a05fd9bced
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch
@@ -0,0 +1,51 @@
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 20 Mar 2026 17:38:07 +0100
+Subject: tls-server: Only accept non-empty ECDH public keys with TLS < 1.3
+
+This prevents a crash due to a null-pointer dereference when processing
+an empty ECDH public key.
+
+The previous length check only applied in the `!ec` case, so in the `ec`
+case, the access to `pub.ptr[0]` was unguarded.  If a crafted TLS
+record ends with an empty ClientKeyExchange, then `read_data8` sets
+`pub` to `chunk_empty`, causing a null-pointer dereference.
+
+Note that if some data follows the empty ClientKeyExchange, this just
+causes a 1-byte out-of-bounds read that has no further effect as the
+TLS session is aborted immediately.  Either because the read value
+doesn't equal TLS_ANSI_UNCOMPRESSED or because the empty public key
+is rejected by `set_public_key()`.
+
+The referenced commit that introduced the pointer access, added the
+check for `pub.len` specifically to the `!ec` case, while the pointer
+access was initially unconditional (probably because the code was just
+copied from `tls_peer.c` which processes ECDH public keys in a separate
+function, so there was no `ec` flag).  The latter was fixed a couple of
+days later with 7b3c01845f63 ("Read the compression type byte for EC
+groups, only").  However, that commit didn't change the length check.
+Anyway, it's possible that the original intention was to add the check
+to the `ec` case on the previous line, or that there was some confusion
+with the parenthesis and something like the current code was intended to
+begin with.
+
+Fixes: e6cce7ff0d1b ("Prepend point format to ECDH public key")
+Fixes: CVE-2026-35332
+
+CVE: CVE-2026-35332
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/1e0643bef105704337efc141a37dfcfbaa53cb1f]
+Patch is refreshed as per the source code version 5.9.14
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/src/libtls/tls_server.c b/src/libtls/tls_server.c
+index 7b2238e..bffc01c 100644
+--- a/src/libtls/tls_server.c
++++ b/src/libtls/tls_server.c
+@@ -857,7 +857,7 @@ static status_t process_key_exchange_dhe(private_tls_server_t *this,
+ 	group = this->dh->get_method(this->dh);
+ 	ec = key_exchange_is_ecdh(group);
+ 	if ((ec && !reader->read_data8(reader, &pub)) ||
+-		(!ec && (!reader->read_data16(reader, &pub) || pub.len == 0)))
++		(!ec && !reader->read_data16(reader, &pub)) || pub.len == 0)
+ 	{
+ 		DBG1(DBG_TLS, "received invalid Client Key Exchange");
+ 		this->alert->add(this->alert, TLS_FATAL, TLS_DECODE_ERROR);
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 41a4de845f..f65a94dd73 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch \
            file://libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes.patch \
            file://constraints-Case-insensitive-matching-and-reject-exc.patch \
+           file://tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.34.1


