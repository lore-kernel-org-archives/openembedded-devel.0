Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E477C609B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 13:48:20 +0000 (UTC)
Received: by wgfl8 with SMTP id l8so86337600wgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 06:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=AzKmY3/VZy8MaSPOxpK3XM+P29e2GlP+n+3g0u0d7IQ=;
	b=OHQ8zjGN4Z+sc5YDGsUI7LLCPqVAK+JqqeSwVFoHiD8ws8NsLwOxht0JAcsOCHFuDG
	QnXgmTS7+7s4NeK3gxeBilY6Zi5Dy0CGQTKEIPlWipusIXwnBtEZHsqDCFWZzctbdzTe
	n06TG4HK3vBw9qCwbIg5QSjDvu5R6K9N8znW2jixO/Duafs6hkDXHX4XP19uBO6fp4/1
	AXm5vh1hjrE4sI9jOKvwYqeaoaHMlJBodn3D4lvpsrlNBoDbzRcZF4PRiUBMkGWZ/UVI
	d1taB/y9Q44boa+hRVq7a5Zc3h0eMfgn1HhaNq3DmpG77kOjyHFNOUTtTgdM1vXCJdJT
	cAKQ==
X-Received: by 10.180.208.7 with SMTP id ma7mr7269580wic.0.1432216100923;
	Thu, 21 May 2015 06:48:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id ng5sm2724163wic.24.2015.05.21.06.48.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 May 2015 06:48:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 May 2015 15:48:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150521134835.GF2377@jama>
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20150521110638.GB2377@jama> <555DDEB7.7040909@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <555DDEB7.7040909@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 0/4] Add GStreamer 0.10 and things that depend on it from oe-core
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
X-List-Received-Date: Thu, 21 May 2015 13:48:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2015 at 04:33:43PM +0300, Alexander Kanavin wrote:
> On 05/21/2015 02:06 PM, Martin Jansa wrote:
> > On Mon, May 18, 2015 at 05:12:44PM +0300, Alexander Kanavin wrote:
> >> These patches add GStreamer 0.10, and things that depend on it from oe=
-core
> >>
> >> GStreamer 0.10 is now being removed from oe-core, but we would still l=
ike to
> >> provide it through meta-openembedded.
> >>
> >> See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6294
> > How was this tested? Are you just throwing recipes unwanted in oe-core
> > to meta-oe without testing?
> >
> > ERROR: ParseError at
> > /OE/build/shr-core/meta-openembedded/meta-multimedia/recipes-multimedia=
/gstreamer/gst-plugins.inc:17:
> > Could not include required file gst-plugins-package.inc
> >
>=20
> My bad, it wasn't. The missing file is shared between gstreamer 1.0 and=
=20
> 0.10 recipes, so it has to be copied over. I'll send updated patches.

No you don't need to copy it, just use path to it, I've already fixed
it for my jenkins builds, you don't need to resend just because of
this..

meta-multimedia/recipes-multimedia/gstreamer/gst-plugins.inc:require recipe=
s-multimedia/gstreamer/gst-plugins-package.inc


>=20
> Alex
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

