Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKAkA-0002cQ-7K
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2012 17:55:02 +0200
Received: by wera1 with SMTP id a1so4146222wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2012 08:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=VfJdhMGvoHEKLx8sJJADi1oEJqwYpsUFHJ9yKAY/JUs=;
	b=Qrkc2d6qiJlSazzWjLbZdvEpe1MyXerT0Gvzz1HBfd3hPuKrHIGT/0Yd6+HGRZgZ61
	z7XkK34f0HJX77rD7C1AdHLHhshUBsXIypR3+0ovZ3tSLWCCAVoDrPGzMPUYiS2SX+yE
	gokWLzJawvBCdSB+K3Etsy6RoOw5mAcLE+mITfCx+3JhnSJtnAwAPlMoSCOMue3J/j5Y
	l8k96S5xw8FkZKrsro37uh4M3l+7ER3bjB6+52a3zIsdd3UHR5xW9ExsbaiVX5O0Wq+Q
	IdHaU7ZeRSPK1r73sfWbEZVwDPnQQewgeg8BvwvSoZ6OY3NlMzrQmFPcdBwZLQH2Fc2J
	9mcw==
Received: by 10.180.81.198 with SMTP id c6mr29453034wiy.18.1334677536158;
	Tue, 17 Apr 2012 08:45:36 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm27676667wib.6.2012.04.17.08.45.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 08:45:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120417153919.GG3665@jama.jama.net>
Date: Tue, 17 Apr 2012 17:45:33 +0200
Message-Id: <E06E57AF-94D1-42DF-9435-ECE3DAC0DBC4@dominion.thruhere.net>
References: <4F8D8AB7.7000002@opendreambox.org>
	<20120417153919.GG3665@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmzPukCjRQWJ8kyZyUvRYdlpFm7OS9kCrbp8feWc/ZvOtm2i6aM7FfpV/NcXFDmbu7PS01r
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] waning "it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2012 15:55:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 17 apr. 2012, om 17:39 heeft Martin Jansa het volgende geschreven:

> On Tue, Apr 17, 2012 at 05:22:31PM +0200, Andreas Oberritter wrote:
>> Hi,
>>=20
>> the following warnings keep appearing on every fresh invocation of
>> bitbake since a few months, I think:
>>=20
>> WARNING: .../meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb: it is =
recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>> WARNING: .../meta-oe/recipes-connectivity/gateone/gateone_git.bb: it =
is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd

The above 2 only have systemd support, so the WARNING is completely =
bogus and should be silenced.=


