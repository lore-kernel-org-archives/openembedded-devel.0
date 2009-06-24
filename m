Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1MJLUj-00085K-Nj
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 07:58:06 +0200
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 9BFCB46752
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2009 17:46:56 +1200 (NZST)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])by 
	gatekeeper.tait.co.nz (Postfix) with ESMTP id 89DAE46751for 
	<openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2009 17:46:56 
	+1200 (NZST)
Received: from conversion-daemon.sunstrike.tait.co.nz by 
	sunstrike.tait.co.nz(Sun Java System Messaging Server 6.1 (built Apr 28
	2004))id <0KLQ00E019KEJY00@sunstrike.tait.co.nz>(original mail from 
	douglas.royds@tait.co.nz)for openembedded-devel@lists.openembedded.org; 
	Wed,24 Jun 2009 17:46:56 +1200 (NZST)
Received: from [172.25.114.21] by sunstrike.tait.co.nz(Sun Java System 
	Messaging Server 6.1 (built Apr 28 2004))with ESMTP id 
	<0KLQ00EP8AQ41G10@sunstrike.tait.co.nz> 
	foropenembedded-devel@lists.openembedded.org; Wed,24 Jun 2009 17:46:54 
	+1200 (NZST)
Date: Wed, 24 Jun 2009 17:48:22 +1200
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <4A3BB88C.5010504@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Message-id: <4A41BE26.3040102@tait.co.nz>
MIME-version: 1.0
References: <4A3BB88C.5010504@epfl.ch>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
X-imss-version: 2.054
X-imss-result: Passed
X-imss-approveListMatch: *@tait.co.nz
Subject: Re: [RFC] cmake cross-compilation paths
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
X-List-Received-Date: Wed, 24 Jun 2009 05:58:06 -0000
Content-type: text/plain;
	format=flowed;
	charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Perhaps you need:

    -DCMAKE_FIND_ROOT_PATH="${STAGING_DIR_HOST};${STAGING_DIR_NATIVE}" 

Douglas.


Valentin Longchamp wrote:
> Hello,
>
> I am trying to build cmake based programs that use QT with 
> Openembedded. The actual support for cmake in OE worked until now that 
> I only had "simple" dependencies. Now with QT as as dependency, I use 
> the cmake FindQt4 Module that strongly relies on qmake to find the 
> different QT cmake variables (try to run ${STAGINGBINDIR}/qmake4 -query).
>
> The problem is that FindQt4 does not find the qmake4 (as I have 
> proposed to rename it like that in my patch from yesterday) since the 
> CMAKE_FIND_ROOT_PATH given to the cmake cmd in the 
> classes/cmake.bbclass only is set to
>
> -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST}
>
> that does not include ${STAGING_BIN_DIR}. Setting it to
>
> -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR}
>
> makes configure fail (it cannot find the needed header files); and with
>
> -DCMAKE_FIND_ROOT_PATH="${STAGING_DIR_HOST};${STAGING_DIR}"
>
> qmake4 is not found either.
>
> So if someone who knows cmake better than me can tell me how to give 
> two paths to a cmd -DPATH_NAME=VALUE1 VALUE2 for cmake (and what would 
> be the equivalent to STAGING_DIR_HOST for ${STAGING_DIR}/i686-linux in 
> my case) that would help a lot (I am not sure it can be achieved).
>
> All the inputs are greatly appreciated and if you could help me for 
> the OE var names (especially for the equivalent to ${STAGING_DIR_HOST} 
> that would point to ${STAGING_DIR}/i686-linux, that would already be a 
> good start)
>
> Thanks a lot
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



