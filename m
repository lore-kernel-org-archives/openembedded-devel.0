Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 94DBF65F1E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 07:45:13 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1XKN3Z-0004zy-Mt for openembedded-devel@lists.openembedded.org;
	Thu, 21 Aug 2014 09:45:13 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 09:45:13 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 09:45:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 21 Aug 2014 09:44:59 +0200
Message-ID: <lt481r$hms$1@ger.gmane.org>
References: <CAHQecY6bxmkDi3U6nN3MhF4x6-ysPnXyb0nwrjXwq3-xX5NdcQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <CAHQecY6bxmkDi3U6nN3MhF4x6-ysPnXyb0nwrjXwq3-xX5NdcQ@mail.gmail.com>
Subject: Re: [META-OE][PATCH 1/1] oscam: fixed QA issue where binary was being stripped
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Aug 2014 07:45:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom King schreef op 21-08-14 08:13:
> http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095778.html
>
>  WARNING: QA Issue: File '/usr/bin/oscam' from oscam was already
> stripped, this will prevent future debugging! [already-stripped]
> 
> Fix above warning by telling cmake to do Debug type build, which
> prevents linking with '-s' flag that removed symbols before bitbake could
> put them into dbg package.
> 
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com> Signed-off-by: Tom
> King<ka6sox@gmail.com> --- meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
> |    2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb 
> b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb index e3f2708..c4a4d99
> 100644 --- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb +++
> b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb @@ -14,5 +14,5 @@ S =
> "${WORKDIR}/trunk"
> 
> inherit cmake
> 
> -EXTRA_OECMAKE = "-DDEFAULT_CS_CONFDIR=${sysconfdir}" +EXTRA_OECMAKE =
> "-DDEFAULT_CS_CONFDIR=${sysconfdir} -DCMAKE_BUILD_TYPE=Debug"

Whitespace damage due to mailer?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFT9aN7MkyGM64RGpERAocuAJ41630bimczFzLdBtpxDkCRY33h6QCeO80c
myBws3uS1pXaavua8+O9vo8=
=xjKT
-----END PGP SIGNATURE-----


