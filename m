Return-Path: <joe@deserted.net>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6206025E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 16:04:45 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 136so121650558iou.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 08:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zcvk+Vmi1jv+uf9pHwjRzUr1XS7uguclM2IJYIG2eV4=;
	b=SQfYC44OlQuNh3wxOw5psBcHU2dNIJkah+WuEEg7ZlGtRC19p6cLBIKlUCzbEtkiS8
	LcoXZPOwYy9igEtrZA7Lktr0UR8V412At0N9xgR547kkTg7verwO5nEt90YwfrPm1pL0
	CYK5lHzdnOZPRoUXdefkSW3bv4U8tw0U5thMyL4iEkToLidw8xsXbg40rozVndjZziNX
	QlmXIH1+PP5B1X0j1fNxV2SR9Gw6rE9KzjAlW0/hA68t09aJPLwsuNkVQuZpIoCxOkbK
	LCXv+8CrVVBj1UHZOI525xIl7tNRdGV1elc7Wa6+6j1YbBBivaZhxtZEE3P221hKjt5t
	4A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=zcvk+Vmi1jv+uf9pHwjRzUr1XS7uguclM2IJYIG2eV4=;
	b=b8hLIB/vDeLbtX801xE7UPPMPvzE0MxHkMveyrh6pdzkScS7/63NK6eaxJJXg96HoI
	+wIg0TiMpmpj+NFPn0k/laghj5mk3ZkDfd2Y4aSaclz5T4nIq4MQJ1Y5qj/hcRGIO6OL
	sSFZCZ91RzvYNwOlfpnZzZUpB8H19x5OO1pkA6FpnUHF7N+KoTliCMtypdGktrIXm2uM
	uY73u51bxwixvi69Wj9ksZItcyt5mA10gvDC+WquZ3+okDND/vfU6Zma5dts58Di6Bxf
	cMupjjTDKzaGyhPaDQaGpRSfkSETduVTJva4ND2MRfkBr+sReyxhLM5NouTlGVNPi2Gh
	RyMA==
X-Gm-Message-State: AKaTC02FTxfqo+IRM3Gjmek9xId7ECksl7+nBg3I6Nu68tWeBstr4cqOZDNtw9MlUQ89kg==
X-Received: by 10.107.156.75 with SMTP id f72mr8720537ioe.9.1481990687221;
	Sat, 17 Dec 2016 08:04:47 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	c36sm3371303itd.18.2016.12.17.08.04.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Dec 2016 08:04:46 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 11:04:48 -0500
Message-Id: <1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 00/11][v2] samba: refresh pending patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Dec 2016 16:04:46 -0000

Rev two of the updated patch set, this time with potentially less multlib
issues (thanks for catching that, Andreas) and formally dropping the
DISABLE_STATIC patch.

-- 
-Joe MacDonald.
:wq


