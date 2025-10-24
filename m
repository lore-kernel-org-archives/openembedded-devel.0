Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F515CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 11:11:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.7691.1761304299685000045
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 04:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWhX4zy3;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so1900858f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 04:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761304298; x=1761909098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9ngc4NJjyXeDz40S0i7jrKaO5ZUn+b1BFrWDIrKi9Y=;
        b=aWhX4zy3Ql5GyC4tiMqrglu8q9kvVFOaOrinXQkBVLeu2AYDDR8yFao4aMUq2IPedX
         VQifCpDrtMVF4lGn6a+AQ229MwGMzm+pGAE37eDHNOMWGeQCjCBPZvoCYlEpUaHVGbiR
         D1LhyHHisJBR+0RlUS4NmythAu7BRwmJT5X8yq0pbKiRktNzRC4f2mu6gXEc6vsWRD1G
         0b4jOLyuVVeexjR748B6ChzMNiO1hsE0niSuKU865GmnTkocsT4IAUhMTE7OqjrVIef0
         PHXpApMJlq4sDo6cxR3e3gQBD9P8YCbLD0Ol77C0Nw4lGOL2Qhl1ga47I+/ngpuwWDfR
         BYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761304298; x=1761909098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9ngc4NJjyXeDz40S0i7jrKaO5ZUn+b1BFrWDIrKi9Y=;
        b=ivHkOeN8EoaSLHTBUXeV8L0qWK00/R7y/wLChhOTvFrCwXyfGarXu3wnm/n3qDjydb
         3Z8ESvYP+XphhERglW+ugVWQG5giFtE1Qma9MVgTj+311F6OjZv7NBDx50dGFds9gsbO
         WkWf/VruFVs/eJBHuViRUhi/ZwX9WepgUGt4A0f+h5slBcYL7EEPxARJyBVvlvWeb+Ax
         5GEAPcRLgpdjE7RdFPqRGUe+BL7cxGwxDtR5Wo0AoM1NJRGGBKZn3bFoZXeuhYPOYOXw
         5rWp/YyDDxVTfqziYKxCIVbIJRvaWsIYnndB9o2PdczSfQYQhXEP6l/jgrxSB/m2eAsQ
         fCGg==
X-Gm-Message-State: AOJu0YymHryqqrfkXwPhZr74pVM1eipdm+AqbdP5QPT67e1q9nrKOAEi
	UHexgwI1+StX0VE5d0PW1NCRqk8+eRlHRY6s24hZbAg2+ENl2FAu9PWi2ugxew==
X-Gm-Gg: ASbGncu1yXqr7wl5p+NQ32r88nl+YQmmFOrMz7088kFUBSJSFIow1b0kQUWKMX/CBUa
	oXY/3wYBJF8XMabp8FeRcHWYSBTvRd8M4O3S89hvC65LE2xXx1ftaxMTaBrmY3GmnTVgXJEajpA
	zf7z+DQCpTCn33LMK5HMVvOdbg1QwmiYFNX7B5KSOT6InaDr7TOKGO78HbEBhSMwTp6lQc9LV/r
	57P3jSen+S74Ca67PrZiEYYJshdPsbYI731Sxy0kdrpCL4O7NS8jyDQkLG+p9Std0KYio7sj3We
	0djqSjdWtGMC6KxKJzlSDOQkaOpAgkFh6+3OgRzU87D123mGjmeIh1/L3vwrmzB/mCoKGZZCbZ4
	C6Bz6NF0yAEn+UbpEZEc5eKh4VBmya8emP68i7KdAJThy/QPmnwbKohMN8UGypW1pURY49nwDDc
	DM46M1cOJ4RUZK1bP8JaE=
X-Google-Smtp-Source: AGHT+IFoRSFxG+1GxPoLdv9qBGgUIzxqoEKVdWlLEr/xFG88BCs5Le4h75NAF6uO2UwCdsEA+t5VAA==
X-Received: by 2002:a05:6000:98a:b0:427:7f0:95f0 with SMTP id ffacd0b85a97d-42707f09601mr17798678f8f.37.1761304297787;
        Fri, 24 Oct 2025 04:11:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccd88sm10574669f8f.36.2025.10.24.04.11.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:11:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 2/2] libcgi-perl: remove from problem ptest list
Date: Fri, 24 Oct 2025 13:11:36 +0200
Message-ID: <20251024111136.1174582-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024111136.1174582-1-skandigraun@gmail.com>
References: <20251024111136.1174582-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 11:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120952

The tests can be executed fine, they pass without a failure (and it takes
less than 3 seconds)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index ab875beafd..fc4a21be72 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -10,6 +10,7 @@ PTESTS_FAST_META_PERL = "\
     libauthen-sasl-perl \
     libcapture-tiny-perl \
     libcrypt-openssl-random-perl \
+    libcgi-perl \
     libdigest-hmac-perl \
     liberror-perl \
     libextutils-config-perl \
@@ -28,7 +29,6 @@ PTESTS_SLOW_META_PERL = "\
 "
 
 PTESTS_PROBLEMS_META_PERL = "\
-    libcgi-perl \
     libconfig-autoconf-perl \
     libcrypt-openssl-guess-perl \
     libcrypt-openssl-rsa-perl \

