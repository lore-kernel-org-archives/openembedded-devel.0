Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MCdTc-000183-3Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 19:45:12 +0200
Received: by bwz19 with SMTP id 19so1669597bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2009 10:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6xaP3qknC8BHJ0JtVZ+7PeLxkXi6FN0t9yvYzhiZ0mA=;
	b=ESEkkVqkxj9I7xLk8pn/CbwHBiYcbScuB7h4+qLVN+CS2+6VM7yg6IXqP3ZiOkxx0q
	7MhYBboACG0dMLRmcpIJoRaRTD3m+2yYnqj8z3KGdUUipBN1/42a4aAJlfTvEbONO/6s
	VsvA75CbWRy88suW7FUNvb+C5799dcbI8wGGk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rdc4cwkZfeeiLVte+Ks9bMKRcDeX1ESUbEAh4LiexfEuCwgjsUesvxR/v/qoqubl+P
	pbe63DAC9o+aazaK41rb3GIkujBHDs2HBrJHAO/+xaZYvFFHS/sWEW9fEOqPlcqeVWvm
	3CA6Cly+eel14wkzBbj0UMAuRLhWjM+mbvoFw=
MIME-Version: 1.0
Received: by 10.103.223.2 with SMTP id a2mr2326478mur.88.1244223358226; Fri, 
	05 Jun 2009 10:35:58 -0700 (PDT)
In-Reply-To: <20090605154522.GU26065@smtp.west.cox.net>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603160458.GK26065@smtp.west.cox.net>
	<fce2a370906050147v358df2f5s9433626b25fe9003@mail.gmail.com>
	<20090605154522.GU26065@smtp.west.cox.net>
Date: Fri, 5 Jun 2009 20:35:56 +0300
Message-ID: <fce2a370906051035j4fc55bb6td618695a85242728@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 Jun 2009 17:45:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2009 at 6:45 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Fri, Jun 05, 2009 at 11:47:04AM +0300, Ihar Hrachyshka wrote:
>> On Wed, Jun 3, 2009 at 7:04 PM, Tom Rini<trini@embeddedalley.com> wrote:
>> > On Wed, Jun 03, 2009 at 06:37:16PM +0300, Ihar Hrachyshka wrote:
>> >
>> >> +do_populate_sdk_append() {
>> >> + =C2=A0 =C2=A0 =C2=A0 script =3D "${SDK_OUTPUT}/${prefix}/environmen=
t-setup"
>> >> + =C2=A0 =C2=A0 =C2=A0 touch $script
>> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_CC=3D${TARGET_SYS}-gcc' =
>> $script
>> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_CXX=3D${TARGET_SYS}-g++'=
 >> $script
>> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_LINK=3D${TARGET_SYS}-g++=
' >> $script
>> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_LIBDIR_QT=3D${prefix}/${=
TARGET_SYS}/${layout_libdir}' >> $script
>> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_INCDIR_QT=3D${prefix}/${=
TARGET_SYS}/${layout_includedir}/${QT_DIR_NAME}' >> $script
>> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_MOC=3D${prefix}/${layout=
_bindir}/moc4' >> $script
>> >> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_UIC=3D${prefix}/${layout=
_bindir}/uic4' >> $script
>> >> +
>> >> + =C2=A0 =C2=A0 =C2=A0 # Repack SDK with new environment-setup
>> >> + =C2=A0 =C2=A0 =C2=A0 cd ${SDK_OUTPUT}
>> >> + =C2=A0 =C2=A0 =C2=A0 fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_OUT=
PUTNAME}.tar.bz2 .
>> >> +}
>> >
>> > I see two minor problems. =C2=A0First, environment-setup is going to e=
xist so
>> > we don't need to touch it again. =C2=A0In fact, the variable should st=
ill be
>> > set, but for clarity we should just comment (in case the file gets
>> > renamed to say environment-setup.sh (if we add in a *csh style one
>> > too)). =C2=A0Second, we should update, not recreate the tarball (tar -=
jf ...
>> > --add-file=3D${prefix}/environment-setup, I think).
>>
>> 1) Touching existing file is not a problem.
>
> But changing the name (for say once my *csh using cowork or customer
> bugs me about it) will break here.

Sorry, but I don't get your point... Please explain me.

>
>> 2) You can't append to compressed tar files.
>
> Ah, true.
>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


