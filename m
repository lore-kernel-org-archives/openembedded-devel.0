Received: from [209.85.217.220] (helo=mail-gx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N4BRs-0003wr-U8
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 11:44:48 +0100
Received: by gxk20 with SMTP id 20so5224705gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Oct 2009 03:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=w0FPj2R6iFJETbklOApN6njjsJKQx/WjoTZPZLj6oNQ=;
	b=ksB9KU+jUHrRT8/IhcnexhY8D+KYaQmqHJMppJ4x2/be0nYz+SJP7OCNr5FnP5KtAI
	WkUjZyppfE6IuNYXdrHAVdfiDIu5yCy/UIoeT6KJU+iiPY2MPgu/PCviGupE4ydeZ1DJ
	4niKXQrXYE8dezHeJcTobGZWY6J0QGHj8d9Is=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=oZ2LN/NpYr+WojVSIF251HCXZqM37jU4nnv+3kdX+eqI/OAopsaeimDzDo8SbEKJHC
	YbFJiUid1XZ9CfAWdgUw0awKtyC1yC0Ni5TZaNfwYfSb4elw3FefdJ1VY8kpazaWgzQE
	cxH35dQMDHupWQMU8n2mi7bORkhLvni4reP8Q=
MIME-Version: 1.0
Received: by 10.101.136.11 with SMTP id o11mr2449990ann.31.1256985815485; Sat, 
	31 Oct 2009 03:43:35 -0700 (PDT)
In-Reply-To: <20091031073914.GE16188@denix.org>
References: <ac9c93b10910300040v779f8446k31de3dfc2b2fe298@mail.gmail.com>
	<hcf53t$4jp$1@ger.gmane.org>
	<ac9c93b10910301032s160461bv2c1ddf5a2a7736ec@mail.gmail.com>
	<20091031073914.GE16188@denix.org>
Date: Sat, 31 Oct 2009 11:43:35 +0100
Message-ID: <ac9c93b10910310343k66101f0dk333cb138e777232e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.220
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: about staging
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
X-List-Received-Date: Sat, 31 Oct 2009 10:44:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/10/31 Denys Dmytriyenko <denis@denix.org>:
> On Fri, Oct 30, 2009 at 06:32:05PM +0100, Frans Meulenbroeks wrote:
>> 2009/10/30 Koen Kooi <k.kooi@student.utwente.nl>:
>> > On 30-10-09 08:40, Frans Meulenbroeks wrote:
>> >>
>> >> Hi,
>> >>
>> >> Yesterday I ended up in a discussion on staging in #oe (ok, ok, I
>> >> mainly caused the discussion :-) )
>> >> Also based upon that I looked at various recipes on how people
>> >> implement staging.
>> >>
>> >> There does not seem to be really standard way.
>> >> Some recipes copy from ${S} which ihmo is not desirable; i think it
>> >> should be a file that is exported by the application).
>> >> Others use other mechanisms.
>> >>
>> >> For my own recipe I ended up with something like:
>> >>
>> >> do_stage() {
>> >> =A0 =A0 =A0 =A0 install -d ${STAGING_INCDIR}
>> >> =A0 =A0 =A0 =A0 install -d ${STAGING_INCDIR}/${PN}
>> >> =A0 =A0 =A0 =A0 install -m 0644 ${D}/${includedir}/${PN}/*.h
>> >> ${STAGING_INCDIR}/${PN}
>> >> }
>> >>
>> >> as that seems the best. ${D} contans the exported/installed files fro=
m
>> >> the application. Those files are the ones the application wants to
>> >> make externally available and those should end up in staging. Not
>> >> something from ${S}.
>> >
>> > Is ${D} garanteed to be present at staging time? I don't think we have=
 a
>> > current hard rule for that.
>>
>> ${D} =3D install subdir, so in my case it is definitely there.
>> but it might be absent in the generic case (e.g. in case of an empty pac=
kage)
>> A solution which automates everything should take that into account
>> (if ${D} does not exist: no action))
>>
>> Btw: as a starter I would already be happy with some scripting that
>> allows easy copying from ${D} to staging
>>
>> (and I hope you agree with me that copying from ${S} to staging should b=
e a no)
>
> Hmm, I guess I missed the discussion on irc, but I don't think the above
> statement is correct. For example, -native packages do have do_stage and
> ususally don't have do_install. Also, staging some files w/o installing t=
hem
> on the "target" (either the main or -dev package) may be desireable in so=
me
> cases...

Ok, ofc I am a n00b when it comes to the build process.
If things work differently and properly for native, then this should
be done for non-native pacakges only.
What I want to get clear is what the basic flow should be.
For me the staging dir is the place where the libs, includes, tools
etc go that are needed for building packages).
If a package X delivers a .h file for general usage, it is normally
exported through make install.
For OE I would expect install to put it in the install dir or perhaps
in staging.
Bypassing install and selectively copying stuff from ${S} does not
seem right to me.
Also if things are missing and stuff is missing, the install from the
package should be fixed

Doing all kind of things manually in  do_stage will cause
inconsistencies and is error prone.(and IMHO should be avoided)

Just my $ 0.02

Frans


