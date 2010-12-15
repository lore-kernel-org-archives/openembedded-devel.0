Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PStO0-0006wv-0B
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 16:35:24 +0100
Received: by iyj18 with SMTP id 18so980199iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 07:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+3ZxRjW1swFr+oivERl3ndHCTWgwTwb9KUdX7KqXyXY=;
	b=Xozb9YKYalncgKfdvIz6eEzPUwMTcBR0yJqe2B+/bEH17C5W9IMRlnIyuOKVe+K/jt
	gD16/FhSS89DfushBi8BUPBGtj+xnmjsrnW84gtZ9vK42BPUUL8QOYc4tURaHQyjl/r6
	vzimUXgCdpiMC+cBCfHowGxISFk50fxywKETo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=srJPn7KabW6DQLshD9ZC2AWbWS0ASFQ2hIX7v8ozxtMXby7MnIbYBHHyVBHdQFqVGJ
	b6GUM2kVxZmf4NHELa4KHqzKVimi5U7tnDJlhrDnIZZisbYQTVcd+VECaHQZozWV3hoy
	WAMi8/S1r6jeTgyULOGKFKP88fR5Au4wuI5Bs=
MIME-Version: 1.0
Received: by 10.231.182.13 with SMTP id ca13mr5029359ibb.57.1292427225615;
	Wed, 15 Dec 2010 07:33:45 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 15 Dec 2010 07:33:45 -0800 (PST)
In-Reply-To: <4D08D3F5.1060608@mentor.com>
References: <AANLkTimTaZyPywc_B8g4k4QO+gTJq67K=OgcoSe6BpJh@mail.gmail.com>
	<4D08D3F5.1060608@mentor.com>
Date: Wed, 15 Dec 2010 16:33:45 +0100
Message-ID: <AANLkTim5ChRd3XDTo+E25HiWwpnmyMDgeg17xXd0=GxA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-12-10 (wiki, results, bluez-libs)
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
X-List-Received-Date: Wed, 15 Dec 2010 15:35:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/15 Tom Rini <tom_rini@mentor.com>:
> On 12/15/2010 12:51 AM, Frans Meulenbroeks wrote:
>>
>> Dear all,
>>
>> I just wanted to update the testing table with my entries and I
>> noticed two (possibly related) things.
>> - no other entries for 2010-12-10 are there yet (and it is already
>> wednesday)
>
> I haven't updated the stuff we're building since just about everything
> failed due to the gcc issue Khem fixed in
> 2c8570552549da2e11428d08b2bc08849cac39b1. =A0This is why I sometimes wond=
er if
> it would be desirable to cherry-pick a few things in to the testing-next
> branch.

Hm. Yeah. I've re-checked and I am definitely building the
testing-next branch, not git head.
Then again I only build console-image and no high end images.
My james-image also had quite some issues (js, samba) which are now resolve=
d.
Only issue left for now seems to be gettext/libtool related.

Frans


