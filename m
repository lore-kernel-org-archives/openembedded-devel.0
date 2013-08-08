Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 60169608BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2013 05:48:49 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf1so145412pab.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2013 22:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=ziiN9IOjtisVCAjp+DEgaUS8Ii7N6UrWGGAZI9U3MiQ=;
	b=Jt+5txZ/OOcOnYRIUOnxPhhN8NBcXlZoDcja+CqjqSMJy4lyo7YtbgQU0hIW3A3LZX
	17vPsFyKHZuMpq8dv6idDxtmr2lEkEGX7i2aqVj28xIsTvOoBByxVT+GxMjhb2Y9iIWN
	DQ452WoIbnGkxt4agLgPqg3iJL8n4fm7Tg6KYN3R/G3UXDl2CmR7x3DP99BEz2w/ghtU
	zT/tZKyJhOsBhd1GrnwfbJwkpACnl/2+hnn2DEtDXWpAwOoeZdF3vs2bLFAfJb+LaTns
	CZBycmfxp+/qry8CsKNGLwisogMhzxfGUgmPf9E590beMEaUCgiH8vaC43l80CFI4HpP
	pSbQ==
X-Received: by 10.68.211.138 with SMTP id nc10mr4178243pbc.162.1375940929820; 
	Wed, 07 Aug 2013 22:48:49 -0700 (PDT)
Received: from gourish-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ai6sm14310816pad.15.2013.08.07.22.48.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Aug 2013 22:48:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <BE65E360-0A4E-432B-9020-A3BCA9E05AF9@gmail.com>
Date: Wed, 7 Aug 2013 22:48:48 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
X-Mailer: Apple Mail (2.1508)
Subject: parsing errors with angstrom/meta-linaro
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
X-List-Received-Date: Thu, 08 Aug 2013 05:48:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi

Often I see this error when parsing angstrom-next, has anyone seen =
something similar or delved into the reason behind
it ?

NOTE: Started PRServer with DBfile: =
/builds1/angstrom/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 45141, PID: =
6728
Parsing recipes...ERROR: ExpansionError during parsing =
/builds1/angstrom/sources/meta-linaro/meta-aarch64/recipes-kernel/linux/li=
nux-linaro_git.bb: Failure expanding variable SRCPV, expression was =
${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: =
Fetcher failure: Fetch command failed with exit code 128, output:
fatal: read error: Connection reset by peer

ERROR: Command execution failed: Exited with 1

Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.



