Return-Path: <Jianchuan.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 997DE60670
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 02:12:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0M2CbtA020572
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 18:12:38 -0800 (PST)
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 21 Jan 2015 18:12:37 -0800
Message-ID: <54C05C72.2080300@windriver.com>
Date: Thu, 22 Jan 2015 10:12:02 +0800
From: Jianchuan Wang <Jianchuan.Wang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1421390018-22395-1-git-send-email-jianchuan.wang@windriver.com>
In-Reply-To: <1421390018-22395-1-git-send-email-jianchuan.wang@windriver.com>
X-Originating-IP: [128.224.162.153]
Subject: Re: [meta-networking][PATCH v2] ipvsadm: Add version 1.26 (initial recipe)
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
X-List-Received-Date: Thu, 22 Jan 2015 02:12:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Maybe there is a parallel compile problem, please ignore it, I will do 
more test and re-send the patch.

Thanks
Jianchuan

On 01/16/2015 02:33 PM, jianchuan.wang@windriver.com wrote:
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
> * add ipvs administration tool
>
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>   ...001-Modify-the-Makefile-for-cross-compile.patch | 91 ++++++++++++++++++++++
>   .../0002-Replace-nl_handle-to-nl_sock.patch        | 63 +++++++++++++++
>   .../recipes-support/ipvsadm/ipvsadm_1.26.bb        | 34 ++++++++
>   3 files changed, 188 insertions(+)
>   create mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Modify-the-Makefile-for-cross-compile.patch
>   create mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm/0002-Replace-nl_handle-to-nl_sock.patch
>   create mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
>
> diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Modify-the-Makefile-for-cross-compile.patch b/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Modify-the-Makefile-for-cross-compile.patch
> new file mode 100644
> index 0000000..27358b9
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Modify-the-Makefile-for-cross-compile.patch
> @@ -0,0 +1,91 @@
> +From c2b9c96109c074851a8fd5ee249a4e68697282ce Mon Sep 17 00:00:00 2001
> +From: Jianchuan Wang <jianchuan.wang@windriver.com>
> +Date: Mon, 12 Jan 2015 15:53:23 +0800
> +Subject: [PATCH 1/2] Modify the Makefile for cross compile.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> +---
> + Makefile         | 21 +++++----------------
> + libipvs/Makefile |  3 +--
> + 2 files changed, 6 insertions(+), 18 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index e4e03cc..ea44c1d 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -35,10 +35,9 @@ ARCH		= $(shell uname -m)
> + RPMSOURCEDIR	= $(shell rpm --eval '%_sourcedir')
> + RPMSPECDIR	= $(shell rpm --eval '%_specdir')
> +
> +-CC		= gcc
> + INCLUDE		=
> + SBIN		= $(BUILD_ROOT)/sbin
> +-MANDIR		= usr/man
> ++MANDIR		= usr/share/man
> + MAN		= $(BUILD_ROOT)/$(MANDIR)/man8
> + INIT		= $(BUILD_ROOT)/etc/rc.d/init.d
> + MKDIR		= mkdir
> +@@ -62,17 +61,7 @@ RPMBUILD = $(shell				\
> + 		echo "/bin/rpm";		\
> + 	fi )
> +
> +-ifeq (,$(FORCE_GETOPT))
> +-LIB_SEARCH = /lib64 /usr/lib64 /usr/local/lib64 /lib /usr/lib /usr/local/lib
> +-POPT_LIB = $(shell for i in $(LIB_SEARCH); do \
> +-  if [ -f $$i/libpopt.a ]; then \
> +-    if nm $$i/libpopt.a | fgrep -q poptGetContext; then \
> +-	echo "-lpopt"; \
> +-	break; \
> +-    fi; \
> +-  fi; \
> +-done)
> +-endif
> ++POPT_LIB = -lpopt
> +
> + ifneq (,$(POPT_LIB))
> + POPT_DEFINE = -DHAVE_POPT
> +@@ -81,7 +70,7 @@ endif
> + OBJS		= ipvsadm.o config_stream.o dynamic_array.o
> + LIBS		= $(POPT_LIB)
> + ifneq (0,$(HAVE_NL))
> +-LIBS		+= -lnl
> ++LIBS		+= -lnl-3 -lnl-genl-3
> + endif
> + DEFINES		= -DVERSION=\"$(VERSION)\" -DSCHEDULERS=\"$(SCHEDULERS)\" \
> + 		  -DPE_LIST=\"$(PE_LIST)\" $(POPT_DEFINE)
> +@@ -96,8 +85,8 @@ all:            libs ipvsadm
> + libs:
> + 		make -C libipvs
> +
> +-ipvsadm:	$(OBJS) $(STATIC_LIBS)
> +-		$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
> ++ipvsadm:	$(OBJS)
> ++		$(CC) $(CFLAGS) -o $@ $^ $(STATIC_LIBS) $(LIBS)
> +
> + install:        all
> + 		if [ ! -d $(SBIN) ]; then $(MKDIR) -p $(SBIN); fi
> +diff --git a/libipvs/Makefile b/libipvs/Makefile
> +index a527a7f..b7300ec 100644
> +--- a/libipvs/Makefile
> ++++ b/libipvs/Makefile
> +@@ -1,6 +1,5 @@
> + # Makefile for libipvs
> +
> +-CC		= gcc
> + CFLAGS		= -Wall -Wunused -Wstrict-prototypes -g -fPIC
> + ifneq (0,$(HAVE_NL))
> + CFLAGS		+= -DLIBIPVS_USE_NL
> +@@ -18,7 +17,7 @@ SHARED_LIB	= libipvs.so
> + all:		$(STATIC_LIB) $(SHARED_LIB)
> +
> + $(STATIC_LIB):	libipvs.o ip_vs_nl_policy.o
> +-		ar rv $@ $^
> ++		$(AR) rv $@ $^
> +
> + $(SHARED_LIB):	libipvs.o ip_vs_nl_policy.o
> + 		$(CC) -shared -Wl,-soname,$@ -o $@ $^
> +--
> +1.8.3.1
> +
> diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm/0002-Replace-nl_handle-to-nl_sock.patch b/meta-networking/recipes-support/ipvsadm/ipvsadm/0002-Replace-nl_handle-to-nl_sock.patch
> new file mode 100644
> index 0000000..7896d6d
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipvsadm/ipvsadm/0002-Replace-nl_handle-to-nl_sock.patch
> @@ -0,0 +1,63 @@
> +From 2686213259b15df9cf1d969c5a14d62f14cfbaae Mon Sep 17 00:00:00 2001
> +From: Jianchuan Wang <jianchuan.wang@windriver.com>
> +Date: Thu, 8 Jan 2015 17:37:11 +0800
> +Subject: [PATCH 2/2] Replace nl_handle to nl_sock.
> +
> +The nl_handle was replace with nl_sock in the libnl-3.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> +---
> + libipvs/libipvs.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/libipvs/libipvs.c b/libipvs/libipvs.c
> +index a157e18..21a9bfa 100644
> +--- a/libipvs/libipvs.c
> ++++ b/libipvs/libipvs.c
> +@@ -32,7 +32,7 @@ static void* ipvs_func = NULL;
> + struct ip_vs_getinfo ipvs_info;
> +
> + #ifdef LIBIPVS_USE_NL
> +-static struct nl_handle *sock = NULL;
> ++static struct nl_sock *sock = NULL;
> + static int family, try_nl = 1;
> + #endif
> +
> +@@ -73,7 +73,7 @@ int ipvs_nl_send_message(struct nl_msg *msg, nl_recvmsg_msg_cb_t func, void *arg
> + {
> + 	int err = EINVAL;
> +
> +-	sock = nl_handle_alloc();
> ++	sock = nl_socket_alloc();
> + 	if (!sock) {
> + 		nlmsg_free(msg);
> + 		return -1;
> +@@ -88,7 +88,7 @@ int ipvs_nl_send_message(struct nl_msg *msg, nl_recvmsg_msg_cb_t func, void *arg
> +
> + 	/* To test connections and set the family */
> + 	if (msg == NULL) {
> +-		nl_handle_destroy(sock);
> ++		nl_socket_free(sock);
> + 		sock = NULL;
> + 		return 0;
> + 	}
> +@@ -104,12 +104,12 @@ int ipvs_nl_send_message(struct nl_msg *msg, nl_recvmsg_msg_cb_t func, void *arg
> +
> + 	nlmsg_free(msg);
> +
> +-	nl_handle_destroy(sock);
> ++	nl_socket_free(sock);
> +
> + 	return 0;
> +
> + fail_genl:
> +-	nl_handle_destroy(sock);
> ++	nl_socket_free(sock);
> + 	sock = NULL;
> + 	nlmsg_free(msg);
> + 	errno = err;
> +--
> +1.8.3.1
> +
> diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
> new file mode 100644
> index 0000000..ac97d47
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Linux Virtual Server administration Utility"
> +DESCRIPTION = "Ipvsadm  is  used  to set up, maintain or inspect the virtual server \
> +table in the Linux kernel. The Linux Virtual  Server  can  be  used  to \
> +build  scalable  network  services  based  on  a cluster of two or more nodes. \
> +The active node of the cluster redirects service requests  to  a \
> +collection  of  server  hosts  that will actually perform the services. \
> +Supported features include two protocols (TCP and UDP),  three  packet-forwarding \
> +methods (NAT, tunneling, and direct routing), and eight load balancing algorithms \
> +(round robin, weighted round robin,  least-connec-tion, weighted least-connection, \
> +locality-based  least-connection, locality-based least-connection with replication, \
> +destination-hashing, and source-hashing)."
> +SECTION = "console/network"
> +LICENSE = "GPL-2.0"
> +LIC_FILES_CHKSUM = "file://README;beginline=40;endline=56;md5=a54cba37b64924aa5008881607942892"
> +
> +DEPENDS += "libnl popt"
> +
> +SRC_URI = "http://www.linuxvirtualserver.org/software/kernel-2.6/${BP}.tar.gz \
> +        file://0001-Modify-the-Makefile-for-cross-compile.patch \
> +        file://0002-Replace-nl_handle-to-nl_sock.patch \
> +"
> +
> +SRC_URI[md5sum] = "eac3ba3f62cd4dea2da353aeddd353a8"
> +SRC_URI[sha256sum] = "6d6c46fecb1c532a892616b4445c73b71730e8790d5630f60269fd9cbee0eb2d"
> +
> +do_compile() {
> +    oe_runmake \
> +    CC="${CC} -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3 -L${STAGING_LIBDIR}" \
> +    all
> +}
> +
> +do_install() {
> +    oe_runmake 'BUILD_ROOT=${D}' install
> +}


