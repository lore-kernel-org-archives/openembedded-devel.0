Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ot8U3-0005RO-7s
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 02:25:52 +0200
Received: by iwn2 with SMTP id 2so5697764iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 17:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=iBmCS99eh0HY8STdf7BUVJXlGFLRXtmwfxWiImpJaqc=;
	b=xRm15JmivEaAzc+MP8EQa5Kh4KjeAlJscMQJWcQc8V5+62QdPPYQWHs0MeIlKw7c4a
	R+UPXLomBcGeLJPFHskaVH9GMl+qIwJStRxdn7xXUSnLGrQAb+NeDN3GIHTtus1WgrLu
	lY/sl48hu3uYmwoecWoKIdhjbMvwHgRPSYKFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=R74D0zzUxXmRBbESBxwXFGk0RfPeK+Rga0YJHPLIL8bpm1DfbQ34abV0we48WY6pX4
	s4TK6PcfQoam0GcHMKtiwZC+t/moz6OH2I9BI9zeF38PqWaa0Rc8EZ613PWsbqgeWkzj
	ZnaKaKeisjxc6ljtR5+H2rz4n6jLPl8CY3qgc=
Received: by 10.231.171.7 with SMTP id f7mr8852170ibz.72.1283905508159; Tue,
	07 Sep 2010 17:25:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Tue, 7 Sep 2010 17:24:48 -0700 (PDT)
In-Reply-To: <1283867878.26335.305.camel@rex>
References: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
	<AANLkTinBzdnAYv_0O=vXnaJ5VNj56Th74eZ=naVSFcFB@mail.gmail.com>
	<AANLkTikSBQOi6aC0W8QzfEOk6skMcBmbaJdmE4K+Auwd@mail.gmail.com>
	<20100906035002.GB5320@gmail.com>
	<AANLkTinvnAhcr63sm=O+s+iyZw8tKfspjzhR__XOb5mU@mail.gmail.com>
	<AANLkTi=zkn=Ns7MgcakxC8F61O9it3FTYb8XgtHRmcrD@mail.gmail.com>
	<AANLkTimNk1mKqHBsfW6S-KuQkbVyT8f4ajz1d8adDFcc@mail.gmail.com>
	<20100906201144.GA8176@rhein.zuhause.netz>
	<1283867878.26335.305.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Sep 2010 17:24:48 -0700
Message-ID: <AANLkTin7ycs2-AB3ws69DeD9TSYN28JmLdLq+_md9ZLA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: virtclass_install prepend
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
X-List-Received-Date: Wed, 08 Sep 2010 00:25:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2010 at 6:57 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Mon, 2010-09-06 at 22:11 +0200, Henning Heinold wrote:
>> > >> The code is:
>> > >> do_install_virtclass-native_prepend() {
>> > >> =A0 =A0 =A0 =A0 install -d ${D}${datadir}/dbus
>> > >> =A0 =A0 =A0 =A0install -m 0644 dbus-bus-introspect.xml ${D}${datadi=
r}/dbus
>> > >> }
>> > >>
>> > >> Actually if the standard do_install needs to be changed, it general=
ly
>> > >> raises some alarms with me.
>> > >> Why would we need to install something that the package normally do=
es
>> > >> not install?
>> > >> (of course this could be a bug in the package, but then I would pre=
fer
>> > >> a patch that we also try to push upstream).
>> > >>
>> > >
>> > > Agreed, that is odd. =A0If it's something that dbus using things mig=
ht need,
>> > > why is it only prepended for the native version, and as you say, why=
 is it
>> > > not installed by the upstream install target. =A0I'd do a git blame =
and figure
>> > > out who added that and ask them :)
>> > > --
>> >
>> > Henning,
>> > Git blame gives your name as the person who created those lines.
>> > Care to comment?
>> >
>> > Frans
>>
>> if I remember correctly this file is generated in the build process. But=
 somehow
>> in the later versions of dbus-glib there is somehow an error so this fil=
e gets not installed
>> at all in the native variant. So I did it per hand.
>
> I suspect that code could well have come from Poky. In this case the
> native recipe generates a file which is then used by the target builds.
> It can't be generated in the target recipe as that would mean running
> target binaries.
>
> So it is in fact a perfectly valid thing to do in this case.

wow cool. This needs to be in the comments in that code.

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


