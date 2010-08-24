Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@rkmorris.us>) id 1OnxWh-00083J-4I
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 19:43:34 +0200
Received: from server ([unknown] [71.170.86.183]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7O009VY11N1PA0@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	24 Aug 2010 11:41:47 -0500 (CDT)
Received: from server [127.0.0.1] by server (Axigen)
	with ESMTPSA id 08347B; Tue, 24 Aug 2010 11:41:36 -0500
Received: from [192.168.1.2] by rkmorris.us with HTTP; Tue,
	24 Aug 2010 11:41:35 -0500
From: <openembedded@rkmorris.us>
Date: Tue, 24 Aug 2010 11:41:35 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1282668095790087500@rkmorris.us>
In-reply-to: <AANLkTim+-=cuW25MrceDNWwExvw+gHcs=jdaw8LCo17L@mail.gmail.com>
References: <1282619507633564500@rkmorris.us>
	<AANLkTim+-=cuW25MrceDNWwExvw+gHcs=jdaw8LCo17L@mail.gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 4
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: openembedded@rkmorris.us
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Build Directory inside conf
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
X-List-Received-Date: Tue, 24 Aug 2010 17:43:37 -0000
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
Maybe we're not talking about the same thing ... but to confirm - inside t=
he conf directory there is a build directory, with the file "Power Macintos=
h-darwin.conf" inside. Is this really supposed to be part of the "official"=
 build?
Thanks!

On Tue, Aug 24, 2010 08:53  AM, Chris Larson <clarson@kergoth.com> wrote:
> On Mon, Aug 23, 2010 at 8:11 PM, <openembedded@rkmorris.us> wrote:
>=20
> > One item that may need to be cleaned up - there seems to be a copy of
> > "build=E2=80=8B" inside "conf".
>=20
>=20
> As there should be.  conf/bitbake.conf includes
> conf/build/${BUILD_SYS}.conf.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From kergoth@gmail.com Tue Aug 24 20:22:33 2010
Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ony8Z-0002uq-UV
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 20:22:33 +0200
Received: by wwi14 with SMTP id 14so1983681wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 11:21:51 -0700 (PDT)
DKIM-Signature: v
