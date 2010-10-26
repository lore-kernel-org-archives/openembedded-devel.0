Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PAob1-0006Ts-B3
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 20:50:10 +0200
Received: by gxk28 with SMTP id 28so120651gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 11:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=NYYLYJxZdmZHnzGEzlOyfLBZK4X+CPwCQuOFP+TfLZk=;
	b=Y2Wyt6jw83morbHlNEDsZkLDveVDHrPmaZvhoX1qHO7JgpMLR27Fo+LQOXb7JPYnBa
	IDw6Nw/6ivMkxwg/evq+bWUUXkZNTmHtzgqdPAAbfcLKjY6Uy9McMlEzgMeZZEK28sE7
	urZEft79rkMygycJ/dnWVU1z+5NPf/DR2Syjw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=K8+rV2KUiWF0WEEVPJi9WUh5ask/47c0vq4Ii4Yhteg8FW4WaUtnncI/p6713x9who
	hI987I6YGF9LHfno2ZvdB64kxf7JRhkLmW8oOpvu9WfoxNjPs9ekrIwj1AZLpye3MFfN
	tMSX33lYCawYvQjtVoLm1uNomURmkMPZAx2ng=
Received: by 10.150.203.4 with SMTP id a4mr7588776ybg.144.1288118964394; Tue,
	26 Oct 2010 11:49:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Tue, 26 Oct 2010 11:49:04 -0700 (PDT)
In-Reply-To: <201010261133.07987.kwong@wurldtech.com>
References: <201010261133.07987.kwong@wurldtech.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Oct 2010 11:49:04 -0700
Message-ID: <AANLkTin1iUTYWyO+_kon374+7H4ePrPQGAExMPwH+qmu@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Our changes to the main OE tree (mostly network/snort related recipes)
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
X-List-Received-Date: Tue, 26 Oct 2010 18:50:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2010 at 11:33 AM, Kelvie Wong <kwong@wurldtech.com> wrote:
> If any of you are interested, we have published our additions to the
> OpenEmbedded repository --
>
> http://gitorious.org/~kelvie/oe/kelvies-oe/commits/upstream-base
>
> There are a couple of bug fixes in there (with the kernel bbclass), and s=
everal
> new recipes:
>
> - snort-2.9 and its dependencies, libdnet and daq
> - A fix for the ARCH detection for the kernel bbclasses
> - The latest kernel driver for the Intel e1000e PCI express ethernet giga=
bit
> driver
> - The initramfs-udev module that I had posted earlier to the list and had=
n't
> been integrated yet.
>
> These are based off of our branch which is 1.5 years old, so if anyone wa=
nts to
> integrate these, some porting is likely required (e.g. with the new check=
sum
> mechanism).
>
> If anyone wants to try the latest and greatest Snort on their system, the=
se
> changes will be of interest :)

Thanks for the work. However if you want to publish it for upstream
integration, its
better to be rebased on master. You being the most knowledgeable
person on your patches is best
fit to do that than one of the maintainers. That will make it more
probable that someone
will integrate them

>
> --
> Kelvie Wong
> Software Developer
>
> Wurldtech Security Technologies Inc.
> Suite 1680 - 401 West Georgia St.
> Vancouver, B.C. =C2=A0V6B 5A1
> Canada
>
> Phone: =C2=A0 =C2=A0 =C2=A0 + 1.604.669.6674
> Toll Free: =C2=A0 + 1.877.369.6674
> Fax: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + 1.604.669.2902
> Website: =C2=A0 =C2=A0http://www.wurldtech.com/
>
> "ARE YOU ACHILLES CERTIFIED?"
>
> This message is intended only for the named recipients. This message
> may contain information that is privileged, confidential or exempt
> from disclosure under applicable law. Any dissemination or copying
> of this message by anyone other than a named recipient is strictly
> prohibited. If you are not a named recipient or an employee or agent
> responsible for delivering this message to a named recipient, please
> notify us immediately by telephone at 604-669-6674, and permanently
> destroy this message and any copies you may have. Email may not be
> secure unless properly encrypted.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


