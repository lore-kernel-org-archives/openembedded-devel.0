Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8D65C77003
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 20:07:35 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so3480438igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=f8gNdBFFIiXm3dkQif0ROQQoIw39QdEu+2XrxepeUco=;
	b=gTmCdzZWdx+phHCHTWsSGEef0AVDZljlbwmcq+IddL/8km/P5PznKSn7VqAU7DDbEk
	Mx/iVOvicdYMOAfSvYdH9ePxi3RkLedcoyAuJL/hDBdWRaMqn6iMpYTGo7gUe4Lul27U
	QjEPAd84bYmYhJp22+/5g6IL/zxAATAo9DLOz4fOhyRBZrPV3ivaHCSBKxcMBjTpSJd2
	4cbswQ8iKTrznfTbxxteeFoC9jBQ5vyGw4DY3OUBVxQj4AvGgrOA4yBzNRLcHWgdT6me
	odAajJ/Hd3P3DT/U695QR1iytJJN8+Klt1yB63Q3xybbeUT+9L1q8NAeJKNC3fkqVps6
	x0mQ==
MIME-Version: 1.0
X-Received: by 10.50.111.113 with SMTP id ih17mr9399023igb.64.1442520455758;
	Thu, 17 Sep 2015 13:07:35 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Thu, 17 Sep 2015 13:07:35 -0700 (PDT)
Date: Thu, 17 Sep 2015 22:07:35 +0200
Message-ID: <CALbNGRQFrAp858jfOe33wspTGbpc+GJ65UTvR1f=SOGMSm82Ug@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: gnome-icon-theme in master-next
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
X-List-Received-Date: Thu, 17 Sep 2015 20:07:37 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

looked through meta-oe master-next a bit to see what patches are to
expect. I found:

commit b5aae54f9ad4aaff228fed64f8b5d992f451b2cd
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Tue Sep 8 11:24:19 2015 +0300

    gnome-icon-theme: add a recipe from oe-core

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

If I remember correct this should not land in master. We try hard to
replace it by Adwaita - right?

Andreas

