Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QhK2W-0002HK-9e
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 13:26:56 +0200
Received: by wwi18 with SMTP id 18so207063wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 04:20:34 -0700 (PDT)
Received: by 10.216.229.220 with SMTP id h70mr6116754weq.1.1310642434258;
	Thu, 14 Jul 2011 04:20:34 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n33sm98138weq.12.2011.07.14.04.20.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jul 2011 04:20:33 -0700 (PDT)
References: <1865303E0DED764181A9D882DEF65FB6A7FC150F62@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A7FC150F62@shsmsx502.ccr.corp.intel.com>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <C0478FA8-57E0-4AEC-922E-6D24C60405C1@dominion.thruhere.net>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 14 Jul 2011 13:20:21 +0200
To: "Cui, Dexuan" <dexuan.cui@intel.com>
Cc: Koen Kooi <koen@openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Did the chromium recipe even build fine in OE?
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
X-List-Received-Date: Thu, 14 Jul 2011 11:26:56 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

It built for armv7a when I imported it for AI git, but it has bitrotted sinc=
e then

Op 14 jul. 2011 om 12:35 heeft "Cui, Dexuan" <dexuan.cui@intel.com> het volg=
ende geschreven:

> Hi all, I'm trying to port the chromium recipe from OE to Poky.  After som=
e investigation, I doubt it could ever build in OE?
>=20
> 1) The last update to the recipe happened in Apr, 2010 -- 15 months ago. S=
ince that, the locations of some repos have changed, e.g., in custom_cached_=
svn, the locations of native_client, JavaScriptCore, WebCore and WebKit/chro=
mium have changed; looks pywebsocket and patched-ffmpeg-mt have been dropped=
 from the repos. So I updated and commented them accordingly to make do_fetc=
h and do_fetch_post pass.
> BTW: the size of the whole source codes is really big -- more than 3G byte=
s!
>=20
> 2) The file include.gypi is for ARM only, so I belive the recipe was only t=
ested for ARM target, if there was any test?
> So I moved the file into the same directory where gypi.patch is in and upd=
atd include.gypi by changing 'target_arch' to 'ia32' and replacing 'armv7' a=
nd 'arm' to 'ia32'.
>=20
> With my changes, do_configure can pass, but do_compile fails (A sligher lo=
nger long is at http://pastebin.com/8w9LJTsa) :
> | /bin/sh: /bin/i586-poky-linux-ar: No such file or directory
> | make: *** [out/Release/obj.target/v8/tools/gyp/libv8_nosnapshot.a] Error=
 127
>=20
> The 'sysroot' include.gyp is empty. This might be the cause?=20
>=20
> I'm trying to look into this.=20
> Please comment.
> Any suggestion is appreciated!
>=20
> Thanks,
> -- Dexuan
>=20
>=20


