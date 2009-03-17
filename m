Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chouimat@gmail.com>) id 1Ljb1u-0001gK-L5
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 16:16:49 +0100
Received: by rv-out-0708.google.com with SMTP id k29so46025rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 08:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=uZp6JT3S2FXW0uLsL7E2ou2/5DgNKhNxtdskNrWIVME=;
	b=r53ootqrWj7Dn6WjeMXZYqmbD3Fc3At3AuUiFAq5cCLi88wP5G9GO9vv7KflLefKxF
	fTG0kLX2Pudia8qklM2L9URIQgmSaB0j5UmEPVYnXDr6J0z/9Iz0rBvD+03dfS+r68/j
	4+DY+IKPnxT+eeJ7BadoSV7j+AEkYpo2zFgPs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=R0bMYMVyzHaHNunPaUCNb45TjW27SdgwDCzjPcwA5/FHinB9/5931f/EmxRYhENlY2
	ENtAZ9LUottsr6o7SdGG9CrJiOCf3Qp5vOJ6TxhSTxPs1Jvp314nAS8Vrh8gIP6Lsf/l
	W7+aOvfMjayx4gUyi8W9hohb7xrQcP567c1X0=
MIME-Version: 1.0
Received: by 10.141.41.12 with SMTP id t12mr20269rvj.289.1237302949356; Tue, 
	17 Mar 2009 08:15:49 -0700 (PDT)
In-Reply-To: <gpodc3$nos$1@ger.gmane.org>
References: <200903171538.21499.marcin@juszkiewicz.com.pl>
	<gpodc3$nos$1@ger.gmane.org>
Date: Tue, 17 Mar 2009 11:15:49 -0400
Message-ID: <f5dc33530903170815q1d6ffcbam16e3ea809736c51b@mail.gmail.com>
From: Mathieu Chouinard <chouimat@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.198.244
X-SA-Exim-Mail-From: chouimat@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RDNS_NONE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: RFC: new stable release
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
X-List-Received-Date: Tue, 17 Mar 2009 15:16:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2009 at 10:50 AM, Koen Kooi <k.kooi@student.utwente.nl>wrot=
e:

> On 17-03-09 15:38, Marcin Juszkiewicz wrote:
>
>  Which things needs defining? I have few in mind:
>>
>> 1. Adding new things. This should be possible only by backporting from
>>    OE.dev tree and needs to be Acked by at least 2-3 developers which
>>    use stable branch. New code has to build for at least one distro and
>>    ARM+x86 architectures (unless it is related to one arch or even one
>>    machine).
>>
>
> So things must get tested before committing, right?
>
>  2. Marking recipes as buildable or not. With over 6000 of them it is
>>    really hard to check everything for status. We can remove many old
>>    versions but sometimes they are useful for some projects. I would
>>    rather add things like BUILDABLE_armv4t =3D "1" into recipe or into
>>    conf/distro/include/${DISTRO}-status.inc file. Similar status for
>>    recipes which are known to not work for some archs.
>>
>
> Just have a CSV file that includes the test coverage for package +
> machines. We can have one per distro. If needed we can extract the info f=
rom
> tinderbox after we've done a few builds.
>
>  3. Dealing with non buildable stuff. We have 'nonworking' and 'obsolete'
>>    dirs in metadata - both should be dropped in stable branch. Other
>>    recipes can be marked as not buildable or dropped from branch - I did
>>    not thought yet on it.
>>
>
> That does mean you can't easily resurrect recipes, but seeing that only
> happens once every 5 years or so..
>
>  4. Lifetime of branch. Will we do new stable release after 6 months or
>>    after one year? For how long stable branch will be supported by OE
>>    itself? I know that there will be companies which will provide
>>    support for longer time - thats what I do with Poky 'pinky' now.
>>
>
> The previous branch had a 12 + 3 month lifecycle, 12 months of support th=
en
> 3 months to wind down.
>
>  What do you feel about it? Any opinions or suggestions? Want to join
>> effort?
>>
>
> I certainly want to join the effort, but I fear that creating a stable
> branch might make some people more inclined to dump even worse crap in .d=
ev,
> which would not be a good thing. So *if* we go with a stable branch we
> should make sure .dev well be in a good shape as well.
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailmanM<http://lists.linuxtogo.org/cg=
i-bin/mailman/listinfo/openembedded-devel>


Simply create a .exp branch for this
Mathieu
--=20
there is an old Greek saying that goes like this:
=93There are two kinds of people in this world that
go around beardless=97boys and women=97and I am neither one.=94

