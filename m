Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBWu9-0000Hb-BQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 20:08:50 +0200
Received: by gwaa11 with SMTP id a11so1515204gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=XbPuDYgHdVTSA6TR502LDeuIz9gSRGgWvXnjwTdlqic=;
	b=PrBPdtQEg6PT6/iMWY6UqpR8c3HvsDKOPEYx8cU9b0fl9LzAiwrwg/4MTrrN9WS1Aq
	0dbnCRwDY8xj2B88Lplo/CK369+P8rLFytokd3Vk9uauBGNvilWbmRCWmnweEMHrVuim
	jUpNwdblqzaR5HnTih+N+lcT7wX4l+uS9fOUQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=s/+LhQSzjUzi1kTPAOYFXfd8icDtulD/uspzZKJBtG1OqVUwFM7mr5dKioM7ieNgLR
	K/ertH08i52VPegNRZof3zNJ9rPrK8hRe2nmmGesEF2bUtovdnqwkdY0V57B33HFKo62
	52cQL3lijUcWsYg92U40CQOkIQOZoXVnnUFxs=
Received: by 10.91.45.28 with SMTP id x28mr3207429agj.73.1288289280287; Thu,
	28 Oct 2010 11:08:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Thu, 28 Oct 2010 11:07:40 -0700 (PDT)
In-Reply-To: <AANLkTi=R5zdtjWXbmZLwCtsa7Yu15Mr67H4SNtPz+EB4@mail.gmail.com>
References: <E1PBVKs-0003ja-Sw@melo.openembedded.org>
	<AANLkTi=R5zdtjWXbmZLwCtsa7Yu15Mr67H4SNtPz+EB4@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Oct 2010 11:07:40 -0700
Message-ID: <AANLkTikZa1TQTtZTk52MeObsO0k3ibUzELJoKisrsE7y@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Stefan Schmidt : cacaoh-*native: Try to be libtool version agnostic.
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
X-List-Received-Date: Thu, 28 Oct 2010 18:08:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2010 at 10:11 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Oct 28, 2010 at 6:28 PM, git version control
> <git@git.openembedded.org> wrote:
>> Module: openembedded.git
>> Branch: master
>> Commit: 44bc5a638065a7ac705c2d7f21c256c7ebda516c
>> URL: =C2=A0 =C2=A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=
=3Dcommit;h=3D44bc5a638065a7ac705c2d7f21c256c7ebda516c
>>
>> Author: Stefan Schmidt <stefan@datenfreihafen.org>
>> Date: =C2=A0 Thu Oct 28 15:50:55 2010 +0200
>>
>> cacaoh-*native: Try to be libtool version agnostic.
>>
>> Based on a suggestion from Enrico Scholz we should use libtool --mode=3D=
install
>> for install libtool stuff. This fixes a regresion for me that came in wi=
th
>> commit 93c4d9d84096c817e74abf3f4c02f82af4c95178
>>
>> It is working fine again now with libtool 2.2.6b (angstrom-2008), testin=
g with
>> libtool 2.4 would be appreciated.
>
> Tested with SHR (libtool-2.4) on host without libtool installed:
>


it should use ${TARGET_PREFIX}libtool to be sure.


