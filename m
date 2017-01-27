Return-Path: <jbriance@cisco.com>
X-Greylist: delayed 598 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Jan 2017 14:16:17 UTC
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	by mail.openembedded.org (Postfix) with ESMTP id 02AFC71CA3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 14:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1883; q=dns/txt; s=iport;
	t=1485526578; x=1486736178;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=D8JdwxptlHTtZCQ8M3p9+5P6wzXjE+2rR5XebXmTUIA=;
	b=FtngrmkV8GX05O1SM3kuxgdxVkGcOKrTEWk0XK9c6QHcfYgPRPqlChPn
	uFxVFkKHrxyLcIQd2RnQTNs6fCHWn4Y5ZwuDUyr7KgQtcQSa1WWdTw+hC
	qyc8VRWyrAlni+DDgzxFnMPoNuYpZzV25EtHJmjrtGNEyEqV6JD80+Zrg Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AUAQBlU4tY/5xdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBgzUBAQEBAR9hgQkHjVeSAZUvggwfC4V4AoIcPxgBAgEBAQEBAQF?=
	=?us-ascii?q?iHQuEaQEBAQQBOUsEAgEIEQQBAQEeCQcoChQJCAIEEwiJWQ6vPIprAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEBAQEBAQEBHYZLhG+KLgWbUQGGZoYDhQaCAo57iCWKWAEfOIFLFYZ?=
	=?us-ascii?q?0dYdzgQ0BAQE?=
X-IronPort-AV: E=Sophos;i="5.33,295,1477958400"; d="scan'208";a="376586371"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
	by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jan 2017 14:06:19 +0000
Received: from XCH-ALN-009.cisco.com (xch-aln-009.cisco.com [173.36.7.19])
	by rcdn-core-5.cisco.com (8.14.5/8.14.5) with ESMTP id v0RE6JMU027667
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 14:06:19 GMT
Received: from xch-aln-008.cisco.com (173.36.7.18) by XCH-ALN-009.cisco.com
	(173.36.7.19) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 27 Jan 2017 08:06:18 -0600
Received: from xch-aln-008.cisco.com ([173.36.7.18]) by XCH-ALN-008.cisco.com
	([173.36.7.18]) with mapi id 15.00.1210.000;
	Fri, 27 Jan 2017 08:06:18 -0600
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-browser][PATCH v2] chromium-wayland: update to
	53.0.2785.14
Thread-Index: AQHSeD9adOF8talF2kOdOX5PhDI3o6FMW4ow
Date: Fri, 27 Jan 2017 14:06:18 +0000
Message-ID: <a5a24703cc0a4dd6be923dac9cc6e129@XCH-ALN-008.cisco.com>
References: <1485356812-8436-1-git-send-email-jaragunde@igalia.com>
	<008601d27798$272e3640$758aa2c0$@neuf.fr>
	<8c7129f5-43e3-3b2d-f4e9-9dfbad7e6ebc@gmail.com>
In-Reply-To: <8c7129f5-43e3-3b2d-f4e9-9dfbad7e6ebc@gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.61.237.239]
MIME-Version: 1.0
Subject: Re: [meta-browser][PATCH v2] chromium-wayland: update to 53.0.2785.14
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
X-List-Received-Date: Fri, 27 Jan 2017 14:16:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: vendredi 27 janvier 2017 02:47
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-browser][PATCH v2] chromium-wayland: update to
> 53.0.2785.14
>=20
>=20
>=20
> On 1/25/17 9:50 PM, Herve Jourdain wrote:
> > Hi Jacob,
> >
> > I've been able to compile chromium-wayland 53.0.2785.14 on
> RaspberryPi, with Wayland only (no X11), BUT I had to add an additional
> patch for it to work, or else I get an error in
> ui/events/keycodes/keyboard_code_conversion_xkb.cc.
> > I'm using VC4, which has a DRM/KMS interface (it seems that DRM
> interface is required by ozone-wayland), but this patch seems to not be
> related to RaspberryPi itself.
> > Basically, it seems that USE_XKBCOMMON is not defined when compiling
> keycodes.
> >
> > Is it something that you saw as well? Or do you have a different
> setting/experience?
> >
> > Just for reference, here is the patch I need (right now, I'm
> triggering it from meta-raspberrypi, but I believe it may be needed in
> meta-browser).
> >
> > --- a/ui/events/keycodes/events_keycodes.gyp	2017-01-23
> 19:12:01.767271256 +0800
> > +++ b/ui/events/keycodes/events_keycodes.gyp	2017-01-23
> 19:12:11.503048216 +0800
> > @@ -21,6 +21,9 @@
> >          'scoped_xkb.h',
> >          'xkb_keysym.h',
> >        ],
> > +      'defines': [
> > +        'USE_XKBCOMMON',
>=20
> This seems fine to me. It should also be proposed upstream as well I
> think.
>=20

For the record, I've already tried to upstream a similar change (see Patch =
Set 1 of review https://codereview.chromium.org/2239833003/), but only the =
GN part has been accepted as gyp support has been removed in Chromium 54.

Julien

