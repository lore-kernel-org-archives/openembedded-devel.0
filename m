Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 393 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Aug 2016 13:51:13 UTC
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.176])
	by mail.openembedded.org (Postfix) with ESMTP id AB22D731DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 13:51:13 +0000 (UTC)
Received: from [85.158.137.67] by server-16.bemta-3.messagelabs.com id
	4B/04-29579-7CBB5B75; Thu, 18 Aug 2016 13:44:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRWlGSWpSXmKPExsVyU6Zrou6R3Vv
	DDZbfl7C4eHgpswOjx7mNKxgDGKNYM/OS8isSWDPWPXzLWNDMVDFrxmW2BsZLjF2MXBxCApsY
	JS59OQfl7GWU+LRgIksXIycHm4CZxK5X69hBbBGBGIml58+zgdjCAjoSJ79sYIKIG0pM//ecB
	cLWk5j6azkjiM0ioCqx8tcWsBpeAVeJSfvvgc1hFJCV+NK4mhnEZhYQl7j1ZD5YjYSAgMSSPe
	eZIWxRiZeP/7FC2AYSW5fuY4GwFSR+9J6CqrGW+PfgLhPEHB2JBbs/sUHY2hLLFr5mhtgrKHF
	y5hOWCYzCs5Csm4WkZRaSlllIWhYwsqxiVC9OLSpLLdI10UsqykzPKMlNzMzRNTQw1stNLS5O
	TE/NSUwq1kvOz93ECAx/BiDYwdj4xekQoyQHk5IorxXf1nAhvqT8lMqMxOKM+KLSnNTiQ4wyH
	BxKErwXdgHlBItS01Mr0jJzgJEIk5bg4FES4Z0PkuYtLkjMLc5Mh0idYtTlWPDj9lomIZa8/L
	xUKXHegyBFAiBFGaV5cCNgSeESo6yUMC8j0FFCPAWpRbmZJajyrxjFORiVhHkPgUzhycwrgdv
	0CugIJqAjePm3gBxRkoiQkmpgzFO3LM55qRDe+qDsZujRpIMGL6omPD112O3WdMbWpZVSqVPO
	Wvu/rOSw+Hr/7eHZks9v1BZ/Wxdv8n4jw70TLT+zoxptmQ+ILXA8IyLme8gmveCIfyOz+8znL
	I1eS2sMnn9Qm51sXn317LRD5z13b3bctdPvXedDu41/jGcmcK212l3Ny5HgqcRSnJFoqMVcVJ
	wIADgUrhkFAwAA
X-Env-Sender: andrew.goodbody@cambrionix.com
X-Msg-Ref: server-14.tower-139.messagelabs.com!1471527875!32574648!2
X-Originating-IP: [217.28.138.145]
X-StarScan-Received: 
X-StarScan-Version: 8.84; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21999 invoked from network); 18 Aug 2016 13:44:36 -0000
Received: from smtp.hs20.net (HELO outlook.hs20.net) (217.28.138.145)
	by server-14.tower-139.messagelabs.com with AES256-SHA256 encrypted
	SMTP; 18 Aug 2016 13:44:36 -0000
Received: from SEHSTE15D2BE2.hs20.net (172.18.251.29) by
	SEHSTE15D2BE4.hs20.net (172.18.251.31) with Microsoft SMTP Server (TLS)
	id 15.0.1178.4; Thu, 18 Aug 2016 14:44:35 +0100
Received: from SEHSTE15D2BE2.hs20.net ([fe80::84cd:cdd2:84c4:a64a]) by
	SEHSTE15D2BE2.hs20.net ([fe80::84cd:cdd2:84c4:a64a%21]) with mapi id
	15.00.1178.000; Thu, 18 Aug 2016 14:44:35 +0100
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Build of u-boot with gold is broken
Thread-Index: AdH5VjLhAuTAF19QS3yoE/njm4xwfA==
Date: Thu, 18 Aug 2016 13:44:34 +0000
Message-ID: <b1622999964348e68e651f38dca42d59@SEHSTE15D2BE2.hs20.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [46.17.166.30]
x-exclaimer-md-config: 266e7a57-cddd-49fd-bdea-19bca6d40303
MIME-Version: 1.0
Subject: Build of u-boot with gold is broken
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
X-List-Received-Date: Thu, 18 Aug 2016 13:51:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

It looks like the recent change to meta/recipes-bsp/u-boot/u-boot.inc to en=
able out of tree builds for u-boot does not work with gold.
The sed at line 70 fails as it is being executed in an empty build director=
y and so there is no config.mk.

Andrew

