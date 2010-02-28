Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NlfmZ-0004Tq-Fk
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 10:49:51 +0100
Received: by gwj22 with SMTP id 22so706492gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 01:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wdkfGB/HCMkEtGB8A/+53GW8J2oaNFgw/uZEiCOw2HQ=;
	b=gGNxioXQbjhzLKZy5a9TwyABkduMskUF+u/GcxVDUh9UHfSjVmGt4hPlzk/fxWJtqQ
	O/7NN6+oNF6U6n0JIrlbGYjGGsnlgSKqpnIfMJpyQGZdx+4ldU0b1yjtR4TSZMwskxkB
	sP2XGgOhN3k6BOa2Rsdv+IydGygQZ2StTrUNg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TS+Th5eEMEqh+APTPf4S1ME0h8tZjo0k8XBSmLn4XPH4tMEMTPgBR54Tt64swfLB4l
	mgY+b/1DWKHBf81NBLWL3GRDNMrnGSOddruV5c1iP+OagViM2FNkHhrzuItWgEXomFLs
	lqfBsUpKHkGKA90YZjcoYCGf52++etiVXZa1M=
MIME-Version: 1.0
Received: by 10.100.235.24 with SMTP id i24mr3793261anh.155.1267350418715; 
	Sun, 28 Feb 2010 01:46:58 -0800 (PST)
In-Reply-To: <1267329887.9295.20.camel@trini-m4400>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
	<1267303607.5437.446.camel@lenovo.internal.reciva.com>
	<20100228033438.GE30145@xora-desktop.xora.org.uk>
	<1267329887.9295.20.camel@trini-m4400>
Date: Sun, 28 Feb 2010 10:46:58 +0100
Message-ID: <ac9c93b11002280146p76ec28f6ra3c71d66a18720ac@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sun, 28 Feb 2010 09:49:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/28 Tom Rini <tom_rini@mentor.com>:
> On Sun, 2010-02-28 at 03:34 +0000, Graeme Gregory wrote:
>> On Sat, Feb 27, 2010 at 08:46:47PM +0000, Phil Blundell wrote:
>> > On Sat, 2010-02-27 at 16:56 +0000, Graeme Gregory wrote:
>> > > NAK on creating extra levels.
>> > >
>> > > Changing the level where recipes are held is not an option do to the=
 way
>> > > you tell bitbake how to find them.
>> > >
>> > > BBFILES =3D "${OE}/org.openembedded.dev/recipes/*/*.bb"
>> >
>> > Is that really such a big deal? =A0We seemed to manage to switch BBFIL=
ES
>> > from /packages/ to /recipes/ without any major casualties, and I would
>> > have thought that adding an extra level in there would be equally
>> > straightforward. =A0Or of course, even better, the distro-specific rec=
ipes
>> > could go in an overlay which the distro config would select.
>> >
>> I have been talking about using overlays for distros at every OE meetup
>> since kergoth made it easy to do. So I fully support that idea.
>
> This would also move a bunch of the distro overrides into amend.inc
> files in the in-tree distro overlay, just like out of tree users. =A0This
> might help encourage problems to be fixed or better dealt with, perhaps.
>
> -

+1


