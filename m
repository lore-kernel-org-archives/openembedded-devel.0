Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id D939B78607
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 22:14:03 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 9so3007261wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 14:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=gblqCyUmUzceEocnjBgP9EwkcvUEx+FFrETFy5V0FLs=;
	b=dzqDfxUq7e5UsxNnMymLujQn8KfUeqeTXb0JnwErI+w9zJfY+MBHGQ2WRz2XmNP4X7
	p6wDhgcA3LBgDAEpeJoR76i+OxsGIxn3c6d4ZY3GcujhfBzsnDdyHrw1FDnVpYIROrXN
	qvYutB0X2Twnnrtu3XiIIhXmTuk+WqWKMuqvpNbPmjggAmmGUg9BHY60qQqh7sjqcJYn
	khOo3xgwL3GXuq738rrDg9SXhc6jAgmqAglZjb8fMR1TcIChuRWg2ASrVYoI9tUe3tM6
	AeJlh4NBPJudD1bszqJueBYXfdq67cwm7zSZu+IRQ4AklEH3XIJOQTQrqPcH79MWdgYD
	YbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=gblqCyUmUzceEocnjBgP9EwkcvUEx+FFrETFy5V0FLs=;
	b=kFF7fy9QzNUo2bSiOMSx/BoLKvUdIhPADs0nJTX8eZSw4wcx9vfvIUAJc6gmwD9uUG
	5mhn0DBx8lcNjQMPVkrpoIhNVViqE16VFb8uePK8554XfMJ2gq33qY+EGJv3rBxMW5P4
	o7ZlaoQsYt2X7I41KeZXq7Fet0Sw0uwP9Jp3gm1aLa4yD0Fs0gaioP/s5VTr4R7+MciT
	fPDzRZHiVDnPtaaHtw5XCPbGi+oBlWqqfWKTjDG5uuZbbmFYQTDKt5RIDF4W856NcR2k
	wfu+eKlZKjtBrhkQsRHFcg6cyW1ofE0ynAMIyXfUyqG11J9WWuIgji40i1TihgDCfxYS
	Im4Q==
X-Gm-Message-State: AJaThX7758gL41LghGd2qbhgXrFLE11lakdS1Ja88mXPoPrVrffthbLc
	djveVu5bw70dXuaVDkjnkr0V
X-Google-Smtp-Source: AGs4zMbmbF/ZHn8jPeBFMfK80mcs58/YG3iX55EhAi/hR4M0LUdTMaAyH4GuL5e+aBs29/gx0Hc3TA==
X-Received: by 10.28.4.146 with SMTP id 140mr2414061wme.38.1510870444521;
	Thu, 16 Nov 2017 14:14:04 -0800 (PST)
Received: from pohly-mobl1 (p54BD58EA.dip0.t-ipconnect.de. [84.189.88.234])
	by smtp.gmail.com with ESMTPSA id d71sm1182372wma.7.2017.11.16.14.14.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Nov 2017 14:14:03 -0800 (PST)
Message-ID: <1510870442.5979.36.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Date: Thu, 16 Nov 2017 23:14:02 +0100
In-Reply-To: <1822334.tYZlPLg4XR@yow-masselst-lx1>
References: <1510845589-10848-1-git-send-email-mark.asselstine@windriver.com>
	<1510856886.5979.34.camel@intel.com>
	<1822334.tYZlPLg4XR@yow-masselst-lx1>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] meta-webserver: apache2 allow SYSTEMD_AUTO_ENABLE to be overwritten
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
X-List-Received-Date: Thu, 16 Nov 2017 22:14:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-11-16 at 15:00 -0500, Mark Asselstine wrote:
> On Thursday, November 16, 2017 7:28:06 PM EST Patrick Ohly wrote:
> > On Thu, 2017-11-16 at 10:19 -0500, Mark Asselstine wrote:
> > > The current assignment does not allow a bbappend to be used to
> > > overwrite the SYSTEMD_AUTO_ENABLE value in order to have apache2
> > > auto
> > > start.
> > 
> > Why does SYSTEMD_AUTO_ENABLE_${PN} = "enable" in a apache2_*.bb not
> > work? It works fine for me with wpa-supplicant:
> 
> Sorry. You are correct the bbappend will overwrite it, but this
> requires a bbappend. If this used "?=" you could achieve this in a
> local.conf or similar. 

SYSTEMD_AUTO_ENABLE_pn-wpa-supplicant = "enable" in local.conf also
overrides the = assignment in the .bb file.

> In general if there is a possibility for a value to be desireable to
> overwrite using "?=" makes sense. Thoughts?

I thought the same for a while, but since then I've come around to the
interpretation that for recipe-specific variables, using =? is mostly
just a cosmetic thing. I can't think of a good example where it really
matters in practice.

It's different for global variables which might get set prior to
parsing a recipe (distro config, local.conf). There it makes sense to
not overwrite a potentially existing value.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



