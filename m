Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49676D3E18E
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.30070.1729278791931562425
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dXI1EYZ9;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e2972abc807so2295528276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278791; x=1729883591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPMvzGvGsGUXcA1LlTfKRJK0b3MI73wbaBYxmMZ40E8=;
        b=dXI1EYZ9S34Iq8tqJeqj4Do2qktw63Heb4VZ+fWz8hqp3TiDydcQyfGvIqYE4jZM3C
         +5Sx18pIv1NOnr5EO/Mvv5oD4MdYcjSQlDFfPwam083VbtyLbFuLzPBXsV7YKPtZeAST
         hJvm2shOf2NoinyTGBhozL98Jf4yhVmXh6uZMa2BUSCBWG3bcAzlPrKQsJ5uinuV5Etw
         9uk/XPtFe27peUBGWu7z3Brhf/FOM0ynslGGfFhGCKaCzxhutZjMmv/NTiaz7yRbZDyg
         YujJX3Hv1TfpKEqyU1jRl0an/WsWN5RXC87sWRfKS2pLns6jWHHZ1T0UOTXO9cfAN07i
         U2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278791; x=1729883591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPMvzGvGsGUXcA1LlTfKRJK0b3MI73wbaBYxmMZ40E8=;
        b=jxlmwCDIrQJsBZZtLxZVEzIif87SZNBjyIWaRKvRmHpSHFd2CyFr5VgGk4uVRMONLt
         18cUXLBihvnO/tqUt0A9+luWs7f6vjSrmHeTcjxJclI7+ZUJAxqJ9XcMhgITWRE6D4+t
         cDwt4tSj3dVjEcYan2WwPbMU/4Q+lpAbNpl4Yg5lTp0hh0wiSVXwxShU4W21QhjipzJB
         Z7Oll0RY6Xs7NDsowM2cvmIDMzfpRIM1kJvMOwKfUx34Whc7D9pROViqh+iM1eLjS48/
         RDVNkmu9ztJBLYVb53DhUr70z9g9o9Gt+HFgzhaRfH5UPPLtb3MHhqdR0aNW9oR0WEBh
         Hj5A==
X-Gm-Message-State: AOJu0YxUwLWoHBb9dU1jsbk7gOAjh4cVODlpkjxFqzWgRlkNfcYaGgZM
	RpMyoO+wKxxvIRA/n7E0kJcgniRO8/FHYbweOGmoro7/aZ4Cn838qDoFQg==
X-Google-Smtp-Source: AGHT+IH/pt8JqcgDSo6aBn+WyWoMwRDKYUFku+5+lT0JduUFJkDsav2GFycylcRZeG6kSknMElj5vg==
X-Received: by 2002:a05:690c:6c8a:b0:6e3:1781:1e2b with SMTP id 00721157ae682-6e5bfc30dc3mr37154887b3.16.1729278790242;
        Fri, 18 Oct 2024 12:13:10 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:09 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/68]
Date: Fri, 18 Oct 2024 15:05:47 -0400
Message-ID: <20241018191101.25184-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112987

Following the note in section 5.5 found here :
  https://docs.yoctoproject.org/dev-manual/new-recipe.html?highlight=md5sum#fetching-code
drop the use of the SRC_URI[md5sum] where SRC_URI[sha256sum] is already being used.


 [meta-python][PATCH 01/68] python3-gsocketpool: Drop unnecessary
 [meta-python][PATCH 02/68] python3-hpack: Drop unnecessary SRC_URI
 [meta-python][PATCH 03/68] python3-pyconnman: Drop unnecessary
 [meta-python][PATCH 04/68] telepathy-python3: Drop unnecessary
 [meta-python][PATCH 05/68] pyrtm: Drop unnecessary SRC_URI md5sum
 [meta-python][PATCH 06/68] python-django-south.inc: Drop unnecessary
 [meta-python][PATCH 07/68] python-flask-bootstrap.inc: Drop
 [meta-python][PATCH 08/68] python-flask-xstatic.inc: Drop unnecessary
 [meta-python][PATCH 09/68] python-libusb1: Drop unnecessary SRC_URI
 [meta-python][PATCH 10/68] python3-appdirs: Drop unnecessary SRC_URI
 [meta-python][PATCH 11/68] python3-argexec: Drop unnecessary SRC_URI
 [meta-python][PATCH 12/68] python3-asciitree: Drop unnecessary
 [meta-python][PATCH 13/68] python3-asyncio-glib: Drop unnecessary
 [meta-python][PATCH 14/68] python3-backcall: Drop unnecessary SRC_URI
 [meta-python][PATCH 15/68] python3-click-spinner: Drop unnecessary
 [meta-python][PATCH 16/68] python3-docopt: Drop unnecessary SRC_URI
 [meta-python][PATCH 17/68] python3-editor: Drop unnecessary SRC_URI
 [meta-python][PATCH 18/68] python3-fann2: Drop unnecessary SRC_URI
 [meta-python][PATCH 19/68] python3-flask-jsonpify: Drop unnecessary
 [meta-python][PATCH 20/68] python3-flask-jwt: Drop unnecessary
 [meta-python][PATCH 21/68] python3-flask-mail: Drop unnecessary
 [meta-python][PATCH 22/68] python3-flask-nav: Drop unnecessary
 [meta-python][PATCH 23/68] python3-flask-pymongo: Drop unnecessary
 [meta-python][PATCH 24/68] python3-flask-uploads: Drop unnecessary
 [meta-python][PATCH 25/68] python3-flask-user: Drop unnecessary
 [meta-python][PATCH 26/68] python3-gpsd-py3: Drop unnecessary SRC_URI
 [meta-python][PATCH 27/68] python3-html5lib: Drop unnecessary SRC_URI
 [meta-python][PATCH 28/68] python3-inflection: Drop unnecessary
 [meta-python][PATCH 29/68] python3-ipaddress: Drop unnecessary
 [meta-python][PATCH 30/68] python3-ipy: Drop unnecessary SRC_URI
 [meta-python][PATCH 31/68] python3-ipython-genutils: Drop unnecessary
 [meta-python][PATCH 32/68] python3-jdcal: Drop unnecessary SRC_URI
 [meta-python][PATCH 33/68] python3-kconfiglib: Drop unnecessary
 [meta-python][PATCH 34/68] python3-keras-preprocessing: Drop
 [meta-python][PATCH 35/68] python3-libconf: Drop unnecessary SRC_URI
 [meta-python][PATCH 36/68] python3-libevdev: Drop unnecessary SRC_URI
 [meta-python][PATCH 37/68] python3-lockfile: Drop unnecessary SRC_URI
 [meta-python][PATCH 38/68] python3-lorem: Drop unnecessary SRC_URI
 [meta-python][PATCH 39/68] python3-meld3: Drop unnecessary SRC_URI
 [meta-python][PATCH 40/68] python3-msm: Drop unnecessary SRC_URI
 [meta-python][PATCH 41/68] python3-padaos: Drop unnecessary SRC_URI
 [meta-python][PATCH 42/68] python3-padatious: Drop unnecessary
 [meta-python][PATCH 43/68] python3-parallax: Drop unnecessary SRC_URI
 [meta-python][PATCH 44/68] python3-passlib: Drop unnecessary SRC_URI
 [meta-python][PATCH 45/68] python3-pep8: Drop unnecessary SRC_URI
 [meta-python][PATCH 46/68] python3-petact: Drop unnecessary SRC_URI
 [meta-python][PATCH 47/68] python3-pickleshare: Drop unnecessary
 [meta-python][PATCH 48/68] python3-pid: Drop unnecessary SRC_URI
 [meta-python][PATCH 49/68] python3-precise-runner: Drop unnecessary
 [meta-python][PATCH 50/68] python3-pybluez: Drop unnecessary SRC_URI
 [meta-python][PATCH 51/68] python3-pyfirmata: Drop unnecessary
 [meta-python][PATCH 52/68] python3-pyjks: Drop unnecessary SRC_URI
 [meta-python][PATCH 53/68] python3-pylyrics: Drop unnecessary SRC_URI
 [meta-python][PATCH 54/68] python3-pytest-tempdir: Drop unnecessary
 [meta-python][PATCH 55/68] python3-pytoml: Drop unnecessary SRC_URI
 [meta-python][PATCH 56/68] python3-raven: Drop unnecessary SRC_URI
 [meta-python][PATCH 57/68] python3-requests-ftp: Drop unnecessary
 [meta-python][PATCH 58/68] python3-rfc3986-validator: Drop
 [meta-python][PATCH 59/68] python3-service-identity: Drop unnecessary
 [meta-python][PATCH 60/68] python3-speaklater: Drop unnecessary
 [meta-python][PATCH 61/68] python3-telnetlib3: Drop unnecessary
 [meta-python][PATCH 62/68] python3-tinyrecord: Drop unnecessary
 [meta-python][PATCH 63/68] python3-txdbus: Drop unnecessary SRC_URI
 [meta-python][PATCH 64/68] python3-versiontools: Drop unnecessary
 [meta-python][PATCH 65/68] python3-visitor: Drop unnecessary SRC_URI
 [meta-python][PATCH 66/68] python3-webencodings: Drop unnecessary
 [meta-python][PATCH 67/68] python3-whoosh: Drop unnecessary SRC_URI
 [meta-python][PATCH 68/68] python3-wpa-supplicant: Drop unnecessary

