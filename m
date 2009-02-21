Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Lb1ji-0000sR-DI
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Feb 2009 00:58:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id C7D2F140933D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2009 00:56:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NrpLQZ0OiclT
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2009 00:56:23 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 9D8EA140932E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2009 00:56:22 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <49A033F4.4090807@opensimpad.org>
References: <49A033F4.4090807@opensimpad.org>
Date: Sun, 22 Feb 2009 00:55:41 +0100
Message-Id: <1235260541.12178.11.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: tcl tk: tclConfig.sh/tkConfig.sh ${STAGING_BINDIR_CROSS}	or ${STAGING_LIBDIR} ?
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
X-List-Received-Date: Sat, 21 Feb 2009 23:58:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Bernhard Guillon wrote:
> Hi all,
> I am currently try to build hv3 [1] - a super fast and small browser=20
> (dillo2 killer ?).
> I need to provide the PATH to  tclConfig.sh/tkConfig.sh which is=20
> currently ${STAGING_BINDIR_CROSS}.
=EF=BB=BF
> Is this the right PATH or should tcl=20
> tk place tclConfig.sh/tkConfig.sh to ${STAGING_LIBDIR} ?

=EF=BB=BFIt depends on the purpose.

If you need tcl/tk for the build process, you need tcl/tk-native and
{STAGING_BINDIR}. If you need to link with tcl/tk, then you need
{STAGING_BINDIR_CROSS}.

Note: You should be aware, that user may set ASSUME_PROVIDED =3D
"tcl-native tk-native" in local.conf. In this case, your program should
be able to find tcl-native/tk-native in system-wide directories (it's
the default behavior of most upstream packages).

If you need both, you have to do some tricks (set needed variable in bb
file and patch package to use this variable).


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



