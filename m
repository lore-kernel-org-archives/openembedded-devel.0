Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A04FF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 05:21:14 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36359.1777267264631926241
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 22:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Lyk7B+eN;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so48189345e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 22:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777267263; x=1777872063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fueGNJb6e7qoMfh0zXR/bJnYm9/HZ503hEPFLf/ZFk8=;
        b=Lyk7B+eN1lGt/hqANczDC2Auh1LKGY2Brq1/sFqFct3EF9/eDRhnFKBPIvIO6b2s+o
         WeUXBJ+3jGzNFIRybdsnvAvGGHY2GVQgJd0/Yor3k018YHz4rWHUX7qvwl7/9nweCqms
         ErjmZuR7ntC+BiHaz7L43EFWxr0DYP/UBvWXVuV74n3QygVXAeGmegvLKzejIHBqHwG/
         enHbFQcG+nzKBz5izIcemN4cPtoWavuN9ku0mel5mhWzVYEHWfqGiq6W42pKLIWV2QpY
         T1ofABEIL2WSGzUwz5VnmKWjLm+g/iw7zNY0lh3QGy8aABHX8ojPFh+ZYPbMMEa4I2ZX
         hzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777267263; x=1777872063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fueGNJb6e7qoMfh0zXR/bJnYm9/HZ503hEPFLf/ZFk8=;
        b=qVciwtBg7oclID8Sk+QTKnOkyVSIYKTyJGE2HzeosWT4RhsGnnjM1e4nd2Oc8AxVMa
         dodLKqC80H4xryp8sr8LAhsUYSlA5MrexWW7C9jZ1HhnTbz6B0kIOBQxmDMgIdbRf5ZZ
         kZ/50tiju+sVmZoPU4ybTbIymO0q9STm/n7h4pbjoefQoUnaHdIImwKUqjUZBGxH0sCB
         oY35ITpGrea6WFMYxVvzWldW6vcAfF+tHzCpqJU6EMNS+m4VxF9nbDGJSVQE4iFUEJx+
         IlDQwxH5EfLMH1ElHfEf47HonTKSHJh4YihFhsVittHkKDcFBuio+6adPDj0CsYbZhV9
         flHg==
X-Gm-Message-State: AOJu0YxlPuULm3sdc5AxDo++sYXuEuajTej7eeVJC3FQBb33cIZH4k19
	tw/5F/TmI8DcseaU+81VHTYEJHfXdSO6xoIuII9uMCaf0+H8TK/gKlbp5Blbhw==
X-Gm-Gg: AeBDietpdOST/b03ERbHbmEbMsnZgW44Ql3nglna/QAmKE/UEFbHIKiz7XWlXEFfYb2
	/RAKrtCb1tfao4GbuL9wwl0yxgVy3j61lR0gH6jF5m7kS9tOdR4uDfVd4JWNJlXZvkPNJVmm7tn
	6+d1kXFEt4g5crpvbcGWOL2N9f8ZcXlYQwIIbfI3F1ScZd3adBBTj2bkV5XQHTXKizwEqVl+zT4
	F6wAsM5hAZYVniAQc6M8Jmy2SjolX7QmVfliZKU0Q64lfnHzJIa6AyKej8A0qjdbLUKUD3nQMZ4
	41Kg+TFHErDjYKrv9xPxHj+DdUph+OHXyCjzAWJ0GzBR/r3LpKP4zVCbfnPaxeu0ymq0pwgi5C4
	xJdbv6quLNlOlYYZPw3oaqryu7YiWFiCAssUL2pOVqw/pNGuEr5H3ssVHQD2NhmgYqdBLK6dE+Z
	IamlaRXBwL9Y9iQM0wC66ufheOqz8MAxY=
X-Received: by 2002:a05:600c:4e0c:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-4891d7a463emr436453085e9.3.1777267262728;
        Sun, 26 Apr 2026 22:21:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb767961sm231000335e9.16.2026.04.26.22.21.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 22:21:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2026-04-27
Date: Mon, 27 Apr 2026 07:20:57 +0200
Message-ID: <20260427052058.805635-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 05:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126630

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (372, out of which new this week: 6):

 - botan: CVE-2024-34702: https://nvd.nist.gov/vuln/detail/CVE-2024-34702
 - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
 - botan: CVE-2026-32877: https://nvd.nist.gov/vuln/detail/CVE-2026-32877
 - botan: CVE-2026-32883: https://nvd.nist.gov/vuln/detail/CVE-2026-32883
 - botan: CVE-2026-32884: https://nvd.nist.gov/vuln/detail/CVE-2026-32884
 - botan: CVE-2026-34582: https://nvd.nist.gov/vuln/detail/CVE-2026-34582
 - [NEW] civetweb: CVE-2026-5789: https://nvd.nist.gov/vuln/detail/CVE-2026-5789
 - corosync: CVE-2026-35091: https://nvd.nist.gov/vuln/detail/CVE-2026-35091
 - corosync: CVE-2026-35092: https://nvd.nist.gov/vuln/detail/CVE-2026-35092
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - dovecot: CVE-2025-59031: https://nvd.nist.gov/vuln/detail/CVE-2025-59031
 - dovecot: CVE-2026-0394: https://nvd.nist.gov/vuln/detail/CVE-2026-0394
 - dovecot: CVE-2026-24031: https://nvd.nist.gov/vuln/detail/CVE-2026-24031
 - dovecot: CVE-2026-27855: https://nvd.nist.gov/vuln/detail/CVE-2026-27855
 - dovecot: CVE-2026-27860: https://nvd.nist.gov/vuln/detail/CVE-2026-27860
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - emacs: CVE-2025-1244: https://nvd.nist.gov/vuln/detail/CVE-2025-1244
 - etcd: CVE-2026-33343: https://nvd.nist.gov/vuln/detail/CVE-2026-33343
 - etcd: CVE-2026-33413: https://nvd.nist.gov/vuln/detail/CVE-2026-33413
 - [NEW] flatpak: CVE-2026-34078: https://nvd.nist.gov/vuln/detail/CVE-2026-34078
 - flatpak: CVE-2026-34079: https://nvd.nist.gov/vuln/detail/CVE-2026-34079
 - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
 - fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-15280
 - freerdp: CVE-2026-22851: https://nvd.nist.gov/vuln/detail/CVE-2026-22851
 - freerdp: CVE-2026-22852: https://nvd.nist.gov/vuln/detail/CVE-2026-22852
 - freerdp: CVE-2026-22853: https://nvd.nist.gov/vuln/detail/CVE-2026-22853
 - freerdp: CVE-2026-22854: https://nvd.nist.gov/vuln/detail/CVE-2026-22854
 - freerdp: CVE-2026-22855: https://nvd.nist.gov/vuln/detail/CVE-2026-22855
 - freerdp: CVE-2026-22856: https://nvd.nist.gov/vuln/detail/CVE-2026-22856
 - freerdp: CVE-2026-22857: https://nvd.nist.gov/vuln/detail/CVE-2026-22857
 - freerdp: CVE-2026-22858: https://nvd.nist.gov/vuln/detail/CVE-2026-22858
 - freerdp: CVE-2026-22859: https://nvd.nist.gov/vuln/detail/CVE-2026-22859
 - freerdp: CVE-2026-23530: https://nvd.nist.gov/vuln/detail/CVE-2026-23530
 - freerdp: CVE-2026-23531: https://nvd.nist.gov/vuln/detail/CVE-2026-23531
 - freerdp: CVE-2026-23532: https://nvd.nist.gov/vuln/detail/CVE-2026-23532
 - freerdp: CVE-2026-23533: https://nvd.nist.gov/vuln/detail/CVE-2026-23533
 - freerdp: CVE-2026-23534: https://nvd.nist.gov/vuln/detail/CVE-2026-23534
 - freerdp: CVE-2026-23732: https://nvd.nist.gov/vuln/detail/CVE-2026-23732
 - freerdp: CVE-2026-23883: https://nvd.nist.gov/vuln/detail/CVE-2026-23883
 - freerdp: CVE-2026-23884: https://nvd.nist.gov/vuln/detail/CVE-2026-23884
 - freerdp: CVE-2026-23948: https://nvd.nist.gov/vuln/detail/CVE-2026-23948
 - freerdp: CVE-2026-24491: https://nvd.nist.gov/vuln/detail/CVE-2026-24491
 - freerdp: CVE-2026-24675: https://nvd.nist.gov/vuln/detail/CVE-2026-24675
 - freerdp: CVE-2026-24676: https://nvd.nist.gov/vuln/detail/CVE-2026-24676
 - freerdp: CVE-2026-24677: https://nvd.nist.gov/vuln/detail/CVE-2026-24677
 - freerdp: CVE-2026-24678: https://nvd.nist.gov/vuln/detail/CVE-2026-24678
 - freerdp: CVE-2026-24679: https://nvd.nist.gov/vuln/detail/CVE-2026-24679
 - freerdp: CVE-2026-24680: https://nvd.nist.gov/vuln/detail/CVE-2026-24680
 - freerdp: CVE-2026-24681: https://nvd.nist.gov/vuln/detail/CVE-2026-24681
 - freerdp: CVE-2026-24682: https://nvd.nist.gov/vuln/detail/CVE-2026-24682
 - freerdp: CVE-2026-24683: https://nvd.nist.gov/vuln/detail/CVE-2026-24683
 - freerdp: CVE-2026-24684: https://nvd.nist.gov/vuln/detail/CVE-2026-24684
 - freerdp: CVE-2026-25942: https://nvd.nist.gov/vuln/detail/CVE-2026-25942
 - freerdp: CVE-2026-25952: https://nvd.nist.gov/vuln/detail/CVE-2026-25952
 - freerdp: CVE-2026-25953: https://nvd.nist.gov/vuln/detail/CVE-2026-25953
 - freerdp: CVE-2026-25954: https://nvd.nist.gov/vuln/detail/CVE-2026-25954
 - freerdp: CVE-2026-25955: https://nvd.nist.gov/vuln/detail/CVE-2026-25955
 - freerdp: CVE-2026-25959: https://nvd.nist.gov/vuln/detail/CVE-2026-25959
 - freerdp: CVE-2026-25997: https://nvd.nist.gov/vuln/detail/CVE-2026-25997
 - freerdp: CVE-2026-26271: https://nvd.nist.gov/vuln/detail/CVE-2026-26271
 - freerdp: CVE-2026-26955: https://nvd.nist.gov/vuln/detail/CVE-2026-26955
 - freerdp: CVE-2026-26965: https://nvd.nist.gov/vuln/detail/CVE-2026-26965
 - freerdp: CVE-2026-26986: https://nvd.nist.gov/vuln/detail/CVE-2026-26986
 - freerdp: CVE-2026-27015: https://nvd.nist.gov/vuln/detail/CVE-2026-27015
 - freerdp: CVE-2026-27950: https://nvd.nist.gov/vuln/detail/CVE-2026-27950
 - freerdp: CVE-2026-27951: https://nvd.nist.gov/vuln/detail/CVE-2026-27951
 - freerdp: CVE-2026-29774: https://nvd.nist.gov/vuln/detail/CVE-2026-29774
 - freerdp: CVE-2026-29775: https://nvd.nist.gov/vuln/detail/CVE-2026-29775
 - freerdp: CVE-2026-29776: https://nvd.nist.gov/vuln/detail/CVE-2026-29776
 - freerdp: CVE-2026-31806: https://nvd.nist.gov/vuln/detail/CVE-2026-31806
 - freerdp: CVE-2026-31883: https://nvd.nist.gov/vuln/detail/CVE-2026-31883
 - freerdp: CVE-2026-31884: https://nvd.nist.gov/vuln/detail/CVE-2026-31884
 - freerdp: CVE-2026-31885: https://nvd.nist.gov/vuln/detail/CVE-2026-31885
 - freerdp: CVE-2026-31897: https://nvd.nist.gov/vuln/detail/CVE-2026-31897
 - freerdp: CVE-2026-33952: https://nvd.nist.gov/vuln/detail/CVE-2026-33952
 - freerdp: CVE-2026-33977: https://nvd.nist.gov/vuln/detail/CVE-2026-33977
 - freerdp: CVE-2026-33982: https://nvd.nist.gov/vuln/detail/CVE-2026-33982
 - freerdp: CVE-2026-33983: https://nvd.nist.gov/vuln/detail/CVE-2026-33983
 - freerdp: CVE-2026-33984: https://nvd.nist.gov/vuln/detail/CVE-2026-33984
 - freerdp: CVE-2026-33985: https://nvd.nist.gov/vuln/detail/CVE-2026-33985
 - freerdp: CVE-2026-33986: https://nvd.nist.gov/vuln/detail/CVE-2026-33986
 - freerdp: CVE-2026-33987: https://nvd.nist.gov/vuln/detail/CVE-2026-33987
 - freerdp: CVE-2026-33995: https://nvd.nist.gov/vuln/detail/CVE-2026-33995
 - [NEW] freerdp: CVE-2026-40254: https://nvd.nist.gov/vuln/detail/CVE-2026-40254
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - giflib: CVE-2026-26740: https://nvd.nist.gov/vuln/detail/CVE-2026-26740
 - [NEW] gimp: CVE-2026-4887: https://nvd.nist.gov/vuln/detail/CVE-2026-4887
 - gsoap: CVE-2024-4227: https://nvd.nist.gov/vuln/detail/CVE-2024-4227
 - hplip: CVE-2025-43023: https://nvd.nist.gov/vuln/detail/CVE-2025-43023
 - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
 - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
 - imagemagick: CVE-2026-22770: https://nvd.nist.gov/vuln/detail/CVE-2026-22770
 - imagemagick: CVE-2026-23874: https://nvd.nist.gov/vuln/detail/CVE-2026-23874
 - imagemagick: CVE-2026-23876: https://nvd.nist.gov/vuln/detail/CVE-2026-23876
 - imagemagick: CVE-2026-23952: https://nvd.nist.gov/vuln/detail/CVE-2026-23952
 - imagemagick: CVE-2026-24481: https://nvd.nist.gov/vuln/detail/CVE-2026-24481
 - imagemagick: CVE-2026-24484: https://nvd.nist.gov/vuln/detail/CVE-2026-24484
 - imagemagick: CVE-2026-24485: https://nvd.nist.gov/vuln/detail/CVE-2026-24485
 - imagemagick: CVE-2026-25576: https://nvd.nist.gov/vuln/detail/CVE-2026-25576
 - imagemagick: CVE-2026-25637: https://nvd.nist.gov/vuln/detail/CVE-2026-25637
 - imagemagick: CVE-2026-25638: https://nvd.nist.gov/vuln/detail/CVE-2026-25638
 - imagemagick: CVE-2026-25794: https://nvd.nist.gov/vuln/detail/CVE-2026-25794
 - imagemagick: CVE-2026-25795: https://nvd.nist.gov/vuln/detail/CVE-2026-25795
 - imagemagick: CVE-2026-25796: https://nvd.nist.gov/vuln/detail/CVE-2026-25796
 - imagemagick: CVE-2026-25797: https://nvd.nist.gov/vuln/detail/CVE-2026-25797
 - imagemagick: CVE-2026-25798: https://nvd.nist.gov/vuln/detail/CVE-2026-25798
 - imagemagick: CVE-2026-25799: https://nvd.nist.gov/vuln/detail/CVE-2026-25799
 - imagemagick: CVE-2026-25897: https://nvd.nist.gov/vuln/detail/CVE-2026-25897
 - imagemagick: CVE-2026-25898: https://nvd.nist.gov/vuln/detail/CVE-2026-25898
 - imagemagick: CVE-2026-25965: https://nvd.nist.gov/vuln/detail/CVE-2026-25965
 - imagemagick: CVE-2026-25966: https://nvd.nist.gov/vuln/detail/CVE-2026-25966
 - imagemagick: CVE-2026-25967: https://nvd.nist.gov/vuln/detail/CVE-2026-25967
 - imagemagick: CVE-2026-25968: https://nvd.nist.gov/vuln/detail/CVE-2026-25968
 - imagemagick: CVE-2026-25969: https://nvd.nist.gov/vuln/detail/CVE-2026-25969
 - imagemagick: CVE-2026-25970: https://nvd.nist.gov/vuln/detail/CVE-2026-25970
 - imagemagick: CVE-2026-25971: https://nvd.nist.gov/vuln/detail/CVE-2026-25971
 - imagemagick: CVE-2026-25982: https://nvd.nist.gov/vuln/detail/CVE-2026-25982
 - imagemagick: CVE-2026-25983: https://nvd.nist.gov/vuln/detail/CVE-2026-25983
 - imagemagick: CVE-2026-25985: https://nvd.nist.gov/vuln/detail/CVE-2026-25985
 - imagemagick: CVE-2026-25986: https://nvd.nist.gov/vuln/detail/CVE-2026-25986
 - imagemagick: CVE-2026-25987: https://nvd.nist.gov/vuln/detail/CVE-2026-25987
 - imagemagick: CVE-2026-25988: https://nvd.nist.gov/vuln/detail/CVE-2026-25988
 - imagemagick: CVE-2026-25989: https://nvd.nist.gov/vuln/detail/CVE-2026-25989
 - imagemagick: CVE-2026-26066: https://nvd.nist.gov/vuln/detail/CVE-2026-26066
 - imagemagick: CVE-2026-26283: https://nvd.nist.gov/vuln/detail/CVE-2026-26283
 - imagemagick: CVE-2026-26284: https://nvd.nist.gov/vuln/detail/CVE-2026-26284
 - imagemagick: CVE-2026-26983: https://nvd.nist.gov/vuln/detail/CVE-2026-26983
 - imagemagick: CVE-2026-27798: https://nvd.nist.gov/vuln/detail/CVE-2026-27798
 - imagemagick: CVE-2026-27799: https://nvd.nist.gov/vuln/detail/CVE-2026-27799
 - imagemagick: CVE-2026-28493: https://nvd.nist.gov/vuln/detail/CVE-2026-28493
 - imagemagick: CVE-2026-28494: https://nvd.nist.gov/vuln/detail/CVE-2026-28494
 - imagemagick: CVE-2026-28686: https://nvd.nist.gov/vuln/detail/CVE-2026-28686
 - imagemagick: CVE-2026-28687: https://nvd.nist.gov/vuln/detail/CVE-2026-28687
 - imagemagick: CVE-2026-28688: https://nvd.nist.gov/vuln/detail/CVE-2026-28688
 - imagemagick: CVE-2026-28689: https://nvd.nist.gov/vuln/detail/CVE-2026-28689
 - imagemagick: CVE-2026-28690: https://nvd.nist.gov/vuln/detail/CVE-2026-28690
 - imagemagick: CVE-2026-28691: https://nvd.nist.gov/vuln/detail/CVE-2026-28691
 - imagemagick: CVE-2026-28692: https://nvd.nist.gov/vuln/detail/CVE-2026-28692
 - imagemagick: CVE-2026-28693: https://nvd.nist.gov/vuln/detail/CVE-2026-28693
 - imagemagick: CVE-2026-30883: https://nvd.nist.gov/vuln/detail/CVE-2026-30883
 - imagemagick: CVE-2026-30929: https://nvd.nist.gov/vuln/detail/CVE-2026-30929
 - imagemagick: CVE-2026-30931: https://nvd.nist.gov/vuln/detail/CVE-2026-30931
 - imagemagick: CVE-2026-30935: https://nvd.nist.gov/vuln/detail/CVE-2026-30935
 - imagemagick: CVE-2026-30936: https://nvd.nist.gov/vuln/detail/CVE-2026-30936
 - imagemagick: CVE-2026-30937: https://nvd.nist.gov/vuln/detail/CVE-2026-30937
 - imagemagick: CVE-2026-31853: https://nvd.nist.gov/vuln/detail/CVE-2026-31853
 - imagemagick: CVE-2026-32259: https://nvd.nist.gov/vuln/detail/CVE-2026-32259
 - imagemagick: CVE-2026-32636: https://nvd.nist.gov/vuln/detail/CVE-2026-32636
 - imagemagick: CVE-2026-33535: https://nvd.nist.gov/vuln/detail/CVE-2026-33535
 - imagemagick: CVE-2026-33536: https://nvd.nist.gov/vuln/detail/CVE-2026-33536
 - imagemagick: CVE-2026-33899: https://nvd.nist.gov/vuln/detail/CVE-2026-33899
 - imagemagick: CVE-2026-33900: https://nvd.nist.gov/vuln/detail/CVE-2026-33900
 - imagemagick: CVE-2026-33901: https://nvd.nist.gov/vuln/detail/CVE-2026-33901
 - imagemagick: CVE-2026-33902: https://nvd.nist.gov/vuln/detail/CVE-2026-33902
 - imagemagick: CVE-2026-33905: https://nvd.nist.gov/vuln/detail/CVE-2026-33905
 - imagemagick: CVE-2026-33908: https://nvd.nist.gov/vuln/detail/CVE-2026-33908
 - imagemagick: CVE-2026-34238: https://nvd.nist.gov/vuln/detail/CVE-2026-34238
 - imagemagick: CVE-2026-40169: https://nvd.nist.gov/vuln/detail/CVE-2026-40169
 - imagemagick: CVE-2026-40183: https://nvd.nist.gov/vuln/detail/CVE-2026-40183
 - imagemagick: CVE-2026-40310: https://nvd.nist.gov/vuln/detail/CVE-2026-40310
 - imagemagick: CVE-2026-40311: https://nvd.nist.gov/vuln/detail/CVE-2026-40311
 - imagemagick: CVE-2026-40312: https://nvd.nist.gov/vuln/detail/CVE-2026-40312
 - jq: CVE-2026-32316: https://nvd.nist.gov/vuln/detail/CVE-2026-32316
 - jq: CVE-2026-33947: https://nvd.nist.gov/vuln/detail/CVE-2026-33947
 - jq: CVE-2026-33948: https://nvd.nist.gov/vuln/detail/CVE-2026-33948
 - jq: CVE-2026-39979: https://nvd.nist.gov/vuln/detail/CVE-2026-39979
 - lcms: CVE-2026-41254: https://nvd.nist.gov/vuln/detail/CVE-2026-41254
 - libcoap: CVE-2024-46304: https://nvd.nist.gov/vuln/detail/CVE-2024-46304
 - libcoap: CVE-2026-29013: https://nvd.nist.gov/vuln/detail/CVE-2026-29013
 - libde265: CVE-2026-33164: https://nvd.nist.gov/vuln/detail/CVE-2026-33164
 - libde265: CVE-2026-33165: https://nvd.nist.gov/vuln/detail/CVE-2026-33165
 - libgphoto2: CVE-2026-40333: https://nvd.nist.gov/vuln/detail/CVE-2026-40333
 - libgphoto2: CVE-2026-40334: https://nvd.nist.gov/vuln/detail/CVE-2026-40334
 - libgphoto2: CVE-2026-40335: https://nvd.nist.gov/vuln/detail/CVE-2026-40335
 - libgphoto2: CVE-2026-40336: https://nvd.nist.gov/vuln/detail/CVE-2026-40336
 - libgphoto2: CVE-2026-40338: https://nvd.nist.gov/vuln/detail/CVE-2026-40338
 - libgphoto2: CVE-2026-40339: https://nvd.nist.gov/vuln/detail/CVE-2026-40339
 - libgphoto2: CVE-2026-40340: https://nvd.nist.gov/vuln/detail/CVE-2026-40340
 - libgphoto2: CVE-2026-40341: https://nvd.nist.gov/vuln/detail/CVE-2026-40341
 - libraw: CVE-2026-20884: https://nvd.nist.gov/vuln/detail/CVE-2026-20884
 - libraw: CVE-2026-20889: https://nvd.nist.gov/vuln/detail/CVE-2026-20889
 - libraw: CVE-2026-24450: https://nvd.nist.gov/vuln/detail/CVE-2026-24450
 - libraw: CVE-2026-24660: https://nvd.nist.gov/vuln/detail/CVE-2026-24660
 - libraw: CVE-2026-5342: https://nvd.nist.gov/vuln/detail/CVE-2026-5342
 - libssh: CVE-2026-0965: https://nvd.nist.gov/vuln/detail/CVE-2026-0965
 - libssh: CVE-2026-0967: https://nvd.nist.gov/vuln/detail/CVE-2026-0967
 - libssh: CVE-2026-0968: https://nvd.nist.gov/vuln/detail/CVE-2026-0968
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - mbedtls: CVE-2025-66442: https://nvd.nist.gov/vuln/detail/CVE-2025-66442
 - minio: CVE-2026-33419: https://nvd.nist.gov/vuln/detail/CVE-2026-33419
 - minio: CVE-2026-34204: https://nvd.nist.gov/vuln/detail/CVE-2026-34204
 - miniupnpd: CVE-2026-5720: https://nvd.nist.gov/vuln/detail/CVE-2026-5720
 - mongodb: CVE-2026-1850: https://nvd.nist.gov/vuln/detail/CVE-2026-1850
 - mongodb: CVE-2026-25612: https://nvd.nist.gov/vuln/detail/CVE-2026-25612
 - mongodb: CVE-2026-4147: https://nvd.nist.gov/vuln/detail/CVE-2026-4147
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - nginx: CVE-2026-32647: https://nvd.nist.gov/vuln/detail/CVE-2026-32647
 - nodejs: CVE-2026-21712: https://nvd.nist.gov/vuln/detail/CVE-2026-21712
 - [NEW] ntfs-3g-ntfsprogs: CVE-2026-40706: https://nvd.nist.gov/vuln/detail/CVE-2026-40706
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - openjpeg: CVE-2026-6192: https://nvd.nist.gov/vuln/detail/CVE-2026-6192
 - opensc: CVE-2025-49010: https://nvd.nist.gov/vuln/detail/CVE-2025-49010
 - opensc: CVE-2025-66037: https://nvd.nist.gov/vuln/detail/CVE-2025-66037
 - opensc: CVE-2025-66038: https://nvd.nist.gov/vuln/detail/CVE-2025-66038
 - opensc: CVE-2025-66215: https://nvd.nist.gov/vuln/detail/CVE-2025-66215
 - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] polkit: CVE-2026-4897: https://nvd.nist.gov/vuln/detail/CVE-2026-4897
 - protobuf: CVE-2026-6409: https://nvd.nist.gov/vuln/detail/CVE-2026-6409
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - python3-aiohttp: CVE-2025-69224: https://nvd.nist.gov/vuln/detail/CVE-2025-69224
 - python3-aiohttp: CVE-2025-69227: https://nvd.nist.gov/vuln/detail/CVE-2025-69227
 - python3-aiohttp: CVE-2025-69229: https://nvd.nist.gov/vuln/detail/CVE-2025-69229
 - python3-aiohttp: CVE-2025-69230: https://nvd.nist.gov/vuln/detail/CVE-2025-69230
 - python3-aiohttp: CVE-2026-22815: https://nvd.nist.gov/vuln/detail/CVE-2026-22815
 - python3-aiohttp: CVE-2026-34513: https://nvd.nist.gov/vuln/detail/CVE-2026-34513
 - python3-aiohttp: CVE-2026-34514: https://nvd.nist.gov/vuln/detail/CVE-2026-34514
 - python3-aiohttp: CVE-2026-34515: https://nvd.nist.gov/vuln/detail/CVE-2026-34515
 - python3-aiohttp: CVE-2026-34516: https://nvd.nist.gov/vuln/detail/CVE-2026-34516
 - python3-aiohttp: CVE-2026-34517: https://nvd.nist.gov/vuln/detail/CVE-2026-34517
 - python3-aiohttp: CVE-2026-34518: https://nvd.nist.gov/vuln/detail/CVE-2026-34518
 - python3-aiohttp: CVE-2026-34519: https://nvd.nist.gov/vuln/detail/CVE-2026-34519
 - python3-aiohttp: CVE-2026-34520: https://nvd.nist.gov/vuln/detail/CVE-2026-34520
 - python3-aiohttp: CVE-2026-34525: https://nvd.nist.gov/vuln/detail/CVE-2026-34525
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-13473: https://nvd.nist.gov/vuln/detail/CVE-2025-13473
 - python3-django: CVE-2025-14550: https://nvd.nist.gov/vuln/detail/CVE-2025-14550
 - python3-django: CVE-2026-1207: https://nvd.nist.gov/vuln/detail/CVE-2026-1207
 - python3-django: CVE-2026-1285: https://nvd.nist.gov/vuln/detail/CVE-2026-1285
 - python3-django: CVE-2026-1287: https://nvd.nist.gov/vuln/detail/CVE-2026-1287
 - python3-django: CVE-2026-1312: https://nvd.nist.gov/vuln/detail/CVE-2026-1312
 - python3-django: CVE-2026-4277: https://nvd.nist.gov/vuln/detail/CVE-2026-4277
 - python3-flask: CVE-2026-27205: https://nvd.nist.gov/vuln/detail/CVE-2026-27205
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-gunicorn: CVE-2024-1135: https://nvd.nist.gov/vuln/detail/CVE-2024-1135
 - python3-gunicorn: CVE-2024-6827: https://nvd.nist.gov/vuln/detail/CVE-2024-6827
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - python3-pillow: CVE-2026-40192: https://nvd.nist.gov/vuln/detail/CVE-2026-40192
 - python3-tornado: CVE-2026-31958: https://nvd.nist.gov/vuln/detail/CVE-2026-31958
 - python3-virtualenv: CVE-2024-53899: https://nvd.nist.gov/vuln/detail/CVE-2024-53899
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sox: CVE-2019-8355: https://nvd.nist.gov/vuln/detail/CVE-2019-8355
 - sox: CVE-2019-8356: https://nvd.nist.gov/vuln/detail/CVE-2019-8356
 - sox: CVE-2019-8357: https://nvd.nist.gov/vuln/detail/CVE-2019-8357
 - sox: CVE-2021-40426: https://nvd.nist.gov/vuln/detail/CVE-2021-40426
 - sox: CVE-2022-31650: https://nvd.nist.gov/vuln/detail/CVE-2022-31650
 - sox: CVE-2022-31651: https://nvd.nist.gov/vuln/detail/CVE-2022-31651
 - sox: CVE-2023-34432: https://nvd.nist.gov/vuln/detail/CVE-2023-34432
 - squid: CVE-2026-32748: https://nvd.nist.gov/vuln/detail/CVE-2026-32748
 - squid: CVE-2026-33515: https://nvd.nist.gov/vuln/detail/CVE-2026-33515
 - squid: CVE-2026-33526: https://nvd.nist.gov/vuln/detail/CVE-2026-33526
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - tcpreplay: CVE-2024-54192: https://nvd.nist.gov/vuln/detail/CVE-2024-54192
 - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
 - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
 - tigervnc: CVE-2026-34352: https://nvd.nist.gov/vuln/detail/CVE-2026-34352
 - tinyproxy: CVE-2026-3945: https://nvd.nist.gov/vuln/detail/CVE-2026-3945
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - vsomeip: CVE-2024-3979: https://nvd.nist.gov/vuln/detail/CVE-2024-3979
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43342: https://nvd.nist.gov/vuln/detail/CVE-2025-43342
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-6558: https://nvd.nist.gov/vuln/detail/CVE-2025-6558
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2019-12840: https://nvd.nist.gov/vuln/detail/CVE-2019-12840
 - webmin: CVE-2019-15107: https://nvd.nist.gov/vuln/detail/CVE-2019-15107
 - webmin: CVE-2019-15641: https://nvd.nist.gov/vuln/detail/CVE-2019-15641
 - webmin: CVE-2020-12670: https://nvd.nist.gov/vuln/detail/CVE-2020-12670
 - webmin: CVE-2020-35606: https://nvd.nist.gov/vuln/detail/CVE-2020-35606
 - webmin: CVE-2020-8820: https://nvd.nist.gov/vuln/detail/CVE-2020-8820
 - webmin: CVE-2020-8821: https://nvd.nist.gov/vuln/detail/CVE-2020-8821
 - webmin: CVE-2022-30708: https://nvd.nist.gov/vuln/detail/CVE-2022-30708
 - webmin: CVE-2022-36446: https://nvd.nist.gov/vuln/detail/CVE-2022-36446
 - webmin: CVE-2023-43309: https://nvd.nist.gov/vuln/detail/CVE-2023-43309
 - webmin: CVE-2023-52046: https://nvd.nist.gov/vuln/detail/CVE-2023-52046
 - webmin: CVE-2024-36450: https://nvd.nist.gov/vuln/detail/CVE-2024-36450
 - webmin: CVE-2024-36451: https://nvd.nist.gov/vuln/detail/CVE-2024-36451
 - webmin: CVE-2024-36452: https://nvd.nist.gov/vuln/detail/CVE-2024-36452
 - webmin: CVE-2024-36453: https://nvd.nist.gov/vuln/detail/CVE-2024-36453
 - webmin: CVE-2024-45692: https://nvd.nist.gov/vuln/detail/CVE-2024-45692
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - weechat: CVE-2024-46613: https://nvd.nist.gov/vuln/detail/CVE-2024-46613
 - wolfssl: CVE-2025-13912: https://nvd.nist.gov/vuln/detail/CVE-2025-13912
 - wolfssl: CVE-2026-0819: https://nvd.nist.gov/vuln/detail/CVE-2026-0819
 - wolfssl: CVE-2026-1005: https://nvd.nist.gov/vuln/detail/CVE-2026-1005
 - wolfssl: CVE-2026-2645: https://nvd.nist.gov/vuln/detail/CVE-2026-2645
 - wolfssl: CVE-2026-2646: https://nvd.nist.gov/vuln/detail/CVE-2026-2646
 - wolfssl: CVE-2026-3229: https://nvd.nist.gov/vuln/detail/CVE-2026-3229
 - wolfssl: CVE-2026-3230: https://nvd.nist.gov/vuln/detail/CVE-2026-3230
 - wolfssl: CVE-2026-3503: https://nvd.nist.gov/vuln/detail/CVE-2026-3503
 - wolfssl: CVE-2026-3547: https://nvd.nist.gov/vuln/detail/CVE-2026-3547
 - wolfssl: CVE-2026-3548: https://nvd.nist.gov/vuln/detail/CVE-2026-3548
 - wolfssl: CVE-2026-3549: https://nvd.nist.gov/vuln/detail/CVE-2026-3549
 - wolfssl: CVE-2026-3580: https://nvd.nist.gov/vuln/detail/CVE-2026-3580
 - wolfssl: CVE-2026-3849: https://nvd.nist.gov/vuln/detail/CVE-2026-3849
 - wolfssl: CVE-2026-4159: https://nvd.nist.gov/vuln/detail/CVE-2026-4159
 - wolfssl: CVE-2026-4395: https://nvd.nist.gov/vuln/detail/CVE-2026-4395
 - wolfssl: CVE-2026-5187: https://nvd.nist.gov/vuln/detail/CVE-2026-5187
 - wolfssl: CVE-2026-5188: https://nvd.nist.gov/vuln/detail/CVE-2026-5188
 - wolfssl: CVE-2026-5194: https://nvd.nist.gov/vuln/detail/CVE-2026-5194
 - wolfssl: CVE-2026-5263: https://nvd.nist.gov/vuln/detail/CVE-2026-5263
 - wolfssl: CVE-2026-5264: https://nvd.nist.gov/vuln/detail/CVE-2026-5264
 - wolfssl: CVE-2026-5392: https://nvd.nist.gov/vuln/detail/CVE-2026-5392
 - wolfssl: CVE-2026-5393: https://nvd.nist.gov/vuln/detail/CVE-2026-5393
 - wolfssl: CVE-2026-5446: https://nvd.nist.gov/vuln/detail/CVE-2026-5446
 - wolfssl: CVE-2026-5447: https://nvd.nist.gov/vuln/detail/CVE-2026-5447
 - wolfssl: CVE-2026-5448: https://nvd.nist.gov/vuln/detail/CVE-2026-5448
 - wolfssl: CVE-2026-5460: https://nvd.nist.gov/vuln/detail/CVE-2026-5460
 - wolfssl: CVE-2026-5466: https://nvd.nist.gov/vuln/detail/CVE-2026-5466
 - wolfssl: CVE-2026-5479: https://nvd.nist.gov/vuln/detail/CVE-2026-5479
 - wolfssl: CVE-2026-5500: https://nvd.nist.gov/vuln/detail/CVE-2026-5500
 - wolfssl: CVE-2026-5503: https://nvd.nist.gov/vuln/detail/CVE-2026-5503
 - wolfssl: CVE-2026-5504: https://nvd.nist.gov/vuln/detail/CVE-2026-5504
 - wolfssl: CVE-2026-5507: https://nvd.nist.gov/vuln/detail/CVE-2026-5507
 - wolfssl: CVE-2026-5772: https://nvd.nist.gov/vuln/detail/CVE-2026-5772
 - wolfssl: CVE-2026-5778: https://nvd.nist.gov/vuln/detail/CVE-2026-5778
 - xdg-dbus-proxy: CVE-2026-34080: https://nvd.nist.gov/vuln/detail/CVE-2026-34080
 - xdg-desktop-portal: CVE-2026-40354: https://nvd.nist.gov/vuln/detail/CVE-2026-40354
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
 - xrdp: CVE-2025-68670: https://nvd.nist.gov/vuln/detail/CVE-2025-68670
 - xrdp: CVE-2026-32105: https://nvd.nist.gov/vuln/detail/CVE-2026-32105
 - xrdp: CVE-2026-32107: https://nvd.nist.gov/vuln/detail/CVE-2026-32107
 - xrdp: CVE-2026-32623: https://nvd.nist.gov/vuln/detail/CVE-2026-32623
 - xrdp: CVE-2026-32624: https://nvd.nist.gov/vuln/detail/CVE-2026-32624
 - xrdp: CVE-2026-33145: https://nvd.nist.gov/vuln/detail/CVE-2026-33145
 - xrdp: CVE-2026-33516: https://nvd.nist.gov/vuln/detail/CVE-2026-33516
 - xrdp: CVE-2026-33689: https://nvd.nist.gov/vuln/detail/CVE-2026-33689
 - xrdp: CVE-2026-35512: https://nvd.nist.gov/vuln/detail/CVE-2026-35512
 - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
 - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
 - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
 - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
 - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
 - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
 - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
 - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
 - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
 - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
 - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
 - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
 - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
 - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
 - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
 - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
 - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258
 - zabbix: CVE-2026-23919: https://nvd.nist.gov/vuln/detail/CVE-2026-23919
 - zabbix: CVE-2026-23920: https://nvd.nist.gov/vuln/detail/CVE-2026-23920
 - zabbix: CVE-2026-23921: https://nvd.nist.gov/vuln/detail/CVE-2026-23921
 - zabbix: CVE-2026-23923: https://nvd.nist.gov/vuln/detail/CVE-2026-23923
 - zabbix: CVE-2026-23925: https://nvd.nist.gov/vuln/detail/CVE-2026-23925

====================

Removed this week (0): 


