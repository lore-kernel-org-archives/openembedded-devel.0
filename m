Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web10.81136.1629439894771638655
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mBxtmj8R;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629439892; i=@fujitsu.com;
	bh=85XbapARxYIczy6u/ohv3QbSRcUPxO0PNtcZ51ZLiZo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mBxtmj8RajG8UOvu7WzIsw5q3/TDh4ROoXE4OlXufRbdbDl/7M9TCLEiUFdTeyIPm
	 iOapxCoTbUtqgz5XDH0JXXd9S0tPD2J64YTbb/33vn5JIDvNfmHfxDvSDXXSeM+qRT
	 J64zT/Ej2hSOUb8VUgzhsKt+pvRbLZRRdx94PhSNEooLnnNllodHMkfpUEAjTggwC8
	 g0/O/Cri418388je8W+9If3DAQOwynvS8IrFjhDRcQ6dawWPlOpnjzHoNUB6DWdQUU
	 2gkDt5be9OVi2nN6QE72hBU0uKhdlQzt9HFqvK/5jBq5MP3+J2kqyD8mQ5LrvRsAKt
	 WOFd1oR90ZtQA==
Received: from [100.112.199.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 3A/76-29858-4974F116; Fri, 20 Aug 2021 06:11:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MRojvFXT7
  R4NR2aYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPVg8usBSc4K/7sbmZqYHzC0cXIySEkMJtJ
  ovurLIR9glHi8DY5EJtNQE1i+q0brCC2iIC+xNLZe5hBbGYBFYkXv3vYQWxhAVeJPw9mMYHYL
  AKqEssOLQWL8wo4SVyf9pYNxJYQUJCY8vA9WC+ngLPEzZPbGCF2OUl0nWtmgqgXlDg58wkLxH
  wJiYMvXjBD9CpKzL7czAJhV0jMmtXGNIGRfxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQw0DU
  0NNI1tDTXNTKx1Eus0k3SSy3VLU8tLtE11EssL9YrrsxNzknRy0st2cQIDMaUgqM/dzA+fP1B
  7xCjJAeTkiivqpl8ohBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3ihXoJxgUWp6akVaZg4wMmDSE
  hw8SiK8xc5Aad7igsTc4sx0iNQpRl2OL6uWLGIWYsnLz0uVEuftdAMqEgApyijNgxsBi9JLjL
  JSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR514JM4cnMK4Hb9AroCCagI4RUZUGOKElESEk1MK2
  fPrW9fXaNsOmsE5EvCu9XZm5qDCt9n29Ul7dx4/GfFttf+y1+vYl305+ZFb+M3xVuSOlJiZps
  91pl8oS1Icu0xd0PKrd/0BIuejflTciiF6wznlxbM5/dIWvFJeFdmQ7159ne+JiyNt5YKKb3u
  8r38ty6F/dWzri174FqgnayQcnRH9v1KlNeuC+byySf/CqCLYZr3Z8f/zJtVMMy/sXdWTbbdp
  vW596TJwqb7pxvLvLnULbtr713TzO8wk2YMXt73TLeco+d7Loz6o9seKggf8FYdHnWTN73oct
  +zr6/93m9y5MTe7rT1kw55aEi3nBevfQtm+HiXYlfn56xdeTb9/xoRG/J5ubswrPROWVKLMUZ
  iYZazEXFiQCCHGE3TQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-287.messagelabs.com!1629439892!714051!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19197 invoked from network); 20 Aug 2021 06:11:32 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-15.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 06:11:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K6BW1Q026145
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 07:11:32 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 07:11:29 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] live555: upgrade 20210720 -> 20210809
Date: Fri, 20 Aug 2021 14:11:10 +0800
Message-ID: <1629439871-46349-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1629439871-46349-1-git-send-email-wangmy@fujitsu.com>
References: <1629439871-46349-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../live555/{live555_20210720.bb => live555_20210809.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20210720.bb => live555_20210809.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20210720.bb b/meta-oe/recipes-multimedia/live555/live555_20210809.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/live555/live555_20210720.bb
rename to meta-oe/recipes-multimedia/live555/live555_20210809.bb
index 52230cdda5..b6a7d9488c 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210720.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210809.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "3a9a83618b07192c5fb0d824bdafaece466086bb44b5634fac32e8f9e00c7994"
+SRC_URI[sha256sum] = "31ce35f13d676033da3fafdb67c6f26e9717438112230743a107dd3a67ebe285"
 
 S = "${WORKDIR}/live"
 
-- 
2.25.1

