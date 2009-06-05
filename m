Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MCVDi-0000mf-SY
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 10:56:14 +0200
Received: by bwz19 with SMTP id 19so1331126bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2009 01:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pEWiQmR+tqXhA6cipaONVzZ76hZ5uSSOLoGjRMSP0c8=;
	b=oyCk0/pT/T5QALcMo2sFnkOJinatxHLcnDdepe4YTrhKs2x1iiOfDGXWK99a4mRziR
	+nUuxhUqp2aGXn3jEoaGIPnqWA4G8lrgUSWG0tGnOZYzvxrt/GjorhS+r5vS39w7hJDq
	fHaoCS00OVQd7saFrwNJWgOJy2g3I2qoZekKc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cXu2bkaCOLPSQlPrLgXAFWqHOhyI7OO+KHPEBsOWaDvTq2WdUOP6z+MYhqy7QATLlq
	KmgQ59l4jKr5TMuoKlbXsFiUHI0aMi+z2APeGEAAAAEvo4kUUtonEN39JBEtmFlYmuzp
	sjFQnJaaY2hajlXU91q3M7KhScCWprjPpkNWI=
MIME-Version: 1.0
Received: by 10.102.228.19 with SMTP id a19mr2032189muh.10.1244191624293; Fri, 
	05 Jun 2009 01:47:04 -0700 (PDT)
In-Reply-To: <20090603160458.GK26065@smtp.west.cox.net>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603160458.GK26065@smtp.west.cox.net>
Date: Fri, 5 Jun 2009 11:47:04 +0300
Message-ID: <fce2a370906050147v358df2f5s9433626b25fe9003@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 Jun 2009 08:56:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2009 at 7:04 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Wed, Jun 03, 2009 at 06:37:16PM +0300, Ihar Hrachyshka wrote:
>
>> +do_populate_sdk_append() {
>> + =C2=A0 =C2=A0 =C2=A0 script =3D "${SDK_OUTPUT}/${prefix}/environment-s=
etup"
>> + =C2=A0 =C2=A0 =C2=A0 touch $script
>> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_CC=3D${TARGET_SYS}-gcc' >> =
$script
>> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_CXX=3D${TARGET_SYS}-g++' >>=
 $script
>> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_LINK=3D${TARGET_SYS}-g++' >=
> $script
>> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_LIBDIR_QT=3D${prefix}/${TAR=
GET_SYS}/${layout_libdir}' >> $script
>> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_INCDIR_QT=3D${prefix}/${TAR=
GET_SYS}/${layout_includedir}/${QT_DIR_NAME}' >> $script
>> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_MOC=3D${prefix}/${layout_bi=
ndir}/moc4' >> $script
>> + =C2=A0 =C2=A0 =C2=A0 echo 'export OE_QMAKE_UIC=3D${prefix}/${layout_bi=
ndir}/uic4' >> $script
>> +
>> + =C2=A0 =C2=A0 =C2=A0 # Repack SDK with new environment-setup
>> + =C2=A0 =C2=A0 =C2=A0 cd ${SDK_OUTPUT}
>> + =C2=A0 =C2=A0 =C2=A0 fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUT=
NAME}.tar.bz2 .
>> +}
>
> I see two minor problems. =C2=A0First, environment-setup is going to exis=
t so
> we don't need to touch it again. =C2=A0In fact, the variable should still=
 be
> set, but for clarity we should just comment (in case the file gets
> renamed to say environment-setup.sh (if we add in a *csh style one
> too)). =C2=A0Second, we should update, not recreate the tarball (tar -jf =
...
> --add-file=3D${prefix}/environment-setup, I think).

1) Touching existing file is not a problem.
2) You can't append to compressed tar files.

>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


