Return-Path: <bkylerussell@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id A64667C0D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Feb 2019 15:53:32 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id m62so9465441ith.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2019 07:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JU59kcbPZbfyL8cUV9mwkAj9+OoX3wFarpDPOvzLoms=;
	b=DOdkm31fz9M/dJ+MxH4I/oz9DbAcCRGOO35DzKdvgVqG72pYhxebPFflPNkEwhRwGx
	qnZKWWBc49wGgns7z+sYRJSAh1ieflpY+fw8Z4n2Oix19MsMVsWsOTmK2o+NmUo08MP7
	DFZnK+8WEtYllEuZmQBTamNhaLM5NuAXTMBEMUANwa6jkGu2VR1LCT4TbdH0ufOtxAQ6
	uk1PQmWIdZAIBx5EgXKo5w0O3s8FPzRjalrSNFzsSNY6TEpVd5IzAume6CP44TEtIh/P
	17qVXjVLOdv5tiAKJlehSilUMSmltTkXLOywezfX/K1Of6dMhEcyBx+gVdF/pKSah3Q5
	C5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JU59kcbPZbfyL8cUV9mwkAj9+OoX3wFarpDPOvzLoms=;
	b=JsjJoidnuQBD2EiBhtebhAFDZ0b7I6oExN4j64QbvB1KrIspDDiSiIGc3qs8qgGj+d
	F8N7+no+fjXoOJIHLzuJGoagJjsSSAFcoYnlDjGa+eL8TuZheNx5o6yY9DEiQNzEBdco
	D+zYlMlkabKXhmoV3XULKkiRk7E19s8RTUV8j1WfQZMS9v0ev+fcFuLxjS0p420fbI4s
	AaYOIgRduEz6WNE0+dtrjv2+6Hht9w3c1p7YWhGnaKQcSk3BfDVreLFhh44Ch4xs5Wum
	He2jFkDXiYkhMS1SswkqkRasEVudxK0yjWDTCfEiMtHgcHFow/1SRMyATX64ElzXM3Qo
	Utig==
X-Gm-Message-State: AHQUAuavJVt4mtZCoscNSFA9kJio+fMUws0mJf/cbOL5NxVe/BHEDzJx
	4o8+7pWfFacSwK5DCboGdfG+xoNW
X-Google-Smtp-Source: AHgI3Ib8Htn69w/tU5ms0nomhlg9Du6fBx3/vJNpMhcMeRnZ1+5N2pxskkH0KdSWuc1XVnRHDJjSPA==
X-Received: by 2002:a02:8244:: with SMTP id q4mr2985460jag.43.1549382013353;
	Tue, 05 Feb 2019 07:53:33 -0800 (PST)
Received: from napoli.dhcp.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id z6sm441985iop.73.2019.02.05.07.53.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Feb 2019 07:53:32 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2019 10:53:23 -0500
Message-Id: <20190205155325.7493-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/2] RFC: Support building Java recipes with openjdk-8-native
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
X-List-Received-Date: Tue, 05 Feb 2019 15:53:32 -0000
Content-Transfer-Encoding: 8bit

This series spun out of a request on the mailing list last October on
configuring meta-java for using openjdk-8-native to compile other Java
recipes that might require modern API features not provided by the
bootstrap VM classes.

http://lists.openembedded.org/pipermail/openembedded-devel/2018-October/197186.html
[oe] meta-java configuration

I've been running with this series on sumo, but I wanted to send it out
to get other thoughts on the approach.

It seems like there's already precedent for this format with perlnative
and pythonnative.  That was more or less how I expected java-native to
behave initially until I understood more about the bootstrap process.

If I've missed a valid use case of java-native and this change would
cause breakage to someone else's layer, I'd be fine with introducing
javanative.bbclass as a new class that provides the same functionality
as the following patch to java-native.bbclass.  (Its name would be more
closely aligned to perlnative and pythonnative without the dash.)
However, it appeared that java-native was essentially unused, and I
thought having both a java-native and javanative class would be
confusing.

Kyle Russell (2):
  Add support for building Java recipes using java-native
  ant-native: only use classpath tools if no JDK

 README                                          |  7 +++++++
 classes/java-native.bbclass                     | 17 ++++++++++-------
 .../ant-contrib/ant-contrib-native_1.0b3.bb     |  2 +-
 recipes-core/ant/ant-native_1.8.1.bb            |  4 ++--
 recipes-core/ant/files/ant                      |  9 +++++++++
 recipes-core/openjdk/openjdk-8-native.inc       |  2 ++
 6 files changed, 31 insertions(+), 10 deletions(-)

-- 
2.20.1


