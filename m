Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OR0jX-0006cq-Qe
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 12:29:39 +0200
Received: by bwz14 with SMTP id 14so1541183bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CdOk8sjAwp4MDL7CLKS9PKWYcT6TosfpLlrUOhyyTH4=;
	b=hmuSwcMyQTDC8wSOUFSYD8otkVvQ+pZVWt7/zgIpzbw4Y1C9RqObYGJEtzMEaDa+rH
	hFm7dT5Ro3/ywMRkeEcDc6WgVafpGHUD93vCAcEOM9/1aY32O4VbL79CC2tiKPv/tdsY
	5BaNsM8NutIQG/+UcsEZuaPoeDAJBt9Ig9HW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FobeA6bfuBQSa30KM8iPX+k3PiPCPRQZ8y4u/8b0eRm3f0jAjpZKrXzK4N5c6Mv68V
	2AW0jmL8D6burclqRFHLpd4lbbAmUAEapSe/KMwNYtsDraQyHIhM89ehjZ/KD90eQo5p
	L/SnQbMMjLN6VytJkx5RiiOObqI2LXpJcavj4=
MIME-Version: 1.0
Received: by 10.204.81.223 with SMTP id y31mr4037543bkk.87.1277202302573; Tue, 
	22 Jun 2010 03:25:02 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Tue, 22 Jun 2010 03:25:02 -0700 (PDT)
In-Reply-To: <1277198604.4745.99.camel@lenovo.internal.reciva.com>
References: <AANLkTim2-Y4qW9Wb-kycxo89vNZgBJkdeVSyERXZYCoJ@mail.gmail.com>
	<1277198604.4745.99.camel@lenovo.internal.reciva.com>
Date: Tue, 22 Jun 2010 12:25:02 +0200
Message-ID: <AANLkTin1IZwCLcNhNwbY8o1AA372K5R4kOVAEdJ5EpJQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] patch file location
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
X-List-Received-Date: Tue, 22 Jun 2010 10:29:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/22 Phil Blundell <philb@gnu.org>:
> On Tue, 2010-06-22 at 09:03 +0200, Frans Meulenbroeks wrote:
>> Frankly speaking I have no clue at all which version of the patch will
>> be used by the 2.10.1 recipe. The only ways to find out is to study
>> the class code that does the patch or to actually build the package
>> (in the hope it selects the patch in a deterministic way). I don't
>> think it is good that if someone is debugging a problem that they
>> should have such a hard time to find out what version of a file is
>> actually used
>
> See glibc_2.10.1.bb:
>
> FILESPATHPKG =3D. "glibc-2.4:"
>
> So, the answer is that it will use the version from the glibc-2.4
> directory.
>
> I think the semantics of FILESPATHPKG are documented in the manual. =A0If
> they're not, that is an oversight and should indeed be corrected.

Couldn't find it and googling for
site:docs.openembedded.org FILESPATHPKG
did not return any results

FM
>
>> (optionally we might allow for a mechanism that allows specifying
>> patches for higher level recipes; e.g. glibc_2.10.1 could look in
>> glibc-2.10.1, glibc-2.10, glibc-2, glibc and files).
>
> You can already do this with a suitable FILESPATHPKG setting, I think.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


