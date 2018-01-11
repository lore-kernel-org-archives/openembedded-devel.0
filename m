Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 1845 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jan 2018 14:38:32 UTC
Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
	by mail.openembedded.org (Postfix) with ESMTP id 102BA78262
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jan 2018 14:38:32 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1eZdWG-0007Fs-3c
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jan 2018 15:07:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=udHq8TEciqmBoT1I94KDNeHX5azd+n88ByGFF0S4OPY=;
	b=HHRRkadF7UPQCVvjCaOWT20JSl
	n4EWvmmNCqDiZbcAZC46oEImFZ+ZAkX/QTO2ffhN2czU3P+JVlt9z2bJOHMNOTPO3pZf+CFFV9i3W
	hiq1/A8DUywaB6ICvelNpGpas6v6Bjd0EPS5o7z9BYRstPX9tb/9SDth9MJxqMhXaqYo20X3CbU69
	ennPvgUGtXMfP+pXAVoi0NDiO+7k/2AWt4u4N9BbddTYT5XQ1OyJqpbgPCqljmsEskKovdHjqnXMQ
	5bsPBSldmThZPGCto0rgtmx8yN9SYH8Dw5TJtsGcyAqn5yQyLZIwr6t7mrkKRp8Sa1c97Vqeb7fbV
	eJW4eYvg==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>) id 1eZdWC-0002Es-0y
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jan 2018 15:07:46 +0100
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <9f004ada-4627-0a82-cb3f-7ee9e38791b7@pr.hu>
Date: Thu, 11 Jan 2018 15:07:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report-Back: Spamchecker on "prspamd4.pr.hu" has DOESN'T believe this
	is spam.
	pts rule name              description  (score: __SCORE__ points)
	---- ----------------------
	--------------------------------------------------
	-0.2 ALL_TRUSTED Passed through trusted hosts only via SMTP
	3.5 BAYES_99               BODY: Bayes spam probability is 99 to 100%
	[score: 1.0000]
	0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
	[score: 1.0000]
	-1.2 AWL AWL: Adjusted score from AWL reputation of From: address
	Preview: Hi, I have been using Yocto since 1.6 and I have found a bug
	in the automatic recording in the shlib dependencies. The problem is
	that shlib dependencies are not recorded with PE+PV. [...]
X-Scan-Signature: bac636d383641ecc82643dbc9c1f3bb5
X-Spam-Tracer: backend.mail.pr.hu 2.3 20180111140746Z
Subject: RFC: Record PE for shlib dependencies
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
X-List-Received-Date: Thu, 11 Jan 2018 14:38:33 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

I have been using Yocto since 1.6 and I have found a bug
in the automatic recording in the shlib dependencies.

The problem is that shlib dependencies are not recorded with PE+PV.

My use case was that I forked Angstrom into a custom distro layer
which at the time was based on Yocto 1.6.

Although I built the OS for x86-64, it was using libc6_linaro-2.19
from EGLIBC.

Now, as the time has passed, we had to add localization to the
systems and the old EGLIBC 2.19 was not good enough.

So, I have switched to Yocto 2.2 and rebased my custom layer on it.

You can already see my problem: linaro-2.19 > 2.24.

The obvious step was to add PE = "1" in a bbappend file for GLIBC.

This made the libc6 package upgradable, but the (>= 1:2.24) dependency
was not encoded in dependant packages, only (>= 2.24), which was
satisfied by linaro-2.19.

Because of this, many times a larger opkg upgrade was cut in the
middle because a post-install scriptlet died when it ran a newly
installed binary that needed the new libc6 and it crashed.

So, upgrades must have been carefully scripted in this and similar cases.

I have started moving to Yocto 2.4 about a week ago and I found
that this bug still exists.

Since my itch was too big now, I have proverbially scratched it.
I have created a PR against Rocko here:
https://github.com/openembedded/openembedded-core/pull/28/files

Please comment whether it's the right approach.

But it has already survived a large-ish bitbake session with
about 2000 runqueue tasks and all the right (>= PE:PV) are there
for shlib dependencies where the dependency has a PE value set.

Best regards,
Zoltán Böszörményi

