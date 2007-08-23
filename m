Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickeyl@linuxtogo.org>) id 1IO8z6-0007DJ-Iq
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 11:28:12 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id DAE5728C013; Thu, 23 Aug 2007 11:24:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=AWL,BAYES_00,NO_REAL_NAME,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,RCVD_IN_XBL 
	autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180189163.adsl.alicedsl.de [85.180.189.163])
	by srv043.dedi23.de (Postfix) with ESMTP id ECE1D28C012;
	Thu, 23 Aug 2007 11:24:06 +0200 (CEST)
Date: Thu, 23 Aug 2007 11:27:01 +0200
From: mickeyl@linuxtogo.org
X-Mailer: The Bat! (v3.99.3) Professional
Organization: OpenMoko
X-Priority: 3 (Normal)
Message-ID: <948196528.20070823112701@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46CD5062.5050308@whitby.id.au>
References: <717ce6e40708230037r2bdd44f3v83180c286fbdd63c@mail.gmail.com>
	<46CD5062.5050308@whitby.id.au>
MIME-Version: 1.0
Cc: List for OpenMoko community discussion <community@lists.openmoko.org>
Subject: Re: 2007.2 compilation failed with package uicmoc4-native-4.0.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2007 09:28:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

From=20OpenMoko-community:

Rod Whitby wrote:
> Phani Kumar Kancharala wrote:
>>  Hi all, =20
>>     I followed the steps in wiki-openmoko to get openmoko on my pc
>> running Ubuntu 7.04 Feisty Fwan. Finally I also ended up with the same
>> error reported by *Frank Gau, *following are the error and logs given by
>> the mokomakefile:
>>=20
>> | kernel/qapplication_x11.cpp:89:31: error: X11/extensions/XI.h: No such
>> file or directory

> Install the host software package which provides the XI.h file.

> It'll be some X11 extensions development package.

> Then update the OEAndYourDistro page on the openembedded wiki to
> highlight that package as a requirement for your host distro.

Hmm, since when is uicmoc-native requiring X? If I recall correctly, I
had always chosen to build the respective -embedded variant of Qt to
not impose the need of having X on the build machine. It looks like we
are now building qt-x11 as provider for uicmoc4. Why did we change that?

--=20
- Michael Lauer <mickey@openmoko.org>                   http://openmoko.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Software for the worlds' first truly open Free Software mobile phone



