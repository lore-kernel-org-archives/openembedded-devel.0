Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1ObqAc-0000Bb-Ch
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 09:26:19 +0200
Received: by iwn34 with SMTP id 34so7828667iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 00:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=EPLqTewSwXCad7pmezVZCgI/JnL8+mbSdQFzJOM1Pw4=;
	b=ka1WzEsw4zucJlV4n9/QOsS6XUNJGcliSZZvQZNCbB61DlMEBu2ZWHwgtUF1w/vqwc
	zZr/6jjkkHczTJF6lB7sbFAvwQG6kbbhEquNRuMNh3ta0kPb0/t6oX4wn0uIVAMtuVpT
	ea+x1XkJwieSxJ29F8ykhH3ZCKsjZosbEOIxc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sWYpUE1NBonDQqJf15II23XKStV72sDrl5P7lZXhxzZGRuq/m4qk+bnmNTkVOnd94B
	N9C93vrUN8n8VtcUDjk4A8ri67gJ0tZavSeQ0tvxxixOmChzvxhKYmAziAfrU9NCGMY2
	YGhczWVi+hSi2a1NcDGvrOBQgEleSMIv81Txs=
MIME-Version: 1.0
Received: by 10.231.159.204 with SMTP id k12mr1491875ibx.42.1279783568080; 
	Thu, 22 Jul 2010 00:26:08 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Thu, 22 Jul 2010 00:26:07 -0700 (PDT)
In-Reply-To: <AANLkTinUM0JSiWeRkhCDo67KqyanvDiaIRiuCiT0tpOr@mail.gmail.com>
References: <4C4704CB.2010204@gmail.com> <i275t3$65g$1@dough.gmane.org>
	<4C475AC4.6010302@gmail.com>
	<AANLkTimMZU5mXUn1ZSFJ0_8aDu8ykWYDXMD55iZW8s7A@mail.gmail.com>
	<4C47E285.708@nedap.com>
	<AANLkTinUM0JSiWeRkhCDo67KqyanvDiaIRiuCiT0tpOr@mail.gmail.com>
Date: Thu, 22 Jul 2010 16:56:07 +0930
Message-ID: <AANLkTil57uQl9XRZmHY7gDTviye2YboZ0G5QyGsEZCj2@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opkg : angstrom fails console-image build
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
X-List-Received-Date: Thu, 22 Jul 2010 07:26:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 22 July 2010 16:41, Graham Gower <graham.gower@gmail.com> wrote:
> On 22 July 2010 15:47, Jaap de Jong <jaap.dejong@nedap.com> wrote:
>> I've made a completely clean build last night and it breaks at the same
>> problem.
>>
>
> Koen bumped the opkg SRCREV a couple of days ago. One of the recent
> opkg changes was to return an error in some erroneous cases which were
> incorrectly ignored previously (check_data_file_clashes errors are one
> of these cases).
>
> Its possible that this problem was there beforehand and its only now
> being caught because of less dumb error checking. Sorry, I don't know
> what is causing the issue - you probably need to look at the
> dependency graph to see why both opkg and opkg-nogpg-nocurl packages
> are being built and installed.
>
> -Graham
>

PS: pushing my opkg cleanup patch would probably fix this with no
further need to investigate...


