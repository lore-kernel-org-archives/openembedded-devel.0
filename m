Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1URoSu-00036e-Lm
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 20:49:21 +0200
Received: by mail-da0-f53.google.com with SMTP id n34so2174764dal.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 11:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=umBo4C+54o10+Upro3c1qQDs78+OAsywlLeMiQHomSM=;
	b=s5nGXXLPFWCRntDFo9IMipV07qCsBZbd3L5/ljfOSZq8S/hqsZxSJi5qkZKCCfE/Dw
	eeGbTmndLTjS1L8T/wc0RgdugMgUkzTQkr9XOTc5tGpxnx8RgZ7afBEQSTtwwMIE1w8j
	ve3Q/BtL1g7a0P24P7y5WbmpkVkzZMfqIM/pM3/vg0wiDvTMv5r9XKurruHKIIG1/W9k
	YhzaD/l7Dmh1q7SIHYO9zg3oBJHbyaQaU2bqWnc0EtZljbMVQSoH6/srqQgfDYb0o10g
	6iJ9n+78C47ms0GFqGh/OTKR5BpEcurmYlvTZIEOfjwtexKUAxb2hvB6cNv3/OelLHN9
	3qhg==
X-Received: by 10.68.247.228 with SMTP id yh4mr30263355pbc.60.1366050710663;
	Mon, 15 Apr 2013 11:31:50 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPS id
	rt13sm22971921pac.14.2013.04.15.11.31.49
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 11:31:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130415141353.GD10628@jama.dyndns-home.com>
Date: Mon, 15 Apr 2013 11:31:49 -0700
Message-Id: <DE4CF41E-2C86-4573-9BE1-43F50E16DBA7@gmail.com>
References: <1366033969-21963-1-git-send-email-raj.khem@gmail.com>
	<20130415141353.GD10628@jama.dyndns-home.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [meta-systemd][PATCH] ntp: Create a separate package for sntp
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
X-List-Received-Date: Mon, 15 Apr 2013 18:49:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 15, 2013, at 7:13 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

>> 4 files changed, 22 insertions(+), 2 deletions(-)
>> create mode 100644 =
meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp
>> create mode 100644 =
meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp.service
>=20
> It shouldn't create new .bbappends in meta-systemd.


ah yes forgot that those changes merged in. I will send another one.=


