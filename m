Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OPEMD-0003et-Q2
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 14:38:14 +0200
Received: by bwz14 with SMTP id 14so3676906bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=P6IP67HaIK5dh8rueXVMTle00KHfSfupPmH+/fW4DXc=;
	b=JN6sPsF/7YdwhjnKyxJXlDMY/ygZvONNtvvEH5LaBbyd/nOx0j8Y8oY2QbQJBKokp7
	bKrcD1diN1oYDT0vlCgV+s04T/6WGDamPA0jNBMbTh6U98A69wQ/MDO2VEVrj+o9kYyR
	jCdaBIhM63GQW7yInTdeqy8WneaZG0ZsZ0MCk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mIXmP/h/KMXUWgwDgrpGXkOnUT2MptbjDfFva8DvZxEaav+oX/XEt+cr8kUu1PIWKD
	v4wM0V3SXtk48DoYCT6lyX1G9tP0etbhUz3kvEfITc5OS2CejUVBw+GVyJ8T6Le8Y5fU
	hWchbXtuEU3UUVzQfip3Y9+NE8oXCCpm7NrrQ=
MIME-Version: 1.0
Received: by 10.204.83.225 with SMTP id g33mr7747971bkl.37.1276778006291; Thu, 
	17 Jun 2010 05:33:26 -0700 (PDT)
Received: by 10.204.119.12 with HTTP; Thu, 17 Jun 2010 05:33:26 -0700 (PDT)
In-Reply-To: <20100617121913.GA16207@rhein.zuhause.netz>
References: <20100617121913.GA16207@rhein.zuhause.netz>
Date: Thu, 17 Jun 2010 14:33:26 +0200
Message-ID: <AANLkTikXuIpS__OkzfO0v12k8bdMhiU4I58yoH8x5giC@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Proposal to remove libattr recipe
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
X-List-Received-Date: Thu, 17 Jun 2010 12:38:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/6/17 Henning Heinold <heinold@inf.fu-berlin.de>:
> Hi,
>
> the libattr from xfsprogs clashes with the attr recipe from udev and I can
> find any recipe which uses libattr, besides libcap2 which could use attr
> from udev too. So my proposal is to remove the libattr recipe and switch
> libcap2 to use attr from udev. Attached are the two patches, to do it.
>
> I would like to see some ack's.
>
> Bye Henning

Looks fine to me (but didn't play-test it).
Did check at my side too, but could not find recipes depending on
libattr either (grep -r libattr recipes) so:

Acked-By: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


