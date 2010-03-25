Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nurvd-0005a5-MJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 19:37:14 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NursX-0007U2-NP from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 11:34:01 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 25 Mar 2010 11:33:58 -0700
Received: from 172.30.80.117 ([172.30.80.117]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 25 Mar 2010 18:33:22 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	25 Mar 2010 11:33:21 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100325180115.GD28005@denix.org>
References: <48239d391003250816m3686a994h92fd5a115c3f47d4@mail.gmail.com>
	<20100325180115.GD28005@denix.org>
Organization: Mentor Graphics Corporation
Date: Thu, 25 Mar 2010 11:33:21 -0700
Message-ID: <1269542001.3545.56.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 25 Mar 2010 18:33:58.0688 (UTC)
	FILETIME=[BBADAA00:01CACC49]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,
	MIME_QP_LONG_LINE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [SDK] meta-toolchain.bb generates very interesting environment-setup
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
X-List-Received-Date: Thu, 25 Mar 2010 18:37:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-03-25 at 14:01 -0400, Denys Dmytriyenko wrote:
> On Thu, Mar 25, 2010 at 06:16:49PM +0300, Sergey Lapin wrote:
> > $ cat /usr/local/angstrom/arm/environment-setup
> > export SDK_PATH=3D/usr/local/angstrom/arm
> > export TARGET_SYS=3Darm-angstrom-linux-gnueabi
> > export PATH=3D$SDK_PATH/bin:$PATH
> > export CPATH=3D$SDK_PATH/$TARGET_SYS/usr/include:$CPATH
> > export LIBTOOL_SYSROOT_PATH=3D$SDK_PATH/$TARGET_SYS
> > export PKG_CONFIG_SYSROOT_DIR=3D$SDK_PATH/$TARGET_SYS
> > export PKG_CONFIG_PATH=3D$SDK_PATH/$TARGET_SYS/usr/lib/pkgconfig
> > export CONFIG_SITE=3D$SDK_PATH/site-config
> > alias opkg=3D'LD_LIBRARY_PATH=3D/lib /bin/opkg-cl -f //etc/opkg-sdk.con=
f -o '
> > alias opkg-target=3D'LD_LIBRARY_PATH=3D/lib /bin/opkg-cl -f //etc/opkg.=
conf -o /'
> >=20
> > A problem seems to be this code:
> >=20
> > # Create environment setup script
> >         script=3D${SDK_OUTPUT}/${SDKPATH}/environment-setup
> >         touch $script
> >         echo 'export SDK_PATH=3D${SDKPATH}' >> $script
> >         echo 'export TARGET_SYS=3D${TARGET_SYS}' >> $script
> >         echo 'export PATH=3D$SDK_PATH/bin:$PATH' >> $script
> >         echo 'export CPATH=3D$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' =
>> $script
> >         echo 'export LIBTOOL_SYSROOT_PATH=3D$SDK_PATH/$TARGET_SYS' >> $=
script
> >         echo 'export PKG_CONFIG_SYSROOT_DIR=3D$SDK_PATH/$TARGET_SYS' >>=
 $script
> >         echo 'export
> > PKG_CONFIG_PATH=3D$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
> >         echo 'export CONFIG_SITE=3D$SDK_PATH/site-config' >> $script
> >         echo "alias opkg=3D'LD_LIBRARY_PATH=3D$SDK_PATH/lib
> > $SDK_PATH/bin/opkg-cl -f $SDK_PATH/${sysconfdir}/opkg-s
> > dk.conf -o $SDK_PATH'" >> $script
> >         echo "alias opkg-target=3D'LD_LIBRARY_PATH=3D$SDK_PATH/lib
> > $SDK_PATH/bin/opkg-cl -f $SDK_PATH/$TARGET_SYS${
> > sysconfdir}/opkg.conf -o $SDK_PATH/$TARGET_SYS'" >> $script
> >=20
> >=20
> > it seems that $SDK_PATH in last two lines gets resolved instead of
> > being written literally. adding \ before $ in these lines seems to fix
> > this problem. Is it appropriate fix?
>=20
> Ah, interesting... It worked for me when the last two lines had double qu=
otes=20
> inside single quotes. But to match RP's styling, I had to revert that to=20
> single quotes inside double quotes and it doesn't seem to work:
>=20
> $ echo 'show "$SDK_PATH"'
> show "$SDK_PATH"
>=20
> $ echo "show '$SDK_PATH'"
> show ''
>=20
> I wonder if it would be Ok to revert back to the original quoting... Or i=
s=20
> escaping with \ a better fix?

Ordered quoting ('""') is how we handle this in other recipes, so we
should do it here.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


