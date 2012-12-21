Received: from mail-ie0-f172.google.com ([209.85.223.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stanhu@gmail.com>) id 1Tm9ua-0002IB-QY
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 22:13:46 +0100
Received: by mail-ie0-f172.google.com with SMTP id c13so6808495ieb.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 12:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DIS3ZFB8tmDPMYdG6s5UzgRwfMvqVgaWbOgS2Nx8PNE=;
	b=fSyGML/nJ06yB31nhDA/rDJpCyEEv1mapWI8ObVAplMH2c/Nn2h5dOfzdxp69tbXi9
	Uqr4wJMg68x591ZVBYr2bDGsf94GD7SSKEami8s2NwrPB9XhQmO3thevzWAvN5716QJ1
	aeRNECPZreysiq2fcsmKIrlzKs5YUU1C7uhSvJM68Ba6QWa8ZKGLZEIQx6c5lkzNS4uC
	2RreAyisj9CkTgmCD2LTg1b/dwFhheHnbSoRfcDm/X6WvxdiPNljYOoRGHeoxiSi9I/P
	GOkO85tPmtgP0ow14M9nzWweQcb4QxrbV9ojPYmmA8BSCeJsVZ7sFIwM/BBQE2A8l8KE
	gKWQ==
Received: by 10.50.158.170 with SMTP id wv10mr9918530igb.75.1356123538057;
	Fri, 21 Dec 2012 12:58:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.153.229 with HTTP; Fri, 21 Dec 2012 12:58:37 -0800 (PST)
In-Reply-To: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
References: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
From: Stan Hu <stanhu@gmail.com>
Date: Fri, 21 Dec 2012 12:58:37 -0800
Message-ID: <CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Multiple .bb files are due to be built which each provide udev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 21:13:46 -0000
Content-Type: text/plain; charset=UTF-8

> My automated build system updated to the latest master of
> meta-openembedded, and now I'm getting theis error message:
>
> ERROR: Multiple .bb files are due to be built which each provide udev
> (/var/lib/jenkins/jobs/systemd-image/workspace/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/udev/
> udev_182.bb/var/lib/jenkins/jobs/systemd-image/workspace/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/
> systemd_git.bb).
>
> I think I have recipes that depend upon libudev, so BitBake pulls in both
> these recipes.  I'm not quite sure why I didn't get these warnings before I
> updated.  What's the best way to resolve this?
>

