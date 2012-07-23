Received: from ams-iport-3.cisco.com ([144.254.224.146])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1StESq-0005r5-Io
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 10:58:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=619; q=dns/txt;
	s=iport; t=1343033200; x=1344242800;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=H1O33vLiUGSwsnbfOVLrMjoL6rmSFYowDGv6qWaE9oo=;
	b=Y2H/MqjRlbOEgSUqbgF1ieXs+uEtUwkZ3HUGQyxqo6+pF4isE28OR26z
	zgxuVfYslJqnWxB/HgKz0fxVQerMSypTHomf95qMZF9SklDt2beW1S99y
	xghnEZUdGJJuY8sPhmQ6M6pHVE5R4oUwGu5rtVvbEDPiBCDqiyL2SXZuw w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av0EAAkODVCQ/khM/2dsb2JhbABEuTWBB4I5AYEiNAJZCAEBHodrnR2BKJ8UjwSDHAOVSYVbiEyBZoJh
X-IronPort-AV: E=Sophos;i="4.77,638,1336348800"; 
   d="scan'208";a="6823140"
Received: from ams-core-3.cisco.com ([144.254.72.76])
	by ams-iport-3.cisco.com with ESMTP; 23 Jul 2012 08:46:37 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id q6N8kbNs031808
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2012 08:46:37 GMT
Message-ID: <500D0F6D.70001@cisco.com>
Date: Mon, 23 Jul 2012 10:46:37 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120628 Thunderbird/10.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Moving pkg.m4 to the x86 sysroot instead of arm sysroot in toolchain
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
X-List-Received-Date: Mon, 23 Jul 2012 08:58:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi.

When building meta-toolchain, pkg.m4 is put in the arm sysroot of the
toolchain, instead of the x86 sysroot where it belongs. pkg-config is in
the x86 directory, and when it is in the arm directory, we need to hack
the aclocal flags to point to it for stuff to compile.

I have tried a few things, like adding pkgconfig-nativesdk to the
task-sdk-host-nativesdk and pkgconfig to task-core-standalone-sdk. From
my understanding, the former should populate the x86 directory, but
obviously it didn't. Any ideas to what I can do to fix this? It would be
greatly appreciated.

Best regard
Martin Ertsaas


