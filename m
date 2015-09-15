Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 417 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Sep 2015 10:20:13 UTC
Received: from atl4mhfb03.myregisteredsite.com
	(atl4mhfb03.myregisteredsite.com [209.17.115.61])
	by mail.openembedded.org (Postfix) with ESMTP id AE52C6E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 10:20:13 +0000 (UTC)
Received: from atl4mhob17.myregisteredsite.com
	(atl4mhob17.myregisteredsite.com [209.17.115.110])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t8FADI3U029425 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 06:13:18 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob17.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t8FADFaD032424 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 06:13:15 -0400
Received: (qmail 3958 invoked by uid 0); 15 Sep 2015 10:13:15 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO ?192.168.80.121?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 15 Sep 2015 10:13:15 -0000
To: openembedded-devel@lists.openembedded.org
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <55F7EF3A.7020403@topic.nl>
Date: Tue, 15 Sep 2015 12:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
Subject: gnome-icon-theme?
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
X-List-Received-Date: Tue, 15 Sep 2015 10:20:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

With current master I get errors like this:

ERROR: Nothing PROVIDES 'gnome-icon-theme' (but 
.../meta-oe/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb DEPENDS on or 
otherwise requires it). Close matches:
   rodent-icon-theme
   gnome-themes
   sato-icon-theme
ERROR: Required build target 'evince' has no buildable providers.
Missing or unbuildable dependency chain was: ['evince', 'gnome-icon-theme']

And similar for quite a few other recipes. Surprisingly, I cannot find any 
recipe that provides it in meta-oe.

Was it moved to another layer maybe? I can't find any mention of 
gnome-icon-theme for the past few months in the log either.

