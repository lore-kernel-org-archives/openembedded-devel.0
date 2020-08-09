Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.23041.1596976522794064493
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 05:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tfLZXAwZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id d6so6701028ejr.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9L8ynwvg8l+NrzwiCKWvu+UBDWo53DIEWywrcl216hU=;
        b=tfLZXAwZeZUvBjvNj07sfrcHdEUuEZHPpP80gCSpYmZtFNZn187TEg5IsPzMSte84L
         ac5JLNNtNFGJZ846/qMIr6nI71cerUArwXBWxyUDgf9Omn1WLY4WgVwoAbI7I0GVTkZX
         RkhNHgqTjME9QB6yKQebHKjyTtVET9JPoudxo5A1VRocGXDEyE1ECeJzIp9OJVp4S0G2
         nga48Nq8Z5d50lbfnn7RqWFZy6RtUxBH61UprG4+v79zWqvwV9JBohwzRYKgHbt5Ebk1
         rDbf7A6cxr8uN2V7B+Z9qmcF+UX7Sa9kHoprPCsyGjvcJDlbNFzcApZia5Oi4XXJjEK1
         DLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9L8ynwvg8l+NrzwiCKWvu+UBDWo53DIEWywrcl216hU=;
        b=XOF+NLdbZdGWjhslXkCH+0APLN9RG/B0gKPE/tlDc+bLbnF8cPmkU+bBVm94hW2yNU
         9qDD84GJwtmf23wTo+uHME0YhvhavDf0XtWXSgQRz/mniUfTy/BfEofW12GeqJCt6WVz
         H5HLm9yn3k5282i8Lxau1oZ5fSNenG8xgn4haq1lu390p6N7EEWHxgMXYtUP3ooGhRdV
         KA6ReUrNvZu/44dHo0ukRAQVQIEpD+4X7ehzhzH2r8GYwTvsDD83ib43jmHT0wVSBFHK
         sI5MU1WhdLnQbez6p6LcvHimGqRwVzKAMcpDvwVpbZBebUGugNrWz3WHJhmFIQ75WKSv
         rlZQ==
X-Gm-Message-State: AOAM532nD4rsEdBk6tfb4vCla1ms476wnpWw0QR8udOZNHuKsM2lvWOl
	eDaC0hbqKo9of59YGH9CyU9OpKXQ
X-Google-Smtp-Source: ABdhPJxDexFmEmOFXEFck+qYokIbZZDBTKylmDCLqTVjIXaHEtSlIckXPFgmMxR6Gg/rVSRgUpkrBA==
X-Received: by 2002:a17:906:36c2:: with SMTP id b2mr16730074ejc.238.1596976521158;
        Sun, 09 Aug 2020 05:35:21 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f102180f54bc478636fc7f8.dip0.t-ipconnect.de. [2003:f0:7f10:2180:f54b:c478:636f:c7f8])
        by smtp.gmail.com with ESMTPSA id b24sm10070260edn.33.2020.08.09.05.35.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 05:35:20 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/6] gnome-help.bbclass: remove double FILES_${PN}-help entry
Date: Sun,  9 Aug 2020 14:35:05 +0200
Message-Id: <20200809123507.267616-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200809123507.267616-1-schnitzeltony@gmail.com>
References: <20200809123507.267616-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When I wrote this class meta-qt5-extra's qt5-translation.bbclass was taken
as template. So this is a leftover which does not make sense: Variable is set
differently few lines below.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/classes/gnome-help.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/classes/gnome-help.bbclass b/meta-gnome/classes/gnome-help.bbclass
index 967091ba4..9c4771ddc 100644
--- a/meta-gnome/classes/gnome-help.bbclass
+++ b/meta-gnome/classes/gnome-help.bbclass
@@ -9,8 +9,6 @@
 #   else
 #       pack all help files to ${PN}-help-<lingua>
 
-FILES_${PN}-help = "${datadir}/*/translations"
-
 # Dummy to get yelp build & PACKAGE_NO_HELP_SPLIT set 1
 PACKAGES_append = " ${PN}-help"
 FILES_${PN}-help = "${datadir}/help"
-- 
2.26.2

