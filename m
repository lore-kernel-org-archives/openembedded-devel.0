Received: from [83.222.23.62] (helo=relay2.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MDBz4-00056f-2o
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 08:35:58 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay2.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MDBpz-0000ST-2Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 10:26:35 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Sat, 6 Jun 2009 21:52:20 +0400
User-Agent: KMail/1.11.4 (Linux/2.6.29; KDE/4.2.4; x86_64; ; )
References: <065E68EB87448440A3E75B4DBB5E871C524DF3@CORPUSMX100C.corp.emc.com>
In-Reply-To: <065E68EB87448440A3E75B4DBB5E871C524DF3@CORPUSMX100C.corp.emc.com>
MIME-Version: 1.0
Message-Id: <200906062152.21217.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 8662 [Jun 06 2009]
X-SpamTest-Info: helo_type=3
X-SpamTest-Info: {DNSBL Rate: low}
X-SpamTest-Method: none
X-SpamTest-Rate: 20
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [patch] tmp.gz is a intermediate dir at last we should remove it
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
X-List-Received-Date: Sun, 07 Jun 2009 06:35:58 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On =D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 06 =D0=B8=D1=8E=D0=BD=D1=8F 2=
009 15:05:23 Lin_Lynn@emc.com wrote:
> In conf/bitbake.conf there is ext2 and ext3 image cmd.It create a
> ${DEPLOY_DIR_IMAGE}/tmp.gz directory, however at last, seems that the dir
> isn=E2=80=99t removed
>
> The attach is to delete this intermediate dir=E3=80=82

It will break parallel image creation, so NACK if that counts.


