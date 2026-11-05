Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6753.1793913798051122750
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:23:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TcE0ajHO;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-353804b591eso4458931eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913797; x=1794518597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYs0YTX3ACuvTvvG7h3lurK1wzpL0jUs1l5a2Uu7sN0=;
        b=TcE0ajHOqeUVmIcYbY/gU1TO2K0hJHzQrsu6xfdR+VJCry+gHuHzoz0Vb/94qZCJcE
         lNmL3OnOyCvUiGT+1L+HK4C+ZAYNe7iOthd0vkpP9bJp0yYPmHuKop7l2cjY+pwKXqk4
         WSn1NrpcflVQ1VMi6oJBmlqJYCZodm6K8UHNe495PSE62alIiQVKDXJEf0gG/ChNc1K7
         tOKWTeEsInhbJOXZS6b5HyGfr21/aj3HUs1zN43W4XOPRdtofyUoSgJfbIfHh/bRNjk7
         MY/3js2QX5ZlwFb37Kk0Km5DjaYJXxCatiWcqErM7+OWFkFPXcdKs9/0tPEojf6pulIz
         mdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913797; x=1794518597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYs0YTX3ACuvTvvG7h3lurK1wzpL0jUs1l5a2Uu7sN0=;
        b=bw/Q1OkzpR2pqUQvrdD4IvSH1TqPJ4JCsghLxKhP8/n64KKmOiLTHbpm0KfGAVD13f
         Wk+uST4/R0fPv/gKzSFWsxYF8Bd2pccOnRQhALrAzwQWSZPgMxye/ZCX8PDVqJX81ARP
         4wnQc3S8iGUkseOZvldR982gcG8I35RSvqIPu1GnmQeJHdUSST+r+6yMB6RjlNF57Yx1
         lS0V/CY3UwcVrOmt/VWmxvyrQh5rDNCbrFGrENQ5gaYyW5bZ0v36bl4lSSOxAhTKXlLl
         /P+Tqx78b3CeloWn5Xr20iUXTFQj20IxJki/vEPC1U+TUfj9xfcj1C80suGIhKncRMpw
         Zgzw==
X-Gm-Message-State: APuU4Z+LAX8lxjEWFeGidshI/iDwkxI2svCBerALY7zPily7L3KPGerY
	0UM3+nr8frLd1mWlkHTPZt+pTToNtzIvUXyocmBBuNp9k+oKD/bFq8yanwy+9A==
X-Gm-Gg: AYBFou1L0/G4MCi9HhkhQkR3J3gCuEXR8DTrGggAadMAZ1fqw9Lhikh5hwD2+dc/FJa
	/qTkG36hOSt7m9wwZNzpF69BGDlv04B7LXECqRbKM/+b5s/hx+GjhtFKfhTMMXVipKmZ/rE0B28
	oj+G+MZcmZjZbIHuOKKiMzwNq3dQ2b2UEoS5DLg66DpwDbSMqX79mAgWDrx8dPbYWsspNnNt7XV
	QUehAQqBUiloKE22/4ND3HVatHGVYO0XMWCgz+OAb5uoKHXCBYGHrPA0oe7n7y8vk8fgX+dCk9w
	Z8TWoQJuDeeBPnhmN6lXJfvkU/z4kaopqRbA8bEOId8vNXyN3a1lXqvCQFGjyY9gDG3E9CLUi5a
	ceOD56joA8dlZfPRULFmXNLCTmDlhw86B045WhYNMFV0hX40pQNdNKfNSMaJHntnihk88ZsOO6o
	bHHH9APkVVtwIprXl8gf4RbNifokTi9FsdM9l8HCyn7ofn2lx5weaRUqfmN9Tz+m1YiKt19NamC
	aWIBxoj9P7HRiJWE/qx2QDxl2fpYgp2GkOZziVCOlj4lupLNe1TwMFTzwOnoU+BOK9C8sWNpwuk
	t7wJKy2k4qCn32hLuwrKwioGUhXQrU0N6sg4AGO/hANqNwRXOuAyqJ7A73Fl0Q==
X-Received: by 2002:a05:7301:251b:b0:36a:1e0a:accb with SMTP id 5a478bee46e88-36f7631c69amr483757eec.35.1793913797110;
        Thu, 05 Nov 2026 13:23:17 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:23:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 11/14] valkey: upgrade 9.0.6 -> 9.0.7
Date: Fri,  6 Nov 2026 10:22:47 +1300
Message-ID: <20261105212250.490188-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131948
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/valkey-io/valkey/releases/tag/9.0.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../valkey/{valkey_9.0.6.bb => valkey_9.0.7.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.6.bb => valkey_9.0.7.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.6.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.7.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_9.0.6.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.0.7.bb
index d31a5dbfe5..10a8eec507 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.6.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.7.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=$
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "a100149d56208209c03f8af9840afe2efa7fb8d1"
+SRCREV = "fe8d406c0b5a64ec897f6455e4de684629883764"
 
 RPROVIDES:${PN} = "virtual-redis"
 
