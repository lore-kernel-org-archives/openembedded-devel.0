Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 33D0365F99
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 01:28:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4F1Sijf024513
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 May 2014 18:28:44 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 14 May 2014 18:28:44 -0700
Message-ID: <53741849.8070402@windriver.com>
Date: Thu, 15 May 2014 09:28:41 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Tim Orling <ticotimo@gmail.com>
References: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>	<53704ECE.6070403@windriver.com>
	<CANx9H-A9_R=vqTmXS2T_tq16wfUewG85UO9QvifDiEqgo0qxZQ@mail.gmail.com>
In-Reply-To: <CANx9H-A9_R=vqTmXS2T_tq16wfUewG85UO9QvifDiEqgo0qxZQ@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH v3 0/9] perl modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 May 2014 01:28:46 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2014 10:13 PM, Tim Orling wrote:
>
> On Sun, May 11, 2014 at 9:32 PM, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     It seems the URL
>     http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Module-Build-Tiny-0.030.tar.gz
>     could not access in China, I use
>     http://cpan.metacpan.org/authors/id/L/LE/LEONT/Module-Build-Tiny-0.030.tar.gz
>     instead, and the build is successed. The others is fine to me.
>
> Would you prefer I add a "MIRRORS +=" or do you think it is because 
> the latest release of this package is 0.036?

It is better to update to the latest version, BTW the URL 
http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Module-Build-Tiny-0.030.tar.gz 
could be accessed, no need to add the "MIRRORS +=".

//Hongxu

>     //Hongxu
>
>
>
>     On 05/07/2014 10:09 AM, Tim Orling wrote:
>
>         From: Tim Orling <TicoTimo@gmail.com <mailto:TicoTimo@gmail.com>>
>
>         This series of recipes is the first step towards the
>         ultimate goal of getting Slic3r to build in OE.
>
>         Changes since v2:
>            * dropped libmodule-metadata as a patch for
>         oe-core/meta/perl provides
>                ** http://patches.openembedded.org/patch/71565/
>            * correct DEPENDS for libmodule-build-tiny-perl ('*-perl-*'
>         missing)
>
>         Tim Orling (9):
>            libtext-diff-perl: add 1.41
>            libcapture-tiny-perl: add 0.23
>            libmodule-runtime-perl: add 0.013
>            libextutils-config-perl: add 0.007
>            libextutils-helpers-perl: add 0.021
>            libextutils-installpaths-perl: add 0.010
>            libmodule-build-tiny-perl: add 0.030
>            libextutils-cppguess-perl: add 0.07
>            libalgorithm-diff-perl: add 1.15
>
>           .../libalgorithm/libalgorithm-diff-perl_1.15.bb
>         <http://libalgorithm-diff-perl_1.15.bb>    | 23 +++++++++
>           .../libcapture/libcapture-tiny-perl_0.23.bb
>         <http://libcapture-tiny-perl_0.23.bb>      | 36 +++++++++++++++
>           .../libextutils/libextutils-config-perl_0.007.bb
>         <http://libextutils-config-perl_0.007.bb>   | 24 ++++++++++
>           .../libextutils/libextutils-cppguess-perl_0.07.bb
>         <http://libextutils-cppguess-perl_0.07.bb>  | 38 +++++++++++++++
>           .../libextutils/libextutils-helpers-perl_0.021.bb
>         <http://libextutils-helpers-perl_0.021.bb>  | 29 ++++++++++++
>           .../libextutils-installpaths-perl_0.010.bb
>         <http://libextutils-installpaths-perl_0.010.bb>         | 25
>         ++++++++++
>           .../libmodule/libmodule-build-tiny-perl_0.030.bb
>         <http://libmodule-build-tiny-perl_0.030.bb>   | 54
>         ++++++++++++++++++++++
>           .../libmodule/libmodule-runtime-perl_0.013.bb
>         <http://libmodule-runtime-perl_0.013.bb>      | 35 ++++++++++++++
>           .../recipes-perl/libtext/libtext-diff-perl_1.41.bb
>         <http://libtext-diff-perl_1.41.bb> | 27 +++++++++++
>           9 files changed, 291 insertions(+)
>           create mode 100644
>         meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
>         <http://libalgorithm-diff-perl_1.15.bb>
>           create mode 100644
>         meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.23.bb
>         <http://libcapture-tiny-perl_0.23.bb>
>           create mode 100644
>         meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
>         <http://libextutils-config-perl_0.007.bb>
>           create mode 100644
>         meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb
>         <http://libextutils-cppguess-perl_0.07.bb>
>           create mode 100644
>         meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.021.bb
>         <http://libextutils-helpers-perl_0.021.bb>
>           create mode 100644
>         meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
>         <http://libextutils-installpaths-perl_0.010.bb>
>           create mode 100644
>         meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb
>         <http://libmodule-build-tiny-perl_0.030.bb>
>           create mode 100644
>         meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.013.bb
>         <http://libmodule-runtime-perl_0.013.bb>
>           create mode 100644
>         meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
>         <http://libtext-diff-perl_1.41.bb>
>
>
>


