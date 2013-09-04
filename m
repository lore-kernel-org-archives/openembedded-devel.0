Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id E4F7A6BAAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 19:41:29 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id p10so761979pdj.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=XylbAgBqR2iu4/WkhSijzJF6tAFslPt+j+QQptjf+hA=;
	b=ZT5F5nJCEiWR7yO9Gx8c8E6/nn1UR1wSfTNLpEHFL0NQDFOHNmHL0fgq2yww6OUv7Y
	JIum7ZOfRvSjlZ6HCJRiwfL0EcVqA1UquSx+OeZv52nB2e6HwlUq0yTfiEOlRxcMQpuP
	Y0JZ+8WzrQdHsOy2QQt4sT0aqNc3MEy4qGAyuhztVlGhoxNkIK0lvRvjIgDrt//LoyAH
	1kb2J/jaJVMi0pqDPBbA/H4ijBOuFC/SHQv3TV3HZI8ZcXq0ILr6XgAaRgp2BZGwkQCX
	MKpsDqELu0MhEkthd7kWRMEZplpOczM2Zp1ijIymMrGWTU4Pvy7p2Zd/kupDsxypHrvk
	ORVA==
X-Received: by 10.66.124.168 with SMTP id mj8mr5003864pab.183.1378323691709;
	Wed, 04 Sep 2013 12:41:31 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	kd1sm32616312pab.20.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 12:41:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <16E29A58-2D18-42F9-9A52-C27BB0A9FE3E@gmail.com>
Date: Wed, 4 Sep 2013 12:42:03 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
X-Mailer: Apple Mail (2.1508)
Subject: mercurial fetch issues
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
X-List-Received-Date: Wed, 04 Sep 2013 19:41:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi

I am seeing something like below with dylan branch

WARNING: Failed to fetch URL =
hg://vim.googlecode.com/hg/;protocol=3Dhttps;module=3Dvim, attempting =
MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 255, output:
warning: vim.googlecode.com certificate with fingerprint =
ca:2d:b2:a7:41:f5:00:83:e7:66:57:bf:6f:be:57:a7:56:92:c0:4f not verified =
(check hostfingerprints or web.cacerts config setting)
abort: HTTP Error 404: Not Found

ERROR: Function failed: Fetcher failure for URL: =
'hg://vim.googlecode.com/hg/;protocol=3Dhttps;module=3Dvim'. Unable to =
fetch URL from any source.


I do not have mercurial installed locally on system its using the one =
built with mercurial native recipe, once I install mercurial on system =
then the certificate warnings disappear however the HTTP Error 404: Not =
Found error still remains

anyone seeing this too ?

Thanks
-Khem


