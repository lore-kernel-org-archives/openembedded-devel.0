Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1039971A35
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 14:13:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 07:13:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,348,1498546800"; d="scan'208";a="297805942"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga004.fm.intel.com with ESMTP; 09 Aug 2017 07:13:30 -0700
Message-ID: <1502288526.1934.39.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Behan Webster <behanw@converseincode.com>
Date: Wed, 09 Aug 2017 09:22:06 -0500
In-Reply-To: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
References: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Alpha release of check-requirement.sh
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Aug 2017 14:13:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

in my opinion, this fits nicely into the oe-core, into the
scripts/contrib folder.



On Tue, 2017-08-08 at 17:24 -0700, Behan Webster wrote:
> I maintain a script (ready-for.sh) which checks requirements for various courses I teach which makes sure you have the right computer, RAM, disk space available, and such in order to do the class. It also makes sure that the required packages for your $DISTRO are installed (supported distros are CentOS, Debian, Fedora, Mint, openSUSE, RHEL, SLES, Ubuntu, with some initial support for ArchLinux). It has a full test suite to make sure the package lists are valid and available for each of the distro. It also can output a JSON version of the requirements (if you want to extract requirements for something else like a webpage or document) and includes an auto-updater. Its designed to make getting ready for a specific course very easy for a new person. I also use it to debug setup issues on people’s computers over the phone or email.
> 
> One of the courses I maintain requirements for is the LF Yocto Project course. And recently I rebuilt the script into something more generic (check-requirements.sh) which specifically allows you to check for requirements for the various groupings of packages in the Yocto Project documentation.
> 
> I’ve made it initially available as an alpha release via https://cm.converseincode.com/cr/ <https://cm.converseincode.com/cr/> , and I plan to maintain it along with the script described above since they share so much of the same code.
> 
> The idea is that users would download and run this script once in order to make sure their machines are ready to build OE or Poky or whatever, instead of reading the setup document and manually installing all the packages. One would still have to clone the appropriate git repo to get a copy of OE or Poky after that.
> 
> As an example, here it is being run on an Ubuntu-16.04 machine which is missing packages for building the documentation. (Showing the YP requirements are boring, because this computer already meets those requirements because I build OE all the time). It is to be run as a normal user, but uses sudo internally when it needs to run privileged commands. In fact if you try to run it as root, it complains.
> 
> $ sudo ./check-requirements.sh 
> [sudo] password for behanw: 
> FAIL: Please don't run as root
> NOTE: Sudo will be used internally by this script as required.
> 
> $ ./check-requirements.sh --list
> Available (4) options:
>   YPDOC - Requirements for Yocto Project Documentation
>   YPGUI - Requirements for Yocto Project GUI
>   YP - Requirements for Yocto Project
>   YPST - Requirements for OpenEmbedded Self-Test
> 
> $ ./check-requirements.sh YPDOC
> Checking that this computer is suitable for YPDOC: Requirements for Yocto Project Documentation
> --------------------------------------------------------------------------------
> PASS: CPU architecture is x86_64
> PASS: 4 core CPU (good enough but 8 is preferred)
> PASS: Your CPU appears powerful enough (currently at 23228 BogoMIPS cumulatively)
> PASS: 6 GiB RAM
> PASS: 158 GiB free disk space in /home/behanw
> PASS: Linux distribution architecture is x86_64
> PASS: Linux distribution is Ubuntu:amd64-16.04 (xenial)
> PASS: Internet is available (which is required in this case)
> --------------------------------------------------------------------------------
> WARN: Some packages are missing
> NOTE: Need to install: dblatex docbook-dsssl docbook-utils fop jadetex java-wrappers libavalon-framework-java libbatik-java libbsf-java libfontbox-java libfop-java libosp5 libostyle1c2 libsgmls-perl libsp1c2 libxmlgraphics-commons-java openjade sgmlspl sp texlive-bibtex-extra texlive-math-extra xmlto
> You can install missing packages by running:
>   ./check-requirements.sh --install YPDOC
> or by:
>   sudo apt-get --no-install-recommends install dblatex docbook-dsssl docbook-utils fop jadetex java-wrappers libavalon-framework-java libbatik-java libbsf-java libfontbox-java libfop-java libosp5 libostyle1c2 libsgmls-perl libsp1c2 libxmlgraphics-commons-java openjade sgmlspl sp texlive-bibtex-extra texlive-math-extra xmlto
> --------------------------------------------------------------------------------
> WARN: Your computer doesn't meet the stated requirements unless you can fix the above warnings.
> WARN: You also have some missing packages.
> 
> $ ./check-requirements.sh --install YPDOC
> Checking that this computer is suitable for YPDOC: Requirements for Yocto Project Documentation
> --------------------------------------------------------------------------------
> <snip>
> --------------------------------------------------------------------------------
> WARN: Some packages are missing
> WARN: About to install: dblatex docbook-dsssl docbook-utils fop jadetex java-wrappers libavalon-framework-java libbatik-java libbsf-java libfontbox-java libfop-java libosp5 libostyle1c2 libsgmls-perl libsp1c2 libxmlgraphics-commons-java openjade sgmlspl sp texlive-bibtex-extra texlive-math-extra xmlto 
> Is that okay? [y/N] 
> 
> Is this useful? Thoughts? Suggestions?
> 
> Give it a try and let me know what you think. It’s extensible, so adding other groupings of packages and such, or adding aliases for OE or something is all trivially done.
> 
> Thanks,
> 
> Behan



