Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD70A611F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 13:30:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 014DUkIK020578
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 4 Feb 2020 05:30:46 -0800 (PST)
Received: from [128.224.56.226] (128.224.56.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 4 Feb 2020 05:30:46 -0800
To: Tim Orling <ticotimo@gmail.com>
References: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
	<CANx9H-BN5ZOwOzguYGG5sNH7DciEa=DUXAh1oj40iEYA2R03EA@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <75fbbff5-5c96-c23c-fbf8-40770f05688a@windriver.com>
Date: Tue, 4 Feb 2020 08:30:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CANx9H-BN5ZOwOzguYGG5sNH7DciEa=DUXAh1oj40iEYA2R03EA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][zeus][PATCH v2 1/2] python-twisted: add required RDEPENDS for twistd
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
X-List-Received-Date: Tue, 04 Feb 2020 13:30:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2/3/20 9:46 PM, Tim Orling wrote:
> Thank you for sorting :)
>
> I was looking at applying this to meta-python2 zeus and my checks 
> (import every twisted and twisted.* module) didn't see any missing 
> dependencies before this patch. Can you describe the need or give me a 
> hint of a reproducer? I'm sure I'm missing something.
The /usr/bin/twistd executable will complain about the dependencies 
being missing. You don't need to pass it any config files to test it - 
it'll output usage info if the dependencies are present.
>
> On Fri, Jan 31, 2020 at 1:29 AM Trevor Gamblin 
> <Trevor.Gamblin@windriver.com <mailto:Trevor.Gamblin@windriver.com>> 
> wrote:
>
>     From: Trevor Gamblin <trevor.gamblin@windriver.com
>     <mailto:trevor.gamblin@windriver.com>>
>
>     python-twisted is currently missing some packages for its
>     /usr/bin/twistd
>     executable to function. Add these to the RDEPENDS list, and also
>     clean up
>     formatting since the list is getting long.
>
>     Note that a similar patch has already been submitted for master
>     branch,
>     but the python2 version of twisted needs more explicit RDEPENDS
>     than the
>     python3 version submitted to master in order for /usr/bin/twistd
>     to work
>     properly.
>
>     Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com
>     <mailto:trevor.gamblin@windriver.com>>
>     ---
>      .../recipes-devtools/python/python-twisted.inc | 18
>     +++++++++++++++++-
>      1 file changed, 17 insertions(+), 1 deletion(-)
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python-twisted.inc
>     b/meta-python/recipes-devtools/python/python-twisted.inc
>     index d70104dc2..024a9fa7c 100644
>     --- a/meta-python/recipes-devtools/python/python-twisted.inc
>     +++ b/meta-python/recipes-devtools/python/python-twisted.inc
>     @@ -56,7 +56,23 @@ RDEPENDS_${PN} = "\
>          ${PN}-zsh \
>      "
>
>     -RDEPENDS_${PN}-core = "${PYTHON_PN}-core
>     ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental
>     ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat"
>     +RDEPENDS_${PN}-core = "${PYTHON_PN}-automat \
>     +                       ${PYTHON_PN}-constantly \
>     +                       ${PYTHON_PN}-core \
>     +                      ${PYTHON_PN}-debugger \
>     +                       ${PYTHON_PN}-hyperlink \
>     +                       ${PYTHON_PN}-incremental \
>     +                       ${PYTHON_PN}-misc \
>     +                       ${PYTHON_PN}-pkg-resources \
>     +                       ${PYTHON_PN}-pkgutil \
>     +                       ${PYTHON_PN}-plistlib \
>     +                       ${PYTHON_PN}-pyhamcrest \
>     +                       ${PYTHON_PN}-pyserial \
>     +                       ${PYTHON_PN}-setuptools \
>     +                       ${PYTHON_PN}-unixadmin \
>     +                       ${PYTHON_PN}-zopeinterface \
>     +"
>     +
>      RDEPENDS_${PN}-test = "${PN}"
>      RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
>      RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
>     -- 
>     2.24.0
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

