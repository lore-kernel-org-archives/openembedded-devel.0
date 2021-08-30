Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web10.5.1630343878933858273
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Aug 2021 10:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=qYHzPyh6;
 spf=pass (domain: cold-front.org, ip: 66.111.4.27, mailfrom: jsbronder@cold-front.org)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 1BCD25C0170;
	Mon, 30 Aug 2021 13:17:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 30 Aug 2021 13:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=mesmtp; bh=Dn75ihXSBVqTEAHe8MBX52O
	ueVcf69IKCTm1/UDNxnk=; b=qYHzPyh6+4Ug7g6pRbdGR6p/LtyXkCjcnUS/kh4
	2BeBtOL6jt2SEvQFYeLY/pVUfizxvHzXx0rg8Z8PIx6uekzdxMeWJgkYFL3loQfN
	A+wJTH9XRXLLQqhrl8ovyNXCO7dibQNahu8Fk+yWMw++mzQ/EY4PDjMdISU2aOJp
	ib14=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Dn75ihXSBVqTEAHe8
	MBX52OueVcf69IKCTm1/UDNxnk=; b=krqv41CkDmwvYZX7BqI9SPNqUy8fi2k3E
	/5tsFPkTi44RYAirQXKOmK3LOSqB4hmcbG98Xl/OsCV21RlI0HaPhX+8gpNUHa6k
	wwm7HQ7N1pimgQVSe6XPzoPHiUGQFhlnqBXEd0n6uKlxlsjyVG1PVN3Z//vvl56/
	7kjfTo4HWCUDN5kxHEksKjMDhYEqwPL3RDxeqUbsTEdgzeVkAqAEuC0cKumoJGCM
	1AFtsxHT+eHGy3klL0IvikCRKkG/a4FtJCqxmnONSzM5Exyt51qKwZn9HQduh+kj
	RJTmjVbhdXuG8/dIfAHpSgLxyL8Cv3APugYGC/+sqyxz1ezCiM/HA==
X-ME-Sender: <xms:xRItYcJgqaO04hoJT6_UNWlH-gNzHN9Ya6VHuozkebofpCa-7lJRAQ>
    <xme:xRItYcKa2pKnQUGQIT0iTt1Ykb6_mGezRRu2Hv-N7IUBG-Uq6f2KeKH0tAtDpC3PY
    Z6qr5ETkLBnJo_9qg>
X-ME-Received: <xmr:xRItYcuIVswic4Y5XOGr7JJDCl9BfF0AOnJotKxFaWIf7td-EU9Pa77SjpJXnZM51gmDaVPFfO1VCxVKZXGA2uat8Drxa5ITOjzi0RqM5KXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduledgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepvdfhtdfhffeiff
    evteevieefuedvtdfhleduieetudekgefgveffgffffffffffhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhestgholh
    guqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:xRItYZYMxikKyvhOxphlUijmDHR0LShBd6_KpIFBD-qSc2EMQWMH_A>
    <xmx:xRItYTbkLaMKWiwMbkM7Si0lJQMVEwpepiAu6onm6anqPDYbnLa6RA>
    <xmx:xRItYVBLQWxGgh9b5LJOOOD2R5mnkuID74evYgbx0ilipE1tVch14Q>
    <xmx:xhItYUDUwRjpKBgFzdnhbzyFhownEn2f9i7m2eWGEhqwh2yZXYQZHA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Aug 2021 13:17:57 -0400 (EDT)
From: "Justin Bronder" <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-oe][PATCH v2] hidapi: add rdep on glibc-gconv-utf-16
Date: Mon, 30 Aug 2021 13:17:42 -0400
Message-Id: <20210830171741.11805-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libhidapi-libusb needs to convert from UTF-16LE to WCHAR_T in order to
read various libusb string descriptors.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-oe/recipes-support/hidapi/hidapi_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
index 76f5dc762..e45445073 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
@@ -7,6 +7,7 @@ LICENSE = "BSD-3-Clause | GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077"
 
 DEPENDS = "libusb udev"
+RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
 
 inherit autotools pkgconfig
 
-- 
2.33.0

