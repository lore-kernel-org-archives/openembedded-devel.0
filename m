Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MOwOR-0002wE-Jp
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 18:22:43 +0200
Received: from [UNAVAILABLE] ([217.74.249.19] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MOwC0-000CVW-MK
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 20:09:55 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 9 Jul 2009 20:09:28 +0400
User-Agent: KMail/1.11.4 (Linux/2.6.29; KDE/4.2.4; x86_64; ; )
References: <be7a9f3d0907090612k3babae30h64d0424a4fe8dcc0@mail.gmail.com>
	<200907091919.56858.khimov@altell.ru>
	<be7a9f3d0907090834q3e1a57b2s6723e15b5f3a9fa6@mail.gmail.com>
In-Reply-To: <be7a9f3d0907090834q3e1a57b2s6723e15b5f3a9fa6@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200907092009.28507.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 8986 [Jul 09 2009]
X-SpamTest-Info: {UDS BL}
X-SpamTest-Info: {DNSBL Rate: low}
X-SpamTest-Method: none
X-SpamTest-Rate: 30
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [RFH] Stable qemu-native BROKEN
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
X-List-Received-Date: Thu, 09 Jul 2009 16:22:43 -0000
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On =FE=C5=D4=D7=C5=D2=C7 09 =C9=C0=CC=D1 2009 19:34:52 Otavio Salvador wrot=
e:
> On Thu, Jul 9, 2009 at 12:19 PM, Roman I Khimov<khimov@altell.ru> wrote:
> > What do you have on host system? And could you also send qemu build log
> > (which fails), please.
>
> It is available at http://pastebin.com/f4bb04943

I think you can try to limit supported targets as a temporary measure, like:

EXTRA_OECONF +=3D "--target-list=3Darm-linux-user,arm-softmmu"

> amd64 (running in 64 bit) with Sid.

Same here. Although I'm something like 3 weeks behind with sid currently an=
d=20
will only be able to update and try latest on Sunday.


