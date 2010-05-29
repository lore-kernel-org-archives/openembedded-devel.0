Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OIIXR-000541-4v
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 11:41:05 +0200
Received: by gya1 with SMTP id 1so1296627gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 May 2010 02:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Ffdq/XEPqToxH3nyy1o80qMQf3Vzc/ENpNYjuWnTbUs=;
	b=Q6pLXcWeKOaPNHY57RbwfK2lZrCG2A5iGW9QN50+PkQKyDR4eZRQUSIPJNM6+GqZWT
	dMzGualEYSEnTi7inEqgA5jkVZ2dVPWepEEZhGTOE+aukqYK+VmUVcAw4bmE9eH6x4gy
	XqiT8msFQgVOdkrEjpZhdMPLf9qRheq1U3Cko=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fjhPPZvmKiQ3aXCpXiKCTPRgBzgHd/D3edaPyW080UtIDjDgUOiV8Xj4SI3rdvfPMG
	OCA0JItBZT15EcbKLycJfIWolWq2Jrxf1RWHX8zYmQ9az/61zU9qN8dsf9otvbf/RdBa
	RIpLvvG8t2wb7HpqO+iE9o8BdSmKE9smKGXf8=
MIME-Version: 1.0
Received: by 10.90.225.16 with SMTP id x16mr1149406agg.71.1275125810423; Sat, 
	29 May 2010 02:36:50 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Sat, 29 May 2010 02:36:50 -0700 (PDT)
In-Reply-To: <AANLkTikmIaqai1TRdoU2SlybGF4JmdS57AJnA6sngrSS@mail.gmail.com>
References: <AANLkTinA_A7Ja4Go6H7MlOxFM4uLsfiQCyJnRodHHCpo@mail.gmail.com>
	<AANLkTikmIaqai1TRdoU2SlybGF4JmdS57AJnA6sngrSS@mail.gmail.com>
Date: Sat, 29 May 2010 11:36:50 +0200
Message-ID: <AANLkTims9fPo1xmCwBFmiHQJ6nrTgJDKVFJkjeThIvt9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: additional bitbake test
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
X-List-Received-Date: Sat, 29 May 2010 09:41:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/5/28 Chris Larson <clarson@kergoth.com>:
> On Thu, May 27, 2010 at 11:36 PM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> Hi,
>>
>> I'd like to propose to add a test in bitbake to see if an overlay dir
>> exists when specifying overlays.
>>
>> In the past I bumped into a problem where BBFILE_PATTERN_local =3D
>> "^${OE_TOPDIR}/myoverlay/recipes" was not processed properly because
>> OE_TOPDIR was not passed using BB_ENV_EXTRAWHITE, resulting in the
>> regexp match with the dir always returning false due to OE_TOPDIR not
>> being expanded.
>> A simple test could warn users against errors like this one.
>>
>
> Hmm, I'm not sure how best to implement the warning. =A0I'd rather not gr=
ep,
> and we don't currently have a way to determine what variables a given val=
ue
> references. =A0I guess we could notice if a given pattern didn't match an=
y
> files in BBFILES, and warn on that. =A0Does that sound reasonable?

That sounds quite good to me.
>
> Aside: the fact that a nonexistant var is left as is, to be expanded in
> shell, is horrible, imo. =A0They should expand to the empty string when u=
nset,
> or error, or something.

I'm inclined to say error. If a default it wanted an assignment can be
done somewhere.
Better make the problem explicit

Frans


