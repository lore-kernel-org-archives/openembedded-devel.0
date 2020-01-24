Return-Path: <kraaggorim@gmail.com>
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
	[209.85.219.172])
	by mail.openembedded.org (Postfix) with ESMTP id 49D767FD44
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:42:42 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id l197so1101403ybf.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Akh4EiUsY4q4fkMCjZCWeZZQgk5QzG5YpRQWDgWgRG4=;
	b=ObehYjuM1TuL23IJLyCSrpAOQ3UfJMh4p60I/hn/dJdeupsqyGGwbkJAag10DrzDFG
	8EwuY2BfPgcQaTJyk0gWJdaA8qibs/F3svYFmkpSe/xiubvloQJCIPTrNEWXNebdjlXl
	jPg4+TvWQzf5MNkrtnXsipX1cjkMKnmU0wmvwVsyMkigFT42jE7qI58I/fKESpKWn8Et
	vF3WlAbSNvR+56CK+uioM/v2wx29KDmvNpDemeT8FSsYituVJT8z4I3bx4Wt/tEC9lG+
	6UZHA/+NYskkIEaKBGflyjkzh36RMVomW18HAQR5fxC6PH8pZYhUzSABwZAt/yTI49Od
	vIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Akh4EiUsY4q4fkMCjZCWeZZQgk5QzG5YpRQWDgWgRG4=;
	b=cwHAtvnFYNskhiPncbjYLa7pSBIqXUA+ErBIy4gSyALgC7mFfn7QRJgHesScDHMbUa
	2mUp7CpmCZPw8cwWWJ6uPo6qDyE+/Hl+unnIxeQ4sa6jr7Iq9Z6vLKN30GZAPi49q7gZ
	vZYujc4N2a97GG2qXgGf3zgQpkDfnImNR4Dg69lbAXWbDKzuXyzF+WFk46TVDH8eJlEh
	rZgjIHR+HfQQzDDhTjavxQX2O5m1Ba1SdAjIo8CIMMIldPlLLV+dtQuLTDDqeyHSK90M
	otn61q6lSBG0GDJc9QCnqXGP3+FnndMmvNjuzxxhzwvDNwZYcRvZLm2LynQAw2MNx664
	VyVQ==
X-Gm-Message-State: APjAAAUzDvihnVRUQJI/8MID7TGnegSSkayDG+UdGxZvnUTaLg21lXLt
	Si7WM/wSux5LEjQBRbb6TDKjbSt7drP4P9pCnMoybGTFh5g=
X-Google-Smtp-Source: APXvYqz2QemRSGoxlT91I6vXlAyOVj4YLvWKgr2vqAGia8CCGytZA63ybGt8+au1KzPJIwdEL9RTcvtoffv+HIyXW/I=
X-Received: by 2002:a25:7c45:: with SMTP id x66mr2614905ybc.297.1579880563100; 
	Fri, 24 Jan 2020 07:42:43 -0800 (PST)
MIME-Version: 1.0
From: Kraag Gorim <kraaggorim@gmail.com>
Date: Fri, 24 Jan 2020 16:42:32 +0100
Message-ID: <CACc3Zv5_T8p6bwi3Cbf8ZZiQvJC7=HSgcAnkp_xCc9div=Ng9g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [PATCH 2/2] icedtea7-native: inherit python native
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
X-List-Received-Date: Fri, 24 Jan 2020 15:42:42 -0000
Content-Type: text/plain; charset="UTF-8"

icedtea7-native relys on python to enable building it. Therefor it
should inherit python instead of assuming python being part of
HOSTTOOLS.

Signed-off-by: Kraag Gorim <kraaggorim@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc
b/recipes-core/icedtea/icedtea7-native.inc
index b578cb2..145ca26 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -30,6 +30,7 @@ CFLAGS_append = " -Wno-error=stringop-overflow
-Wno-error=return-type"

 inherit native java autotools pkgconfig
 inherit openjdk-build-helper
+inherit pythonnative

 JAVA_HOME[unexport] = "1"

-- 
2.24.0

