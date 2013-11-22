Return-Path: <andre.draszik@linaro.org>
Received: from mail-bk0-f49.google.com (mail-bk0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id AB0D46CEEA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2013 08:40:52 +0000 (UTC)
Received: by mail-bk0-f49.google.com with SMTP id my13so678239bkb.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2013 00:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:content-type:mime-version:content-transfer-encoding;
	bh=OW/Pc5RFEXfRLq3hTBE1xoekUXsFkt7fhE5Uze4FEjw=;
	b=DOOk2j4QYov8IOzQrRKeGRoJ5DSDNjzShSzCC0e57ty+JmWk300ujvqvCShEHb+jps
	uOlzY7Fx50GYfZKsm101Mt+DCAf7A9cBVwMg7zTtCv6pNebP5rzbnboqcTHE+3bIacS+
	oYlkDQJkEc/ZGgw2P66nBo53dxBhMlCNDPW34OGuB3P50nWm95DviChT2OgCh9VVYKP1
	rDVl8HjI4QCXEMyZVOhdPotqyU0iixh2hSc7cm6JglR+jvP7AqyLPkr6BLtoSzxdjBBZ
	Xwz9+jZorssbKDR+VQ9bVZX5C+BdKl3CjFR2xmufNH3J/JENPRUdI8kdZDRZQV7rVpF0
	2UAw==
X-Gm-Message-State: ALoCoQkqNel9rJh0YE3NMW8sGmiy1oZeZmGEHzdpF6C2FLulF82s4dP44hmy+lJ28gL8oku2sr7m
X-Received: by 10.204.111.200 with SMTP id t8mr584258bkp.43.1385109651829;
	Fri, 22 Nov 2013 00:40:51 -0800 (PST)
Received: from [10.65.4.44] (sushi.andred.org. [85.214.105.253])
	by mx.google.com with ESMTPSA id j13sm16325087bky.0.2013.11.22.00.40.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 22 Nov 2013 00:40:51 -0800 (PST)
Message-ID: <1385109648.23183.38.camel@bril0118.bri.st.com>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Nov 2013 08:40:48 +0000
In-Reply-To: <20131121173050.GA3708@jama>
References: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
	<20131121123904.GX3708@jama>
	<CAP71WjxW7KZp3D+gTEGV2ZzDfwPhwxqLUP5qw4Rj4XN_z1=cQA@mail.gmail.com>
	<20131121173050.GA3708@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: making qt5 package machine specific
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
X-List-Received-Date: Fri, 22 Nov 2013 08:40:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Martin,

On Thu, 2013-11-21 at 18:30 +0100, Martin Jansa wrote:
> Ah one more comment.
> 
> qmake5_base.bbclass doesn't look like best place for it.
> 
> I guess you have only target qtbase being MACHINE_ARCH, right?

Everything that was built using the previously configured qtbase, e.g.
qtwebkit - see below.

> qmake5_base.bbclass can be inherited by many packages which are
> TUNE_PKGARCH and don't use (depend) on target qtbase at all, so
> QMAKE_PACKAGE_ARCH would be used in more recipes then where it's really
> needed.

I don't know enough about qmake, but my thinking is that qmake will
store the (qtbase) configure options somewhere (from the time when you
configure qtbase for the target), i.e. qmake during the qtwebkit build
has access to the configuration from the time qtbase was configured.
Hence the idea is to make all (target) packages that use (inherit)
qmake5 to use the same PACKAGE_ARCH override.

Does it work differently?


Cheers,
Andre'



