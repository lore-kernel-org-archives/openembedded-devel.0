Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <serra82@gmail.com>) id 1N0bdm-0000zz-9A
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Oct 2009 15:54:17 +0200
Received: by fxm22 with SMTP id 22so7309612fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2009 06:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=1tbQFELRi0A8mneRRgVeuBu3kAdBNyjkahgJdUO/oB8=;
	b=BctsTNbadvMMppEVQXxLQvD/txmOsP8+Iy4HixFRa0/ZnhiR1xP6cOMlMKjMyKiFK7
	tqpJZ59UFXNGVMoRLfVwNC5spazZ5dWuFtKfizTtwqQIhsxpPzpGsNscSWUWBAnwCHva
	FgnUt3O4f6S7Dwqw6U65VqCyrmrOharoEukjc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VqTPvaO49k6JbLqPrr351abbaaxko4O1SgnU+c4rlTAEthEezOrb07WuIqaeJNoKp0
	c0b+hNc2qrDptXqanslwb15mtqn9HQHJhBGIppTC1LT5oXfZc9x5FwUiEBckMdGGQ8aI
	FH1O15lCC0s70GlJDbfYekWkZfn7fCC2+fQKU=
MIME-Version: 1.0
Received: by 10.103.126.12 with SMTP id d12mr3470749mun.40.1256133193295; Wed, 
	21 Oct 2009 06:53:13 -0700 (PDT)
In-Reply-To: <hbmoep$f72$1@ger.gmane.org>
References: <afb7987a0910200214v11b56177w400fac16a87a09f7@mail.gmail.com>
	<20091020110625.GA25350@mi.fu-berlin.de> <hbk60j$m83$2@ger.gmane.org>
	<70c9a9110910210114y6a907cb3qc69564fea9c3b565@mail.gmail.com>
	<hbmoep$f72$1@ger.gmane.org>
Date: Wed, 21 Oct 2009 15:53:13 +0200
Message-ID: <afb7987a0910210653rec4e371s4601e16bdf70168@mail.gmail.com>
From: Andrea <serra82@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: serra82@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: IGEPv2 with TI DSP codecs and GStreamer
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
X-List-Received-Date: Wed, 21 Oct 2009 13:54:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Koen,

>
> I have them queued on a local branch together with some fixed I need to test
> before pushing them out.
> You might have noticed the patchwork status of your patches has been updated
> :)
>

Could you add support for IGEPv2 in dmai?
I patched /recipes/ti/ti-dmai/touchbook-support.patch, but I don't
think is the right place!

--- /tmp/Cpu.c  2009-09-25 12:41:08.000000000 +0200
+++ davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/Cpu.c
     2009-09-25 12:41:36.000000000 +0200
@@ -107,6 +107,8 @@
     }
     else if ((strcmp(valBuf,"OMAP3EVM Board") == 0) ||
             (strcmp(valBuf, "OMAP3 EVM") == 0) ||
+            (strcmp(valBuf, "IGEP v2.x board") == 0) ||
+            (strcmp(valBuf, "OMAP3 Touch Book") == 0) ||
             (strcmp(valBuf, "OMAP3 Beagle Board") == 0)) {
             *device = Cpu_Device_OMAP3530;
     }

Regards,
Andrea


