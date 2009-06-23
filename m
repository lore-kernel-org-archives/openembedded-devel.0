Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MJEix-0000on-5O
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 00:44:19 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLP00663QN9CF42@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	23 Jun 2009 17:33:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 136CD14AF5F; Tue,
	23 Jun 2009 18:33:09 -0400 (EDT)
Date: Tue, 23 Jun 2009 18:33:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623223309.GD32082@denix.org>
References: <200906230940.05121.marcin@juszkiewicz.com.pl>
	<1245747417-11163-3-git-send-email-marcin@juszkiewicz.com.pl>
	<h1q6cn$a5v$9@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1q6cn$a5v$9@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 054/125] netpbm: Make this aware of	LDFLAGS, fixes QA GNU_HASH issue
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
X-List-Received-Date: Tue, 23 Jun 2009 22:44:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 23, 2009 at 11:13:58AM +0200, Koen Kooi wrote:
> On 23-06-09 10:56, Marcin Juszkiewicz wrote:
>> From: Tim 'timtim' Ellis<tim.ellis@foonas.org>
>>
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   recipes/netpbm/netpbm-10.28/libgnuhash.patch |   12 ++++++++++++
>>   recipes/netpbm/netpbm_10.28.bb               |    3 ++-
>>   2 files changed, 14 insertions(+), 1 deletions(-)
>>   create mode 100644 recipes/netpbm/netpbm-10.28/libgnuhash.patch
>>
>> diff --git a/recipes/netpbm/netpbm-10.28/libgnuhash.patch 
>> b/recipes/netpbm/netpbm-10.28/libgnuhash.patch
>> new file mode 100644
>> index 0000000..3df92ca
>> --- /dev/null
>> +++ b/recipes/netpbm/netpbm-10.28/libgnuhash.patch
>> @@ -0,0 +1,12 @@
>> +diff -urN netpbm-10.28.old/lib/Makefile netpbm-10.28/lib/Makefile
>> +--- netpbm-10.28.old/lib/Makefile	2005-02-05 18:47:27.000000000 +0000
>> ++++ netpbm-10.28/lib/Makefile	2009-05-12 13:33:10.000000000 +0100
>> +@@ -111,7 +111,7 @@
>> + 	rm -f $@
>> + 	$(SYMLINK) $<  $@
>> + libnetpbm.$(NETPBMLIBSUFFIX).$(MAJ).$(MIN): $(LIBOBJECTS) 
>> $(LIBOBJECTS_X)
>> +-	$(LD) $(LDSHLIB) -o $@ $(LIBOBJECTS) $(LIBOBJECTS_X) \
>> ++	$(LD) $(LDFLAGS) $(LDSHLIB) -o $@ $(LIBOBJECTS) $(LIBOBJECTS_X) \
>> +           $(SHLIB_CLIB) $(LADD)
>> + endif
>> +
>> diff --git a/recipes/netpbm/netpbm_10.28.bb 
>> b/recipes/netpbm/netpbm_10.28.bb
>> index 8469074..2672e4a 100644
>> --- a/recipes/netpbm/netpbm_10.28.bb
>> +++ b/recipes/netpbm/netpbm_10.28.bb
>> @@ -25,10 +25,11 @@ RDEPENDS = "perl\
>>   RDEPENDS += "perl-module-exporter-heavy"
>>   RDEPENDS += "perl-module-file-spec-unix"
>>
>> -PR = "r6"
>> +PR = "r7"
>>
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/netpbm/netpbm-${PV}.tgz \
>>   	   file://ppmtojpeg.patch;patch=42 \
>> +	   file://libgnuhash.patch;patch=1 \
>>   	   file://Makefile.config \
>>   	   file://oeendiangen"
>>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


