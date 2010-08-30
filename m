Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oq9DW-00075R-An
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 20:36:28 +0200
Received: by gwb1 with SMTP id 1so2092019gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 11:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=kPMpEnrY1OKdobrF3XnoM3UVEyMqcaApDK1WIPuxGxM=;
	b=McNgjHpYCfAZHMl22Lfrnx4cg3NbWLBhkXnKqhoOUVFGPE97zhERWCDyRf/jLLvjDY
	cg228NdxUKFIZDoMgLCCuvaRvxkOgz+eIbr7eEYFWgYPXNsi3Co1arlHRN88qlxpQxzL
	P8qI6bCWX53AuE9tDiN583hz8bIo8Yu+lv/5g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=G2bMZen8jOo2GYYUHylVlfRResQU0ahDYrqzenttQeRldsWtVl9OgE0TdnXR11cuyx
	Z3Us25Z6DoOVy+gAhHEmWOG1csS6Oix/rqAKhLIlBDHJBD0E3zn1T0lEM0VTGHibSEmS
	CTncDZDaYYcclCLqfDUD2OC1hfVAjByuoHF7Y=
MIME-Version: 1.0
Received: by 10.150.138.1 with SMTP id l1mr405364ybd.381.1283193349520; Mon,
	30 Aug 2010 11:35:49 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 30 Aug 2010 11:35:49 -0700 (PDT)
In-Reply-To: <4C7BF64A.6080408@balister.org>
References: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>
	<4C7BF64A.6080408@balister.org>
Date: Mon, 30 Aug 2010 20:35:49 +0200
Message-ID: <AANLkTikfDN6d8X+OgR0AYRyPM78GXwN_RqFAxp48e9d0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-omap-psp-2.6.32 breaks iscsi-target
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
X-List-Received-Date: Mon, 30 Aug 2010 18:36:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/30 Philip Balister <philip@balister.org>:
> On 08/30/2010 01:47 PM, Frans Meulenbroeks wrote:
>>
>> The current beagleboard angstrom and minimal distro's (and maybe
>> others) use the linux-omap-psp_2.6.32.bb recipe to build the kernel.
>
> What is iscsi and why would I need it on the Beagleboard?

http://stgt.sourceforge.net/

the pacakge is from
http://iscsitarget.sourceforge.net/
It is used by tgt (http://stgt.sourceforge.net/)

with it you can e.g. mount an iscsi disk.
iscsi is for instance also supported by windows 7 and by various NAS-es.
Its throughput is better than Samba or NFS.

So for beagle it could act as mechanism to e.g. retrieve content from a NAS.

Frans.


