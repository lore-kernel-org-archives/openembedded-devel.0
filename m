Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MHEaL-00069e-8G
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 12:11:09 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MHEQ6-000080-7d
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 14:00:35 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2009 14:00:12 +0400
User-Agent: KMail/1.11.4 (Linux/2.6.29; KDE/4.2.4; x86_64; ; )
References: <1245267720-13612-1-git-send-email-khimov@altell.ru>
	<1245267720-13612-2-git-send-email-khimov@altell.ru>
	<1245316678.25995.9.camel@mill.internal.reciva.com>
In-Reply-To: <1245316678.25995.9.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200906181400.12312.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 8773 [Jun 18 2009]
X-SpamTest-Info: helo_type=3
X-SpamTest-Method: none
X-SpamTest-Rate: 0
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [PATCH 2/3] package_ipk: optimize do_package_update_index_ipk
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
X-List-Received-Date: Thu, 18 Jun 2009 10:11:09 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 18 =D0=B8=D1=8E=D0=BD=D1=8F 2=
009 13:17:58 Phil Blundell wrote:
> On Wed, 2009-06-17 at 23:41 +0400, Roman I Khimov wrote:
> > +			PACK_COUNT=3D`ls -t ${DEPLOY_DIR_IPK}/$ipk_path/ | head -n 4 | grep
> > Packages | wc -l` +			if [ -e ${DEPLOY_DIR_IPK}/$ipk_path/ -a
> > "$PACK_COUNT" !=3D "4" ] ; then
>
> This test seems a little bit fragile.  How about something like:
>
> NEWEST_PACKAGE=3D`ls -t ${DEPLOY_DIR_IPK}/$ipk_path/*.ipk | head -n 1`
> if [ -n "$NEWEST_PACKAGE" ] && [ "$NEWEST_PACKAGE" -nt
> "${DEPLOY_DIR_IPK}/$ipk_path/Packages" ]; then
>  ...
>
> instead? =20

Works good here, updated patch to follow.


