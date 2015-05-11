Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id A70D860043
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:24:47 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t4BJOk7b024768 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 14:24:48 -0500
Received: from us-aus-mail3.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015051114160700-1260689 ;
	Mon, 11 May 2015 14:16:07 -0500 
In-Reply-To: <CAMKF1sr+DV-sA23dwzhAocJiACp=1+WNk8VWh3eGreDQ1Xh25A@mail.gmail.com>
References: <1431112486-23487-1-git-send-email-haris.okanovic@ni.com>
	<CAMKF1sr+DV-sA23dwzhAocJiACp=1+WNk8VWh3eGreDQ1Xh25A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: A1E75F3A:8D299EDB-86257E42:0069B047;
	type=4; flags=0; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP3 November 16, 2012
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <OFA1E75F3A.8D299EDB-ON86257E42.0069B047-86257E42.0069D8F9@ni.com>
Date: Mon, 11 May 2015 14:16:06 -0500
X-MIMETrack: Serialize by Router on US-AUS-MAIL3/AUS/M/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/11/2015 02:16:07 PM,
	Serialize complete at 05/11/2015 02:16:07 PM,
	Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/11/2015 02:16:07 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/11/2015 02:24:48 PM,
	Serialize complete at 05/11/2015 02:24:48 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-11_04:, , signatures=0
Subject: Re: [PATCH] dpkg start-stop-daemon: Fix RCONFLICTS typo
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
X-List-Received-Date: Mon, 11 May 2015 19:24:50 -0000
Content-Type: text/plain; charset="US-ASCII"

> It is blacklisted so how did you test it.

I tested Dizzy, which doesn't include Martin Jansa's blacklist change 
(a76a8cb6),
and verified `Conflicts: dpkg` got added to the ipk control file for 
qemux86.


> [If] it's working fine then may be
> you should white list it too

I don't fully understand the problem Martin worked around, so I'm hesitant 
about
undoing his change right now. I'll have to take a closer look at this at 
some point,
if no one else does, because NI will eventually upgrade from Dizzy and we 
would
like to keep using dpkg start-stop-daemon.


Regards,
Haris


