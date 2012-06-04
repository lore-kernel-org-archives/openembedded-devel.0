Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SbcKJ-0007HA-Fl
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 20:48:35 +0200
Received: by eekd49 with SMTP id d49so1648100eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 11:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ADV8jWx9V88C189TBQ5d31XYp3NCA62yRK0Zukuy6eQ=;
	b=O8QjFUtvWauQ+XPr1xPkjByXr+lGsRB2mo/veEwgmpe5iieW1kRf0bBttg0YTitUzM
	5Or9UlDQM3DkwJvYHYaxaDelsmQO07n7w/cGxJ1t3R80QFoqE89vYE/PrIOmI5QHqhw9
	VhI5sk+EVKL/yIxmeqfsNpLXgcXQ49PUV+agwA1X4af3frVXragZqAoIKHA/1fcBgod1
	j71WvBMIh2dn2Okd7ow0+inQbygpOHLhw3kxzgpw5LQ3G6aTrsGzuw53PJ6tl7Dq+u2E
	addShyBz8gqpr625qzdNS8DDCSUPRTO/x0zEiHhLDCPtXqJDAFAIcCthEJDMaJI3nrXU
	WqxA==
Received: by 10.14.53.76 with SMTP id f52mr5794137eec.79.1338835076758; Mon,
	04 Jun 2012 11:37:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Mon, 4 Jun 2012 11:37:26 -0700 (PDT)
In-Reply-To: <77A5818E-F77E-4215-939B-882BC738EB65@gmail.com>
References: <D40848EB-C66A-47B6-B3C0-CF743A8E032A@gmail.com>
	<CAMKF1srC1uxpT1+Z_LqRUagFhxStZb30ZU10wrRtAReSSR7_zg@mail.gmail.com>
	<77A5818E-F77E-4215-939B-882BC738EB65@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jun 2012 11:37:26 -0700
Message-ID: <CAMKF1spRxzbVgiSev063fjBnPfurPAs45crPXq6kogZP8QuQYQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Understanding what qemuppc emulates and getting it to emulate a ppc440 CPU
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
X-List-Received-Date: Mon, 04 Jun 2012 18:48:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 4, 2012 at 11:19 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
> I found that the QEMU sources contains direct support for the Xilinx ML507, in file qemu/hw/virtex_ml507.c

OK try it out then you just need to select right machine (-M xxx) and
params if any. If upstream support for this platform is sound
then you are good to go.

look under scripts/runqemu* scripts and add this variant you need.

-Khem


