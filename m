Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1C12D7F7E4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 09:06:09 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id z11so4844801wro.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 02:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:followup-to:from:subject:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:content-transfer-encoding:content-language;
	bh=wDkrTFCywexR9WqtlYkz0p2578QfwSLwX0sAChrweEE=;
	b=mtuphorJTI5vObJwWdnUzHZ7yP+KbVEd6RO1EGmUesbOoeVaFusCXyg8f2gpuaEjsL
	/QxUOiGTJmtRl3ZnpawLBkc0Mymz3g6OSKLcV0G/qx9B4vVcodoeOKXbvb4N/+TUszt+
	IUfic+KVaNmTH3Lkepca4/VlZhzUOMuM11V/QUTAHcV6PMJV80tn4HC2FI4KIzpz7tVN
	YBAZmvb9MYPKSMka4CFByOVb2jHbHngosACddt4OPDtM6WYU3b4RILBbBzWGxRG5lARg
	0g/5Z75hM4jVRUX2GHGDBwonGr8UYke8qIqzyszx9MygHHUgfaTttmAVSj6u771UO3FL
	S9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:followup-to:from:subject:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=wDkrTFCywexR9WqtlYkz0p2578QfwSLwX0sAChrweEE=;
	b=Gtt0ohtjWaZsQPWYefZLsF8BvMyg9lhTnxINYqcGGKdPtL4RoMeVuzt12/tXTcBXKG
	Z6dXDarnK/hru3+Z44SdoVBVxyBo9rSdgrnJYhR9kJ0URwtfHjD4mATog+IhN5s8xV80
	+H/XWCCbQ1GLKq4CGO5Gz9OSf5ROI+bFjA/E2JVMGsp+GQVjNWTDJUPnJVPsxc9HW896
	rSqaLA0PYuVZMXKxGXNJD6nqEsJ64pyxweuNBo5OLiadsZ7qUvK37z9NTLQSUjNTfsSd
	crRvH1hYwuG4ZNZVuVZ4LlWOwrR0RC7eJ6RUKQ+eQueuSFvgcYhhoIUD4us7g7AiULIV
	DUVg==
X-Gm-Message-State: APjAAAWXewcx6YxL31kYHnXn6UGzjcXBR+tU1lYQlKxnDvzuj3nIU7vx
	gtwN2ZTwj2xNqR7tgqKFe6lhwMAFMNc=
X-Google-Smtp-Source: APXvYqxI6W3YTDBy3L6/HanGfnW44L5MinMBsZFgWsBH9Xl0mOKZ6/fDpUwpSotl4vRJ6yj1BHEiaQ==
X-Received: by 2002:adf:e542:: with SMTP id z2mr6226368wrm.338.1572080770464; 
	Sat, 26 Oct 2019 02:06:10 -0700 (PDT)
Received: from [10.192.11.162] ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id l8sm4859237wru.22.2019.10.26.02.06.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Oct 2019 02:06:09 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Followup-To: Khem Raj <raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4dda49b3-8eb9-b89b-5a1a-a8a396cbd17f@gmail.com>
Date: Sat, 26 Oct 2019 02:06:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
Subject: thud merge quest
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
X-List-Received-Date: Sat, 26 Oct 2019 09:06:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 2d088d252624b19df384aecc434d23afb636178f:

  postgres: update to 10.10 (2019-09-04 17:34:11 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded thud-next

for you to fetch changes up to 446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93:

  tcpdump: Fix CVE-2017-16808 (2019-10-05 09:01:00 -0700)

----------------------------------------------------------------
Dan Tran (1):
      polkit: Fix CVE-2018-19788

Denys Dmytriyenko (1):
      mariadb: update SRC_URI, as 5.5.64 has moved to archive

Peiran Hong (1):
      tcpdump: Fix CVE-2017-16808

 ...2017-16808-AoE-Add-a-missing-bounds-check.patch |  61 +++++++
 .../recipes-support/tcpdump/tcpdump_4.9.2.bb       |   1 +
 meta-oe/recipes-dbs/mysql/mariadb.inc              |   2 +-
 .../polkit/polkit/CVE-2018-19788_p1.patch          | 194
+++++++++++++++++++++
 .../polkit/polkit/CVE-2018-19788_p2.patch          | 153 ++++++++++++++++
 .../polkit/polkit/CVE-2018-19788_p3.patch          |  53 ++++++
 meta-oe/recipes-extended/polkit/polkit_0.115.bb    |   3 +
 7 files changed, 466 insertions(+), 1 deletion(-)
 create mode 100644
meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
 create mode 100644
meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p1.patch
 create mode 100644
meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p2.patch
 create mode 100644
meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p3.patch


