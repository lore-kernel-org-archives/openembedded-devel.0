Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MHDTR-0005fi-UT
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 10:59:58 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MHDJE-000BP1-Gk
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 12:49:24 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2009 12:49:20 +0400
User-Agent: KMail/1.11.4 (Linux/2.6.29; KDE/4.2.4; x86_64; ; )
References: <1245267720-13612-1-git-send-email-khimov@altell.ru>
	<1245267720-13612-3-git-send-email-khimov@altell.ru>
	<20090617210805.GJ15477@smtp.west.cox.net>
In-Reply-To: <20090617210805.GJ15477@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200906181249.20393.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 8773 [Jun 18 2009]
X-SpamTest-Info: helo_type=3
X-SpamTest-Method: none
X-SpamTest-Rate: 0
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [PATCH 3/3] package_ipk: fix race in opkg.conf creation
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
X-List-Received-Date: Thu, 18 Jun 2009 09:00:00 -0000
Content-Disposition: inline
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 18 =D0=B8=D1=8E=D0=BD=D1=8F 2=
009 01:08:05 Tom Rini wrote:
> On Wed, Jun 17, 2009 at 11:42:00PM +0400, Roman I Khimov wrote:
> > It's a very little race, but one can hit it anyway on concurrent image
> > builds.
>
> So, the way this works is we do cp template ${IPKGCONF_TARGET} and use
> it, or so? =20

See package_generate_ipkg_conf in package_ipk.bbclass, it's echo-ing things=
 in=20
destination files sequentially.

> And IPKGCONF_SDK / IPKGCONF_CANSDK won't race because we're
> cp'ing them to a final destination ?

I've thought that we're not doing multi-sdk, so it shouldn't be a problem.=
=20
Although if some build would need to do some images plus an SDK it might be=
=20
invoking package_generate_ipkg_conf from several places.

Maybe we can merge it with package_update_index_ipk (or just invoke=20
package_generate_ipkg_conf from there leaving the function itself)? Everyth=
ing=20
except package-index meta-recipe does

package_update_index_ipk
package_generate_ipkg_conf

anyway.


