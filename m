Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 14B2B787DE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:04 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id n17so1366543pgf.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=l0IqFSCJd/Z8vgEDGoxTizO6/f6zuvWS0AjS2dbhRIk=;
	b=cjm/eChhQsvrHNG7XBNNltGig+9NYL7r1knNlKPaPvMH55qwdEPr9oB5EJE3zmeKyV
	jEOXFflW3i5qG8HX3oDEfjhjIzYSAbpu5z5nY6e/b5h1nsUFmcdCtXeg968/zI8+gt0A
	er3Bz+aK9Bj+fALQ1VL5e8SMl6sF2pfYVB9aGQox8IPewmNHCUSh8wo/eMnYCGHxEqRA
	wSRIK13N3Bd+olYHN6k9BoyShdPB3Yu0Msav5avNBBp6syrWQ8d4ccXfP3D/lyZQ2x7U
	ujGU47xyuZhG2V9MyloVDxB5Z7dg2QrJhiehFH5+LXu+xzlqGp1bjFs+1hy2Jlr0LFD8
	ZCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=l0IqFSCJd/Z8vgEDGoxTizO6/f6zuvWS0AjS2dbhRIk=;
	b=RxFdn/nT7606X3ZHDogyyFKJ9USyHiThs/mDc51QegOgI6AuI8nFi8M49IlzyOPrP0
	ECnbmNB2SWxplCbEVJhxP+vY/q7cebgnlbIvJGxfx4cnuI9TbfsJy8K6U38yU5yv5Ynr
	7HxTI9c9QIC7WoPGg7QDAe3Uhf/uMtf4WYvuSji1FsIFjOruV4BzSjhjhq+eHthjb7SP
	a5b/pwNLO6912MwstCcmOvU7pdUIa2Eu+GQ7YU/GCMYOUL2r+IM9S1KmiSn2aUA/pGM5
	oqD1HrkD6VG1GjWVx+X2tbzpXQAnZmgSLaherxZ7tA4D9nyZOIr5IYv+w6ZGK5otLwoN
	+5Ow==
X-Gm-Message-State: AKwxytchrFgirzq1pJPrGtWZ8MdGr6l/0GPxyyHflgCDbSQGOHdYB3xm
	+1ZtcoQctEBcH2oiE7/6chqYow==
X-Google-Smtp-Source: AH8x2266unO6FPtTtgD3XspMtUTGjK64HRzShrKBYpLSetJ4W4ny0ay+MDzSFMO4IW/gW0Xgx53xOA==
X-Received: by 10.99.65.199 with SMTP id o190mr14042111pga.238.1517023505767; 
	Fri, 26 Jan 2018 19:25:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:27 -0800
Message-Id: <df66128a8ae428b8f4f90b0958232917edb6e160.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 27/36] leveldb: fix checking for SSE flag
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:04 -0000

From: Yi Zhao <yi.zhao@windriver.com>

The build_detect_platform-Check-for-__SSE4_2__.patch tries to use fgrep
with pipe to get the SSE flag. But actually it would fail with error:
fgrep: /tmp/leveldb_build_detect_platform-cxx.25886: No such file or
directory

That means it can not get the correct SSE flag.
We should make sure the fgrep command runs after g++ command has
finished and redirect the stdout and stderr to /dev/null to avoid make
error:
Makefile:18: *** missing separator. Stop.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit fa211625598c9cc2ef965bf95548d21930622aaa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
index bbabf68..8f93cb3 100644
--- a/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
+++ b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
@@ -19,14 +19,15 @@ Index: git/build_detect_platform
 ===================================================================
 --- git.orig/build_detect_platform
 +++ git/build_detect_platform
-@@ -230,13 +230,12 @@ EOF
+@@ -224,13 +224,13 @@ EOF
      rm -f $CXXOUTPUT 2>/dev/null
  
      # Test if gcc SSE 4.2 is supported
 -    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -msse4.2 2>/dev/null  <<EOF
-+    $CXX $CXXFLAGS -Werror -x c++ - -o $CXXOUTPUT -msse4.2 -dD -E 2>/dev/null | fgrep __SSE4_2__ $CXXOUTPUT 2>/dev/null  <<EOF
++    $CXX $CXXFLAGS -Werror -x c++ - -o $CXXOUTPUT -msse4.2 -dD -E 2>/dev/null  <<EOF
        int main() {}
  EOF
++    eval fgrep __SSE4_2__ $CXXOUTPUT >/dev/null 2>&1
      if [ "$?" = 0 ]; then
          PLATFORM_SSEFLAGS="-msse4.2"
      fi
-- 
2.7.4


