Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id EE3486DC00
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 00:39:06 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hn9so4754029wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 16:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cVEV36BG7BokFyoZdaue5eA4J5vTFhR1XkwIM72VKN8=;
	b=IA8X81PMLQHNxs15q4frTBM6Bn663x0ZFgZY6u/BdezUCufoTH5XWIhI5CI9mOQuyo
	FUkooDiq6s0biTlzBUREdvYllk7SASaa3cECr1bp7LXdH52A9EXsXPGeDfchY2/HbCDH
	wXOoST04dmGPaRSs0pOtzXGUGIZ0WthhCenLiNAjflV2L5w7nQ3WK+KGezul/ir3HU1H
	ixqh4owJE/PpmqSkkOBWNacme5e50Q8tH5oSAgRYnBiPS6g4/SraxamXwtgI+qkcukWv
	8a8Ai5HN4tB4moHinVKSktBtb64dsLu7Eh51zPVCETQZGBH6LBqrbNmtPV8n1UEGs02o
	6Sow==
X-Gm-Message-State: ALoCoQkbl37Kib4SiND8T0cMpVT5eykbnq3yqYfCTSpxinF62XABBgkesPQeNlsQCMm2DxGmjvQe
X-Received: by 10.180.219.33 with SMTP id pl1mr9561500wic.49.1386203945927;
	Wed, 04 Dec 2013 16:39:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id qc10sm1032500wic.9.2013.12.04.16.39.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 16:39:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 00:38:57 +0000
Message-Id: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-devel@lists.openembedded.org
Subject: [RFC][PATCH] cmake: respect ${S} and ${B}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2013 00:39:08 -0000

Hi,

This is a Request For Comments because it changes behaviour of the cmake class
and I'm not entirely knowledgeable in cmake.

For some reason, cmake.bbclass doesn't use ${S} and ${B}, but instead has it's
own variables OECMAKE_SOURCEPATH ("." by default) and OECMAKE_BUILDPATH ("" by
default).  Those defaults meant that the build happened in the source directory,
which conveniently was ${S}.  Unless ${B} was also set, in which case it all
broke.

I don't see a good reason for cmake.bbclass having it's own special versions of
${S} and ${B}, so this patch drops them and replicates some of the logic in
autotools.bbclass: specifically the part where if ${S} and ${B} are different,
delete ${B} before building.  This ensures that switching machine doesn't re-use
the same build directory, which was the cause of me going back to look at this
(libproxy trying to use the nuc sysroot when I'm building for qemux86-64).

Some open questions:

1) As I understand it cmake has more reliable support for out-of-tree builds
than autotools.  If this is the case should cmake.bbclass set B ?=
"${WORKDIR}/build", or leave setting of B to separatebuilddir.inc?  Are there
known recipes using cmake that fail with out-of-tree builds?

2) Is dropping OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH acceptable?  Nothing in
oe-core uses them and there's three (IIRC) recipes in meta-oe that use them.
Assuming the answer to (1) is "separatebuilddir.inc" then the only fallout
should be these recipes using in-tree builds until OECMAKE_BUILDPATH is replaced
with B.

Feedback and testing from people who actively use cmake very welcome.

Cheers,
Ross

