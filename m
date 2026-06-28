Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD842C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:50 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20739.1782663769892595304
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZAR+mKpW;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bf132969bso3664875eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663769; x=1783268569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udVLmWCz1z0ymgscbzM68Y97hEyQIY8Mlc+1bghSnKQ=;
        b=ZAR+mKpWzAQVMJ8YCbkoHTl7DSoyeo/qeiCNGQmgJI8j7lBDbTAQSB5thOiFqH2wWx
         1Neuj47MxH91YpVSd3jicfqBGoVi++DelXixbca0MJt7Xtf7HXD41hzj8EUQH1mWyfgm
         SbWtvN/+8n3Bww3p6Q6bEjgytDi3LSrXFCleqzEdQh04pSMQHqZ65PspyrmC5XDJv5M6
         7a/ldwhF+DK9H/WM9tBvdaLoqOlylOjgHS4GIeW11nhGoMtpmbb0r8v7yRUh3InyqCry
         /SeQ3oCMdcV1BxU01qZ8arZ5RXjFP6fry2anY2G1thnbzTyIFNiT/rwh9EATce8Lfz0l
         yZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663769; x=1783268569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=udVLmWCz1z0ymgscbzM68Y97hEyQIY8Mlc+1bghSnKQ=;
        b=knqvBu7dh0d5dyNeYseaeBsMlRKSCW4ZHkXz2Y9nrW5gCHswru0/wp3wc1yeAkaGe0
         C/f6EKZvjbA7kZDkHgUKOSADYV5VPoxtUIxQ7txCqooFoY20802rf//wJNWx8dlCPjhw
         gJQib/yMz56rCJoifl1ALkZtCzi4mx1t1Tl4L2KgZV9l2UTDmI/p0vd+4dNMDyvXayxK
         gRMQCujfE/ixbCJxTuELoU77uQUL1uEeVthj7kBjZ5e5Kf4gaw5C5vjXVTGR2Sqf3r5f
         Yj57c/gzA/pNglgIv9jmWnWE2NlwpevJdHiYc5c0T1l1RBS8o0heeLvx2J8aEZhLZhI+
         VxCg==
X-Gm-Message-State: AOJu0YwSubPMjpnfVnYrCm+wEL7/Cw/o0SKOKHE0fUK4zehUsp/2/kAn
	WEj2bhfm/DJrnb8yq0LCbOI6Oanqx/Dq8RHFNESFi9hItO78Js1R1xek5vi8icKURatWAQ==
X-Gm-Gg: AfdE7cnLZS9uvQNOf9fSq+B5/DqmlonnHu14jZXpdpGUjTJvAmFes1lZmoGnyXWItrp
	oI7bzUHlcRU1fiBIdHe7eC5bsQjo2PmX4bonOqp9YHUoFmxok8OyWPqtzXDmcitIBmZ6qoeAKS4
	ruro43Q35bOAnZa5AkH/eGVJIeO8PJxzga7LsH/omppJKhxRffxlX2w5SDIKa6Rmyy+I77gqlJx
	F3PEhfZew5U+KUs4lYCKrJHZxzKOVRqJVnh7FMjW+nG0ihwGy6HKqEC1oP+QWvtRPQxiVhHBtpo
	YWr7LJwQzxmlQOww8L6IyVvcZ1ah3tORXP7zj4A1Aaz4YmnR2lS6cCmzm/Lx7+iZkypy3u+2ZcK
	vkxR+p1aUDcPg67Cra/bS9Y0jmiWRlggC/gG/p9q1nZZp0OmbAI8IfvzWEnJF7JKhpflFL/tZAB
	Skl2mIGxnrwmgwhMesoJatJ65eBjztiaVSodItRkGTMhtgWADkYgI5OKNnupG7lfBmjET7Bp0r2
	DuLFFoTUn5GQMMGGzTr0mtSAlwDLr7MpAeuXEGRD3lX21E5RJMmP9AKgHD5xqwhzTxhiWAIYu0J
	Ux7lI6G3O5qXflz98uTFCreAIfy36A==
X-Received: by 2002:a05:7301:9f0f:b0:304:dc05:607e with SMTP id 5a478bee46e88-30c84bdc54amr12026134eec.14.1782663769206;
        Sun, 28 Jun 2026 09:22:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 124/128] libyui-ncurses: fix wchar_t stream to narrow ostream for GCC 16
Date: Sun, 28 Jun 2026 09:22:18 -0700
Message-ID: <20260628162222.4081517-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127934

GCC 16 / libstdc++ implements the C++20 deletion of
std::operator<<(std::ostream&, wchar_t). NCtext.cc and NCRichText.cc stream
a wchar_t directly into a narrow std::ostream for debug output:

  NCtext.cc:348:34: error: use of deleted function
  'std::basic_ostream<char, _Traits>& std::operator<<(...wchar_t)'

Add a patch casting both sites to char (the values are ASCII).

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ar_t-before-streaming-to-narrow-ostr.patch | 46 +++++++++++++++++++
 .../libyui/libyui-ncurses_4.6.2.bb            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libyui/files/0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch

diff --git a/meta-oe/recipes-graphics/libyui/files/0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch b/meta-oe/recipes-graphics/libyui/files/0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch
new file mode 100644
index 0000000000..3193147b4b
--- /dev/null
+++ b/meta-oe/recipes-graphics/libyui/files/0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch
@@ -0,0 +1,46 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jun 2026 00:00:00 +0000
+Subject: [PATCH] NCurses: cast wchar_t before streaming to narrow ostream
+
+GCC 16 / libstdc++ implements the C++20 deletion of
+std::operator<<(std::ostream&, wchar_t). Two debug-output sites stream a
+wchar_t directly into a narrow std::ostream, which is now ill-formed:
+
+  NCtext.cc:348:34: error: use of deleted function
+  'std::basic_ostream<char, _Traits>& std::operator<<(basic_ostream<char,
+  _Traits>&, wchar_t)'
+  NCRichText.cc:521:59: error: use of deleted function ... wchar_t ...
+
+Both values are ASCII characters used purely for debug output, so cast
+them to char to keep the previous behaviour.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/NCRichText.cc | 2 +-
+ src/NCtext.cc     | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+--- a/src/NCtext.cc
++++ b/src/NCtext.cc
+@@ -345,7 +345,7 @@
+     str << "[label" << obj.size() << ':' << obj[0].str();
+
+     if ( obj.hasHotkey() )
+-	str << ':' << obj.hotkey() << " at " << obj.hotpos();
++	str << ':' << static_cast<char>( obj.hotkey() ) << " at " << obj.hotpos();
+
+     return str  << ']';
+ }
+--- a/src/NCRichText.cc
++++ b/src/NCRichText.cc
+@@ -518,7 +518,7 @@
+ 			    break;
+
+ 			default:
+-			    yuiDebug() << "Ignoring " << *wch << std::endl;
++			    yuiDebug() << "Ignoring " << static_cast<char>( *wch ) << std::endl;
+ 		    }
+ 		    ++wch;
+ 		}
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
index d7c96492b2..43a79e26ff 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://../COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad0
 "
 
 SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https \
+           file://0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch \
           "
 
 SRC_URI:append:class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"

