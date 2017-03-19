Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B1A1D6FF78
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 21:51:47 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l37so15820945wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 14:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JCF7Q1iwjWXBv+mn6tJuTONpjDrUIEdz4+Fnhx7lqtk=;
	b=eTZarxmbNGUARbffgOWqCOexHeODv9wuWRFXGUYWds/Q9sMsA2v5gqTV2if0qhOTtE
	wkSk9y4yVFq6q+LHXQKEg0Z+l+4YG1WZ2YCHFbTd6ZWyOJkcx8XjRfvIRaaiTcKiMPfi
	LGAAUyxAZ32ubCUMnPspBFGlbCxB0Thbs0ydYUUM8tZQPb09q42QxLksYGIGN3OD9p1k
	mPlSsVBak2kAisC9zRWR54FFxISKzyQVoiK+31+PhiDaUSJxp2mpqYQHloCOoDIW8Q3C
	t+5IJQFcZrlQ5vpIP+9N8FRpneSOk9Xa9mpIE9fo6e/5Bp5u342ldf0nCy5h57wwIh22
	CLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JCF7Q1iwjWXBv+mn6tJuTONpjDrUIEdz4+Fnhx7lqtk=;
	b=X+tfG5FBKkNQNuZCRHAl1AEuQ6FclRX6aaITtB9/HoJ1yT1h4BjOhJx0HOFXEUGK68
	Lhc9tvAW21i7MWjKEnda2G62JamPa0rhwmltq68Wy31FPKqbTEbIfS8bfDShiFyjWPd7
	1SwVB2rGlYubHxFQBMH83+Ypdm6GZzVQg2OOB7jRe8IgAocOCGPw/dxAHeFru0Qp5BYV
	R8OT/Bbrap0+Y4vjl9g4ydHhrLWA5ORvOX+utF210o/0kp1Qcs+nDbd38PkuNtgjOWci
	3qYyaivzmi5v17UCVLRfh522m3EhSviY/V0oEozH8QTMhZ9x7pTxOhJmQe1tVX+gkSu4
	QQwQ==
X-Gm-Message-State: AFeK/H0RmzWlLQQfNMXDmWULVHLtLTzQKzSWvN55RbRHurJnszou5Ec9nuzfX/hdwjcwVw==
X-Received: by 10.223.155.129 with SMTP id d1mr22445545wrc.67.1489960308086;
	Sun, 19 Mar 2017 14:51:48 -0700 (PDT)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	o52sm18418843wrb.51.2017.03.19.14.51.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 14:51:47 -0700 (PDT)
Message-ID: <1489960306.2834.31.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Daniel Dickinson <cshored@cshore.thecshore.com>, Gary Thomas
	<gary@mlbassoc.com>
Date: Sun, 19 Mar 2017 22:51:46 +0100
In-Reply-To: <20170319120416.6afeafc5@danielf.thecshore.com>
References: <20170319002834.17953566@danielf.thecshore.com>
	<1489915859.2234.8.camel@gmail.com>
	<1b018e93-114d-8d5c-2b94-efd692faa8a3@mlbassoc.com>
	<20170319120416.6afeafc5@danielf.thecshore.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded Layer Index autobuild errors
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
X-List-Received-Date: Sun, 19 Mar 2017 21:51:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Sonntag, den 19.03.2017, 12:04 -0400 schrieb Daniel Dickinson:
> On Sun, 19 Mar 2017 15:39:38 +0100
> Gary Thomas <gary@mlbassoc.com> wrote:
> 
> > > 
> > > With that change all tools which must be installed on the host need
> > > to be present, even if in your use case some of them might not be
> > > used. Did you install the prerequisites?
> > > http://www.yoctoproject.org/docs/2.2.1/ref-manual/ref-manual.html#required-packages-for-the-ho
> > > st-dev
> > > elopment-system  
> > 
> > The real point is that it's not his host - it's the [remote]
> > autobuilder tool for OpenEmbedded (IIRC)
> > 
> 
> Yes, thank you.  I'm not sure it's a full autobuilder or just parses
> recipes for generating the web pages, but either way it's not my host,
> it's an openembedded.org host.  Apparently I'm not good at explaining
> that...

My bad, sorry.

And it looks like the host fails to update any of the layers, e.g. also openembedded-core:
https://layers.openembedded.org/layerindex/layerupdate/323749/
Adding Paul, as he maybe knows how to get those tools onto the server.

Max

> 
> Regards,
> 
> Daniel

