Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id A6991723EE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 05:50:03 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id u10so5011230lbd.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2014 21:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=gF21LgjVlg1K1UASWsJqiNWjc532ewUVDoGQNYrYimI=;
	b=iaZkLt2k5rma/oLkoFcJJ7KKy0IR3zj2giY1HMIQHmaBKvcKWSDeyLELX15F5T8Cfd
	bA+ZfV1Tt/LYRfgif/TyVRCvJOd1KfW1HgFzgawY6H/TSDV8IGDZ4nmeSp0L7FLenso2
	w46NuHifSCme6Ok2Ff3R8tbG4WnB/RHY07GL7vEz8bK0IjGZc/JsVO/baq+O2Vx16vzZ
	h9GUqsGn19U3vWTjeibJWf2d+R/rwLxoa2mHWYZTgBL7vNc0B0/O5IZTmXTw8aHyV8J5
	2qeJF96ng1FeLuDsvKHwccHzyHBgiIzsCMSp6pFVZTXAGn4FgEZYs8RA+n0kLrgQdqAI
	8WQg==
X-Gm-Message-State: ALoCoQlofFQ3gnMNXePgR8/eGAcBw0/88on4SU/K5F4LHN/WREcVwP8biNh8t5BA7SDa425rzGLW
X-Received: by 10.153.5.33 with SMTP id cj1mr20395744lad.65.1418104202828;
	Mon, 08 Dec 2014 21:50:02 -0800 (PST)
Received: from ad.chargestorm.se (c-83-233-19-145.cust.bredband2.com.
	[83.233.19.145])
	by mx.google.com with ESMTPSA id i6sm73827lag.0.2014.12.08.21.50.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Dec 2014 21:50:01 -0800 (PST)
Date: Tue, 9 Dec 2014 06:49:17 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209054917.GA8454@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Denys Dmytriyenko <denys@ti.com>
References: <1415923119-4861-1-git-send-email-denis@denix.org>
	<20141124194823.GB25432@denix.org>
	<20141208232817.GG13319@denix.org>
MIME-Version: 1.0
In-Reply-To: <20141208232817.GG13319@denix.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH 1/2] nativesdk-qtbase.inc: avoid removing directories, namely /usr/lib itself
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
X-List-Received-Date: Tue, 09 Dec 2014 05:50:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Denys Dmytriyenko <denis@denix.org> [141209 01:31]:
> On Mon, Nov 24, 2014 at 02:48:23PM -0500, Denys Dmytriyenko wrote:
> > On Thu, Nov 13, 2014 at 06:58:38PM -0500, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > > -    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and \
> > > +    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and -not -type d \

Shouldn't there be an additional -and in here at the end of the line?

Cheers,
Anders

> > >                                     -not -name 'libQt5Core.so*' -and \
> > >                                     ${QTLIBSPRESERVE} \
> > >                                     -not -name 'libQt5Bootstrap.a' \
-- 
Anders Darander
ChargeStorm AB / eStorm AB

