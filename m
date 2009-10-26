Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N2TZ3-0000wX-5I
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 18:41:08 +0100
Received: by ywh7 with SMTP id 7so10304270ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 10:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=nhYTQB5x4j0y2JfqDWebdFIa3wqoZbA4u/4b7+1NEDI=;
	b=SrY1hzY+mx8C5MiYZfYByHqQ6KyLUwcVVyLgdb1+eJKC7KiyZQvzEmxJKzZD/Lds5N
	mZSbvu1t3zcfOGdRQQtkHWlpjli/pQGVagv8HP3gxAFdFTM6f9KL8oRTtsFyFzPvNN7f
	++jfdUOSX6jTQrLvboJN1CqaSQJJ5OcaDDL2w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Zo0MH5XuwIF/spbzdMIET5tJSDCCuhwClyLE7q+lucPL/M7v6Ew0CrheEgmJmzMhbJ
	Yr4T7dSg7mldCujAIefs1+RhEaE24XmAcD0IDkrpYN7b39JvaIBHUTVBRxJX/BKmWLsS
	6SInmU1uTZjPo7iBwNEE0OBDPBlcTecUEIfgs=
MIME-Version: 1.0
Received: by 10.100.80.7 with SMTP id d7mr1404840anb.43.1256578799597; Mon, 26 
	Oct 2009 10:39:59 -0700 (PDT)
In-Reply-To: <4AE5D539.7080005@kernelconcepts.de>
References: <ac9c93b10910250159k36219facpa0c13777d91d068@mail.gmail.com>
	<4AE5D539.7080005@kernelconcepts.de>
Date: Mon, 26 Oct 2009 18:39:59 +0100
Message-ID: <ac9c93b10910261039la639c48w1d6e83b81ec64000@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: kirkwood, one or multiple machines
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
X-List-Received-Date: Mon, 26 Oct 2009 17:41:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/10/26 Florian Boor <florian.boor@kernelconcepts.de>:
> Hi Frans,
>
> Frans Meulenbroeks schrieb:
>> Recently I added support for the openrd client board to OE by making a
>> new machine.
>
> yep - good job, the OpenRD client is an interesting piece of hardware.
>
>> Then why do we have multiple machines?
>> the only things I can think of is:
>> - smaller kernel (but more variants does not drag in that much)
>> - machine specific patches (but for now these do not exist yet, and a
>> clearer way then would be to use the machine specific config macros)
>> - tuned defconfigs (which is the only thing that there is now)
>
> These are good reasons to have one machine conf for every machine. Apart from
> the fact that it is quite likely that it will cause confusion if you merge
> multiple machine configs into one.
>
>> Disadvantage of more machines is that this will grow and grow.
>> Guess within a short while we'll see a machine definition for QNAP
>> TS219 probably followed by all kind of plug variants like pogoplug,
>> toninoplug etc etc.
>
> I do not agree here, a new device configuration file for a new device is
> something I can live with pretty well. Even if two devices can live with the
> same kernel one config for each makes it much more obvious which ones are
> supported in OE and which to look at if you need to change something.
> Thanks to include files these configs can be small but I don't see a major
> advantage of merging them. Currently this might be possible but you move away
> from best results if more specialized Kirkwood devices show up.

You have a point here.
The only disadvantage of different defconfigs is that you need to
change them all if there is some lower level change.
E.g. discovered the other day that ubi does not like it if
CONFIG_MTD_NAND_VERIFY_WRITE is set (which it used to be)
(see http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail)
in that case all defconfigs need to be updated.
THen again if they live nicely in subdirs, not too much of a problem.

Frans


