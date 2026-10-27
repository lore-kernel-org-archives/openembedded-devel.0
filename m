Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22223.1793115908085125277
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 08:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tCPgToFK;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so7117485e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793115906; x=1793720706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4u6SMRvKUhY7uGY5UhMrmTyevqT/HFxpU6BjatLcuzU=;
        b=tCPgToFK7cWJVUYeEmqiSLcZx5olbZDSjw+hrAUPR4zVDxEFnTNNRXznImVPAFJfp4
         HXYMOboaO910X4y8ZIp9xNJ9FN5Mf4HNrQz5+RDusnNfwkoI1B+fAdXuuagP8gR470VB
         fFH1pkcJdE+UwzGTJEMIitR+mDz5FT9CFthI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115906; x=1793720706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4u6SMRvKUhY7uGY5UhMrmTyevqT/HFxpU6BjatLcuzU=;
        b=sQjQX9YlGYHJB7AsRJJr++3YVcsMu+iJ1R/srkI0ZqQyF5J/CPjHS7FojigXbG52qA
         OZ4uWwrhvj6d16S2PrBk84WwfkcCQghXa2vcTSakBLzUtNmigD+lN5GelzlCqudL8szn
         gfuD7lFyThNc0Gl22SddzR6onS6EEPZERhUGWIsaRHEU6JOA2QF8Nphmdl0X/nbCbw1d
         4VxXchnkYh36dqM4AoknpNNps1Y6nN/2GjXc+AdYReV9SC+dmRTABaxpRd+3tRm1GiAE
         KqZdBCLza2HpqjqUeFj3hwkUEY0qzAcFC8fDQxN5etVVnujXNMUrdZLarkz06tFf40kj
         riZQ==
X-Gm-Message-State: AFq9FYKR7k7MZiHF9GEplIrZqQscMvJjs4TeBzXc9qkWfrI3yQC7ZEnT
	cfMOxltsrlfzOM91sth6M0Gblj4A1qC8XmwFYh14uc4Awxal5Ja8FXVL94YBX8A8hDQWUc6uSJu
	DNZG6
X-Gm-Gg: AYBFou0F6+AVn4A9Mi3K+VQm5Gf1yhh2bS9sw4lkKOK98LLUcza1dZkJ19rVHlJy9eq
	r7bEZrws5FVyDatDNG0jau/h0zHJ9Kw1voycKBLmm1uKC49OAYNrDhQTXS2NpHo1xI0SjRkDmsi
	hNloj+kWNeWVdLtOL81Q/GfU2WhInnQUSNflZxnpiHbqR0GPbqfjlxLpHBRpI8CvvcAw5Z1Swnr
	sCMgxfq7QeipNGWPn8ORnwCOm6ka6fVk1MF8va8ev+JT1NE1LR8UHMOr9NcjNyHWUob1dJ5urj2
	rxpiIEpLzjQW7eRyt/rriZ/KHxsmi17pe8t9VVkO1cgKSSerzvl0qHSNb2qa5YY4uKPXGRiJIGy
	dndkm2TBWC0ZnI2MlnqlttA9lcgF1AUWXMwbL43Hg5nBu8vJUxxNpj/n6Mmys04TuW5Uh2pM93Y
	3zGhe8KWhxNhj9y+SOcaMFr8cOiKU+TBBlQdkP6SxStERu++3El6rhyqF4XW+vLCK3N83TR4Z7g
	ZM5gCnsDGwV9LZFQDXZKuHVKMCmSoyxjBtdkt+Vyd20jQDJejEC44CLe0HP4gKyTprEGJVQF2yH
	vkAYuoVSbtNubdw0uyXw7ZKeYcbwbHvWq4kjkzIn4Q4n3NYKxCvOqhrrLi7l2CUe2dqo8A1zgDF
	Yeku3
X-Received: by 2002:a05:600c:45c4:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a7bfec4e49mr68936985e9.2.1793115906303;
        Tue, 27 Oct 2026 08:45:06 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm266099575e9.12.2026.10.27.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:45:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 2/2] hunspell: Upgrade 1.7.5 -> 1.7.6
Date: Tue, 27 Oct 2026 17:45:01 +0200
Message-ID: <20261027154501.1209697-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027154501.1209697-1-leon.anavi@konsulko.com>
References: <20261027154501.1209697-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 15:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131539
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.7.6:

- add, add_with_flags, add_with_affix and remove apply the
  dictionary's ICONV rules to the word, as spell does, so a
  caller that converted the word itself must stop doing so
- A personal dictionary exclusion such as *afterwards also
  rejects the word when the dictionary has it only as an affixed
  form
- stem and analyze give st: stem fields again with
  COMPLEXPREFIXES
- analyze lists every analysis of a compound word, where a
  rejected split of the word could hide the splits after it
- The text and XML parsers check the character after a character
  entity such as &agrave;
- The interactive mode shows the first digit of a two digit
  suggestion number
- The -a pipe interface checks a line of any length in one piece
- The hunspell tool takes -- as the end of the options, the -u2
  sed script escapes the word and the suggestion, and a zipped
  ODF file whose name starts with - can be checked
- The hunspell tool no longer searches the OpenOffice.org 2.x and
  3 folders or LibreOffice's user wordbook folder for
  dictionaries, and searches /Library/Spelling and
  ~/Library/Spelling only on macOS
- On Windows, search the share\hunspell, share\myspell and
  share\myspell\dicts folders of the installation that holds
  hunspell.exe
- New configure option --disable-tools to build and install only
  the library
- A static-only build records that in the installed hunvisapi.h,
  so its users need not define HUNSPELL_STATIC
- Install the Hungarian hunspell.5 in hu/man5
- Use Mozilla's own FileMgr and csutil code in MOZILLA_CLIENT
  builds
- A CMake build of the library, as an alternative to configure
- New configure option --enable-werror, off by default
- Man page: the fallback dictionary is en_US, the SYNOPSIS lists
  -u, -U, -u2, -u3, -P and --trace, and -a reads a file with the
  pipe protocol too
- Build fixes: MinGW, the BSDs, macOS, makealias without gawk or
  GNU sed, readline and curses detection, and the release tarball
  ships the CMake files and all the test data
- oss-fuzz and Coverity fixes and hardening

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../hunspell/{hunspell_1.7.5.bb => hunspell_1.7.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.7.5.bb => hunspell_1.7.6.bb} (96%)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.5.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.6.bb
similarity index 96%
rename from meta-oe/recipes-support/hunspell/hunspell_1.7.5.bb
rename to meta-oe/recipes-support/hunspell/hunspell_1.7.6.bb
index ec25dc91e2..f7e98da5ac 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.5.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=c96ca6c1de8adc025adfada81d06fba5 \
 "
 
-SRCREV = "e8342700b4dde06130cdbba75f7e6500ffa58864"
+SRCREV = "15faca15532b34db3106d50f162e5edc2503d6d6"
 SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=v${PV} \
            file://run-ptest \
 "
-- 
2.47.3

