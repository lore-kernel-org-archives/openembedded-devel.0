Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6B12F6AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2015 03:22:03 +0000 (UTC)
Received: by oba1 with SMTP id 1so23448120oba.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Dec 2015 19:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dNaGB4D+GaMGopdfixHtza9dKdJnFz2R3j/M8Y/5VBk=;
	b=djC/O9QWYSdmjYmAeON5YqNnWd4UFN6H3nKIhGa3PZRTrQ7bEmSbfbKB5KaEeMtVAB
	4DrQC4pDse2B5tAMxvInXWEToUAsLpgRLPz1aDsbsulV23+h1j7exwzI/5ysZwlpy3or
	7Z4CUDkUirLAItgoKh35RlDipLAHKoDZ0MVa+Arot4OCFZoe0O6mwaSMoRP/3OqbT0qS
	E/mIqZY/1kYzYNd9bbZtEOx2+73U0njSVY6E7hGkC4ufgcA5K/2ol7gWw8roULmPCvar
	FyhO6CM/D5007Q8zGzsbgVoqqXu2yfzMMUW9WvMM+b5HfowQ3v16hxT/DIPPNVe6U9YJ
	QyGw==
X-Received: by 10.182.125.38 with SMTP id mn6mr7737039obb.17.1449199323865;
	Thu, 03 Dec 2015 19:22:03 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ct9sm3533633oec.15.2015.12.03.19.22.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Dec 2015 19:22:02 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Dec 2015 19:21:52 -0800
Message-Id: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-multimedia][PATCH 0/4] mpg123 cleanups + update
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
X-List-Received-Date: Fri, 04 Dec 2015 03:22:03 -0000

Andre McCurdy (4):
  mpg123: recipe formatting cleanup, no functional changes
  mpg123: limit ARM_INSTRUCTION_SET = "arm" over-ride to armv4/armv5
  mpg123: drop unnecessary dependency on tslib
  mpg123: update 1.21.0 -> 1.22.4

 .../mpg123/{mpg123_1.21.0.bb => mpg123_1.22.4.bb}  | 47 ++++++++++++----------
 1 file changed, 25 insertions(+), 22 deletions(-)
 rename meta-multimedia/recipes-multimedia/mpg123/{mpg123_1.21.0.bb => mpg123_1.22.4.bb} (86%)

-- 
1.9.1


