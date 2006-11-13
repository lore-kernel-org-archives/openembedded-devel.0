Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1GjgLL-0002qB-Q6
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Nov 2006 19:15:40 +0100
Received: from [212.60.202.194] (helo=[192.168.2.28])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1Gjgp5-0007Bl-04
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Nov 2006 19:46:23 +0100
Message-ID: <4558B5D3.2090609@kernelconcepts.de>
Date: Mon, 13 Nov 2006 19:13:39 +0100
From: Nils Faerber <nils.faerber@kernelconcepts.de>
Organization: kernel concepts
User-Agent: Thunderbird 1.5.0.7 (X11/20060922)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45566FBC.1030206@kernelconcepts.de>	<45586AF5.8060800@kernelconcepts.de>	<45589A63.9030808@kernelconcepts.de>
	<200611131725.11432.openembedded@hrw.one.pl>
In-Reply-To: <200611131725.11432.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.0.0
X-Mailman-Approved-At: Mon, 13 Nov 2006 21:42:24 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: ARM EABI SDK build
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
X-List-Received-Date: Mon, 13 Nov 2006 18:15:40 -0000
Content-Type: multipart/mixed; boundary="------------060106010200070009050605"

--------------060106010200070009050605
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit

OK, that was indeed fixed.
But I still have the problem that gcc-cross-sdk-4.1.1 fails to compile
due to problems with sys/types.h
This is really strange since this originates from glibc.

Koen: Didn't you build an EABI-softfloat toolchain already?

Cheers
  nils

Marcin Juszkiewicz schrieb:
> Dnia poniedzia³ek, 13 listopada 2006 17:16, Nils Faerber napisa³:
> 
>> I forgot to report: "file_4.16.bb"  and "file-native-4.16.bb" need to be
>> updated since the server does not carry 4.16 anmore - only 4.17 and
>> 4.18.
> 
> I suggest updating metadata:
> 
> Revision: fa302963f7d41e6cdf3efbde3458b3731e8ec5ae
> Ancestor: 3d7e2cab9dc312dae9852afc664f3bbdb5d4c9e9
> Author: xora@openembedded.org
> Date: 2006-11-09T10:37:33
> Branch: org.openembedded.dev
> 
> Added files:
>         packages/file/file-native_4.18.bb packages/file/file_4.18.bb
>         packages/file/files/dump packages/file/files/filesystems
> 
> ChangeLog:
> 
> file, file-native 4.18 : replaced the magic files for filesystems and dump
> for the ones for 4.16. The stuff that doesnt compile in 4.18 is new so it
> looks like a lack of QA on part of this release that they dont work.
> 


-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--

--------------060106010200070009050605--
