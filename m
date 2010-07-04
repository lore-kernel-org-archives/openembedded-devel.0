Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OVTXi-000258-TM
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 20:03:51 +0200
Received: by iwn34 with SMTP id 34so4856278iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jul 2010 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=S6JP8jnASkZbJ4bKHHiJ/rVoPv522MHgLd6NwPkuuVs=;
	b=egzh8UQOEY2YgonzcIOaobrtEEp4paYmhwr2UfAM9sandipdJyLAag/mRaDRPA/YmO
	x1kTUgk83Kp+bYq3PC95/YJlH3MzKfkn3bD9n3wz25SNJI+mHEGVw9IlpSqA0k7B39jo
	fRb1UnwkVpfWfKUgFsVbxgVDTIScCqXcXD1r4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=IjTKvBzARa4C5RZMb1/hl6css8lSbOBpYE25BI66M3AAZA6Xd8HaNijqxVO2I/MsFL
	+4OpuSCfdlQy88LNMYu/l8zWU6vVAWsGZsrTC6sd/7BC+rV99JBd/CoMNGbwPQ/gjJ/o
	nfdRLxXg2oHImJP6vGfjoc7CRQzlsx/s+TI+A=
Received: by 10.231.150.18 with SMTP id w18mr2226969ibv.43.1278266344209; Sun, 
	04 Jul 2010 10:59:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Sun, 4 Jul 2010 10:58:44 -0700 (PDT)
In-Reply-To: <4C3092C5.5060606@station51.net>
References: <4C2CE2E6.3050708@station51.net> <4C3092C5.5060606@station51.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Jul 2010 10:58:44 -0700
Message-ID: <AANLkTil9SMIAhB8Z7wEJ8uzgIT0aVpbK8R6CNgKzc6mu@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenLDAP 2.4.21. doesn't create packages
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
X-List-Received-Date: Sun, 04 Jul 2010 18:03:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 4, 2010 at 6:55 AM, Bill Sargent <butters@station51.net> wrote:
>
>
> On 7/1/2010 8:48 PM, Bill Sargent wrote:
>>
>> =A0Hello,
>>
>> I'm trying to add the openldap 2.4.21 recipe to my bootable image, and i=
t
>> doesn't seem to be creating the packages. It installs only the libs and =
no
>> binaries (slapd etc..) ... I looked at the recipe and it seems it should=
 be
>> creating some bin package as well as base etc... but I haven't seen any =
in
>> my packages directories.
>>
>> Can someone explain to me what is wrong? Is there a problem with the
>> openldap recipe?
>>
>> Thanks
>> Bill
>
> Well I wrote this the other day and as usual, nobody responded. I finally
> got it to spit out libldap-2.40*.ipk with the slapd etc... however, addin=
g
>
> libldap-2.4-slapd
> and
> libldap-2.4-bin
>
> to my IMAGE_INSTALL variable doesn't seem to work. Can someone explain to
> me, the correct way to install a full working openldap server and utiliti=
es
> into an image?

suppose your image is console-image then you can add something like
below to your local.conf

IMAGE_INSTALL_append_pn-console-image =3D " libldap-2.4-slapd libldap-2.4-b=
in"



>
> As much documentation as there is for this, apparently we need a list of
> installable packages as well since the filenames don't exactly always mea=
n
> that it's a package name thats installable. =A0If there is one, I've miss=
ed it
> I think :)
>
> Thanks,
> Bill
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


