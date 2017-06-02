Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 278C36076F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:55:21 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id n195so30332979wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jun 2017 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PGPM/faj0gRBsrZfwJP8f6NbgKsv1I9kwnowreFr/1A=;
	b=E7ogv6zTBnmtvRJEa/2TY9ANZeErt56hPHG+cmM6yQQa39btaWe4F2xv/8eU6CsK3f
	C+2gPh1pUyMSZqT7Ke4lNfv5duCUQTCf9WLH0AvQmw3AcWsZ470KqHMthvnKaNb6+00w
	Lfk+6x4nSyM0vZ3uorr/gyBRVs+Z1dDVmpKrGYllUn43Tf4cTvOzug0mvktjJeQxZGta
	tMpbWNOgzFh7Kv/VVYywNaDY7uCU0YvtKUJ8zlwqcvzQ+vz3H2oeAUtl1Zo+AUbxNSr0
	VgU2TBgEQlY8TmuzNohVY/V6aoRNEhSJ24TFT1d+EMhwD3kBlepZ8iH/jPtmIjhe0k62
	B1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PGPM/faj0gRBsrZfwJP8f6NbgKsv1I9kwnowreFr/1A=;
	b=TxubDKXzT/UUjmpNzPoZwFknOryXGhMQ+MK9MyivVPNDbLbgp+iVhiFOWl3kAeIw9t
	kpUiHoSeRxhTXC6amNNl/Kdhyg5RIgfMt0ocSV94JWuZYdnF9cg2UGQhhJ7ZnR+6rcUJ
	KEObTmcW7TptEHQI7TyJKLx0CS9GP41JR+FZMzXead/2KRcthv+mGGtH7mM3mW25Tjh/
	xGMjHyGoMgFuhaItEJGctdr9msMjRj85aTaZ6oPPiFhzsyvgvwWe7KzZGADikqKov7k5
	9HVrQO2kWG6iy8G40NgJbFmHPS7xvIIbLy/b4Sy573qMnQjymiAFKupG5WEIolsuob3H
	VKgg==
X-Gm-Message-State: AODbwcD2ebYNdLwtjfnTi78RD6wgNMKNFI5yBCHxoAX9O1bZqNpaBIOh
	Cw/evAJwifFnLgmH+0E=
X-Received: by 10.28.199.65 with SMTP id x62mr3317198wmf.49.1496418922412;
	Fri, 02 Jun 2017 08:55:22 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m14sm2940059wmi.2.2017.06.02.08.55.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Jun 2017 08:55:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jun 2017 16:55:15 +0100
Message-Id: <1496418916-17305-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] meson: enable process reporting for do_compile
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
X-List-Received-Date: Fri, 02 Jun 2017 15:55:23 -0000

Ninja outputs progress information during a build (for example [12/34]) so we
can tell bitbake how to parse this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/classes/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index 5a04134..42f4005 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -75,6 +75,7 @@ meson_do_configure() {
     fi
 }
 
+do_compile[progress] = "outof:^\[(\d+)/(\d+)\]"
 meson_do_compile() {
     ninja ${PARALLEL_MAKE}
 }
-- 
2.8.1


