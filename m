Return-Path: <prvs=7010ab24f=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF067533A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 08:04:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,242,1526335200"; 
   d="scan'208";a="1506623"
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	<openembedded-devel@lists.openembedded.org>
References: <20180425151735.9983-1-git@andred.net>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <d9e3f89e-8245-b49b-f315-93b531ba641c@skidata.com>
Date: Tue, 19 Jun 2018 10:04:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180425151735.9983-1-git@andred.net>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] openjdk-8: give downloaded files a more descriptive name
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
X-List-Received-Date: Tue, 19 Jun 2018 08:04:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 25.04.2018 17:17, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> Rather than using the HG (mercurial) changeset IDs directly,
> add a more descriptive part to the file name. This can help
> with download cache management.
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>   recipes-core/openjdk/openjdk-8-common.inc         | 14 ++++++-------
>   recipes-core/openjdk/openjdk-8-release-16xbyy.inc | 24 +++++++++++++++--------
>   2 files changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index d8b38f5..2c68462 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -30,13 +30,13 @@ SRC_URI = " \
>   do_unpack_extract_submodules () {
>       cd "${S}"
>       # tar --transform
> -    tar xjf ${WORKDIR}/${CORBA_FILE} --transform "s,-${CORBA_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${HOTSPOT_FILE} --transform "s,-${HOTSPOT_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${JAXP_FILE} --transform "s,-${JAXP_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${JAXWS_FILE} --transform "s,-${JAXWS_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${JDK_FILE} --transform "s,-${JDK_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${LANGTOOLS_FILE} --transform "s,-${LANGTOOLS_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${NASHORN_FILE} --transform "s,-${NASHORN_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${CORBA_FILE_LOCAL} --transform "s,-${CORBA_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${HOTSPOT_FILE_LOCAL} --transform "s,-${HOTSPOT_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${JAXP_FILE_LOCAL} --transform "s,-${JAXP_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${JAXWS_FILE_LOCAL} --transform "s,-${JAXWS_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${JDK_FILE_LOCAL} --transform "s,-${JDK_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${LANGTOOLS_FILE_LOCAL} --transform "s,-${LANGTOOLS_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${NASHORN_FILE_LOCAL} --transform "s,-${NASHORN_CHANGESET},,g"
>   }
>   
>   do_unpack_remove_X11_wrappers() {
> diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> index bd4a349..c1fcda4 100644
> --- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> @@ -64,25 +64,33 @@ OPENJDK_HG_U = "jdk8u"
>   OPENJDK_HG_URL = "http://hg.openjdk.java.net/${OPENJDK_ARCH_PORT}/${OPENJDK_HG_U}"
>   
>   OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
> -OPENJDK_URI = "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};name=openjdk"
> +OPENJDK_FILE_LOCAL = "openjdk8-${PV}-jdk8u-${OPENJDK_FILE}"
> +OPENJDK_URI = "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};downloadfilename=${OPENJDK_FILE_LOCAL};name=openjdk"
>   
>   HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
> -HOTSPOT_URI = "${OPENJDK_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
> +HOTSPOT_FILE_LOCAL = "openjdk8-${PV}-hotspot-${HOTSPOT_FILE}"
> +HOTSPOT_URI = "${OPENJDK_HG_URL}/hotspot/archive/${HOTSPOT_FILE};downloadfilename=${HOTSPOT_FILE_LOCAL};name=hotspot;unpack=false"
>   
>   CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
> -CORBA_URI = "${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
> +CORBA_FILE_LOCAL = "openjdk8-${PV}-corba-${CORBA_FILE}"
> +CORBA_URI = "${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};downloadfilename=${CORBA_FILE_LOCAL};name=corba;unpack=false"
>   
>   JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
> -JAXP_URI = "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
> +JAXP_FILE_LOCAL = "openjdk8-${PV}-jaxp-${JAXP_FILE}"
> +JAXP_URI = "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};downloadfilename=${JAXP_FILE_LOCAL};name=jaxp;unpack=false"
>   
>   JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
> -JAXWS_URI = "${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
> +JAXWS_FILE_LOCAL = "openjdk8-${PV}-jaxws-${JAXWS_FILE}"
> +JAXWS_URI = "${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};downloadfilename=${JAXWS_FILE_LOCAL};name=jaxws;unpack=false"
>   
>   JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
> -JDK_URI = "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
> +JDK_FILE_LOCAL = "openjdk8-${PV}-jdk-${JDK_FILE}"
> +JDK_URI = "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};downloadfilename=${JDK_FILE_LOCAL};name=jdk;unpack=false"
>   
>   LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
> -LANGTOOLS_URI = "${OPENJDK_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
> +LANGTOOLS_FILE_LOCAL = "openjdk8-${PV}-langtools-${LANGTOOLS_FILE}"
> +LANGTOOLS_URI = "${OPENJDK_HG_URL}/langtools/archive/${LANGTOOLS_FILE};downloadfilename=${LANGTOOLS_FILE_LOCAL};name=langtools;unpack=false"
>   
>   NASHORN_FILE = "${NASHORN_CHANGESET}.tar.bz2"
> -NASHORN_URI = "${OPENJDK_HG_URL}/nashorn/archive/${NASHORN_FILE};name=nashorn;unpack=false"
> +NASHORN_FILE_LOCAL = "openjdk8-${PV}-nashorn-${NASHORN_FILE}"
> +NASHORN_URI = "${OPENJDK_HG_URL}/nashorn/archive/${NASHORN_FILE};downloadfilename=${NASHORN_FILE_LOCAL};name=nashorn;unpack=false"
> 

