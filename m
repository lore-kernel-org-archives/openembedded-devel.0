Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5AEC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:08:47 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.18140.1714388922931518523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=pzhHHJUI;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.221.44, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-343d2b20c4bso3020082f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714388921; x=1714993721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNNw7h78sg3SPxCfUWj0JOiSWW4FSLPijkKXbFsmSLc=;
        b=pzhHHJUI517BaTe5ScjLgOLORNNdIRM92lCIAFA/MuENjQcTpV84GG1PhIGhET7oXg
         FER352nBRmoeOfkKq3ohfaksoJgF7ulml8opn1+ibxfPwfNSvfqD8adgzltScCZYdX/r
         XBuzmvddrtX0dVOdzh7zLQAPY1A2RQZv6KpW3izNYLxHhr975sIgi8+sxq62JRGy/0vN
         WxGNd7jUfGvVs2moKa42kh50iD8mOkvT7iQig74oYGkBYnT0b6gnh3Njq8pjZDulTprY
         gnZzo6KeZBIg43Mgw2qY6oeoT6+BYnVVuq6QYm4p86JykHC5D48GURYTzrToJM8882u+
         CqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388921; x=1714993721;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNNw7h78sg3SPxCfUWj0JOiSWW4FSLPijkKXbFsmSLc=;
        b=or7VFc5DbjZaRCOkOV15FNAELd22CxuNmKVZlcBTFicf1GmSU0rx7H9eGXaVhyJAJf
         5qbvjz+Zzk/opRUyjmlerYBne+x6u9NoWjbCGrH0t82eCCKAISJca4rOV6ew2xX3tY0q
         6qT/FeY/Q65rKtkiJB6TtFzdWW54WdAtcJ+jFbIAt1ncUvrrFH04O1wHzuskFz/nHbCE
         yq+YeVzvribF+Yku9Sg8P4USkUPNH5/ktgLBQht+e4+XoAhOupyDBgh2QHQOoF5CoOUp
         LS2170QF8XUzuXTGDdE+ZMDHP6VHGKy4IPrerlLk65CwpGpJd1wAqMmzTp8I6wlfhlEm
         Ereg==
X-Gm-Message-State: AOJu0YzKvQOTqZGjTvnvAkH3IDroE3W/LBu+f+KownBAhUy/zIMIMKBd
	XmzPViNQPKgcWxHLIXree1WF0I+1T3FGdL+nJ/mifupCsrfQAnUrkoKDbXyPfeXx+fXSdYOB5xk
	21Vg=
X-Google-Smtp-Source: AGHT+IEu+nFYfRWD/RunUgL4tKFhEPnI2Nuo7omzy7gh6r18Jm4DBaeYezwKAms46V/WyT0oPsw5Vg==
X-Received: by 2002:a5d:6585:0:b0:34d:384:9ccd with SMTP id q5-20020a5d6585000000b0034d03849ccdmr2528731wru.49.1714388921236;
        Mon, 29 Apr 2024 04:08:41 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id a16-20020a5d4d50000000b0034a9b75e272sm23920926wru.45.2024.04.29.04.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:08:41 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] sthttpd: Update status for CVE-2017-10671
Date: Mon, 29 Apr 2024 13:08:34 +0200
Message-ID: <20240429110835.55086-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110174

Current version 2.27.1 is not affected by the issue.
Affected versions: Up to (excl.) 2.27.1

Ninette Adhikari (1):
  sthttpd: Update status for CVE-2017-10671

 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0


