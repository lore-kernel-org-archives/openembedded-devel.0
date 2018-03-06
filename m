Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 164EB78A84
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 01:55:14 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 61-v6so10955846plf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2018 17:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9v/hMZqo9gI1T69SXVI/3ZtGxqmzKsvT1PU2FMV+Kqk=;
	b=YL+8wV6dGdsmKiOefS09N74CBLTyzyEtPdC/dT4UCwBX22kMODsoBKmCTHWIjRtkBW
	N7a1MNlsqz78gDiGzE/TcmmJ0RIG/zdhJ2w7172MmsV9AiF+JoCaUeZuwWBus0UV6s2b
	b5vBBtru3LMB/gj1kBEcMNUEFhaCCXCvWWchQ6NKnpjQ2VTVsDkm5PgAKjodY5zsWUY9
	+RhaNJsDq+0jUsp4qA1ggoTgV67x5MOEG24l1XlxJIsZx0APwnWaYhKcrwDMoxqTkD/R
	6cQT2XVQC7Cp9L7nt68IknHV6SYfoH9JT4Hm3y2pJb+E88cDq8p9iiEEM/T8mn0xolNG
	zjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9v/hMZqo9gI1T69SXVI/3ZtGxqmzKsvT1PU2FMV+Kqk=;
	b=eI7Ut+pqETzpfUPpFi+h57ybcjt9uuNN/GhcRQPJSkHSZBF5UaZiFAfCJZkoFmAH3B
	Znc6LEyuVgTS+XZ4O65O+CteD+fZoSNqfv+BysjJJdu1VDsRrm45mtGWCVQ94losKd7p
	RKArpNlJfggGmBmNLveEJul+fBtoeVVq+MJxuDQu/kjIjMOBJV1zhBj4ZnKBmRijfKNP
	RJ51I2mY5USOv1ll8EFUPiRSZ3rkMOug0eZfuCmWwCipczQtgq9Wm1KP8Hq3aumw6pC9
	6fEJzBTg8m5QVS0lvZuIXkwzCtM1AWT5gN+JIyR+oEJ/hn30URJdXKn3mBqqB1o+pPE0
	V8mw==
X-Gm-Message-State: AElRT7H/zcDuXG4KTPqu4+9ww/nQ6E+be7+EskrIcCojJ4AOBJ7HOkwb
	PyhZoJNL5azGjN4lto2oYfYk2Q==
X-Google-Smtp-Source: AG47ELtEUooa+u0x6WwY9GB+7IDVKf0TByTMsD9NUWYRrkKXKxy/j7c4QVCNPh9HIwTJ9wL0Apjhxg==
X-Received: by 2002:a17:902:7d17:: with SMTP id
	z23-v6mr7961720pll.237.1520301315784; 
	Mon, 05 Mar 2018 17:55:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:95c8:2b55:de97:f11f])
	by smtp.gmail.com with ESMTPSA id
	p125sm31985927pfp.43.2018.03.05.17.55.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Mar 2018 17:55:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:55:11 -0800
Message-Id: <1520301312-29879-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520301312-29879-1-git-send-email-akuster808@gmail.com>
References: <1520301312-29879-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 3/4] grpc: move it from oe to networking layer
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
X-List-Received-Date: Tue, 06 Mar 2018 01:55:14 -0000

grpc has dependancy on meta-networking packages.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch  | 0
 .../grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch   | 0
 .../grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch    | 0
 {meta-oe => meta-networking}/recipes-devtools/grpc/grpc_1.8.5.bb          | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc_1.8.5.bb (100%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
rename to meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
rename to meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch b/meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
rename to meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb b/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
rename to meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
-- 
2.7.4


