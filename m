Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F504CD1299
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 14:49:10 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.1802.1712760540873835738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 07:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=KhFviLOc;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.167.50, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516dc51bb72so5374551e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712760539; x=1713365339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QysJ4TwyYy+zLwpUKxx0XC8p2rkACwtdRWHCFFVyfLo=;
        b=KhFviLOc8fXbnSR9CXU9p3zuoqbpcm+AtWrkh1kKmgVmu0Ag6LUX420f4RPlF1cPAA
         s2dz31HWYI2J7TMisSRda7tJKrNHXfGii2tt8qNgiTWJIn8mmFA+HkraOO+P5/CHCJCJ
         GUlQX11utIAqxo+gGxE7/fVO3kwCG8S9CkqXcBZWamuKMmqS7XSUwq7To2JkxiiED01d
         HQ+wXF49Z3pYF6UGlZzZRum40sZCoq+LFOhKO1XF1QUmIB9S7B8hE3MZP/FvXxMt0S2e
         CCK8HSVR8g2jIussnAohTWqFdbQWGyRYw2U3EQzATp57CU7B1omeGVzGYyI8E1JCH5vn
         r3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712760539; x=1713365339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QysJ4TwyYy+zLwpUKxx0XC8p2rkACwtdRWHCFFVyfLo=;
        b=O0tTDvQvjzMVhgvt7Orwrb+ZovN+MU4YmhNg3tEgEARtQeU6KROcVdflo8XmxFLko3
         vR8odAFeSCMoE05s3mFDxPMYO1OQoKZZyQX28tniVv+aHqkw3yu0UO/tNG2jJSOfB3+0
         mUDIyECqbhl8UUovLLPWpMl6/k0cLdzym4n9PIl+RGX98qOWlGXQyfRI88gFzQ0h/nGi
         0L3dyGWE4OiXmK2/je8OZDT5YtT6KKYKKEMHLkQtHBhIrh5GI4nsbvAMSu3TG3H3MUmU
         N5g9/Nlu/wHw2hiKVvP1gZFV8uXx6v2kaBRaMMoDxGAOi6yVoOrzhQBSgsVGa+98wOE4
         f9xQ==
X-Gm-Message-State: AOJu0YzTNf9/1pshUJqOeqFxojmhyOoWiPJ5zLU92LYSZWP1g9ZaeyuI
	Gxhg8FzjGGXzX/MsNG2NJlg+FQm8Y7mZF88h/pNfZshXvzyFS/65rANAG0jvFYwp9AJUNtk4q/f
	o
X-Google-Smtp-Source: AGHT+IH5GXd45eZSIuU8pqqjcBf19bzh93NH/ylZkGDFT8z0X4uinO5NIwwr2mD1n2xWT9wp7U+9EA==
X-Received: by 2002:a05:6512:b92:b0:513:c60a:5fc0 with SMTP id b18-20020a0565120b9200b00513c60a5fc0mr2494190lfv.0.1712760538949;
        Wed, 10 Apr 2024 07:48:58 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id dd13-20020a056402312d00b0056dc0e21a7dsm6516977edb.4.2024.04.10.07.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 07:48:58 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] graphviz: Update CVE-2014-9157 status
Date: Wed, 10 Apr 2024 16:48:55 +0200
Message-ID: <20240410144856.90991-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 14:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109901

Current version 8.1.0 is not affected by this issue. 
Affected versions: 8.0.*

Ninette Adhikari (1):
  graphviz: Update CVE-2014-9157 status

 meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0


