Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E804860992
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:36:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00UFZUU6029286
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 30 Jan 2020 07:35:40 -0800
Received: from [128.224.56.226] (128.224.56.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 30 Jan 2020 07:35:20 -0800
To: Tim Orling <ticotimo@gmail.com>
References: <20200127204322.143707-1-trevor.gamblin@windriver.com>
	<CANx9H-CZe5bCG-tv2YVkEiQy=PVPYPHhw6n9AcghP+dZ1yBogg@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <f18b9364-decd-8316-03dd-626cff3fe2ac@windriver.com>
Date: Thu, 30 Jan 2020 10:35:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CANx9H-CZe5bCG-tv2YVkEiQy=PVPYPHhw6n9AcghP+dZ1yBogg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][zeus][PATCH 1/2] python-twisted: add required RDEPENDS for twistd
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 1/30/20 1:00 AM, Tim Orling wrote:
>
>
> On Mon, Jan 27, 2020 at 12:44 PM Trevor Gamblin 
> <trevor.gamblin@windriver.com <mailto:trevor.gamblin@windriver.com>> 
> wrote:
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
>     index d70104dc2..f55bbb033 100644
>     --- a/meta-python/recipes-devtools/python/python-twisted.inc
>     +++ b/meta-python/recipes-devtools/python/python-twisted.inc
>     @@ -56,7 +56,23 @@ RDEPENDS_${PN} = "\
>          ${PN}-zsh \
>      "
>
>     -RDEPENDS_${PN}-core = "${PYTHON_PN}-core
>     ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental
>     ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat"
>     +RDEPENDS_${PN}-core = "${PYTHON_PN}-core \
>     +                       ${PYTHON_PN}-zopeinterface \
>     +                       ${PYTHON_PN}-incremental \
>     +                       ${PYTHON_PN}-constantly \
>     +                       ${PYTHON_PN}-hyperlink \
>     +                       ${PYTHON_PN}-automat \
>     +                       ${PYTHON_PN}-pyserial \
>     +                       ${PYTHON_PN}-pyhamcrest \
>     +                       ${PYTHON_PN}-debugger \
>     +                       ${PYTHON_PN}-unixadmin \
>     +                       ${PYTHON_PN}-pkg-resources \
>     +                       ${PYTHON_PN}-misc \
>     +                       ${PYTHON_PN}-pkgutil \
>     +                       ${PYTHON_PN}-plistlib \
>     +                       ${PYTHON_PN}-setuptools \
>     +"
>
>
> Please sort this alphabetically. It is MUCH easier to see what is 
> present or missing that way.
Done, v2 sent.
>
>     +
>      RDEPENDS_${PN}-test = "${PN}"
>      RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
>      RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
>     -- 
>     2.23.0
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

