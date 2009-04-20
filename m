Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Lw1Dj-0000dT-FR
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 23:40:07 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIF001DA5AYAFB1@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	20 Apr 2009 16:35:22 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C20316B83A8; Mon,
	20 Apr 2009 17:35:21 -0400 (EDT)
Date: Mon, 20 Apr 2009 17:35:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090420213521.GD6379@denix.org>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-10-git-send-email-marcin@juszkiewicz.com.pl>
	<gsi85j$ec5$6@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <gsi85j$ec5$6@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 1/1] hostap-utils-0.4.7: use LDFLAGS	(fixes QA error)
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
X-List-Received-Date: Mon, 20 Apr 2009 21:40:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 20, 2009 at 06:33:55PM +0200, Koen Kooi wrote:
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>


> On 20-04-09 17:25, Marcin Juszkiewicz wrote:
>> From: Jeremy Lain??<jeremy.laine@m4x.org>
>>
>> ---
>>   recipes/hostap/hostap-utils-0.4.7/ldflags.patch |   24 
>> +++++++++++++++++++++++
>>   recipes/hostap/hostap-utils_0.4.7.bb            |   24 
>> ++++++++++++++++++++++-
>>   2 files changed, 47 insertions(+), 1 deletions(-)
>>   create mode 100644 recipes/hostap/hostap-utils-0.4.7/ldflags.patch
>>
>> diff --git a/recipes/hostap/hostap-utils-0.4.7/ldflags.patch 
>> b/recipes/hostap/hostap-utils-0.4.7/ldflags.patch
>> new file mode 100644
>> index 0000000..d2ca298
>> --- /dev/null
>> +++ b/recipes/hostap/hostap-utils-0.4.7/ldflags.patch
>> @@ -0,0 +1,24 @@
>> +diff -urN hostap-utils-0.4.7.orig/Makefile hostap-utils-0.4.7/Makefile
>> +--- hostap-utils-0.4.7.orig/Makefile	2005-01-01 06:42:51.000000000 +0000
>> ++++ hostap-utils-0.4.7/Makefile	2009-04-08 08:36:46.000000000 +0000
>> +@@ -14,17 +14,17 @@
>> + hostap_crypt_conf: hostap_crypt_conf.c
>> +
>> + hostap_diag: hostap_diag.o util.o
>> +-	$(CC) -o hostap_diag $(CFLAGS) hostap_diag.o util.o
>> ++	$(CC) -o hostap_diag $(CFLAGS) $(LDFLAGS) hostap_diag.o util.o
>> +
>> + hostap_diag.o: hostap_diag.c util.h
>> +
>> + util.o: util.c util.h
>> +
>> + hostap_io_debug: hostap_io_debug.c
>> +-	$(CC) -o hostap_io_debug $(CFLAGS) hostap_io_debug.c
>> ++	$(CC) -o hostap_io_debug $(CFLAGS) $(LDFLAGS) hostap_io_debug.c
>> +
>> + hostap_rid: hostap_rid.o util.o
>> +-	$(CC) -o hostap_rid $(CFLAGS) hostap_rid.o util.o
>> ++	$(CC) -o hostap_rid $(CFLAGS) $(LDFLAGS) hostap_rid.o util.o
>> +
>> + hostap_rid.o: hostap_rid.c util.h
>> +
>> diff --git a/recipes/hostap/hostap-utils_0.4.7.bb 
>> b/recipes/hostap/hostap-utils_0.4.7.bb
>> index 9fe362b..5635947 100644
>> --- a/recipes/hostap/hostap-utils_0.4.7.bb
>> +++ b/recipes/hostap/hostap-utils_0.4.7.bb
>> @@ -1 +1,23 @@
>> -require hostap-utils.inc
>> +DESCRIPTION = "User mode helpers for the hostap driver"
>> +HOMEPAGE = "http://hostap.epitest.fi"
>> +SECTION = "kernel/userland"
>> +PRIORITY = "optional"
>> +LICENSE = "GPL"
>> +PR = "r6"
>> +
>> +SRC_URI = "http://hostap.epitest.fi/releases/hostap-utils-${PV}.tar.gz \
>> +	   file://hostap-fw-load.patch;patch=1 \
>> +	   file://ldflags.patch;patch=1"
>> +
>> +S = "${WORKDIR}/hostap-utils-${PV}"
>> +
>> +BINARIES = "hostap_crypt_conf hostap_diag hostap_fw_load hostap_io_debug 
>> \
>> +	    hostap_rid prism2_param prism2_srec split_combined_hex"
>> +
>> +do_install() {
>> +	install -d ${D}${sbindir}/
>> +	for f in ${BINARIES}
>> +	do
>> +		install -m 0755 $f ${D}${sbindir}/
>> +	done
>> +}
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


