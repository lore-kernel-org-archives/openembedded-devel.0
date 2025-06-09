Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0DAC677C4
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 11:12:15 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.56730.1749467534175686247
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 04:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T9G+fU7I;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e64b430daso38105057b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 04:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749467533; x=1750072333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0/CjJhlYEwnUxAW+Nsi2ODNCBbBqOzyJdAuTXpc9vE=;
        b=T9G+fU7IOCNCB3sVP2IDNGWjQ6OMzHw8553xyJPVJBfToqqLfT67NDaLPNFyFmWDG0
         wjentdLOvW1oSA/e6GE7lPVb/hQlDDBXid+PPKiI182hVBUu4+Sq+xyM7yOqOicUfiNp
         JyFZOYb1Ho8aBq1DCuUNz7YtVHWXvEzG2Pr2fb8c5yxg87nw72UJcatoX2UzesiZgwTu
         D6qlWuwlaCv8PbQ0ifHnnAiN7qVv193a8KaipOtkB+cCvLins7ok1vSWQIp4Tcd8OZI7
         HPynvm3psSsu++OC/S+E0Etobv6A5NOt3sK9mSHVeQevA1zjXQrvmglhWKPVRGJYWGR0
         68oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749467533; x=1750072333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0/CjJhlYEwnUxAW+Nsi2ODNCBbBqOzyJdAuTXpc9vE=;
        b=laVCSsH0U3Mrz0XG3TtBxNl0/bEoF5OY/QBfq2u7I8TPVOsSdg4tsWWx+/01tYUIg6
         kRZI4MEKdHjCSvYwMXZBjIA7SyW2QJOECjTyXojNzNwg+9R45sdwaFu8ov5ntreHwugZ
         r077oLw8V9nsv4wmmAn5DvBX7ty3moVyBLCBGTjZtWCPs9VoW3O9wZSXvZSi7wuxINiq
         +1OmXeTkiOLPDFn7ZOQBAMlQg9OlEGLf+6E8Ow5r2tr//6Rs8N5amOy3ScMp6ivMAW6U
         bhFzh90h++pgdocY32m+DP5FhN9gKGm1ioRPfUgzVnauPU4KnKchaQ7HIsLXxiAXOih6
         eyaA==
X-Gm-Message-State: AOJu0YyGCFyRMIhAHfEl2DqLfzq2nDh4fOlU8E2mkjzObmC2w43r4GVp
	/8JjYBk3tejPSAwb71gVdk/+uyvqrhyLu5neBDiU123LFwiV/6yc48owgUhnfNaw
X-Gm-Gg: ASbGnct8n07BxhLSqYe+S83nU4vOPWyUh8MKgpcI0dNnl/hdla8cCg5QIDDx4YbiUt7
	pKSv5Vrf1lcFuuF4Am8ajFjjifwozZozM6DkqlYe+wR6JSiqZVxdNzaEN1fzWd3XzI4tchXd/bG
	hPgjw9vf3g2yTUGdDe1dikcMtCuMK8JSqupt3xrEVP4DfVBMO/zYzGQUUsDyYL7nlGAT48qydXC
	apLYO2xXrO5fJBqHDLumqfTU0ql3OjZPbhWstY9X/gDS11efkJeOWyZkbtjY8h03XW8+Iw4HxbE
	o8AO5RaTFNLx3zUJnojM5tARLETDDenCEOJBb60LlmrCSBa5P4BPZmcuazSzziOme9NgpQ50YGp
	cs9nMiel2fZ81U/2rB0ty
X-Google-Smtp-Source: AGHT+IEpSTvjvTbbVYptZ/pKPjERYXEJWTTMJQl62LRqB5hXWcIsK9KXDAJ1xrG+2lG8lZMj9l8e1A==
X-Received: by 2002:a05:690c:670d:b0:70e:d35:fbf5 with SMTP id 00721157ae682-710f772c329mr184127787b3.35.1749467532855;
        Mon, 09 Jun 2025 04:12:12 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f9a2e5aesm11979157b3.125.2025.06.09.04.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 04:12:12 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/3] parole: upgrade 4.18.0 -> 4.18.2
Date: Mon,  9 Jun 2025 07:11:53 -0400
Message-ID: <20250609111154.1056573-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609111154.1056573-1-schonm@gmail.com>
References: <20250609111154.1056573-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 11:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117786

Changelog: https://gitlab.xfce.org/apps/parole/-/tags/parole-4.18.2

Changelog: https://gitlab.xfce.org/apps/parole/-/tags/parole-4.18.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../parole/{parole_4.18.0.bb => parole_4.18.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-multimedia/parole/{parole_4.18.0.bb => parole_4.18.2.bb} (90%)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_4.18.0.bb b/meta-xfce/recipes-multimedia/parole/parole_4.18.2.bb
similarity index 90%
rename from meta-xfce/recipes-multimedia/parole/parole_4.18.0.bb
rename to meta-xfce/recipes-multimedia/parole/parole_4.18.2.bb
index eaa233ceb4..7787196fdd 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_4.18.0.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_4.18.2.bb
@@ -16,7 +16,7 @@ DEPENDS += " \
     taglib \
 "
 
-SRC_URI[sha256sum] = "bbe52fbc4d3abe30f6c79fc7ac57bd9de9cf74ce1a79b508a1d7de83dc4f3771"
+SRC_URI[sha256sum] = "6625288b760d38a15c295051ecf66c556fcad21dd1516d6d661c2a582421ee0e"
 
 RDEPENDS:${PN} += "gstreamer1.0-plugins-good"
 
-- 
2.43.0


