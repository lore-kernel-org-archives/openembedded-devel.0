Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8F30D6BDE5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 21:54:33 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id y10so2344414pdj.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 14:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=IG5UR3XOqXNrl7+Jxv5olukG1sOPraSuEpUhLBGpwKw=;
	b=CKyySvkzdPrzW0cvwxZWVTCREdYGMfoqlZc4LkyvALo8s+poO6FI/C8nZf82Q9syWz
	S2T15a3UyW29qsMB2yKQAheYygxUotFWfywNnp0y85Nbh2bLn+Xd8E27+Zug24AkabXj
	EAzqlZMoobWflpxfBHEKSsytA1vtdBEzSUows+uULXBVFuyk06nGz9w++TqDY89WDR7x
	UgHjIfedNjjh7PiDphHPdZq7lWFFhXVxFIy1IemQJLm+PzI6jsNgnsTBkyhOloxgKdMi
	kdwL2NrewwcEQJ9yZ4CpA3d+nDldEM5vV23PArl68cTHHnOkR8kDV+k14eCIZjFT0qYX
	p+sg==
X-Received: by 10.66.162.136 with SMTP id ya8mr12857053pab.110.1377899674216; 
	Fri, 30 Aug 2013 14:54:34 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id tg7sm29414pbc.36.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 30 Aug 2013 14:54:33 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Sat, 31 Aug 2013 01:54:26 +0400
Message-Id: <D43CA667-1051-4FBC-8E12-D140F94AFAFC@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
X-Mailer: Apple Mail (2.1498)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Adding support for additional qemu machine configurations
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
X-List-Received-Date: Fri, 30 Aug 2013 21:54:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
     I'd like to put forward a proposal for adding support for =
additional qemu machine configurations, either by way of creating a new =
meta-qemu layer, or adding additional machine configurations to the =
oe-core, targetting a future release (say 1.6 or 1.7).

Proposed qemu machine configurations, not currently included in oe-core, =
are as follows:

- qemuarmv7 (useful for emulating TI OMAP 3 based platforms)
- qemuarma9 (useful for emulating TI OMAP 4 and Freescale i.MX6 =
platforms)
- qemuarmv8 (for AArch64 platforms)
- qemumips64

As a first step, I can contribute support for qemuarmv7, qemuarma9 and =
qemuarmv8.

Thanks and do let me know your thoughts on this.

Best regards,

Elvis Dowson=

