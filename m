Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDB037E3AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2019 01:34:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5A1YsjT028516
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Jun 2019 18:34:54 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 9 Jun 2019 18:34:53 -0700
To: Tim Orling <ticotimo@gmail.com>
References: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
	<1559703841-263740-3-git-send-email-changqing.li@windriver.com>
	<CANx9H-AQ46hCN=CzMQuGOWxjHeyEJz7ZyxW=HzXtJpxCAg2ZSA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <1876ebf3-47eb-2fdc-d149-2f760470c6ce@windriver.com>
Date: Mon, 10 Jun 2019 09:34:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CANx9H-AQ46hCN=CzMQuGOWxjHeyEJz7ZyxW=HzXtJpxCAg2ZSA@mail.gmail.com>
X-Originating-IP: [128.224.162.186]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/7] python-pygobject: upgrade 3.28.3 -> 3.32.1
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
X-List-Received-Date: Mon, 10 Jun 2019 01:34:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 6/7/19 3:12 PM, Tim Orling wrote:
> Please consider providing a python3 version as well. Python2 will be 
> EOL soon.
Already have one under oe-core layer
>
> On Tue, Jun 4, 2019 at 8:04 PM <changqing.li@windriver.com 
> <mailto:changqing.li@windriver.com>> wrote:
>
>     From: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>
>     switch to meson build
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     ---
>      ...thon-pygobject_3.28.3.bb <http://thon-pygobject_3.28.3.bb> =>
>     python-pygobject_3.32.1.bb <http://python-pygobject_3.32.1.bb>} |
>     14 +++++++++-----
>      1 file changed, 9 insertions(+), 5 deletions(-)
>      rename
>     meta-oe/recipes-devtools/python/{python-pygobject_3.28.3.bb
>     <http://python-pygobject_3.28.3.bb> => python-pygobject_3.32.1.bb
>     <http://python-pygobject_3.32.1.bb>} (64%)
>
>     diff --git
>     a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
>     <http://python-pygobject_3.28.3.bb>
>     b/meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
>     <http://python-pygobject_3.32.1.bb>
>     similarity index 64%
>     rename from
>     meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
>     <http://python-pygobject_3.28.3.bb>
>     rename to
>     meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
>     <http://python-pygobject_3.32.1.bb>
>     index 348a039..c26b383 100644
>     --- a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
>     <http://python-pygobject_3.28.3.bb>
>     +++ b/meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
>     <http://python-pygobject_3.32.1.bb>
>     @@ -4,6 +4,7 @@ SECTION = "devel/python"
>      LICENSE = "LGPLv2.1"
>      LIC_FILES_CHKSUM =
>     "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
>
>     +GNOMEBASEBUILDCLASS = "meson"
>      inherit gnomebase gobject-introspection distutils-base
>     upstream-version-is-even
>
>      DEPENDS += "python glib-2.0"
>     @@ -13,16 +14,19 @@ SRC_URI = " \
>     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir(
>     <http://ftp.gnome.org/pub/GNOME/sources/$%7BSRCNAME%7D/$%7B@gnome_verdir(>"${PV}")}/${SRCNAME}-${PV}.tar.xz
>     \
>      "
>
>     -SRC_URI[md5sum] = "3bac63c86bb963aa401f97859464aa90"
>     -SRC_URI[sha256sum] =
>     "3dd3e21015d06e00482ea665fc1733b77e754a6ab656a5db5d7f7bfaf31ad0b0"
>     +SRC_URI[md5sum] = "9d5dbca10162dd9b0d03fed0c6cf865d"
>     +SRC_URI[sha256sum] =
>     "32c99def94b8dea5ce9e4bc99576ef87591ea779b4db77cfdca7af81b76d04d8"
>
>      S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>     -BBCLASSEXTEND = "native"
>     +UNKNOWN_CONFIGURE_WHITELIST = "introspection"
>     +
>     +PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo
>     python-pycairo, python-pycairo"
>     +PACKAGECONFIG[tests] = "-Dtests=true, -Dtests=false, , "
>
>     -EXTRA_OECONF = "--disable-cairo"
>
>     -RDEPENDS_${PN} += "python-setuptools"
>     +BBCLASSEXTEND = "native"
>     +RDEPENDS_${PN} = "python-setuptools"
>      RDEPENDS_${PN}_class-native = ""
>
>      do_install_append() {
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
-- 
BRs

Sandy(Li Changqing)


