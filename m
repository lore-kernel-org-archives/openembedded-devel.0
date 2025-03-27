Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200B0C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 17:53:08 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.2854.1743097978686133165
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 10:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5nTf0Q8;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6fee63b9139so11614137b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 10:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743097978; x=1743702778; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZM7B1tNifsigzd2PEyjJqSOfEoFfzj5jJQtASxsQujg=;
        b=d5nTf0Q8mP723oT0V5HC1nto1iA15W+8bcsi65Hvl880Rb+sB5t240Hwxzfh49Bb/d
         vY6Imcm40kj42ib/0wHqvW4/GcoWGGZHq+uQSnmMh3nkHMjkt2ZgOv25numoAruOGaDH
         gV9qUWbYSGYgql7ohT4JNr4pLQvO9BH5tpqUB0ElJEtHUo7qSUFsOfB4hhghBuIOAZT6
         2vODbst4XZ1JpH/6nRvy9KJsnvnrUAYBuzEDEz8/I/8W76WnVZxC2xHLq/foUvOLTNxP
         rom1LGcXSFQLL2hZ2qmKxUilfhs/mazilwISEZSEDQRz7sGbTAMmcqonUUgC6GtPX844
         fVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743097978; x=1743702778;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZM7B1tNifsigzd2PEyjJqSOfEoFfzj5jJQtASxsQujg=;
        b=MAiKVy3PsIuKJMsTVTPNMaEaz31sEDLhh9ss/a/XBLqopIYi9NTm9EzY1qxwfRoNlx
         xYbKtr36uu6GAhZ9/cVKJaAX7eDdp88voYQghNiVR5wpIoQd4t/mtflo6iZaS3dhjIaQ
         Jjwo0IF0ugVuHDhqrUWjteDtQtzNxcj6A/EqhHFMBysXP8RuKl4JsyKjlCsC+UhjWyyC
         eBbhYHtVavdfWiTVXU9W9B0TZLNWlxdFkYywUvV0jSVgffUdIMxrtw2brfF24IzFJMKA
         SvNIRWwkPqWoeabYWon84m5tST6Ju9BCxNspM7Oep/88vfc5dHhR7Cv1xET+Y+o7K0EX
         +lHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRcGhEg9h/I1xiZrO/WSmYBjB0uKyCIBap9rF4/Ub8XsrcOmmAE9L4J5Qa3Y0HQdd5JCKfSWzJ+mUyji+/25dFbHA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyOzUBhgngRF+EQG1zaGSfv6LyAj5hJA6lzaKHGBUfw3Y9UwKt8
	HSGQ47DBve4ZQiR3yhAL/LYqCuXM6qEwK2rPfPM7ZMo9WzQLJIUR
X-Gm-Gg: ASbGncuvLMVPFOeubWTQyf3RxYqbuUtnmcea04ByjVok49dMpbBaCoci58t97u3NdMJ
	UqzbYIFCBYP1PRNQXHP/rtzDBgVoavTlhy3/KKzuai0AEPZnjERfCZgwykl+oEVwqfhqfYYMCF/
	OJqLJbYf7nUql7dMKJWRVJTfK34Zmgqknj1G+0lUoBuNNtd1UpFynTMS5P4veSjxMljyEjfjfUu
	d7kRp4a+HHyhZF9vUPa8an8HGJOHLUhC9lJ4RbVMsaNWLYRyB8JVQkRxnmtKoYIfMUe8C1dxC86
	ju4fS6gQClr0BxGaoR9kp7UUrX507iGiA4r90bvBZa0AitbX7l521SZ40JUyc9i1PSQXytQk3b9
	D0LhlNt/WGTDsTiVMtdPJ
X-Google-Smtp-Source: AGHT+IGJ6PEVn8AGfxW+LkIakTAQy6+pL6Rh6nOHF5KbXUZP4xX1cKuJrf+P6efWdvJylQ7Ez1tHnA==
X-Received: by 2002:a05:690c:3686:b0:6ff:2777:92b7 with SMTP id 00721157ae682-702374d6833mr17408337b3.9.1743097977606;
        Thu, 27 Mar 2025 10:52:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:dce4:1a1f:d94c:aa35? ([2600:1700:45dd:7000:dce4:1a1f:d94c:aa35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7023a9ff345sm1036687b3.113.2025.03.27.10.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 10:52:57 -0700 (PDT)
Message-ID: <7303f311-13cd-4495-aa15-fbe9d0d95011@gmail.com>
Date: Thu, 27 Mar 2025 13:52:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: March 27th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 17:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116325

The following changes since commit 7e18b3fc774b7efabf9a20ae3cd6abd0e0715b59:

   lapack: upgrade 3.10.0 -> 3.10.1 (2025-03-07 19:18:02 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 084df16f561ebce5aea2ae9241cc500247771ef3:

   Revert "net-snmp: fix memory leak" (2025-03-20 09:56:59 -0400)

----------------------------------------------------------------
Armin Kuster (1):
       Revert "net-snmp: fix memory leak"

Peter Marko (1):
       libmodbus: patch CVE-2024-10918

  ...0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch | 40 -----
  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb    | 1 -
  meta-oe/recipes-extended/libmodbus/libmodbus.inc                | 7 +-
  .../libmodbus/libmodbus/CVE-2024-10918-01.patch                 | 159 
++++++++++++++++++
  .../libmodbus/libmodbus/CVE-2024-10918-02.patch                 | 113 
+++++++++++++
  .../libmodbus/libmodbus/CVE-2024-10918-03.patch                 | 240 
++++++++++++++++++++++++++++
  6 files changed, 518 insertions(+), 42 deletions(-)
  delete mode 100644 
meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
  create mode 100644 
meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-01.patch
  create mode 100644 
meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-02.patch
  create mode 100644 
meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-03.patch


