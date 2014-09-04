Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id EC726713EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 14:12:23 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id i50so10177696qgf.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 07:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=P1XJ1I7iH/XMKYO1dJTV79mzg30uKRynLop3BcZrOwA=;
	b=c9h16rfLAEPbqHCBzQuqDQb57IBgTg9OUBMmqgFE4w+zXVfNa2+NazH9oyk8kHWXjq
	yzOJUwOhwyREoEm6wGQADrLIdCPdIg9dXfAHUZ/laG785w5xrmS5JaSUhWcZii7P5hgE
	aYwdKcxPxXA9dQcDJA2LRhI14cDRfnMjBxSddicAFcpLKWKq53lpr4q2vRDCpQBddHbs
	V9pTe4Izg2WJxyRO/jdiKouSXzFi1hxvENfWAsD4G461lFaDkEVIh0n5f8oobybx7vXU
	JTyzYE2BICn1SDc7+GGYJqUql1i1ity4IK5bge5FWNQfW4m7haZoosR+iXzWY6EPSKd1
	QNpg==
X-Gm-Message-State: ALoCoQlR26iys0y6pmI8AbeqxjC+S79spPxD8yqNa1XhXftjPdgWI7SsrWrgnJ/c4kAW3HYkysSe
X-Received: by 10.140.94.234 with SMTP id g97mr7044324qge.77.1409839943907;
	Thu, 04 Sep 2014 07:12:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 07:12:02 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 15:12:02 +0100
Message-ID: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 14:12:28 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Quick question of style for the community to bikeshed on:  in the
general case should recipes be split into foo_1.2.bb and foo.inc, or
should they only split to bb/inc if there are multiple versions and
generally there should just be foo_1.2.bb.

Specifically I'm looking at the libunwind patch for oe-core (moving
from meta-oe) which adds libunwind_1.1.bb and libunwind.inc.
Personally I feel that splitting them up complicates packaging and
should only be done if there's actually multiple versions being used.

Ross

