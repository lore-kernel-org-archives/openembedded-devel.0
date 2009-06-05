Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MCfrr-0006Zw-HQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 22:18:23 +0200
Received: by bwz19 with SMTP id 19so1753139bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2009 13:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0MTKE6+4PvtsSwupmKvbmYltF27+rnB9xwM70XbNMAU=;
	b=le0xfpkdNu1bclK+bGTrTc++0zdYF/LcosvvNayKkctzuSR91HmQwUSUEYscsE7nkr
	SB5ukAm5dpVm3nSPXtubpl0j54FJp/Qm6+CjhIdpTx1R4nOjR64oRnkW3bdkjXm9htJa
	cIvwirI/9UTFLvM5/2MEL5jU/Cm+VEMyu56P4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=H9/+yyQcwbubsEViA9jLq4JeakkqjXFH9TQc4GZz85xo5BrQl0SP2yI86yNyUS5icC
	2McGKwYYX76KwPqbCav6afcWA6oTPF2X8Keu0n1Xtc7/LcLZ/fp/kceQFrfDybH1gYLi
	90+E8QEkLui0uY0BaKxc5l+Pro2aQ0I86QLnw=
MIME-Version: 1.0
Received: by 10.103.1.5 with SMTP id d5mr2416695mui.113.1244232549768; Fri, 05 
	Jun 2009 13:09:09 -0700 (PDT)
In-Reply-To: <20090605193532.GD26065@smtp.west.cox.net>
References: <1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603160458.GK26065@smtp.west.cox.net>
	<fce2a370906050147v358df2f5s9433626b25fe9003@mail.gmail.com>
	<20090605154522.GU26065@smtp.west.cox.net>
	<fce2a370906051035j4fc55bb6td618695a85242728@mail.gmail.com>
	<20090605193532.GD26065@smtp.west.cox.net>
Date: Fri, 5 Jun 2009 23:09:09 +0300
Message-ID: <fce2a370906051309w24a1257br33dd65f7e33932e3@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 06/12] meta-toolchain-qte: initial qt embedded toolchain version
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
X-List-Received-Date: Fri, 05 Jun 2009 20:18:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2009 at 10:35 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Fri, Jun 05, 2009 at 08:35:56PM +0300, Ihar Hrachyshka wrote:
>> On Fri, Jun 5, 2009 at 6:45 PM, Tom Rini<trini@embeddedalley.com> wrote:
>> > On Fri, Jun 05, 2009 at 11:47:04AM +0300, Ihar Hrachyshka wrote:
>> >> On Wed, Jun 3, 2009 at 7:04 PM, Tom Rini<trini@embeddedalley.com> wro=
te:
>> >> > On Wed, Jun 03, 2009 at 06:37:16PM +0300, Ihar Hrachyshka wrote:
>> >> >
>> >> >> +do_populate_sdk_append() {
>> >> >> + =C2=A0 =C2=A0 =C2=A0 script =3D "${SDK_OUTPUT}/${prefix}/environ=
ment-setup"
>> >> >> + =C2=A0 =C2=A0 =C2=A0 touch $script
>> >> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_CC=3D${TARGET_SYS}-gc=
c' >> $script
>> >> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_CXX=3D${TARGET_SYS}-g=
++' >> $script
>> >> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_LINK=3D${TARGET_SYS}-=
g++' >> $script
>> >> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_LIBDIR_QT=3D${prefix}=
/${TARGET_SYS}/${layout_libdir}' >> $script
>> >> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_INCDIR_QT=3D${prefix}=
/${TARGET_SYS}/${layout_includedir}/${QT_DIR_NAME}' >> $script
>> >> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_MOC=3D${prefix}/${lay=
out_bindir}/moc4' >> $script
>> >> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_UIC=3D${prefix}/${lay=
out_bindir}/uic4' >> $script
>> >> >> +
>> >> >> + =C2=A0 =C2=A0 =C2=A0 # Repack SDK with new environment-setup
>> >> >> + =C2=A0 =C2=A0 =C2=A0 cd ${SDK_OUTPUT}
>> >> >> + =C2=A0 =C2=A0 =C2=A0 fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_=
OUTPUTNAME}.tar.bz2 .
>> >> >> +}
>> >> >
>> >> > I see two minor problems. =C2=A0First, environment-setup is going t=
o exist so
>> >> > we don't need to touch it again. =C2=A0In fact, the variable should=
 still be
>> >> > set, but for clarity we should just comment (in case the file gets
>> >> > renamed to say environment-setup.sh (if we add in a *csh style one
>> >> > too)). =C2=A0Second, we should update, not recreate the tarball (ta=
r -jf ...
>> >> > --add-file=3D${prefix}/environment-setup, I think).
>> >>
>> >> 1) Touching existing file is not a problem.
>> >
>> > But changing the name (for say once my *csh using cowork or customer
>> > bugs me about it) will break here.
>>
>> Sorry, but I don't get your point... Please explain me.
>
> I've gone back and forth with myself on this. =C2=A0My point is that it's=
 a
> little fragile, if ${SDK_OUTPUT}/${prefix}/environment-setup is renamed
> (it's bash/etc-centric and for example, if my tcsh using coworker bugs
> me, or a customer asks, I'll certainly make a
> ${SDK_OUTPUT}/${prefix}/environment-setup.csh and then push upstream,
> and probably rename the old one to
> ${SDK_OUTPUT}/${prefix}/environment-setup.sh). =C2=A0But, this isn't
> happening right now, and well, even with my suggestion (using $script as
> it's already set) would still be probably equally as fragile.
>
> So, I'm happy with things as-is, sorry for the back-and-forth :)

Ok, I get it :)
But for now we don't support *csh syntax for toolchain setup scripts
so there is no problem with the patch. If you want to add *csh support
feel free to send the needed patch after this patchset is committed in
tree.

>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


