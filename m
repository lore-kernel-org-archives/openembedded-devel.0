Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11738.1795085361567145713
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 02:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=cbDTr8OZ;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout06.t-online.de (Postfix) with SMTP id F0058133C
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 11:49:18 +0100 (CET)
Received: from localhost.localdomain ([79.219.238.229]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xTzhd-4JwVdo0; Thu, 19 Nov 2026 11:49:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/4] tree-sitter grammars and neovim
Date: Thu, 19 Nov 2026 11:47:45 +0100
Message-ID: <20261119104903.176376-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1795085357-A17F99BF-3A9B3D73/0/0 CLEAN NORMAL
X-TOI-MSGID: 328c8767-b25f-4236-b686-cc9a6e52af24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795085358; i=f_l_k@t-online.de;
	bh=YZmwY3c5F3wi9Hu5I98Xh2xfCrO5KMJQtXSZSnxFTtk=;
	h=From:To:Subject:Date;
	b=cbDTr8OZt9aCly5h5UlmDdgYUz/AWXMLItI5rbqkI8MJo0i/wTynq6X/1lL57DYpu
	 tKOs4w4N6oHLQO17HZLHR5CVA5+v7TAJ3yKhlOnxDQXadhV9XV3i8K8UkbmJhLmCpY
	 v5/xLbfmxXaQMJfnJrWzFC15XwdwBSqCSNvywatsUNRoPLfiHQ1f/zgm1MnwocUDGZ
	 va8/BC3D8FSvSMB/hw/75W8FlDCOYAnch22xJu0ZquT1y/wElXUQP/mkSQCXwURbsP
	 EVsGEkWP5LEoOtmUwr2xpSVN2/ywMii1+LH75IpxF4zC0uF9e01m7CnCcG1ASCdU+P
	 ociEVlsi4VZ+Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132674
Content-Type: text/plain; charset="utf-8"

This series adds tree-sitter grammars and neovim. It depends on
"libtreesitter: add recipe for 0.27.2" sent earlier.

