Return-Path: <ranshalit@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id EB8D36FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 15:26:50 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id 189so11863109qkj.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=2mr9YtiCKOmRdolluyhLW+Q1lCVfARe7A7zbbg6+Dbw=;
	b=QtFj7WXFN2GhFQ1Z+SuDjeqsVwRHc/oGMHrjgI+NxK+GoWfnqbnEhhoOJlmlJYSrVb
	HntsZWfglC4eJvu+x8BJYE7mq8PcKJ8Anj+gZsAGkzGIJ3BxURHT5rrSTvFCxnk04UDe
	OvOD+WucqW2vJ2I8X9Y9/ZojO7TCtKgbrykOAzvkzB+e2HTi6SAJNb+aZ1EqcS7ZXEyE
	nwxA7D7aNptPzpvZylM+fhzCSeiqaLziSPirp77VotiLBveop6b13bYe0oTYTU7lZiXX
	0vbMCPwcdyxrkuichqMoLFoWEO38E12N1HRmcfS3xjr1KLU6TSn9mP2kXIBuG5iJ+FTV
	6/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2mr9YtiCKOmRdolluyhLW+Q1lCVfARe7A7zbbg6+Dbw=;
	b=eGjyEB/oDTmnOBF6KQxe1kLvNeMO6cu9IpfF8c1toh4uAWci7AqWPdv5T4wDERl3Nf
	JTMSnvhbK9+Uhhg0uhVO8Tr2qOk8Bgq16ZjvV9mURxf/Jo7gopziqjjPc/JrRZ1uZ6lz
	btyinUO1kCyFw+Gqa+VYuZQXGsZFeDyyDHblqbCRyvnErk2P1R/EhhrFbLIIhoeV5P2S
	rtDOmOzgfjgkRoTUOYnCl4b7zXNFoWG5A899TLnYqrINb0L7FepbnIllhUn/oEaE+uKG
	sRcI8GiHrN1JAMi/HXmpPhKQICVV1wYS3RrGY6gkrSdFu+Y3bZSVWbLm1fw4yPcThfyl
	V/WA==
X-Gm-Message-State: AA+aEWa6R/fuQn1d6OmwX6KN4wSob9shZ6b0ezEioicnAzrK2fJ3sQ/6
	7hk43azWHXPxbx44KlBtis7LkdoJs12qA42DPKQtOXW4
X-Google-Smtp-Source: AFSGD/UCWGwdu3TqEh1+beY0B65kNAkLuttshq/UC1iMs9wgwrVOq3grGrswKq/9ZerCrkEvTZlZDfezf4qx3D7ozQw=
X-Received: by 2002:a37:bd47:: with SMTP id n68mr20526481qkf.203.1545233211553;
	Wed, 19 Dec 2018 07:26:51 -0800 (PST)
MIME-Version: 1.0
From: Ranran <ranshalit@gmail.com>
Date: Wed, 19 Dec 2018 17:26:40 +0200
Message-ID: <CAJ2oMhKm02QeiF5dqpvYqeXBRCo+jWh=cjb2Sj2DjAt+ZqirTg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Build suddenly stops and desktop logouts !
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
X-List-Received-Date: Wed, 19 Dec 2018 15:26:51 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

I have strange behavior with ubuntu16.04 LTS, in which after building
for couple of hours, suddenly the ubuntu OS logouts.
I see that others also have the same issue but seems that there is no solution:
http://lists.openembedded.org/pipermail/openembedded-core/2016-December/130617.html
and
https://stackoverflow.com/questions/48148169/whenever-running-bitbake-stops-all-application-and-locks-the-system

I have increased my virtualbox memory to 11G, (no swap in my ubuntu)
but it still happens (might be less than before not sure), also
strangely even after increase with "free" command I see that it get
sometimes below ~150M free.

Is there any idea what's wrong?

Thank you,
ran

