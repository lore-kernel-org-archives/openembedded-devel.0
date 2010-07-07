Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OWQvz-0005Sb-V9
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 11:28:54 +0200
Received: by bwz10 with SMTP id 10so3802265bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=t4I4941eIoXsxo9U3x9/xsFb2Sc3lc2ejgR7JHPbXFY=;
	b=pvkpWZPeAlep2AzzAzoU2rqICkbDNgEDx/orrQiA1avSfgL2sFWVzytEZO7dNHFH1J
	h0nNsk4ASTEHeAGLHUEobiK8m0paDfhsHhU84vFl4WYuiV0kr/YSSHG7G4XA7hEvte7c
	wud9DES/wKb92MhpyZdT8MjZi6i+a26ltr2Ns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wSFwDQpIMDzca3e38MDXT+9fIfrfRqUMI22XPTwgeox0bn1EeHxfkJByyIYvEmN9Ks
	828ZU6ewpsc6OBuzZ9GX2CsY/A15W065Q3C1hbrZO3pF7d5UvTcrOpsK61y684yWgNiK
	8Kj2ds2PV1baRZbjOEjJTtoE7S5U40gRZJH5A=
MIME-Version: 1.0
Received: by 10.204.152.4 with SMTP id e4mr3765169bkw.120.1278494642673; Wed, 
	07 Jul 2010 02:24:02 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 7 Jul 2010 02:24:02 -0700 (PDT)
In-Reply-To: <i11duk$rbd$1@dough.gmane.org>
References: <i108p5$hd$1@dough.gmane.org> <4C33B301.7010006@mentor.com>
	<i119n7$ej7$1@dough.gmane.org>
	<AANLkTilMeF6JeEaV7XjkOwfb2_G1d3XO3sIe9CP_77-g@mail.gmail.com>
	<i11duk$rbd$1@dough.gmane.org>
Date: Wed, 7 Jul 2010 11:24:02 +0200
Message-ID: <AANLkTikiUFxGOFFNGd_54vDbRjZJq_VucuSDzei6k4ZN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 4d6a63850b4dc7ca2f060aedda26ddf4efa0e5cc
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
X-List-Received-Date: Wed, 07 Jul 2010 09:28:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/7 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 07-07-10 10:22, Frans Meulenbroeks wrote:
>
>> - I haven't really seen interested from angstrom to support nios2.
>> Feel free to correct me by sending a pointer (preferably referring to
>> the angstrom mailing list)
>
> Both me and Graemo have told you that in that RFC thread, that's 2/3 of
> the angstrom core developers already.

Graeme mentioned that if I asked, it might be added. One might
consider that as interest.
From you I have not seen a message that I interpreted as interest from
the angstrom side.
(and if that is a misinterpretation from my side, my apologies for that).

Anyway, I have no interest in having a yes/no discussion on whether or
not angstrom has shown interest.
If angstrom wants to support nios2, fine with me. If not, also no problem.

There is a machine.conf. I feel it serves its needs. The rationale why
things are added is well documented. Pinning things in a machine conf
is afaik not in violation with any OE design rule, and also not
uncommon as 100+ pinnings in the machine dir tell me.

But if you feel my machine conf file is totally wrong feel free to
raise the issue with the TSC.
(then again I have not seen too much explanation why this is bad; I
just reread the first post of this thread and there is no explanation
why this is bad; maybe it helps if you consider something is bad, that
you explain why it is bad, instead of just making statements that
things are bad. In general by explaining why something is bad you
create understanding. Saying that something is bad without saying why
is only creating anger and frustration).

Frans.


> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMNDsUMkyGM64RGpERAo+7AJ0cyzYELBJ/RM4bT6CGG5AwoEYNaQCfVJDf
> EgWdJiOPiLdH3pPCXYUKTWY=
> =5bcf
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


