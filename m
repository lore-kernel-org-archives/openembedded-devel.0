Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A4A7877DB6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 18:32:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v79IWiDU014110
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Aug 2017 11:32:44 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 9 Aug 2017 11:32:42 -0700
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>, Behan
	Webster <behanw@converseincode.com>
References: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
	<1502288526.1934.39.camel@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <893c3fce-14cf-adbf-6613-1297b0334210@windriver.com>
Date: Wed, 9 Aug 2017 14:32:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502288526.1934.39.camel@linux.intel.com>
X-Originating-IP: [172.25.44.7]
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
X-List-Received-Date: Wed, 09 Aug 2017 18:32:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2017-08-09 10:22 AM, Leonardo Sandoval wrote:
> in my opinion, this fits nicely into the oe-core, into the
> scripts/contrib folder.

Agreed.

It would be nice to separate the data from the script so
that people could easily add to it. That might make updates
more difficult if the script is kept separate from oe-core.

Could you get rid of the references to 'course' if the script
gets integrated:
$ grep -i course ~/Downloads/check-requirements.sh | wc -l
139

s/course/activity/ perhaps.

Thanks,

../Randy

> 
> 
> 
> On Tue, 2017-08-08 at 17:24 -0700, Behan Webster wrote:
>> I maintain a script (ready-for.sh) which checks requirements for various courses I teach which makes sure you have the right computer, RAM, disk space available, and such in order to do the class. It also makes sure that the required packages for your $DISTRO are installed (supported distros are CentOS, Debian, Fedora, Mint, openSUSE, RHEL, SLES, Ubuntu, with some initial support for ArchLinux). It has a full test suite to make sure the package lists are valid and available for each of the distro. It also can output a JSON version of the requirements (if you want to extract requirements for something else like a webpage or document) and includes an auto-updater. Its designed to make getting ready for a specific course very easy for a new person. I also use it to debug setup issues on people’s computers over the phone or email.
>>
>> One of the courses I maintain requirements for is the LF Yocto Project course. And recently I rebuilt the script into something more generic (check-requirements.sh) which specifically allows you to check for requirements for the various groupings of packages in the Yocto Project documentation.
>>
>> I’ve made it initially available as an alpha release via https://cm.converseincode.com/cr/ <https://cm.converseincode.com/cr/> , and I plan to maintain it along with the script described above since they share so much of the same code.
>>
>> The idea is that users would download and run this script once in order to make sure their machines are ready to build OE or Poky or whatever, instead of reading the setup document and manually installing all the packages. One would still have to clone the appropriate git repo to get a copy of OE or Poky after that.
>>
>> As an example, here it is being run on an Ubuntu-16.04 machine which is missing packages for building the documentation. (Showing the YP requirements are boring, because this computer already meets those requirements because I build OE all the time). It is to be run as a normal user, but uses sudo internally when it needs to run privileged commands. In fact if you try to run it as root, it complains.
>>
>> $ sudo ./check-requirements.sh
>> [sudo] password for behanw:
>> FAIL: Please don't run as root
>> NOTE: Sudo will be used internally by this script as required.
>>
>> $ ./check-requirements.sh --list
>> Available (4) options:
>>    YPDOC - Requirements for Yocto Project Documentation
>>    YPGUI - Requirements for Yocto Project GUI
>>    YP - Requirements for Yocto Project
>>    YPST - Requirements for OpenEmbedded Self-Test
>>
>> $ ./check-requirements.sh YPDOC
>> Checking that this computer is suitable for YPDOC: Requirements for Yocto Project Documentation
>> --------------------------------------------------------------------------------
>> PASS: CPU architecture is x86_64
>> PASS: 4 core CPU (good enough but 8 is preferred)
>> PASS: Your CPU appears powerful enough (currently at 23228 BogoMIPS cumulatively)
>> PASS: 6 GiB RAM
>> PASS: 158 GiB free disk space in /home/behanw
>> PASS: Linux distribution architecture is x86_64
>> PASS: Linux distribution is Ubuntu:amd64-16.04 (xenial)
>> PASS: Internet is available (which is required in this case)
>> --------------------------------------------------------------------------------
>> WARN: Some packages are missing
>> NOTE: Need to install: dblatex docbook-dsssl docbook-utils fop jadetex java-wrappers libavalon-framework-java libbatik-java libbsf-java libfontbox-java libfop-java libosp5 libostyle1c2 libsgmls-perl libsp1c2 libxmlgraphics-commons-java openjade sgmlspl sp texlive-bibtex-extra texlive-math-extra xmlto
>> You can install missing packages by running:
>>    ./check-requirements.sh --install YPDOC
>> or by:
>>    sudo apt-get --no-install-recommends install dblatex docbook-dsssl docbook-utils fop jadetex java-wrappers libavalon-framework-java libbatik-java libbsf-java libfontbox-java libfop-java libosp5 libostyle1c2 libsgmls-perl libsp1c2 libxmlgraphics-commons-java openjade sgmlspl sp texlive-bibtex-extra texlive-math-extra xmlto
>> --------------------------------------------------------------------------------
>> WARN: Your computer doesn't meet the stated requirements unless you can fix the above warnings.
>> WARN: You also have some missing packages.
>>
>> $ ./check-requirements.sh --install YPDOC
>> Checking that this computer is suitable for YPDOC: Requirements for Yocto Project Documentation
>> --------------------------------------------------------------------------------
>> <snip>
>> --------------------------------------------------------------------------------
>> WARN: Some packages are missing
>> WARN: About to install: dblatex docbook-dsssl docbook-utils fop jadetex java-wrappers libavalon-framework-java libbatik-java libbsf-java libfontbox-java libfop-java libosp5 libostyle1c2 libsgmls-perl libsp1c2 libxmlgraphics-commons-java openjade sgmlspl sp texlive-bibtex-extra texlive-math-extra xmlto
>> Is that okay? [y/N]
>>
>> Is this useful? Thoughts? Suggestions?
>>
>> Give it a try and let me know what you think. It’s extensible, so adding other groupings of packages and such, or adding aliases for OE or something is all trivially done.
>>
>> Thanks,
>>
>> Behan
> 
> 


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

