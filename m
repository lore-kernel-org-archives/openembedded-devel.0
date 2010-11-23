Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PKgmH-00016q-65
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 01:30:33 +0100
Received: by wyb40 with SMTP id 40so836543wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 16:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=u3idtFZaYn8Sm3T1IVIVhdML8mKZ7A4ZcCJr5auNblA=;
	b=uDrtBED4UacspV5C1rAV2oQCuPN9gzwuI+lHo3gNMm/VwDwnNZRG/8SFDqPnY82PUv
	stFKdupfIu3YkpgB3/sJSl44D3hLQbLJo6nGCsEqnNmGce7tyD0ZYhSpBeq4J12LJ2ew
	sTcuhYGnW1yf7yISahT9rStZbN1Qr2tSgBono=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=oySQ0tlTY8aBWtfn50wHl8UMFNEE8XyGS1Ov/Fzkav+UoRPalB8YjAqpp9BCSlMVit
	c8L2DWXOBlwJVr6qIbNXXGOAhaMYqBJK1Q/z/cZkBtzJHfL5sGF1Ys99iYV4DKwWBdYw
	i7eGOiSHMeMr22vpSWWooVzM9LVymPlzH0xC4=
MIME-Version: 1.0
Received: by 10.216.52.133 with SMTP id e5mr5490295wec.0.1290472160540; Mon,
	22 Nov 2010 16:29:20 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Mon, 22 Nov 2010 16:29:20 -0800 (PST)
In-Reply-To: <AANLkTikyUr4Kf43w1Mt69BD3=OyuuKx+HuMWWw=do+jU@mail.gmail.com>
References: <AANLkTimt7_P96yJMtLVd5S8ZOgH-=6VgTny=CezhOJ7P@mail.gmail.com>
	<AANLkTikQLnSYpAF4YivEWQODjHpOdHowndLOkyh3LJAp@mail.gmail.com>
	<AANLkTikyUr4Kf43w1Mt69BD3=OyuuKx+HuMWWw=do+jU@mail.gmail.com>
Date: Tue, 23 Nov 2010 01:29:20 +0100
Message-ID: <AANLkTi=vcHRVu_kyV255bw-TpHPGvKsk+PxfbxhRnk2F@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: automake-1.11 vs. host $perl_threads
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
X-List-Received-Date: Tue, 23 Nov 2010 00:30:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 1:17 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> It comes from
>>
>>
>> do_configure_prepend () {
>> =A0 =A0 =A0 =A0if ${@['true', 'false'][bb.data.inherits_class('native', =
d)]}
>> =A0 =A0 =A0 =A0then
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0export ac_cv_path_PERL=3D"${ac_cv_path_PE=
RL=3D${bindir}/perl}"
>> =A0 =A0 =A0 =A0fi
>> }
>>
>
> OK what happens if you get rid =A0of do_configure_prepend fully ?
>

 yes, fully removing do_configure_prepend allows e.g. libx11

Bingo!

Andrea


