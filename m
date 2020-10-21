Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web09.15643.1603301951786071050
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 10:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=NhRWBE9z;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: crg7475@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4CGd5m6g3FzQlWB
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 19:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:mime-version:date:date:message-id:subject:subject
	:from:from:received; s=mail20150812; t=1603301945; bh=GGA/GcXjl0
	jjIF9R2FbhOsp51tNorxJjWU4DFfdDF1w=; b=NhRWBE9zXihIEjvmj4kte3oGDf
	PNmTWuZb3W7oeDBncHq3SocK6FjIT3gooMopz3JVCfajTe0a6Iq0tTfCEHqr6IHn
	fpFspbrbGbixMXDufyJXLKBNBycoBRMM9ab5u+VTDk0Ti43dMzR3ilJJ4VUxC7ha
	w+riX/p8SpADamII+SPoCzsSLghIiowkqYQP4rUuq1L40Szs2I/lCk3SShbD0hYD
	6eSY7YJfiv3gIriwqrNdg7ayrpMMoDDYbYE08MySX5QdEN/Ube/5Y8573GDnneKE
	Pki9vYOwSszTSShG4BGY2bB2gj8Gyw7H322N9UxPeEO/giaAiWf63Y63NmgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1603301947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5WC+vEXvnDwen2CQWxfEP/HDHgvwzUuF0w9cN9YViMI=;
	b=MNdebMFgXQF+Gwfh7fLgE6905gCYFVSngRx1EihwlEtL2swy5WLqGxLal1WN5kE0JpBo4q
	wPZX8wOE9RUBxHl6VZqO6RfpvOdSpKLSEdjIsRGPGzmVGF5ZdUej9JT3pmuukgXPsi6j4z
	epX0ytGBxCnJfPwx6gQIchzdHGPaqQ+nUbAnZ/hgY2VXknqxJ2kbWzdpyfhSUxtGM5xI+8
	vJ+EVsu2tiKbmdm3+K7J/Kfe5HYwxLQbMd1y09d1EQc9/oCAFdRma4gfm8NPw3im4w7dQG
	zcPM4EP3e/rFO6g7Yv+4lqJ6TXHRUiXZXhWWYbAo5uMq6AMIdp1Tql1hreapuQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
	with ESMTP id ZH7jGNuoVLJm
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2020 19:39:05 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
Subject: qmake with Yocto SDK - is this possible?
Message-ID: <23ddbc79-e01d-4cae-9820-416e188ec795@mailbox.org>
Date: Wed, 21 Oct 2020 19:39:05 +0200
MIME-Version: 1.0
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.70 / 15.00 / 15.00
X-Rspamd-Queue-Id: E61EF17DB
X-Rspamd-UID: f501cd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I've been trying to get qmake to work with Yocto-generated SDKs for 
cross compiling qmake based projects.

No luck so far.

What I've tried is to add nativesdk-packagegroup-qt5-toolchain-host to 
TOOLCHAIN_HOST_TASK_append . However, when I try to run qmake, this happens:

"Cannot find feature spec_pre.prf"

Does anybody have any idea what I have to do to make qmake work with the 
SDK's environment?

