Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NsLrk-0002Fx-4D
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 20:58:52 +0100
Received: by pwi6 with SMTP id 6so1827370pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=vwOfr0Iy24PT4eyzEM+rH+8BeFEO4NeEKrlCPO3L7co=;
	b=CV8qRBEoRkwd2VWbqhtMvcocFPEQ/VFNwfpjvTV+H693T6ijQkDl/ZaoGRbXpMIwZp
	qGxctDd9ga3FB1NdfaHjLF46JZfuEw0FsFqPWZG7WtwBHU80RyPL/y+uFHpi6a/HPEqR
	Wl6kNxASRz15eKHn6Tey3bgkSf9ghtuSaGBgI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=T5hQE3nhMGMrHJy9DESp1hOWnjHia30eZUMVoOpid8jdemLCtgcIeN9mfVRgRErVmc
	d08Y20HRD0sTGGWfg62q8VYtBKi+mBTFDA9kC7x2LXh4oQGELzbnV6Vmeu1W/JlIAfUo
	vPBMvykJC+yv5yeV9qCQHygi1jfWnv9MNrR2c=
MIME-Version: 1.0
Received: by 10.141.107.18 with SMTP id j18mr613838rvm.283.1268942142563; Thu, 
	18 Mar 2010 12:55:42 -0700 (PDT)
In-Reply-To: <1268941337.8697.69.camel@rex>
References: <4BA1825F.9080405@tait.co.nz>
	<201003180437.10542.holger+oe@freyther.de>
	<1268933342.8697.43.camel@rex> <hntp31$a2q$1@dough.gmane.org>
	<1268941337.8697.69.camel@rex>
Date: Thu, 18 Mar 2010 12:55:42 -0700
Message-ID: <19c1b8a91003181255l52422890seb14b465e99479ca@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] Renamed prefix_native, bindir_native, etc using 	camelCaps
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
X-List-Received-Date: Thu, 18 Mar 2010 19:58:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2010 at 12:42 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Thu, 2010-03-18 at 18:49 +0100, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 18-03-10 18:29, Richard Purdie wrote:
>> > On Thu, 2010-03-18 at 04:37 +0100, Holger Hans Peter Freyther wrote:
>> >> On Thursday 18 March 2010 02:31:11 Douglas Royds wrote:
>> >>> =A0 =A0 - Avoids clashing with the machine override when MACHINE=3Dn=
ative
>> >>> =A0 =A0 - bindir_cross similarly renamed for consistency
>> >>
>> >> Thank you for that much work. I think we established the usage of '-'=
 instead
>> >> of '_' to avoid clashes with the override detection though.
>> >
>> > I just noticed this problem. It makes me very very nervous to introduc=
e
>> > yet another variable naming convention, particularly one we don't use
>> > anywhere else :/.
>> >
>> > Might it be simpler to rename the native machine? Using "native" in th=
e
>> > override namespace is asking for trouble :(.
>>
>> rename it to 'host'?



>
> Its still not a good name to have in overrides. We really need something
> meaningful but not generic e.g. "localmachine"

yeah I would vote for renaming the machine. Some overrides should be
respected just for
the level of intrusion they have.

>
> Cheers,
>
> Richard
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


