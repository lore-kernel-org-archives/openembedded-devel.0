Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OgCpV-00030O-Oq for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 10:26:40 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet2.eads.net with ESMTP; 03 Aug 2010 10:24:00 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Tue, 3 Aug 2010 10:26:08 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 3 Aug 2010 10:26:07 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 3 Aug 2010 10:26:05 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5B32@deimsg40.de.net.world>
In-Reply-To: <201008031722.39507.marc@cpdesign.com.au>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Problems building gdb-cross-sdk
Thread-Index: Acsy31yyaMnqG2s9SXKjoyLL4JpKMgABRzBg
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5ADD@deimsg40.de.net.world>
	<201008031722.39507.marc@cpdesign.com.au>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 03 Aug 2010 08:26:08.0163 (UTC)
	FILETIME=[85AA6F30:01CB32E5]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problems building gdb-cross-sdk
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
X-List-Received-Date: Tue, 03 Aug 2010 08:26:41 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

>>As a work around you can delete the existing toolchain installed at=20
>>/usr/local/angstrom/..... The build finishes, but I don't know what =
the=20
>>fallout is..
 =20
well, an installed toolchain is the difference between both systems.

There must be a bug in some of the involved classes loosing/mangle the =
${SYSROOT_DESTDIR} and
${STAGING_DIR_TARGET} variables.

Some ideas ?

Regards
Wolfgang Hauser

-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Marc Reilly
Gesendet: Dienstag, 3. August 2010 09:23
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] Problems building gdb-cross-sdk

On Monday, August 02, 2010 11:06:16 pm Hauser, Wolfgang (external) =
wrote:
> Hello,
>=20
> I am running in strange problems while building gdb-cross-sdk.

snip

>   File "relocatable_binaries_preprocess", line 4, in <module>
>   File "relocatable_binaries_preprocess", line 2, in
> relocatable_binaries_preprocess
>   File "<bb>", line 7, in rpath_replace
>   File "<bb>", line 33, in process_dir
> OSError: [Errno 1] Operation not permitted:
> '//usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-nm'
> <<<<<
>=20
> the production VM is drived from the test VM, so the used environment =
is
> mostly the same.
>=20
> The python routine obviously loose or mangle the ${SYSROOT_DESTDIR} =
and
> ${STAGING_DIR_TARGET} Variable, but I can't figure out why.

I had the same problems the other day. SYSROOT_DESTDIR was empty and so =
OE was=20
trying to work on the files that were already in place. (which fails due =
to=20
permission probs.)

=20
> Instead of =
'//usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-nm'
> it should be something  like
> =
'/angstrom/temp/angstrom-omap3evm/work/i686-armv7a-sdk-angstrom-linux-gn
> ueabi/gdb-cross-sdk-7.1-r6.0/temp' I suppose.
>=20
> Has someone an idea what's going on ?
Sadly, I'm too new to all this. So I don't.

As a work around you can delete the existing toolchain installed at=20
/usr/local/angstrom/..... The build finishes, but I don't know what the=20
fallout is.. =20

(I did notice that a note that said this recipe uses legacy staging, but =
I'm=20
not really sure what that means. Could that be something?)

Cheers
Marc





_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


