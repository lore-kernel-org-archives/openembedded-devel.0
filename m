Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OX9Jf-0007Pj-96
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 10:52:16 +0200
Received: by iwn34 with SMTP id 34so1946132iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=iF6f98x0lgM1YTXIjbgPs3JCq0uI6g8eTcVwIEp5QE8=;
	b=SSeeatpgmQK3Gt3S8XFId+3KEuUBUA3k7ITBPPPwfSzl5zP/xqeO02mxgEBul/Amr8
	GSTfUNx/5hQRZQ54Ylai9xcJfMo3VkFGKsTe22OYbO8m49sPnKpY7R/1eV+zNdTAmd1p
	lKYdfB4btKZKos+lTlN6gEL/T4GAytxeRYNLM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=IbvQP+PybY74XSaeiLmHQW8E+NNfCDrW8NOLN8f9JexYPRegoZ390d+smh1fiCfiC+
	cEnnawMRm3EbsmuujJuRKoIVIsO91ddACxXXR3sK2qgOsXvyXnrl+1X55pUfcgtN9e/Y
	OO54hCcjOGdTP6k+p8yDM3INKSqphtV0pOyZc=
Received: by 10.231.40.6 with SMTP id i6mr8630406ibe.26.1278623556242; Thu, 08 
	Jul 2010 14:12:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 8 Jul 2010 14:12:16 -0700 (PDT)
In-Reply-To: <1278622050.15825.18.camel@lenovo.internal.reciva.com>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com> 
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com> 
	<1278622050.15825.18.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jul 2010 14:12:16 -0700
Message-ID: <AANLkTinJLDCgt2ku0lIoHiT0EPlYMH8HDJLI-hAaXMvG@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_06_12,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][v3 3/4] uClibc: redo configuration
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
X-List-Received-Date: Fri, 09 Jul 2010 08:52:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 8, 2010 at 1:47 PM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2010-07-08 at 12:02 -0700, Khem Raj wrote:
>> I would have a feature called 'nobx' because most of the machines
>> we support actively in OE has BX. With current state this needs to
>> be added to MACHINE features for almost all arm machines. We can instead
>> have nobx and keep USE_BX enabled and only disable it if nobx appears
>> in machine_features. Otherwise I have tested the patches myself
>> and they seems to work well.
>
> I'm not sure that putting bx (or nobx) in MACHINE_FEATURES really
> conveys any information that you can't already get from TARGET_ARCH plus
> THUMB_INTERWORK. =A0It's also worth noting that the latter is a DISTRO
> variable so, if you did add a competing bx flag to MACHINE_FEATURES, it
> would be difficult to ensure that the two were consistent.

hmm TARGET_ARCH wouldnt be the one but BASE_PACKAGE_ARCH does have sub-arch
info. Although I would agree with you that we can build this information fr=
om
BASE_PACKAGE_ARCH but its not as bad to have it as a machine feature either=
.

>
> p.
>
>
>


