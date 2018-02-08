Return-Path: <pidge@toganlabs.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7C84F78493
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 16:20:31 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id r71so10565483wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Feb 2018 08:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=reply-to:to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=jLBkwICpaKUCAPhFlg4j/c9W9ccDs0MnCkswjuKCiLM=;
	b=p00MJzR6wkUTaeWp5LRTzLLRhTyvsgxfX+skQ/0y6lpUAf/fe0ooi3R9ri+nTnkF1Y
	cx4lImpYaAEcvhUlDnX/mYxP7DdwK6hSOLyMbi3B/xXBFfuIjCrP6qwPxPJgwaj6g4v+
	QGAaXFkyEcny+4xSAcG4Be9aOF8WYxqOow2ZY+aS2oSyGHhwOjaco+hQtikEaLE5B4wD
	g0s4TbgFOeIl+tutk+hpDly8A4DsGN4YzKJtwIDSrB9qXLBRUM73C/0k5LOF2vFVmz+6
	cEGxbNtw4sPm7wjtcshSnxM07makE7gdWXcOGk2GYBlTLUQ0TuUvEWeOQGHHTKuPJNod
	ythQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:reply-to:to:from:subject:organization:message-id
	:date:user-agent:mime-version:content-language
	:content-transfer-encoding;
	bh=jLBkwICpaKUCAPhFlg4j/c9W9ccDs0MnCkswjuKCiLM=;
	b=jxmX5y1vjAEXhC9njp7hB3jQnaKLPpj9TYogVtUp6eLMckbNFl4LVdf5ai8/h7SW6g
	vRbVfa6Z3T9Yi950CcvZqHrPDnMK1KH6ftwAG+OzMA+5mf3k2AG62v2l0fQT24hOWPuk
	NvIMn4DXgiS5xj3/tfQvnbJbCx9Y/Hj6QF/wPFk1bf5S6y+QwWWKhUQxSm0MgoXR/KPl
	Kano9YDtSgWD01ea8fa/ygmNwCTU0BrNFBJpiEaebvEwE+KqJT4eY1CTieYMnVX0bXPQ
	B1AqxKJkq47pqeoER5BPSJjrb6FMEvfRwbq+gd/4GqUxwv9nlDKneBLQpW+o/MMrPKx3
	cBpg==
X-Gm-Message-State: APf1xPDvTuApMiK6XWLctvCztVgN3ILj95QImzBF2NrXkhrR8Yra5RuT
	mlN9p/YQMwawsBS9x4dyTTAk4GfG4C4=
X-Google-Smtp-Source: AH8x2262QeU7n5m72zYSjeDF2d7RXl+cBQhDWe5Cltt57LFfzRXBdFr6/BoN10Cnp5IWqde5hs2GIQ==
X-Received: by 10.80.220.70 with SMTP id y6mr2234111edk.236.1518106832989;
	Thu, 08 Feb 2018 08:20:32 -0800 (PST)
Received: from [192.168.1.104] ([83.136.43.184])
	by smtp.gmail.com with ESMTPSA id a5sm140309edm.38.2018.02.08.08.20.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 08:20:31 -0800 (PST)
Reply-To: pidge@toganlabs.com
To: openembedded-devel@lists.openembedded.org
From: Beth 'pidge' Flanagan <pidge@toganlabs.com>
Organization: =?UTF-8?Q?Tog=c3=a1n_Labs_Ltd.?=
Message-ID: <014bfa20-b9c7-9a23-4fc7-ac515a3c3452@toganlabs.com>
Date: Thu, 8 Feb 2018 16:20:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
Subject: [RFC] Using OE with Fossology.
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
X-List-Received-Date: Thu, 08 Feb 2018 16:20:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

I wanted to make folks aware that we've released a new layer to do
automated fossology runs within OE. The old spdx.bbclass is bitrot and
we needed something to make some of our license clearance and tracking
easier to manage.

http://layers.openembedded.org/layerindex/branch/master/layer/meta-license-tools/

This layer takes patched archives created by the source archiver during
the build and, using a utility we wrote called fossup, sends them on to
a fossology instance for out of build scanning.

The impact on build times is relatively small. If you want to use it,
you'll need to install fossup (https://gitlab.com/toganlabs/fossup), set
up the fossup rc file to point to your fossology instance (all of this
is in the README), and ensure that the bits needed for an archiver build
are included in your local.conf

Typically this will look like the following:

INHERIT += "archiver"
ARCHIVER_MODE[src] = "patched"
ARCHIVER_MODE[diff] = "0"
ARCHIVER_MODE[dumpdata] = "0"
ARCHIVER_MODE[recipe] = "1"
COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'
COPYLEFT_LICENSE_EXCLUDE = 'CLOSED Proprietary'
COPYLEFT_RECIPE_TYPES = 'target'
INHERIT += "fossology"

Feedback welcome of course.

-b

----
Beth 'pidge' Flanagan
pidge@toganlabs.com

