Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14589C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 09:23:50 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.8309.1645694628985665835
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Wc48lLuU;
 spf=pass (domain: mvista.com, ip: 209.85.215.178,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f178.google.com with SMTP id o23so1216302pgk.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VbkDG3mYU5H6EhOnbTJqOrtpzKY8mGifVZmR1bWkA1s=;
        b=Wc48lLuUfk74kmbtiknwI5dtDLJBn/KU+3YY0fZ5NoMgYNmrIgUc5d9Jw+C0vyGlRN
         t315c24BWLdHOBRbpEKoqV50lJOhR+sirGKU9lzjtlsejldAoOa3gxB03oPkP7QeXq+o
         lOBAgFPmFdd94XIRAQRSzglxxM10TdmQk5vyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VbkDG3mYU5H6EhOnbTJqOrtpzKY8mGifVZmR1bWkA1s=;
        b=uDvWLTTimQwwEdMIotI+sXYLVQ1frTTTXeDx0hww30FNwuD8ASsEHJAt29M4hKbQvs
         hVKZ5Mkb1/RkTodmZI2rvdJ4z0eNFfb9u+3PaD9aDxihyc15WNDouABp2FxcAo/OT2sN
         GhnzQKhC4xrXQCJGeMkncP9IUMoXFxOlNHyDKmt4VJGgwo1+ovo6w+uakYr1Jo3NkKqQ
         uWDvmq/UeEskZlNf8uwMX149Ab6BM2l89DLe3dR2tKJ1tY8CoAKx/Hq6RHtuCONYortH
         pPKvkUSJOZzWX6sF7O5dKPKCq/Vyorsf4PFJBVlb6MKnDSyXwk1B1q3qs8a9S1xci2td
         crgA==
X-Gm-Message-State: AOAM533O7rsY6Ih44OXeMxeeihzvG3G3g0ah0ROHTSDdJQN4QtbFQYtq
	gCU+mUCGzIBlnVPa4tWlLm6sOsiFsGoHOw==
X-Google-Smtp-Source: 
 ABdhPJx1j5oEPwZzYgUt5/Qqz4VKz0yE/I83J4oB29kzsELmS5db0bkzmwRGR0bqJKVdNtCZ/Z9ZWg==
X-Received: by 2002:a63:70b:0:b0:373:9e98:d8f9 with SMTP id
 11-20020a63070b000000b003739e98d8f9mr1565911pgh.242.1645694627701;
        Thu, 24 Feb 2022 01:23:47 -0800 (PST)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 t2sm2588490pfj.211.2022.02.24.01.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 01:23:47 -0800 (PST)
Received: by red (sSMTP sendmail emulation); Thu, 24 Feb 2022 04:23:45 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-java][PATCH 0/5] Update master to kirkstone compat
Date: Thu, 24 Feb 2022 04:23:34 -0500
Message-Id: <20220224092339.2711524-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 09:23:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95503

Update variables to use kirkstone variants.

Jeremy A. Puhlman (5):
  Switch compat to kirkstone
  jaxme: update variable names
  xerces-j: update variable names
  commons-configuration: update variable names
  commons-jxpath: update variable names

 conf/layer.conf                                           | 2 +-
 recipes-core/jakarta-commons/commons-configuration_1.5.bb | 2 +-
 recipes-core/jakarta-commons/commons-jxpath_1.3.bb        | 2 +-
 recipes-core/xerces-j/xerces-j_2.11.0.bb                  | 2 +-
 recipes-core/xml-commons/jaxme_0.5.2.bb                   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.33.0


