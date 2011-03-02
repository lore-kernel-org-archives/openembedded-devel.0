Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>)
	id 1PupJL-0003xf-BE; Wed, 02 Mar 2011 17:54:03 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PupHu-00010y-4c from Tom_Rini@mentor.com ;
	Wed, 02 Mar 2011 08:52:34 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 2 Mar 2011 08:52:32 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Wed, 2 Mar 2011 08:52:33 -0800
Message-ID: <4D6E75BD.7050005@mentor.com>
Date: Wed, 2 Mar 2011 09:52:13 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Ben Gardiner <bengardiner@nanometrics.ca>
References: <cover.1299076392.git.bengardiner@nanometrics.ca>
In-Reply-To: <cover.1299076392.git.bengardiner@nanometrics.ca>
X-OriginalArrivalTime: 02 Mar 2011 16:52:32.0943 (UTC)
	FILETIME=[39912BF0:01CBD8FA]
Cc: Andrea Galbusera <gizero@gmail.com>, Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2 0/2] allow linux-lib-headers with external-toolchain-csl
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
X-List-Received-Date: Wed, 02 Mar 2011 16:54:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2011 08:05 AM, Ben Gardiner wrote:
> This patch series enables the use of linux-libc-headers with
> external CSL toolchain. This is useful when building userspace
> applications to use ABI features not present in the headers bundled
> with the CSL toolchain.
>
> Version 1 of this patch was tested in arago [1] and found to work there.
>
> Testing was performed there also by Andrea Galbusera<gizero@gmail.com>.
> Who found that the changes enabled a couple of packages to pickup kernel
> headers that were not bundled with the CSL toolchain.
>
> I tested this series on 3dc72c4ca0a9ce677f6c3a56517626984b5eaaa0 of
> git://git.openembedded.org/openembedded#master
>
> Using the following local.conf (comment- and blank-lines trimmed):

With some slight modifications to not use rsync (since the host may not 
have that) and to punt the local.conf.sample bit to another commit I'm 
doing shortly with a full -csl example, I've applied this locally and 
will push today.  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


