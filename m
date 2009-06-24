Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1MJLEI-0007dC-7f
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 07:41:07 +0200
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id D4EBF46757
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2009 17:29:56 +1200 (NZST)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])by 
	gatekeeper.tait.co.nz (Postfix) with ESMTP id C4CD146752for 
	<openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2009 17:29:55 
	+1200 (NZST)
Received: from conversion-daemon.sunstrike.tait.co.nz by 
	sunstrike.tait.co.nz(Sun Java System Messaging Server 6.1 (built Apr 28
	2004))id <0KLQ00E019KEJY00@sunstrike.tait.co.nz>(original mail from 
	douglas.royds@tait.co.nz)for openembedded-devel@lists.openembedded.org; 
	Wed,24 Jun 2009 17:29:55 +1200 (NZST)
Received: from [172.25.114.21] by sunstrike.tait.co.nz(Sun Java System 
	Messaging Server 6.1 (built Apr 28 2004))with ESMTP id 
	<0KLQ00ECA9XS1G10@sunstrike.tait.co.nz> 
	foropenembedded-devel@lists.openembedded.org; Wed,24 Jun 2009 17:29:54 
	+1200 (NZST)
Date: Wed, 24 Jun 2009 17:31:21 +1200
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <1245344715-22415-1-git-send-email-valentin.longchamp@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Message-id: <4A41BA29.3000007@tait.co.nz>
MIME-version: 1.0
References: <1245344715-22415-1-git-send-email-valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
X-imss-version: 2.054
X-imss-result: Passed
X-imss-approveListMatch: *@tait.co.nz
Subject: Re: [PATCH] render cmake search path stricter
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
X-List-Received-Date: Wed, 24 Jun 2009 05:41:09 -0000
Content-type: text/plain;
	format=flowed;
	charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Any particular reason not to include CMAKE_FIND_ROOT_PATH_MODE_PACKAGE?

Normally this won't have any effect, as CMake will look in the CMake 
installation for FindSomething.cmake ("module" mode). But if a package 
installs a SomethingConfig.cmake in /usr/share/cmake (the "config" mode 
of find_package) we should be looking only in staging, not trawling 
around on the host PC.

Douglas.


Valentin Longchamp wrote:
> The search is only done in the STAGING directy: all the needed tools
> should be there (already built) and all the libs and header are there
> too. With this, we are sure that we do not mix with the host libs,
> headers or tools.
>
> Signed-off-by: Valentin Longchamp <valentin.longchamp@epfl.ch>
> ---
>  classes/cmake.bbclass |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
> index b5b7b86..af8f3a9 100644
> --- a/classes/cmake.bbclass
> +++ b/classes/cmake.bbclass
> @@ -21,6 +21,9 @@ cmake_do_configure() {
>    cmake ${OECMAKE_SOURCEPATH} \
>      -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
>      -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST} \
> +    -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=ONLY \
> +    -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
> +    -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
>      ${EXTRA_OECMAKE} \
>      -Wno-dev
>  }
>   


=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



