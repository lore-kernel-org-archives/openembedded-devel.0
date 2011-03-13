Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pya7s-0004cH-Fw
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 02:29:44 +0100
Received: by pxi1 with SMTP id 1so1002587pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 17:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=YkhXmoJgbXr/pXXCRnZGpk1c/WFv0t2vzikxzZcMJDE=;
	b=WJBwTzOi7gw/tgKmPkifhu2/VNW2Ijk8VYIWOki8aV9vimBcoFVCveqlh5pUGS6I7O
	q8KcvHyxGcjvpkDAf0NyDMRtLYtxsK0+qL9CIok4q5Q1sVZyU5tdOijg1dyHxw8rfzKY
	swOf8b58AH9ZuB1utpPa9fe4v33RDV+pZmGr0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=k0NhrXYAfyxiFJatEbaeKqbOkrUHPa4e+mvoA22YAyFThrbb+2iOFg2n8TFo9VpfwM
	mn6NG2ZMeAwpGqHHM7pbTpooBO7a0KQQL8Q/TfSNYMV2ncVZCFTQoFXLvFgV7kpOQw8F
	SpG9s/IT1eREiroXYpVu8EOxM8chlCc9+WWUM=
Received: by 10.142.62.35 with SMTP id k35mr8834386wfa.67.1299979681536;
	Sat, 12 Mar 2011 17:28:01 -0800 (PST)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p40sm7813709wfc.5.2011.03.12.17.27.59
	(version=SSLv3 cipher=OTHER); Sat, 12 Mar 2011 17:28:00 -0800 (PST)
Message-ID: <4D7C1D96.1060300@gmail.com>
Date: Sat, 12 Mar 2011 17:27:50 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH 00/11] Patchset being in use on O.S. Systems internal tree
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
X-List-Received-Date: Sun, 13 Mar 2011 01:29:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/12/2011 11:27 AM, Otavio Salvador wrote:
> Hello,
>
> This patchset has been in use in our internal tree and as usual we'd
> like to have it synced with upstream so we're proposing those for
> merging.
>
> The patches that are included on this set are:
>
> [PATCH 01/11] freerdp: workaround gcc linking bug forcing -lpthread
> [PATCH 02/11] freerdp: add singleton support with PDU error handling
> [PATCH 03/11] cmake.bbclass: drop CMAKE_MODULE_PATH as it works fine without it
> [PATCH 04/11] bitbake.conf: add XZ_INTEGRITY_CHECK and LZMA_COMPRESSION_LEVEL variables
> [PATCH 05/11] udev (165): move ConsoleKit support to udev-consolekit package
> [PATCH 06/11] xkeyboard-config: use --with-xkb-rules-symlink=xorg option
> [PATCH 07/11] xkeyboard-config (git): update to current version - 2.1 plus fixes
> [PATCH 08/11] linux (2.6.37): update to 2.6.37.3 stable patch
> [PATCH 09/11] libarchive: add
> [PATCH 10/11] cmake: depends on libarchive
> [PATCH 11/11] p910nd: update to 0.95 and improve packaging
>
> The diffstat of whole series is:
>
>   classes/cmake.bbclass                              |    2 -
>   conf/bitbake.conf                                  |   10 +-
>   recipes/cmake/cmake_2.8.3.bb                       |    4 +-
>   recipes/freerdp/freerdp.inc                        |    7 +-
>   recipes/freerdp/freerdp/singleton-mode.patch       |  208 ++++++++++++++++++++
>   recipes/freerdp/freerdp_git.bb                     |    5 +-
>   .../0001-Patch-from-upstream-revision-1990.patch   |   45 +++++
>   .../0002-Patch-from-upstream-revision-1991.patch   |   34 ++++
>   .../0003-Patch-from-upstream-rev-2516.patch        |   65 ++++++
>   .../0004-Patch-from-upstream-rev-2514.patch        |   35 ++++
>   .../0005-Patch-from-upstream-rev-2520.patch        |   33 +++
>   .../0006-Patch-from-upstream-rev-2521.patch        |   30 +++
>   ...YS-error-when-setting-up-xattrs.-Closes-5.patch |   33 +++
>   recipes/libarchive/libarchive_2.8.4.bb             |   20 ++
>   recipes/linux/linux_2.6.37.bb                      |    8 +-
>   recipes/p910nd/p910nd_0.92.bb                      |   45 -----
>   recipes/p910nd/p910nd_0.95.bb                      |   49 +++++
>   recipes/udev/udev_165.bb                           |    7 +-
>   recipes/xkeyboard-config/xkeyboard-config.inc      |    9 +-
>   recipes/xkeyboard-config/xkeyboard-config_git.bb   |    6 +-
>   20 files changed, 584 insertions(+), 71 deletions(-)
>
> Thanks in advance,

Except [PATCH 05/11] udev (165): move ConsoleKit support to 
udev-consolekit package

merged all.

Thanks

-Khem


