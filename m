Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 1264 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 May 2017 08:29:44 UTC
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id DA0F260017
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 08:29:44 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1d8j9M-0000sa-Ou
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 May 2017 10:08:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; 
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To;
	bh=r4P55txbM49saCIwB8Y0SbFU4UxH1Aofsu6OWgTyjaQ=; 
	b=EVdejTXFFL3I7OMUHjr9GsLPzfrpOosFytob2uY5j+DovuXI6Y83XDQb0WlTAXZqQaJxP67forIgvXB7Ah64vS5SbbXOsgDEcmwOvY7a4190/7xUlwFfuByYZs2kU7oFbXsTpj0lD8/xuzem7bsymuP2TSPCP0ht79ad7WLDdxRGDPCZ3U1J9pyebwK7YdvwyJV8pNqG2eb6D2pAoEb2nqsw9EIeIj6Z6EWKuQ/xON2WK983o4UyuCrQ6gsdFss6FvN7d/sH09N1uG6tgv1tRNXM/cuw5HHQ6SNFykP4B0mGdvEp+1hvvcg/Ww+ymZAeMozS+moPFQ/pgZJyWHgxzA==;
Received: from host-87-242-51-16.prtelecom.hu ([87.242.51.16]
	helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1d8j9F-00019y-EZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 May 2017 10:08:38 +0200
To: openembedded-devel@lists.openembedded.org
From: Boszormenyi Zoltan <zboszor@pr.hu>
Message-ID: <2fe15965-3372-3e2e-1d77-3c46ea397527@pr.hu>
Date: Thu, 11 May 2017 10:08:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
X-Spam-Score: 3.5 (+++)
X-Spam-Report: Spam detection software, running on the system "prspamd3.pr.hu",
	has NOT identified this incoming email as spam.  The original
	message has been attached to this so you can view it or label
	similar future email.  If you have any questions, see
	the administrator of that system for details.
	Content preview:  Hi,
	the cairo recipe exposes PACKAGECONFIG[egl] and PACKAGECONFIG[glesv2].
	I tried to enable them for genericx86-64 and a build error occors
	because
	now mesa is a dependency of cairo but mesa doesn't contain
	BBCLASSEXTEND="native". [...] 
	Content analysis details:   (3.5 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-0.2 ALL_TRUSTED Passed through trusted hosts only via SMTP
	3.5 BAYES_99               BODY: Bayes spam probability is 99 to 100%
	[score: 1.0000]
	0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
	[score: 1.0000]
X-Scan-Signature: 590f427944e86919b339bef1bc8dcd47
X-Spam-Tracer: backend.mail.pr.hu 3.5 20170511080838Z
Subject: Cairo egl / glesv2 PACKAGECONFIG dependency hell
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
X-List-Received-Date: Thu, 11 May 2017 08:29:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

the cairo recipe exposes PACKAGECONFIG[egl] and PACKAGECONFIG[glesv2].

I tried to enable them for genericx86-64 and a build error occors
because now mesa is a dependency of cairo but mesa doesn't contain
BBCLASSEXTEND="native".

This applies to Morty and the morty branch of meta-backports.

Please fix it either way: remove PACKAGECONFIG[egl] from cairo
or add native build to mesa.

If you go the second route, then all the dependencies of mesa also
need the same BBCLASSEXTEND="native" treatment. Maybe better adding
it to xorg-proto.inc and xorg-lib-common.inc is better. Then the LLVM
recipe, possibly not a nice fallout.

Maybe it's easier to just remove PACKAGECONFIG[egl] and
PACKAGECONFIG[glesv2] from cairo.

Best regards,
Zoltan Boszormenyi

