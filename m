Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACDACCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:52:10 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.37397.1759765929676334299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mUCyYvCK;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d603b674aso54656977b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765929; x=1760370729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEEE7bfUXwMFV1BhdJE4O5Vyn3YcwWhLFwHn/KDwkvg=;
        b=mUCyYvCKLR3uHfYjndqMZRwJUB/fhA1AcD2sF0JRmibyscCuuP1RU1iVf3WQngx6jM
         xLSO27M7WCWgxiIub8I7SQUGJi5DWvw/xWiAiIMwYYW6NB02inqV3FBnHgfDR8te1RfK
         DBAxTiQU7m/fAth5ZboSgdeCmy7SEbbmLZR/yq3RnNhR7Ix74pyVCBeLk+yfSTJpNBRG
         OyWDvGk1H+IIiGxJQD7EYNK3tK4yx5HskfqqDJ5z8rLYqHq3azGJ0dqcj9OcDIsdvlC3
         WphT2vBWl6jCIONWxdBwF2+BIC+FnuyLA40NHothFG7FjCK4vXSDyy/McD6wG6xejZrV
         j2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765929; x=1760370729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEEE7bfUXwMFV1BhdJE4O5Vyn3YcwWhLFwHn/KDwkvg=;
        b=Z33XKXqukAeyxEIFKxmUMQK/YJXdxzTR8JwtLVPwj54ZbvufWs9byVqLi8R/OgLPGw
         D8DZ5Tn1R26iUrC/5okoXI7kx+jFyyYwvilpQnfN3iECrUSwopoAA2OTsNwWSNHfkVIY
         wZ50HiU9O/r82gYwvMMTsg5b6sA6jsyDoR/IKw+eHkOlzuwwC7geqF8Rg++zNUDbD7Zi
         UJTZlz9ua0NQGG8POiKYq7vCUZUJ3ZXIRm1C1S2gANcz74uyH6FpBFFdGdIKjW7QVade
         7CAjw3xHttpCEXMTOlJJU4WrYt2Z0VFxyvucEZS+oUrU810wowLOryQpYKr/dMRd8iGf
         7WZw==
X-Gm-Message-State: AOJu0YyQtuElY3FnsUNNgFXwqD1M59dQa+1iYhevBQLLltmKJiCAGDSC
	qxgu3kVfjgXwPr8oJNDFoKZU+t/jUwK2JJYEWHU6UbnC+anJsg+ELNEGA9gHPQhO
X-Gm-Gg: ASbGnctt/pbb9lien2F17Hp1uHRYyUgQL+75BP2KywMiBB97xCoW+snbqTF0bw2mS0X
	NhyX89Q7HTLt3O3xSpkBraS2e+ROtkTbKg85P8dFowLZSAKNzGEl/UKkRf3wUZr0k/tTe0OIhNy
	RtvVK01GcW8v71JpmeixynhPTBPRgMchqkMzg23/VwE5ws3IwSe9/gCintFPw82+iWonzpx0GYM
	4s1ygqcdyiIKuzARc9dLLiXwTPRDBDlnHaCKdwAfzk7ye3jkDV4wnV+cS3mmp0JzNMFBXLILtd4
	KXjSoTPyc8LbHD2rGIvrPdExRk3x25PkE8wa6HQTQ1GQKHSVR3kLDoc1nXsZi8pI9H9xyc0jjZU
	Mfv7/8KYaAq8BSk+HVFvHkPkLUkiUnaC8ldQJDZqYLp0Nl5BEX0pxbaZaX0cuDoU=
X-Google-Smtp-Source: AGHT+IHwgjCPNUi/e2WPCTGiUTKiYkSmoX7LfSDBeQuIeiSuDIZeb39lythEuVhYoIqaawSWQ5hchw==
X-Received: by 2002:a05:690c:f0e:b0:771:dda2:f1fd with SMTP id 00721157ae682-77f945c3038mr159194997b3.18.1759765928254;
        Mon, 06 Oct 2025 08:52:08 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c34d7esm44294397b3.21.2025.10.06.08.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 08:52:08 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 05/10] xfce4-systemload-plugin: upgrade 1.3.2 -> 1.4.0
Date: Mon,  6 Oct 2025 11:51:41 -0400
Message-ID: <20251006155146.416335-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006155146.416335-1-schonm@gmail.com>
References: <20251006155146.416335-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 15:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120296

refresh patch.

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-systemload-plugin/-/tags/xfce4-systemload-plugin-1.4.0
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-systemload-plugin/-/tags/xfce4-systemload-plugin-1.3.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../systemload/xfce4-systemload-plugin/convert-gulong.patch | 6 +++---
 ...oad-plugin_1.3.2.bb => xfce4-systemload-plugin_1.4.0.bb} | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.3.2.bb => xfce4-systemload-plugin_1.4.0.bb} (80%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin/convert-gulong.patch b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin/convert-gulong.patch
index 30897caab3..599ba569b7 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin/convert-gulong.patch
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin/convert-gulong.patch
@@ -14,15 +14,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/panel-plugin/network.cc
 +++ b/panel-plugin/network.cc
-@@ -114,6 +114,7 @@ read_netload_proc (gulong *bytes)
+@@ -118,6 +118,7 @@ read_netload_proc (gulong *bytes)
  gint
  read_netload (gulong *net, gulong *NTotal)
  {
 +    gulong tbytes[2];
-     static guint64 bytes[2];
+     static gulong bytes[2];
      static gint64 time[2];
  
-@@ -122,10 +123,12 @@ read_netload (gulong *net, gulong *NTota
+@@ -123,10 +124,12 @@ read_netload (gulong *net, gulong *NTota
  
      time[1] = g_get_monotonic_time ();
  
diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.4.0.bb
similarity index 80%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.4.0.bb
index 0b07bda32b..584bc887a9 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.4.0.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-systemload-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9acb172a93ff6c43cce2aff790a8aef8"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
 PACKAGECONFIG ?= "network power"
@@ -10,4 +12,4 @@ PACKAGECONFIG[power] = ",,upower"
 PACKAGECONFIG[network] = ",,libgtop"
 
 SRC_URI += "file://convert-gulong.patch"
-SRC_URI[sha256sum] = "bb303fc3020e053ad1fa0b8fcbf0d7681c5563bb8f649357d6a95a577802b072"
+SRC_URI[sha256sum] = "6e363bcf845bb88329b52858d65a1ec6e00db5121ae9246e46eb03135d9569c6"
-- 
2.43.0


