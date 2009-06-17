Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MGzTb-00088q-Bm
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 20:03:11 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MGzJR-0002hF-IQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:52:41 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 21:52:35 +0400
User-Agent: KMail/1.11.4 (Linux/2.6.29; KDE/4.2.4; x86_64; ; )
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
	<h1b9rb$39u$1@ger.gmane.org>
In-Reply-To: <h1b9rb$39u$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200906172152.35585.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 8770 [Jun 17 2009]
X-SpamTest-Info: helo_type=3
X-SpamTest-Info: {UDS BL}
X-SpamTest-Info: {DNSBL Rate: low}
X-SpamTest-Method: none
X-SpamTest-Rate: 30
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 18:03:14 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On =D0=A1=D1=80=D0=B5=D0=B4=D0=B0 17 =D0=B8=D1=8E=D0=BD=D1=8F 2009 21:40:58=
 Rolf Leggewie wrote:
> Chris Larson wrote:
> > Set IMAGE_KEEPROOTFS to something other than the empty string to keep
> > tmp/rootfs around after image creation, otherwise it will be removed
>
> We had something like this proposed a while ago by I think Lynn Lin.
> This is already a bit more evolved since it is conditional on a
> variable.  The proposal then was rejected on the grounds of breaking
> concurrent builds and I think this will likely be the case here, too.
>
> comments?

I think that was on 'tmp.gz' deletion and this one actually removes=20
IMAGE_ROOTFS, not tmp/rootfs, so it should be fine.


