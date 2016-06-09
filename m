Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id B15F260722
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 18:13:28 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bz2so15425679pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Sm8jrmSdf/NJsS0Gteyd0qyEf82cU2iT7uSXY1oMg1Y=;
	b=HNgCm3CEe1thDeHVnfpDefGHCGqk/8ery8gs9l8bcICDWL8RhQ/yjMeZpWi0s943+C
	/eBPgrZ8O5X52Hmwo54zamorICRSVBFr5pP6sUkXVgthFBoNB6ebKA44dtajFLveyuXI
	kdjdQmt0ildUROwwbKqevcC6FXoVq4huNV1tpi6tbjRAeeF2Oh+LZ3DAmh2RJyQS1Lcr
	adRiW7CTUdugzsBEd3+XkZ3Yxi9qTe1abpqTtVpJiGyoeP2jxhoEUV1MxOjaXDfQeh9Z
	vXttD+VHi+CcYZrD5hNQDXMiJW/aYisJ5lvFQeb75JDqBRrfW/e/IzbGo9xqGCRZMwjS
	GBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Sm8jrmSdf/NJsS0Gteyd0qyEf82cU2iT7uSXY1oMg1Y=;
	b=lRCML8m3q/9l4gOZNNygvco2OFOLcUIghQPkEukyLu8mxrN+AMWiysa889jzuMtJVc
	aSwWDRgU1a2MEKbxndo9g1Y71d1d9G2OaXYhwGRviVy14UnYmuaXQhLbHwfMy/t6iIHz
	ShHCSOEHBHe+xalkxu4ojFCleFKNglyD1gTBqYRpND0JTcJbbI35fMJ5V0eeYptkZVnY
	Qi5QauRMpOlzX50070lMNRVcK+eDd81SQuhpFlQmQEfKRznEhk3eXytuzNgicYL9HkZ5
	Lfq4KmsbnkQS8OA4jJze3YOhJozqy7wi+8B89Xz6EqRxFiLYX0kW+zFDL9VdzvaWWBW1
	SbPQ==
X-Gm-Message-State: ALyK8tJbzQgoAZTy0cDqioPCAmCPbUo7Yg6RqQ9q1XJ5/UWsXLwb1B/SZoYmK8FOcLSNjg==
X-Received: by 10.66.172.49 with SMTP id az17mr13741560pac.104.1465496008906; 
	Thu, 09 Jun 2016 11:13:28 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	r64sm11637708pfi.54.2016.06.09.11.13.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Jun 2016 11:13:27 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jun 2016 11:12:36 -0700
Message-Id: <cover.1465495803.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 0/2] mpv: add desc & use waf.bbclass
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
X-List-Received-Date: Thu, 09 Jun 2016 18:13:28 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit 52213998eb4ead7d24cba012c937bcc25e89c2ca:

  mpv: Media Player (2016-06-08 14:55:30 +0200)

are available in the git repository at:

  git://github.com/kergoth/meta-openembedded mpv-use-waf-bbclass
  https://github.com/kergoth/meta-openembedded/tree/mpv-use-waf-bbclass

Christopher Larson (2):
  mpv: add DESCRIPTION
  mpv: use waf.bbclass

 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

-- 
2.8.0


