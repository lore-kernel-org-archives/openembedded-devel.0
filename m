Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1GjbMJ-0003yw-NI
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Nov 2006 13:56:19 +0100
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1Gjbq1-0006hR-KK
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Nov 2006 14:27:01 +0100
Message-ID: <45586AF5.8060800@kernelconcepts.de>
Date: Mon, 13 Nov 2006 13:54:13 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.7 (X11/20060922)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45566FBC.1030206@kernelconcepts.de>
In-Reply-To: <45566FBC.1030206@kernelconcepts.de>
X-Enigmail-Version: 0.94.0.0
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
X-List-Received-Date: Mon, 13 Nov 2006 12:56:20 -0000
Content-Type: multipart/mixed; boundary="------------030907070703010205060103"

--------------030907070703010205060103
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Nils Faerber schrieb:
> The first problem I stepped over is that gcc4-build-sdk.inc still has
> the line
> 
> SRC_URI += 'file://602-sdk-libstdc++-includes.patch;patch=1'
> 
> or in fact without the 602- prefix. But this patch is already included
> in the gcc_4.1.1.bb. So I commented that out.

this seems to be fixed now, i get a different message:

NOTE: Applying patch '300-libstdc++-pic.patch'
ERROR: Error in executing:
/home/fuchs/Projekte/oe/dev/packages/gcc/gcc-cross-sdk_4.1.1.bb
ERROR: Exception:__builtin__.CmdError Message:Command Error: exit status: 1  Output:
Patch headers differ:
@@ -1,4 +1,2 @@
 # DP: Build and install libstdc++_pic.a library.

Sounds like a broken patch to me.
I use bitbake 1.6.2 and the up to date stuff from org.openembedded.dev
(9c4dc2162967f7102e29135dc8da502dd80d01ac).

The full error message is attached...

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-14
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76

--------------030907070703010205060103--
