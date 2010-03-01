Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmDLo-0007vE-K3
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:40:34 +0100
Received: by iwn10 with SMTP id 10so2637235iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 13:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BHW53FRtLX7jIEfTNPyvY1XygHG4HASsVRdyjlCLTLY=;
	b=fcxMvf2j4P9mzNHMI2Q6ylLI3xY8Asbzu0iiMpYCHo+PtYAUcMfMW0TaiFJ1Xh2EzU
	pPRtlsDn44u6NrpK5JA7fDskKnrcVJ41EMl628KtrW5GCSx+/Rb8Tny4BnT8hkvTL2Pi
	0TY0JT6Fw6LFxLwZcTL1Ul3W8XR2DqvKqfLGU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tYXDhoF6b/29g3c0MnQrFHj8l2iSZysEQf41ysBesiRG1bXFadieH3A+5M4OGMe9Nk
	0NmeBQvuB3snFjH2wIKbhcda7pAGJ8nDXJxSbG6ICHRaVRBUH1TH2j7lNOvm11418zRv
	I1FVk9wDU2+0UbgUkvY3z0d1Enc/WPuh8HlU8=
MIME-Version: 1.0
Received: by 10.231.167.4 with SMTP id o4mr201966iby.66.1267479457948; Mon, 01 
	Mar 2010 13:37:37 -0800 (PST)
In-Reply-To: <hmfqnd$7an$1@dough.gmane.org>
References: <E1NlqMw-0004yw-KS@melo.openembedded.org>
	<1267396888.9295.30.camel@trini-m4400> <hmfqnd$7an$1@dough.gmane.org>
Date: Mon, 1 Mar 2010 13:37:37 -0800
Message-ID: <19c1b8a91003011337m5870f0c2w7bc347f0ffe2c06e@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Graeme Gregory : firefox_3.6.bb : add new version, convert to new staging
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
X-List-Received-Date: Mon, 01 Mar 2010 21:40:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 28, 2010 at 11:35 PM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 28-02-10 23:41, Tom Rini wrote:
>> On Sun, 2010-02-28 at 21:08 +0000, git version control wrote:
>>> Module: openembedded.git
>>> Branch: org.openembedded.dev
>>> Commit: 0ca0394c94028b941603b2d6f7264d3eaaed5a98
>>> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dco=
mmit;h=3D0ca0394c94028b941603b2d6f7264d3eaaed5a98
>>>
>>> Author: Graeme Gregory <dp@xora.org.uk>
>>> Date: =A0 Sun Feb 28 21:07:28 2010 +0000
>>>
>>> firefox_3.6.bb : add new version, convert to new staging
>>
>> Do we still honestly need PARALLEL_MAKE =3D "" ?
>>
>
> The firefox hg version I tested in december still needed it, haven't
> tried 3.6.

From Firefox FAQ

you have to add the -j option to .mozconfig file like this
mk_add_options MOZ_MAKE_FLAGS=3D-jN


Parallel building with -j4 and -j8 seems to work well.

Thx

-Khem


