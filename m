Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LxPRb-0006H7-Ob
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 19:44:12 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIM00HQ8918O0KO@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	24 Apr 2009 12:39:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 867BB6B83A8; Fri,
	24 Apr 2009 13:39:08 -0400 (EDT)
Date: Fri, 24 Apr 2009 13:39:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090424173908.GF28636@denix.org>
References: <1240560708-14550-1-git-send-email-denis@denix.org>
	<gssg3a$rpo$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <gssg3a$rpo$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH] udev 124: fix the absolute soname link in	libvolume for SDK
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
X-List-Received-Date: Fri, 24 Apr 2009 17:44:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 24, 2009 at 03:50:34PM +0200, Koen Kooi wrote:
> On 24-04-09 10:11, Denys Dmytriyenko wrote:
>>
>> Signed-off-by: Denys Dmytriyenko<denis@denix.org>
>
>
> Looks OK to me:
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Do I need another ack?

>> ---
>>   recipes/udev/udev-124/libvolume-id-soname.patch |   12 ++++++++++++
>>   recipes/udev/udev_124.bb                        |    3 ++-
>>   2 files changed, 14 insertions(+), 1 deletions(-)
>>   create mode 100644 recipes/udev/udev-124/libvolume-id-soname.patch
>>
>> diff --git a/recipes/udev/udev-124/libvolume-id-soname.patch 
>> b/recipes/udev/udev-124/libvolume-id-soname.patch
>> new file mode 100644
>> index 0000000..56365a4
>> --- /dev/null
>> +++ b/recipes/udev/udev-124/libvolume-id-soname.patch
>> @@ -0,0 +1,12 @@
>> +diff -uNr udev-124-orig/extras/volume_id/lib/Makefile 
>> udev-124/extras/volume_id/lib/Makefile
>> +--- udev-124-orig/extras/volume_id/lib/Makefile	2008-06-12 
>> 01:24:30.000000000 -0400
>> ++++ udev-124/extras/volume_id/lib/Makefile	2009-01-14 23:32:42.000000000 
>> -0500
>> +@@ -113,7 +113,7 @@
>> + ifeq ($(libdir),$(usrlibdir))
>> + 	ln -sf $(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
>> + else
>> +-	ln -sf $(libdir)/$(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
>> ++	ln -sf ../..$(libdir)/$(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
>> + endif
>> + 	$(INSTALL) -d $(DESTDIR)$(usrlibdir)/pkgconfig
>> + 	$(INSTALL_DATA) libvolume_id.pc 
>> $(DESTDIR)$(usrlibdir)/pkgconfig/libvolume_id.pc
>> diff --git a/recipes/udev/udev_124.bb b/recipes/udev/udev_124.bb
>> index 76edb2f..37dc3a7 100644
>> --- a/recipes/udev/udev_124.bb
>> +++ b/recipes/udev/udev_124.bb
>> @@ -2,13 +2,14 @@ DESCRIPTION = "udev is a daemon which dynamically 
>> creates and removes device nod
>>   /dev/, handles hotplug events and loads drivers at boot time. It 
>> replaces \
>>   the hotplug package and requires a kernel not older than 2.6.12."
>>   RPROVIDES_${PN} = "hotplug"
>> -PR = "r14"
>> +PR = "r15"
>>
>>   SRC_URI = 
>> "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
>>   	   file://noasmlinkage.patch;patch=1 \
>>   	   file://flags.patch;patch=1 \
>>   	   file://vol_id_ld.patch;patch=1 \
>>   	   file://udevtrigger_add_devname_filtering.patch;patch=1 \
>> +	   file://libvolume-id-soname.patch;patch=1 \
>>   	   file://mount.blacklist \
>>   	   file://run.rules \
>>   	   "
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


