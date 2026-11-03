Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8035.1793701457820412339
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lbb0j/ej;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso26428295e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701456; x=1794306256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mO+xscDpRcq5x/1lXfn2Cv1arV3fPW4r0mwEjaqM/c=;
        b=lbb0j/ej3lVx4V9CvIJ+hQ919Bm/N0MUI0rzRU2z4KkTBFKldQ0I0Ei0AGOhBTNX0x
         627q4pjUme4sU8/w+qWdl9oWeESQmwXemAbNIHY6M7mFPf/v/GatxgBAGarr1agDc6dt
         xmRGA6I60CIcscdAhEhyWJfaNHDs4PogO0Z5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701456; x=1794306256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9mO+xscDpRcq5x/1lXfn2Cv1arV3fPW4r0mwEjaqM/c=;
        b=GWo7V/EAlbh5ZjtuEokJMfGaZ8SO6+mjgl5d1pn4m0q+xWd5x9OClacU+rDTiiI2Vv
         dr329wxDUXEJBOXuVjFbhnGViXPKOYQA+Ba0jEltGz+r5nZbSf8jWnS//EkQ5/OmOTnM
         3wWbRBvlCM0Cv+i4XtRYkw9RE3fENiQCDcOS4sKGW26dobqp8byV22igPxZoui5AqTWS
         eCobxVg0jPQu808Z1/7cdKS0Ozaj08zL0xNwsi4d/j38ldn41RM60L18Ym4HvztEeg2i
         ZLVB9A78xyyVeI4i/rOwtX9+z6qdShGi9fQ/eajCEk0TX6dRQCrVRB3wIpHXdvl5qG5n
         XiAw==
X-Gm-Message-State: APuU4Z+eg2yT+91nirgVFOlw62K5YuHGawGBWXf6YlBLrRZnzEgn5LKF
	XMRIlV9syOSZXqoohNPlHfu1l43DsyNSXgDF+E78H1FolVlf0GOWHRdROS1I6Dejumda3Cql7QV
	LjF51
X-Gm-Gg: AYBFou1jUNcqCkKIoVerIKqDmL4zSszY7sYEpw+BlpjaRX3i4hp/YpyJLhARYutvn37
	fAMJEYOg1y63+LEKEXbiYCN+s4/g5uFj5EYe6+hU39v2dGE+sUet+397ceEM5jVHJRTvRg9oHa/
	Brxu/MqnVxbndfFztkWEjxrH9HINGlIBBIJXeKY7oC+NQnLhy3D90e4BE5Kz1nuiBIjACqv9yQg
	opxXifTdWhEcOmFqqc9N3yrKtVa8ZoBqnm8DwHiQpJc9NYvfTN39pyWZ01oMHDg4jQamaGxSzWv
	rzYLHOXgtSLf32uwzrZNG3uSWJgO4aP3f84uXYuUmwt2uiO2N6BQ/JznU9YE8/+WnYcM8kBRiEk
	gCNpOUEgJqtMVw4/VEfFmTq5z7/TQcViH7fop6HLsYkiYUaJbDGUpQI3Ic67AuAVFdONHTftPpT
	NjEUq+fJeWYp15BD5ezXdIX4QpEUQ4wxOW6TmHWm8p9CunnyzhxIYrDEG7phJtRM1mKnuXG/xDt
	lcypOw1yFMzS/FnC2V5wf+kkFgIaUzxNHxH1bc3u6KdNkd5qULXpRWgBsvFHyToMjeZFosRbuRb
	K7vyiY73bZhzXg9u5sweZQ1JuvB5znYLErcIlJOqmecEoYYUjmQFjMzphoi7L7OykP/KhxWXQkF
	70gAw6vhsSWiZoI+A4Ko6Ul8Z75Ctr4KBKezzGaTAGqrpzClxs97ikw==
X-Received: by 2002:a05:600c:6089:b0:4a2:a8c:22b0 with SMTP id 5b1f17b1804b1-4ac14ec75fbmr276395145e9.1.1793701456159;
        Tue, 03 Nov 2026 02:24:16 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:15 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/22] python3-jsonpatch: Upgrade 1.38 -> 1.39
Date: Tue,  3 Nov 2026 12:23:39 +0200
Message-ID: <20261103102350.1952237-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131774
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.39:

- Test that the code examples in the docs run and match their
  output
- Raise JsonPatchConflict when removing from immutable containers
- docs: explain copy and in-place behavior when a patch fails

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.38.bb => python3-jsonpatch_1.39.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.38.bb => python3-jsonpatch_1.39.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.38.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.39.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.38.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.39.bb
index 7de7f8cb94..0748642130 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.38.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.39.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "debc3e7bdc3d446468d64987f51a0e7a9deea42987ff90a6d1005a489b471c19"
+SRC_URI[sha256sum] = "d0a314128ec7fc7dba7155b0b19f94913198f54acbbef9c7817d5063d998bc27"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3

