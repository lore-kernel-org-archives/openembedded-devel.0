Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Otx3I-0003FR-Es
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 08:25:37 +0200
Received: by iwn2 with SMTP id 2so1910884iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 23:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sT1NX09ktoWpZFY1ePUGR5JH81cFX2HdfvhOsNyuLQE=;
	b=MkH5ga7Qdr7oi9OzzGiX7NOqFXjTr/8UDBMu/uvF89BLocXbcLybbWiVU+Ooc6xlV2
	vcJzQQH4HTkYVRK5ZNExPzre3YcGo+GKEJEWxJB6shSl7TRixSiCgTzGAJzI3e4UgAKT
	x9ISQWLUr9JpbUX01zVqcNDzYuCcA/N35PfVA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ICyTyPGk74AkuShfN27l+vOgb89+eNeLnxU73fP2bNH+fR/DaTUASqL9gPFAuKRz+W
	bltzwMRWyeeXtG96lXlYEY+R4irwK/ZvTd38OZ7PquRV6ynT5lA/PPJ3FK+TPuFaG6r4
	kW9NCmNivLDG4eFJxgFyTz189pFpSqba+pWTg=
MIME-Version: 1.0
Received: by 10.231.35.138 with SMTP id p10mr515448ibd.33.1284099894221; Thu,
	09 Sep 2010 23:24:54 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Thu, 9 Sep 2010 23:24:54 -0700 (PDT)
In-Reply-To: <20100909224326.GA3693@mi.fu-berlin.de>
References: <E1OtmZA-0002LR-H4@melo.openembedded.org>
	<20100909224326.GA3693@mi.fu-berlin.de>
Date: Fri, 10 Sep 2010 08:24:54 +0200
Message-ID: <AANLkTim-pUUN1=3HOZz4HdmwxDBt3yhi8kp=0p6eXHV-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Frans Meulenbroeks : pulseaudio: made 0.9. 21 compile for armv4 and armv5 too
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
X-List-Received-Date: Fri, 10 Sep 2010 06:25:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/10 Henning Heinold <heinold@inf.fu-berlin.de>:
> On Thu, Sep 09, 2010 at 07:13:48PM +0000, git version control wrote:
>> index a733038..138c0b6 100644
>> --- a/recipes/pulseaudio/pulseaudio.inc
>> +++ b/recipes/pulseaudio/pulseaudio.inc
>> @@ -6,7 +6,7 @@ LICENSE =3D "LGPL"
>> =A0DEPENDS =3D "bluez4 libatomics-ops liboil avahi libsamplerate0 libsnd=
file1 libtool hal virtual/libx11"
>> =A0# optional
>> =A0DEPENDS +=3D "alsa-lib glib-2.0 dbus consolekit hal openssl"
>> -INC_PR =3D "r10"
>> +INC_PR =3D "r0"
> Hm is that good changing the INC_PR down?
>

Aargh, good catch, I goofed.
Actually the .21 recipe did not use INC_PR at all, so I thought it was
safe to drop it.
Seems I missed that the .15 recipe was using INC_PR.
I've pushed a patch to set it back to 10

Frans.

PS: we have some 889 .inc files and only 217 use INC_PR


