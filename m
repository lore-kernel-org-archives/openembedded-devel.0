Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.1050.1611269714331246870
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MLsDkwi/;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id y187so2838932wmd.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 14:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AxcW8HnJ7cZV8mX1AadvbzgAnPKyeI/gDdQXOvTFx6s=;
        b=MLsDkwi/QZz3cMlVkT9OHtqoDj20KPN+h3n3QExJW4DkuD5gCGdJZ62ZO+BTZBHV/0
         uWs2R1//QTOXCot0lsa4wDvCsxJNtBoCKCZb6bRv7tfhs3hJym+fbnypfIcOW8db3KaV
         2zEVv3LixEJscck1q7twYSAqyb9V3yIoZI9vKjPoR4vD1i7QWGGO3CAQI4Xxd6p5O/bB
         0nkvw9mPAbDA0p4qTZCrngjT4A9LZVhh6BlTj5EmMndrtPHtOURv3Dbrc1xhMvFu6sbQ
         hfk2Qp8kEiRMTcieFz58YazU3tJDWzrQKhzEBTuHWxkkY3U1Wu3B9T61pLJTmiwCw63C
         KxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AxcW8HnJ7cZV8mX1AadvbzgAnPKyeI/gDdQXOvTFx6s=;
        b=eUZX5xM7sZ8Ve/lJTLJqJTgCri+RbrknuJlxgTEiaCjvpec+disR+G1fJYYcQaFC5N
         myhoPBLO48Iw7R4OHV8rvyupCpyVlKeQ1DlF+pHNsvp3+BvXzSgaIKd61fVpli/rjWJp
         mpoPH6yghOqr4QkAa+rJrDQScfr1hsEuA4dfCOMh1PB7EE4FCJ/MSl21VDvUoztUJwG+
         eye30ECAofkkT/HjRcUtUKfhtDw+TmRJPzfqsigTfjsaCpIS9u/SWOWqFyYgDqJkoAs5
         /tmiKBdxv2I6HKrRQzmGAWTGu4xvcWeZuDTTD+yNknzZAieGAKHAF6+X9TR2GkIxeZtl
         J/Qw==
X-Gm-Message-State: AOAM533ADK7NaROozofW+qGfm3Ryt6boOBbg9HfnDeTK7oYQ6nwoj55M
	7EdepssFDc4AIc2bs1e18dZuw7zv6HFRZQ==
X-Google-Smtp-Source: ABdhPJxvSgO/kn/KsJQoq2cDfUal2UJ8xgduOHpt7iEWehYVrvhUJ3imYJnM0nHGKzduqzsE9sKBeA==
X-Received: by 2002:a1c:f30e:: with SMTP id q14mr1250956wmq.139.1611269713014;
        Thu, 21 Jan 2021 14:55:13 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09d446818dfa6dffe17955.dip0.t-ipconnect.de. [2003:f0:7f09:d446:818d:fa6d:ffe1:7955])
        by smtp.gmail.com with ESMTPSA id n9sm10019742wrq.41.2021.01.21.14.55.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 14:55:12 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/7] appstream-glib: upgrade 0.7.17 -> 0.7.18
Date: Thu, 21 Jan 2021 23:54:57 +0100
Message-Id: <20210121225458.278343-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121225458.278343-1-schnitzeltony@gmail.com>
References: <20210121225458.278343-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 0.7.18
~~~~~~~~~~~~~~
Released: 2020-09-07

New Features:
 - Add content rating system APIs from gnome-software (Philip Withnall)
 - Add "validate-version" command (Florian Müllner)

Bugfixes:
 - Allow timestamp in the future in validate-relax (Bartłomiej Piotrowski)
 - Don't ignore localized strings that are the same as original (Isaque Galdino)
 - Fix crash with invalid children of <ul/> (Fabian Vogt)
 - Lower the OARS/CSM mapping of sex-homosexuality/intense (Philip Withnall)
 - Properly initialize mutexes (Laurent Bigonville)
 - Test launchable tags in validation (Ian McInerney)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{appstream-glib_0.7.17.bb => appstream-glib_0.7.18.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-support/appstream-glib/{appstream-glib_0.7.17.bb => appstream-glib_0.7.18.bb} (84%)

diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.17.bb b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
similarity index 84%
rename from meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.17.bb
rename to meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
index eb60bd968..e40354f56 100644
--- a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.17.bb
+++ b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
@@ -20,8 +20,7 @@ DEPENDS = " \
 inherit meson gobject-introspection gettext bash-completion
 
 SRC_URI = "https://people.freedesktop.org/~hughsient/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "67d441fb0fb3e14551b47db656565fc4"
-SRC_URI[sha256sum] = "7ca7e91d4accefa1c0d2c6e310cb3fe2686c017810e23b3f82d9f5724345e549"
+SRC_URI[sha256sum] = "ca1ed22e3bde3912cb903aaa7de085d55771da454f1c0573fd9608e1de9c4002"
 
 EXTRA_OEMESON = " \
     -Drpm=false \
-- 
2.26.2

