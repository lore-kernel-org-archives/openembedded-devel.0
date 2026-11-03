Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7965.1793701447628754267
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=c3cXz/Fb;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so39940325e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701446; x=1794306246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zk/Kua62CSJD8KBNTu5bL6p/VvXsUIvv11Rvuvm0AmY=;
        b=c3cXz/FbxDkHIVV1EA0kRwIucDb4fdtJ4N2niiW7YOuCqsQOkVpZtB2wHOuEa59YpZ
         cGFysXsq3RCDa/j4HZtiYDzARRDMJU2bXe5GYL9SFsn2AVe04DMsaPpkIipTDR4yR7Dw
         +P4pU/sWsCQu1t85FqBhj1x9FoP/73kWD9xSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701446; x=1794306246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zk/Kua62CSJD8KBNTu5bL6p/VvXsUIvv11Rvuvm0AmY=;
        b=TBOC+LkEDSEb9Jpvee377fdLkRbLGuWGuWy8tln/R1uJG8pK3ZMYY+iA8AQsS5dpu3
         OpW0PTIL+1jKCd1O5ZJDPR67VL9HaSyLvopAELpR9oYy4l2cF4/jtNNCpXA9ZW5syLVq
         TsTK5syk2dc4FtF8n5I0EDB0owHm8v4xYi5zEReKdLwdIK0d59DJpYuZmAT8axfSjck+
         uyAeSI3hVHc6+ohAoiJ1dLHk+k+gZxqS6czqfX+IGyX25leVMXbx3cYH0r6Qlylfk4uk
         tC+FWlg8MJRzdqpULF3UpRiGdJvDjjYjV5ji4ZHI1ULdScgdhPLy1/qTCwfd/2q1hc+w
         Eu4A==
X-Gm-Message-State: APuU4Z9pX7NUfu0WmknUPGz02W0Yq4yIDytCiVam9T9waUkRxxCXiGaR
	C51dRuN6SiYMNyb38ZqUyI8GiAXgtbCyEIj+B1KmdUKC4BEqQU7NK2QCKycijqi8yRhuEVkauuo
	lSAAI
X-Gm-Gg: AYBFou2fKDMvxD6Lgae4JOu8UdydKDI/k3Vo26zcg8+BfOzh9WPXfxsFk1wITn5fbs+
	z/wG1wALItRN3nA055miWZ2o4DpdadnehLldqY4xJjiq2HcLPDbbpHBWgvBCO9EDr+3jy5ebEQU
	CEhkGBBEjZRpN2RjbSN2iCGBlXP+MkGXpxIQnF86wsVs4e2vO3eTqPp+iRZJhOkmRsqxeGwjYf/
	O1yQnyfBspcIIfYXaSsRk93OiqLynJLF8N7r7bXvdafm+vJYNbsdkzphQHPzq9wAX0mZHuQnX/3
	6360vAD18qDaJDj5Qn7LuO3h0WhW4h6pO8ZoXFVs4XsnpeWcqeMbnVK6GJPuht//oggHXXfhEIW
	6QPk+8T2KcAjAnvG7byHzBOIqjKru/wE+VdYbH62trMmQokxkaHPqOqV8ZMD20czBrT5BA1EDOg
	XygNGmQvz+/lktk8xb7llUF3IhGel/6EtuZFTUeURFi76OX/7Ezmnx6PFcobnmcsxS3eEiLAnPv
	T2JOAauyRoaAblIi/NBm6jSFbMjAYuw2a/y6qt56WfMTuS6jDk5R8QF0Nqjv8Q6FW1/jHA35Uj9
	2JoxCOAqW2xQHfdmI/nNBHEmlmUo5OAaN3CncZvRpt9miiOoF3y2Xsy0+8K+iubeS/d/NmxA86C
	0Of9cKqWfFCVvtg9t4bL2dL9Aq2nfOWuKnUW9ng+2gbnE/HyLOkG6mQ==
X-Received: by 2002:a05:600c:638f:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4ac17d168a6mr281284445e9.10.1793701445994;
        Tue, 03 Nov 2026 02:24:05 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:05 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/22] python3-cbor2: Upgrade 6.1.5 -> 6.2.0.post1
Date: Tue,  3 Nov 2026 12:23:31 +0200
Message-ID: <20261103102350.1952237-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131766
Content-Type: text/plain; charset="utf-8"

Upgrade to release 6.2.0.post1:

- Build Pyodide (pyemscripten) wheels for Python 3.14

From 6.2.0:

- Added the strict_hashable_types parameter to CBORDecoder, load()
  and loads() which, when enabled, restricts map keys and set
  elements to text strings and byte strings in order to prevent
  denial-of-service attacks via hash collisions
  (GHSA-p6xp-9h6j-r278)
- Documented decoding concatenated CBOR objects with EOF checks
  between objects
- Fixed CBOREncoder.encode_to_bytes() sharing the string reference
  namespace of the enclosing encode operation when called from a
  default hook
- Fixed the encoder writing the repr() of a bytes regular
  expression pattern (tag 35) instead of the pattern itself, so the
  regular expression decoded back as the text pattern b'...' and no
  longer matched the same input
- Fixed shared references (tag 29) allowing the decoder to
  construct object graphs nested deeper than max_depth, which could
  crash the interpreter with a segmentation fault when such an
  object was hashed (as a map key or set member)
  (GHSA-55vx-2phh-7grr)
- Fixed mission conversion of date values (tags 100 and 1004) to
  JSON as ISO formatted strings
- Fixed a PanicException on Python 3.10 when decoding a string-form
  datetime (tag 0) whose fractional seconds part contains a
  multi-byte Unicode numeric character, as the microsecond padding
  treated those as digits and then truncated the part on a byte
  index inside one of them
- Fixed the decoder accepting a set (tag 258) whose payload is not
  an array, folding a text string, byte string or map into a set of
  its characters, bytes or keys instead of rejecting it
- Fixed the decoder accepting a non-integer exponent or mantissa in
  a decimal fraction (tag 4) or a bigfloat (tag 5)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cbor2_6.1.5.bb => python3-cbor2_6.2.0.post1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_6.1.5.bb => python3-cbor2_6.2.0.post1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post1.bb
index 94d3f30dbb..aa5839a932 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post1.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "6eb06160c42315ac0c4ded461c7d84d92fa18c69d13d17fc1dfc1fae96580c95"
+SRC_URI[sha256sum] = "2465ecef686b61e9feee840f506ef1cc15fa568825344c7b0af504b8230b698c"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
-- 
2.47.3

