Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6333.1792499554960045305
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GU1RqfsQ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so18283515e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499553; x=1793104353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rE9r7vGWLRQa7eg+TS6uDsZmpAzplmgA3Pa0Qhb7f68=;
        b=GU1RqfsQ6huZaxnQiR/RXuHb3UaXT8DldiSNdHvI/3ngbDJlILImwCSmR3BQ9YySe4
         8kbgQBUh1/ooXh7ETBvavm0wHZJFDHto7ST4WqTfA8DGl+kTg//JJfYERBcKz6XALIec
         seT8EWJOHm8PisxHfNSlztE2evR08F5kLFTls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499553; x=1793104353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rE9r7vGWLRQa7eg+TS6uDsZmpAzplmgA3Pa0Qhb7f68=;
        b=J92dELyoI31lUV/9KMJ7Jphjoflkvox3kvOCfm1xVs4vBrxAPfUnTyPA2MvVvHmZJ1
         ie2ekkvW01+M9g5xMZSYTvCP8qDkExaVbJZ1H3RjxkqhyD5knFPvMrhVbgGudSdXkfwI
         gl1jDJ6EFNGIE3O9ve8uzUZyEafv/0wIWY+MlhrBv26Bk1HtwluEoCAasLplVeE181HQ
         h5WV2Y6H2kjA45clm7o6be6HzM4pes9lnWv8Qt4Qm/rDHg8gn3LFZyTUHCe/kdkqF5So
         15eoVgyDp/3nwQAMs6ODZQeBh0M/qlIK0gwED5aCPEKjFV4NtU9Pkyjns77B4EFL7EQD
         G5uw==
X-Gm-Message-State: AFq9FYKBxHDehnWJYygNJxf7oQhuHDoXs7G4VJQVF+G9iNlJ0THbM3ZS
	0ANS/XDuhUGWxZDbq/9oZBrvWViPynrqVOt8PdDYlkMklt6oHw08PtZqJtxhEsyygK9k45oooqY
	TVzHo
X-Gm-Gg: AYBFou1wDRRlyPtBvkTaRkezXjHyvn0fsooIKLyQTSV1+UMRAS6AT1HJSxOzraCG7UX
	4+bSccgwKzxT8KOmNHUDPqyDMGQeHGce2fpcfWKaJ+Xl4s0yVOeglLCs/QD+nuquaQcfoBzgpaE
	JfYmOBd9ylEUkMpQ+/jxOqRUrPSm8Gpd7H4p8mphxAMpYqx3OVHkev8X3znbV14ddz73NAgvb2C
	4Hc4Oo54zPT8I+ItgMfp9phsfOkPmKgvkB9OXCgpGVMcT/37bo2A/hJcqKN6xkcTsUltoLzw3ol
	jDlm3KwTirlqf/YfZRfOsqwaVhrt86c7c93dcNCvbAjG1PeKRIZQAHteidABFNwm9FrDoGlWChV
	scXeGHTt2TxQOT7aaZEyonWavd6gyKxA0FodOT9Rm4qLUbSRWRgFU58zOJqvMD5Is64BmDO5qpz
	0+6fw0xiayCZ3/0+hTsKfu3hnT+IutFxTicMlxkM/YFo9j/K+oqGQqXUc/t6hLXo25iSfBWDWMD
	p46k+9137vhp1LDdjNdfMNhgI25T3YXEDVPLolWUegT8EJpxGv/k/itQwleO8mRmzgHdL8T0VE/
	u60APv/u+14VT+nl1hrUY0Q=
X-Received: by 2002:a05:600c:c117:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a1d75af362mr168814085e9.4.1792499553200;
        Tue, 20 Oct 2026 05:32:33 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:32 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/14] python3-distlib: Upgrade 0.4.0 -> 0.4.4
Date: Tue, 20 Oct 2026 15:32:17 +0300
Message-ID: <20261020123226.4033600-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131163
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.4.4:

compat:

- Fixed a missing import.

markers:

- Enforce compatible-release bounds in environment markers.

metadata:

- Add an urls property to expose project and home URLs.

scripts:

- Raise the correct exception when a launcher can't be written.
- Detect shell-script Python executables in ScriptMaker shebangs.

util:

- Improve performance of export entry search to take linear time.
- Use tarfile.data_filter rather than tarfile.tar_filter in
  unarchive() when extraction filters are available, matching the
  Python 3.14 default. Path and link containment checks now use
  os.path.realpath and no longer fail with IndexError for members
  such as . or ./.
- unarchive() now resolves member paths through symlinks seen
  earlier in the same archive, so a chain of individually
  harmless-looking links cannot be used to write outside the
  destination on Pythons without extraction filters.

version:

- Improve NormalizedVersion by addressing correctness and
  performance gaps found by comparison with packaging.
- Improve SemanticVersion by comparing numeric prerelease
  identifiers, including those longer than 8 digits.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-distlib_0.4.0.bb => python3-distlib_0.4.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-distlib_0.4.0.bb => python3-distlib_0.4.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-distlib_0.4.0.bb b/meta-python/recipes-devtools/python/python3-distlib_0.4.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-distlib_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-distlib_0.4.4.bb
index d094186236..0667cdba3e 100644
--- a/meta-python/recipes-devtools/python/python3-distlib_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-distlib_0.4.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/distlib"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc"
 
-SRC_URI[sha256sum] = "feec40075be03a04501a973d81f633735b4b69f98b05450592310c0f401a4e0d"
+SRC_URI[sha256sum] = "ca4175b4ac7f71223cc30ed7248c45d2b38c2439d8ee6e498ab67ed63cf3508d"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_setuptools_build_meta
-- 
2.47.3

