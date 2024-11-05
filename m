Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6F0D33A3D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.27708.1730831864905280335
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2atKMfr;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e30d821c3e0so5883645276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831864; x=1731436664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmKVRqcUwuPG35ntuYOwAV1ri3jwg38VtdvoWjYunVA=;
        b=l2atKMfrl/8lZkjmyW5Y4FrJrCoLJuT89Cmzkyp2G+pe7GN1YN1hEdGqM7BxL1SvB7
         vhir2VTVCHD1SPM+EdHUIREeeruuhjhM/BRbtQV1zCYJrvXm4i7Yntqc72mPAd+1xcSV
         kjQkm6oXFXUAISs75Xj6790/SrpWBLxQRdjoYvppRXlf4y0kWdaItBnQfT77elryjXQY
         AcR0lAV731+63jgPGoOmOjjppxUhfqCOS2Oezo3keXZRdv03i3D9cTJKW5NKuDucq0S6
         p2opsU4Ue3818EiDhvhtxyk+zL7cOP0VvzMi/mle3LL+ih7efPZXXKn9X4BW5rb04ZK+
         LC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831864; x=1731436664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmKVRqcUwuPG35ntuYOwAV1ri3jwg38VtdvoWjYunVA=;
        b=lxDcT9mhItoshLMN9w7d26WWmmsAoRXFZ9gNB4pNzkvh6DXPJfJu5Bwv0Prg9a8UQV
         OQDOipBOEAsA55XV5J5g5MeJAKPrLkYWRlo2/lKcoPo4qGgJig9JImLVr2K37V7ED191
         a/msS3ZxMECLH2YiNMc+KZRKB5k6XdIMQRc7NBzJBMuLZiidSgM8zBMySkftA/4TXmLK
         V3t0HkqOjLiNQDvZpSXxSAYI360AxehwaMifXUsBrCEFzXwrR8MsetSib+PF02ruh4Fn
         GWtuREt1AUD/FBrS8U65qmCLgqyJ5LsvjrlMuo/toDmFiAAzmnCiDAN2lDRAjkuDgscr
         Nnbg==
X-Gm-Message-State: AOJu0Yybml/L/zBa7EzqNbNfSjiWpszhCdjAs1Tu/BKrSuBj0nzlz7Dc
	Z7f+eFaywZWe95IHg04gQgSOWQ0FqhiEudtatLuSgap+xaDID8VWtyAM1XV4
X-Google-Smtp-Source: AGHT+IG9kHHezS0zGhOoIzqXva5ZHzOdC94uIcM6mXQTLIHgqtsLoEXj1HcVQxdgCLZyvJf57Ai99A==
X-Received: by 2002:a05:690c:f89:b0:6ea:8b94:6c15 with SMTP id 00721157ae682-6ea8b947204mr90487497b3.24.1730831863430;
        Tue, 05 Nov 2024 10:37:43 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:37:43 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 0/161] Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:36 -0500
Message-ID: <20241105183658.34982-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113515

Following the note in section 5.5 found here :
  https://docs.yoctoproject.org/dev-manual/new-recipe.html?highlight=md5sum#fetching-code
drop the use of the SRC_URI[md5sum] where SRC_URI[sha256sum] is already being used.

Thanks,
Jason Schonberg


