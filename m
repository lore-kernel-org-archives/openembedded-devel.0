Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 23D7174D39
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 May 2018 06:18:11 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j11-v6so18081145pgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2018 23:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gNUdTHk49Gc+e0L2V1CJ4NWuvPkKTerME8Wb/O09qZg=;
	b=Xpg2+morCkn4KwjfhT4RL8qvxb/GPycVNEHX/kVmjw7DgX7Z/zwcaxoY+4p/rGeYEe
	xsk0oWT8gqNW+9JHpX1X3xyDCyFqE3dSBFC3iekaUVXFqEoWCCDBttuoOgDPeflmRzqX
	eik95ExJBjdy+zzQQ3jldgKx/jS1XxZkZPxEnAQbPug+CMMxgcvPPxQb6t1t1da5BmXA
	H62emlXZWWCOdnhknw4D9B1sJ3soiCdkvp4SnbVRSwVMYh4Tw+JY73IJkMOrpQMNaJjU
	FCvuOA7NBzpPwvHf+G/kNEuh7+W2HLobNBbnbjpoACZY7hQ1giMu5tqVX1jQh//0KDRr
	OutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gNUdTHk49Gc+e0L2V1CJ4NWuvPkKTerME8Wb/O09qZg=;
	b=WZRXY7tX6FwiKEof7BZM9Ryj6DqThjiKeq44Y86XXSvsN7vGmlnbdczsudJQFZYIOh
	PUulf9wcnEwdGa9q84SEkHOlYQI/Qa+UgWUX9Cv3z3Jm532DU/5ww8ZsLITLnRpV6In8
	9zbbiHnCegvhlrP1MP6Px2nKcsvGnr5vBFos9P+L/ZGu6TO/YUehND/2HJ4OSqo2pLQJ
	zJzRRjdje/wX2kZSdId3vVUsOnNuwkfdfKVW+dqsCeAJQWuYKa36dwjV7Y9S35666qXd
	USTeAwW5KXJYiVq5V+Jnh0QN2urDiWXjnDiD8vAovVTT251amkV/PL5SnN/z5g7TV5je
	NrCg==
X-Gm-Message-State: ALQs6tDwpUyd33vm+kpmWpqZ4oHqorseZKnf030pR17JZWNf90f3zUTU
	iMUHo4kGOM4EYTTX+4W5MfVAVw==
X-Google-Smtp-Source: AB8JxZopbzyhA5RDx/rRKyz0XkJOb5p3Y84U8oPsPA+E80TCbMgqTbdW8oFUON/HKQjJJGUw6Lc1fQ==
X-Received: by 2002:a17:902:2006:: with SMTP id
	n6-v6mr34135306pla.125.1525587492137; 
	Sat, 05 May 2018 23:18:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	s65sm46674457pfj.124.2018.05.05.23.18.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 May 2018 23:18:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 May 2018 23:18:01 -0700
Message-Id: <20180506061804.19509-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180506061804.19509-1-raj.khem@gmail.com>
References: <20180506061804.19509-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] geany-plugins: Add dependency on fribidi
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
X-List-Received-Date: Sun, 06 May 2018 06:18:11 -0000

Its needed by addons

Fixes

ld: cannot find -lfribidi
| collect2: error: ld returned 1 exit status
| make[3]: *** [Makefile:569: addons.la] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
index 3b5b7ce94..d8f2f894b 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
@@ -11,6 +11,7 @@ python () {
 }
 
 DEPENDS = " \
+    fribidi \
     geany \
     libxml2 \
     libsoup-2.4 \
-- 
2.17.0


