Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37926.1795594078821994496
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cqZT/vQh;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3863db981d4so7616110eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594078; x=1796198878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLn5SbK4ZToimZwyMnVe8NU6BajfhjsidM/j4osLTRU=;
        b=cqZT/vQhbHsiFuWXXmMMSqdFcoztiSfEkan4SptFrBMIpRNsHu6bcCI1VGD1hhWjGL
         w1+og4hTb2XlaQYdRFVW8uYHw55VZOEViPZCCeAZvUOS8A7i2wHhH8KKSjeKe6s4W2DQ
         huKZkU0niY9bQw5qa7dvEZgNEoV1Hbhl8POzCtxXTnq362u359f+RaAXpLwOw+4i9Pfa
         8Ft7A+BQOzYtTxpS+eUjqE9VLJEvjCZAYoZYMABbpaWYdQuFzvtB15F/WVF5s0SYyetc
         W+ZYgExAcHbBuBa2w5LWGappUZB9bjs0WsZemGDmPYAURtSSrl3Ll2FYpuPw/9CTDo3C
         DjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594078; x=1796198878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VLn5SbK4ZToimZwyMnVe8NU6BajfhjsidM/j4osLTRU=;
        b=eJEBgIU9SzYnvyex/9nL4Xh/GTNIXZovwFPw5xD736AeiyCxjgp0k3ZGK9BKrcjYvs
         BF1qCqiuLaX5LJ9wy51syT8vDPrv3KbwLl3NUNFVbmKUHKo6pFRSNwkhd56Jijz3hXG4
         mA4VziyiGm1rbIQN4Pu+OAFn9mTO4uNoy9em5GxSJsVzIXZMvO0tkNFsnil1feVN8Hvj
         3dbIuL6C0sBzPvrYcQs664koYaK7pPnQstaXSjJ1B8aPg3izS+AFxxHBfb2JNpQnm7lc
         ba3XW0MEcoGXae7q7m2Tz5+tbv1BytGHRPw+VD4mo+fHMeCetk+7ahXyGxUqVqwiM+WR
         LJOw==
X-Gm-Message-State: APuU4Z9rS8dcRZnX3DRJJF1IqsMIxj/MAYcPOXkktFYMWxpeNwpTC4MO
	BnjgB9mOQotT8EMcGIFJsG60TpAfygkR8Lo9djE4NhRnUUxmwYyAaDvZSQz+lVi5
X-Gm-Gg: AZFdTZe/TF6hnXPL3JXBihlf76YghKmNoCkFH0ZjOsn7kPCZg/YkunP2HYqHX5G6K8h
	WEmpyp2b4b2gZcySCof5Na7coGk6VLWmSRF7fjOEGkZxOHhbIGh3u5bRh7ofMGs04EM2wzYpQQq
	4km2n9jlTh6xBaJgeOEGsZFqoSH4UbxnqEUv4y5BlLQsBQXTvab2qY5J7/0XxrzSUK4Kslkha6m
	4Mg7NdUHeX8s7vTImk9RZ1zEnAJD6mri4NlvoRTHbpItTJb2LcmoTBxXmqz9SvDorrX4OL+UQpD
	i9oQu/dhvrlavozKRdAU6vnaLxtakydMepj0uOuUmakbE59g4nqlGPQPnyXfznfTqhTWNr4hW5L
	NCw051RjmTxPqpgDUYVEmL5JadGb/0wLhL8bKwE3A/ZvdExC1mycHIDIdIOCgTjdBaDLkmo3EQu
	uYRJ1QmE2gC1L7bwQlD3l4vdUX7Tddc9lQ8XK9FqDSVX/CIkWPzRkspCa25D+XpliaS6CLu5x+X
	ZhUL3k0kKxsoNMa24GU45tcihlbh6q8NmKQfgvIGgSYP6TzbhPG3mLMjCiOuyB0D+nl4n/4JQWw
	C2hp4lI4QlKe/IvhjMTdBlPXjMGGie767uMSxKnjSQuCA0fZCvPdgqs3+blwCfs0OS7QCcyJLDA
	LLrlO2/U8jcWXH2Q86IhAEzfEliMzt+IX9MUMpSB98ooSxAb7HKbbjq4TNGOJk9zQDpMPZYuZjW
	4y9P+Z6+byCi+D7VpZ4PSSZShRtcjXG6aeNqPAgU1PL8dbjdtaiEeGIlOKTODOKZjsckIacMtFf
	uir8ezMWxtq4UBNUZWVuuiI3IeGpKeLqvCh+3AQG/QJk4HlFHPtOCL5SR91d3IU5Fv7BD52538L
	XXda
X-Received: by 2002:a05:7301:6181:10b0:386:b2ac:1f17 with SMTP id 5a478bee46e88-386b2ac2832mr8584511eec.7.1795594078221;
        Wed, 25 Nov 2026 00:07:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 12/55] lmdb: upgrade 0.9.35 -> 0.9.36
Date: Wed, 25 Nov 2026 00:06:28 -0800
Message-ID: <20261125080732.2419614-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133015
Content-Type: text/plain; charset="utf-8"

- Reject zero-length values in DUPSORT databases and add more input
  validation for MDB_MULTIPLE puts
- Fix writes of 2GB values, limit sub-page growth when re-adding
  existing data and fix mdb_stat page counts for DUPSORT databases
- Platform fixes: metapage sync and SIGPIPE in mdb_copy on macOS, no
  fdatasync on FreeBSD 11.0 and older, large writes on Windows

Stay on the 0.9 series: 1.0 changes the on-disk format, so existing 0.9
databases cannot be opened without a dump and load. Restrict the
upstream check to 0.9 releases.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/lmdb/{lmdb_0.9.35.bb => lmdb_0.9.36.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/lmdb/{lmdb_0.9.35.bb => lmdb_0.9.36.bb} (89%)

diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.35.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.36.bb
similarity index 89%
rename from meta-oe/recipes-dbs/lmdb/lmdb_0.9.35.bb
rename to meta-oe/recipes-dbs/lmdb/lmdb_0.9.36.bb
index 36f2056914..8ed1853500 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.35.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.36.bb
@@ -14,7 +14,10 @@ SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https;tag=LMDB_${P
            file://0001-make-set-soname-on-liblmdb.patch;patchdir=../.. \
            "
 
-SRCREV = "69087ced3cb6082f7dcfb4fc2dcaa3b68a7e2e8c"
+SRCREV = "028f61b6832032174f893484719ed4848d8d60db"
+
+# Stay on 0.9: 1.0 changes the on-disk format
+UPSTREAM_CHECK_GITTAGREGEX = "LMDB_(?P<pver>0\.9(\.\d+)+)"
 
 inherit ptest
 
