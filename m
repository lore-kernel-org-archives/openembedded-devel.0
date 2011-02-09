Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pn6CS-0005ec-0U
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:19:00 +0100
Received: by qwi2 with SMTP id 2so4780801qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 01:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=CFIAc7DmetbzUIB5+ihZqmD5FPa2wxNELbbluhXGbHg=;
	b=R/tLuMRBpPrxILTX5TeFHLTjy32Hl0mbq1R6AJrISnmXZGnpPAKN9yqPZUVsZLjv5R
	ohG2pUvvJuAuuom2X/EkY2TS58iyoTjPznClUpvy36nu/brnmioE+EEeDkoXp0UfKsb9
	UbPkF5VmU3US5OjwP5lHZnpI0U5XAybiGT9P4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=O8DiD26VLzb2wZD+8ixgzG2Z7kbn9jAm+tzCeiT4y8SL24/IqE+soZlFD7J+j5+0cj
	kW9HHEu9Roqf97re1SiqpElu0y3IRh+qxN8VyRkhJ/DXQao05O6hHEuQFKs2SlKwzaYM
	7NFGHG1GWmVviYMlw8kqSrD899A6PFsFxJOvQ=
MIME-Version: 1.0
Received: by 10.229.91.2 with SMTP id k2mr4269881qcm.260.1297243076237; Wed,
	09 Feb 2011 01:17:56 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Wed, 9 Feb 2011 01:17:56 -0800 (PST)
In-Reply-To: <iisb4q$n5v$1@dough.gmane.org>
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D517D6C.3070604@mentor.com> <iis1mg$tj9$1@dough.gmane.org>
	<AANLkTim7EfHHu1wCmZOwEtG7uvtURM=fmpjGT9k790Jo@mail.gmail.com>
	<iisb4q$n5v$1@dough.gmane.org>
Date: Wed, 9 Feb 2011 10:17:56 +0100
Message-ID: <AANLkTikY-jr6ZO-Y9GXE5Z133ZME4amg+2pUjcWPUmSC@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Wed, 09 Feb 2011 09:19:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/8/11, Koen Kooi <k.kooi@student.utwente.nl> wrote:

> Kinda hard to get to the feeds without networking

The bootstrap image does not contain pppd, which is far more
frequently used when accessing the Internet than bluetooth (and
bluetooth scenario usually involves ppp).

So either the recipe is wrong in forcing bluetooth, or in not including pppd.

bye,
Filip Zyzniewski


