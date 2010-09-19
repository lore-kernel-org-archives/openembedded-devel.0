Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cargoudel@gmail.com>) id 1OxTAO-0005Gq-Ub
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 01:19:29 +0200
Received: by qyk4 with SMTP id 4so4243509qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Sep 2010 16:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=lnw2Bfy/tJOq6Ls332iwgHYdAWYD4jU/RxQg/KUzmwo=;
	b=aeOSq/qmY9bAhbF3isU+M7b1z7z9GYtj1WEvOm2j+qP9hiBS8z+TXZOtrWpMaquFDX
	+UoITgYJBXGOQHGx2AAemB7MeKV+dJM48hZadN5YyO5gq5KFg5uUUqpBFKDIVyoOLsTW
	36d+Y9Ay2nQ441c4DKTd4ZFURN49aVUFBAj2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=lihCycOPxXVdisaeX6KQOR0fXLOnpjRIATVeULHCxUPCQbNu9RqbMrzlVRp70lNqkC
	8MyqFN6rMMRxMmRDU27l+XFmMWhuvtn3OG9eT1MRfFNfJF49hhpH/aUQqGPCRAmoID1V
	cNeYHIITjHLrlSB+L2Yc6Qdeh/NIyKuUtOHuk=
Received: by 10.229.247.3 with SMTP id ma3mr5651588qcb.1.1284938314172; Sun,
	19 Sep 2010 16:18:34 -0700 (PDT)
MIME-Version: 1.0
Sender: cargoudel@gmail.com
Received: by 10.229.188.212 with HTTP; Sun, 19 Sep 2010 16:18:14 -0700 (PDT)
In-Reply-To: <AANLkTinFs+k=b-UowmKXY9kWFvSdv772K1n7B+uzkJHL@mail.gmail.com>
References: <AANLkTinFs+k=b-UowmKXY9kWFvSdv772K1n7B+uzkJHL@mail.gmail.com>
From: "R.T. McGee" <67800@udel.edu>
Date: Sun, 19 Sep 2010 19:18:14 -0400
X-Google-Sender-Auth: bfUOXj9BvjZkcLyk7yGG1IaWZiM
Message-ID: <AANLkTinKOg2beadzpOyLQ+eQtQa4KH5KG11OyF_jCC64@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: cargoudel@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: FA526 / CNS2132 / TS-7500 build configuration
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
X-List-Received-Date: Sun, 19 Sep 2010 23:19:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The Faraday FA526 core is used in ARM processors like the Semi STR8132
/ Cavium CNS2132 which is in my Technologic Systems TS-7500 board in
addition to some NAS boxes out there. From what I have read, it
basically resembles a ARM920T but has NO thumb interworking support
which makes it not fully EABI compliant (
http://www.mail-archive.com/openocd-development@lists.berlios.de/msg05856.h=
tml
). I have build a few tool chains manually that produce working code
using a configuration meant for a OABI style armv4 which makes sense
since it uses NO thumb instructions, but I am not sure this is
optimal.

What is the best way to move forward to setup a OpenEmbedded
distro/machine configuration for something like the TS-7500 or a
general FA526 configuration? =A0I guess, one option is setup OABI ARMv4
style setup but this was removed from things like angstrom a while
ago. Switching to OABI just to get rid of thumb seems a little silly.

It would be nice to figure out a way to use EABI ARMv4T toolkit but
pass flags like -mapcs-32 -mno-thumb-interwork (just a guess) to GCC
to insure no thumb instructions (other weird things are discussed in
http://wiki.debian.org/ArmEabiPort#Otherscenarios ). =A0The linker
option -fix-v4bx looks promising for the linker also. A lot of things
are possible solutions, but whats the cleanest way to work it into
OpenEmbedded's build system?

Any suggestion would be helpful. Thanks.


