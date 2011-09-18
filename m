Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R5HL3-0007WM-3v
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 15:23:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Sep 2011 06:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,400,1312182000"; d="scan'208";a="52912006"
Received: from unknown (HELO helios.localnet) ([10.252.120.89])
	by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2011 06:16:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Dmitry Eremin-Solenikov" <dbaryshkov@gmail.com>
Date: Sun, 18 Sep 2011 14:16:54 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Message-Id: <201109181416.54157.paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie 00/17] big opie pull
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
X-List-Received-Date: Sun, 18 Sep 2011 13:23:17 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 18 September 2011 12:23:02 Dmitry Eremin-Solenikov wrote:
> The following changes since commit
> 963ac303ee49fd77d32d1edaaebf0358af4a6fd0:
> 
>   libopieobex0: fix disable-bit-check patch for current git (2011-09-17
> 14:43:22 +0100)
> 
> are available in the git repository at:
>   git@github.com:lumag/meta-opie.git master
> 
> Dmitry Eremin-Solenikov (17):
>       libopie2: also use gcc45_opiemm_include.patch for git version
>       libqpe-opie: fix LnkProperties desctructor visibility issues
>       opie-taskbar: fix linking issues
>       opie-taskbar: launcher also uses opiepim2 library, add it to LIBS
>       opie-today-addressbookplugin: add dependencies on opie-today and
> libqtaux2 opie-libqrsync: package static library
>       libopieobex0: drop setting of FILES for -dbg package
>       task-opie: provide defaults for screen resolution
>       opie: drop MOC and UIC overrides on command line
>       uicmoc-native: install tools with suffix 2
>       qmake.bbclass: adapt for  {moc,uic} -> {moc,uic}2 change
>       qte-common: adapt for  {moc,uic} -> {moc,uic}2 change
>       qmake: do not try to regenerate moc
>       opie: fix GPLv2 plus license
>       opie: mass-correct licesnses for LGPL packages
>       opie: mass GPL->GPLv2 fixup
>       opie-icon-reload: for completeness add git version

Merged all except #1 and #2, these fixes are already upstream.  I also 
introduced INC_PR to libopie2, fixed it in libqtaux2_1.2.5.bb and bumped INC_PR 
for all inc files changed in #9. 

Thanks very much!

Cheers,
Paul

--

Paul Eggleton
Intel Open Source Technology Centre


