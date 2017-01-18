Return-Path: <anton@advancedtelematic.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 161D57199D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:44:04 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id z134so11841818lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 05:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=advancedtelematic.com; s=google;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=v3pUcHFC0x/yYWQ5BoyTj7g7ecKNaABmDuLW4EIHPE8=;
	b=UX1y2w9dCW+TvgQqYltkm7xtuF5W8HU1JD8nougljdq5Xqhl+qaaRh0ncST0WjzNBs
	J3mjvAJ6JmRvQ5OkGq1t5tphk522xzc6cmh/RD2V3Pq+Vi8MIn7kH7NW775UToQEIlXF
	Yu95KC0pNIdXFj/PJ5o8wcAPGWv+V0TGKhd+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=v3pUcHFC0x/yYWQ5BoyTj7g7ecKNaABmDuLW4EIHPE8=;
	b=To4cvXc9qnEDilwAgYUbckXu9ccIzuwuskujFvLo2ZsOhCq6Q4ht7K0vIiH7senpUD
	PyKNow+0og2f4OnQxTchIFF1GNKhJUpUvn1WPZbZrD1gOagBmRNa6qsgwYj4uEflvbPL
	bOOkxamOfbFrZVRCfzs24GIQWFsqHFhlxQZP/l5Mta8w6+RRtZ9TeSTjykweSoN98SnP
	Gj7Y6x+l8C1BEzqHCScNIa7+QKoStZzc3tOpBQqo6MxgxQWD5uCxdXZ++8ErolKMPa4a
	n9t5sujDM461y9f5AmdnvALBeHKKUiSaN+niczovv5OciAeLwPxFQlvKqFj9hj32GXTC
	PIRg==
X-Gm-Message-State: AIkVDXIjb4DnKQLRF4b0crU2yXMsT6ltHC721BqxNmLKh6heipS/8C06Th3bVS1axBVl0w==
X-Received: by 10.46.5.130 with SMTP id 124mr1638766ljf.17.1484747044637;
	Wed, 18 Jan 2017 05:44:04 -0800 (PST)
Received: from [192.168.1.52] (p57bf9f95.dip0.t-ipconnect.de. [87.191.159.149])
	by smtp.gmail.com with ESMTPSA id s20sm203731lfg.29.2017.01.18.05.44.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 05:44:04 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
From: Anton Gerasimov <anton@advancedtelematic.com>
Message-ID: <4415c776-cf62-377d-1756-3a559b6afba6@advancedtelematic.com>
Date: Wed, 18 Jan 2017 14:38:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Subject: /usr merge, stateless systems and atomic updates w/ OpenEmbedded?
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
X-List-Received-Date: Wed, 18 Jan 2017 13:44:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jussi,

in meta-updater we were using the second approach, because it didn't requ=
ire
any interfering in oe-core. But first one seems a lot cleaner to me. I am=
 looking
forward to seeing your patch.

Best regards,
Anton Gerasimov


--=20
Anton Gerasimov, ATS Advanced Telematic Systems GmbH
Kantstrasse 162, 10623 Berlin
Managing Directors: Dirk P=C3=B6schl, Armin G. Schmidt
Register Court: HRB 151501 B, Amtsgericht Charlottenburg



