Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 841 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Jan 2020 13:08:49 UTC
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
	[67.219.246.214])
	by mail.openembedded.org (Postfix) with ESMTP id 0856D6C108
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 13:08:49 +0000 (UTC)
Received: from [67.219.246.206] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-c.us-east-1.aws.symcld.net id 71/F2-04435-91ABD1E5;
	Tue, 14 Jan 2020 12:54:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsXi5LtOQFdyl2y
	cwapLHBZ7Py1itLh4eCmzA5PHzll32T3ObVzBGMAUxZqZl5RfkcCa8at/N0vBAaaKru0GDYzt
	TF2MnBxCAqsYJSYeFOli5AKyFzNKXJzzmg0kISzgLdH3+wpYEZuAnsTkS0+YQWwRgVCJe4ubW
	SCacyUevu0Csjk4eAWsJTZv4QEJswioSvRMncoOYosKhEusXn+WEcTmFRCUODnzCVgrp4CNxP
	ErK1lBbGYBC4mZ888zQtjiEreezGeCsOUlmrfOZoZYpSJxcOllsBoJoPimzWfZJzAKzEIydha
	SUbOQjJqFZNQCRpZVjKZJRZnpGSW5iZk5uoYGBrqGhka6ZroWJnqJVbrJeqXFuqmJxSW6hnqJ
	5cV6xZW5yTkpenmpJZsYgQGeUsAWsoPxy9e3eocYJTmYlER5r4VKxwnxJeWnVGYkFmfEF5Xmp
	BYfYpTh4FCS4A3dIRsnJFiUmp5akZaZA4w2mLQEB4+SCO8BkDRvcUFibnFmOkTqFKOilDhvEE
	hCACSRUZoH1waL8EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHn9QKbwZOaVwE1/BbSYCWg
	x12VJkMUliQgpqQYm4cT1ny+JPNbfalp4odo/+PLeNiaBK1qV24+Vl6f8mu/dfn1W4eXj24JO
	ebOG+E7RC2Pg0Xw5L+D9olXB/020cgPV0y+dLej23XteON6j/hl/rFBNTErkxid/5vkwJ73LO
	DU7fcch9/O7tLfJFeVoM4vuePdbVf1cyVv2bP21RrEbVhjdcVCKiLk4p5XVza9xyuxla9e+7/
	Y+e9RVP/fAe4uNxWor39g5rdAvqVhue25qu0NFSJH8/S0S515lzu+db/NLS/RwmWzh43XTzb6
	rMr1ms1ZIu7hjyZr3i9NlrlZ1dJ4/v3DCZRW5bWZ1pvV3Cp5O3a/9eZIKH4+c16FvfJ4zHCZJ
	ey3vMvbLVzytxFKckWioxVxUnAgAuy8c8WsDAAA=
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-29.tower-414.messagelabs.com!1579006488!86257!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16530 invoked from network); 14 Jan 2020 12:54:49 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-29.tower-414.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 14 Jan 2020 12:54:49 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 14 Jan 2020 06:54:47 -0600
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 14 Jan 2020 13:54:44 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-devel@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
References: <20191127162913.30498-1-arturo.buzarra@digi.com>
	<421e63c8-2c54-fe73-5917-fe68ffdefa74@digi.com>
Message-ID: <53fc113e-c3bd-99d0-b159-45bdeda6093b@digi.com>
Date: Tue, 14 Jan 2020 13:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <421e63c8-2c54-fe73-5917-fe68ffdefa74@digi.com>
X-Originating-IP: [10.101.2.54]
Subject: Re: [thud][PATCH] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jan 2020 13:08:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


On 04/12/2019 10:37, Javier Viguera wrote:
> Hi Armin,
> 
> Could you queue this fix for Thud?
> 
> Same fix is already merged in master and Zeus.
> 

Ping.

The patch appears as new in patchwork:

https://patchwork.openembedded.org/patch/167467/

-- 
Javier Viguera
Software Engineer

Digi International® Spain S.A.U.

