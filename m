Received: from [195.6.168.30] (helo=mailserv.atmel-nantes.fr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <ulf@atmel.com>) id 1HnacF-00022M-51
	for openembedded-devel@openembedded.org; Mon, 14 May 2007 15:29:31 +0200
Received: from babylon.nto.atmel.com (babylon [10.172.102.73])
	by mailserv.atmel-nantes.fr (8.13.6/8.12.11) with ESMTP id
	l4EDTHQD000407 for <openembedded-devel@openembedded.org>;
	Mon, 14 May 2007 15:29:17 +0200
Received: from gondor.sweden.atmel.com ([10.175.196.34])
	by babylon.nto.atmel.com (8.12.8/8.12.8) with ESMTP id l4EDSbJp013176
	for <openembedded-devel@openembedded.org>;
	Mon, 14 May 2007 15:28:37 +0200
Received: from gondor.sweden.atmel.com (localhost.localdomain [127.0.0.1])
	by gondor.sweden.atmel.com (8.12.10/8.12.10) with SMTP id
	l4EDSbjT014121 for <openembedded-devel@openembedded.org>;
	Mon, 14 May 2007 15:28:37 +0200
Received: from aeglos (dhcp248.sweden.atmel.com [])
	by gondor.sweden.atmel.com ([10.175.196.46]);
	Mon, 14 May 2007 13:28:37 +0000
Message-ID: <07a101c7962b$e0db5860$0200a8c0@atmel.com>
From: "Ulf Samuelsson" <ulf@atmel.com>
To: <openembedded-devel@openembedded.org>
Date: Mon, 14 May 2007 15:14:03 +0200
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3028
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
X-ATMEL-NTO-MailScanner-Information: Please contact the ISP for more
	information
X-ATMEL-NTO-MailScanner: Found to be clean
X-ATMEL-NANTES-MailScanner-Information: Please contact the ISP for more
	information
X-ATMEL-NANTES-MailScanner: Not scanned: please contact your Internet E-Mail
	Service Provider for details
X-ATMEL-NANTES-MailScanner-From: ulf@atmel.com
Subject: qemu-native failure on Angstrom
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
X-List-Received-Date: Mon, 14 May 2007 13:29:32 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Tried building OpenEmbedded for the first time, DISTRO=3D=C5ngstr=F6m,=20
with an at91sam9263 target (made my own file) but it seems that
qemu.native is not compilable on my OpenSuSE 10.1 system using =
gcc-4.1.2.
The error message says that qemu has only been tested on gcc-4.x.x for =
arm
and that other architectures need gcc-3.x

Tried to update the bb files to allow gcc-4.1.2 but that resulted in
qemu-arm not beeing built, causing the build to terminate later.

Is there any way to have open embedded build a gcc-3.4.4 cross compiler
as part of the normal build.

Best Regards
Ulf Samuelsson



