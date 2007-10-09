Received: from [89.96.204.112] (helo=www-zirak-new.zirak.it)
	by linuxtogo.org with smtp (Exim 4.67) (envelope-from <phy@linux.it>)
	id 1IfH3n-0004Xa-B9
	for openembedded-devel@openembedded.org; Tue, 09 Oct 2007 17:31:51 +0200
Received: (qmail 25272 invoked by uid 64017); 9 Oct 2007 15:20:52 -0000
Received: from 62.123.41.74 (filippo@zirak.it@62.123.41.74) by www-zirak-new
	(envelope-from <phy@linux.it>, uid 64011) with qmail-scanner-2.01 
	(uvscan: v5.1.00/v5052. bogofilter: 0.92.0. spamassassin: 3.0.4.  
	Clear:RC:1(62.123.41.74):. 
	Processed in 0.789407 secs); 09 Oct 2007 15:20:52 -0000
Received: from unknown (HELO ?192.168.1.200?) (filippo@zirak.it@62.123.41.74)
	by www-zirak-new.zirak.it with SMTP; 9 Oct 2007 15:20:50 -0000
Message-ID: <470B9D9D.5080501@linux.it>
Date: Tue, 09 Oct 2007 17:26:21 +0200
From: Filippo Basso <phy@linux.it>
User-Agent: IceDove 1.5.0.12 (X11/20070730)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: different hosts, different OE images
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2007 15:31:51 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

    here is another developer jumped into the world of OE... Wow! really
amazing tool...!


Anyway, today I got into a strange behaviours that depends on the
machine on which I'm bitbakin' (a debian testing/lenny and a debian
stable/etch on vmware).
I understood that the results should be highly independent from host
system, so I begun debugging a bit.

So, I luckily (!) got also into a difference that lead me to a
compile/non-compile, much easier to debug. On a angstrom-2007.1 and i586
architecture, I added "minimo" web-browser and I got that with the same
identical OE installation it compiles on my machine and fails compiling
in my vmware.



2 new points are now in my debug log:

1st point - (one of these "I want to understand why...")
in general, quite all the files "run.do_configure.xxx" or similar are
not sorted in the same way; definitions of environment variables are in
different order, depending on the system... is it normal?

2nd point - (one that let me thing "is this a bug...?")
in mozilla minimo webbrowser (minimo-1_0.02+cvs20070626-r0) the
log.do_compile is strange:

***debian etch***
    ....
    ccache gcc -o host_xpidl
-isystem/home/nbt/OSSTBOX/trunk/oe/build-nbt-crownbeach/tmp/staging/i586-angstrom-linux/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
-DXP_UNIX -O3 
-I/home/nbt/OSSTBOX/trunk/oe/build-nbt-crownbeach/tmp/staging/i586-angstrom-linux/include/libIDL-2.0
-I/home/nbt/OSSTBOX/trunk/oe/build-nbt-crownbeach/tmp/staging/i586-angstrom-linux/include/glib-2.0
-I/home/nbt/OSSTBOX/trunk/oe/build-nbt-crownbeach/tmp/staging/i586-angstrom-linux/lib/glib-2.0/include
-DMDCPUCFG=\"md/_linux.cfg\"  host_xpidl.o host_xpidl_idl.o
host_xpidl_util.o host_xpidl_header.o host_xpidl_typelib.o
host_xpidl_doc.o host_xpidl_java.o ../../../dist/host/lib/libhostxpt.a
-L/home/nbt/OSSTBOX/trunk/oe/build-nbt-crownbeach/tmp/staging/i586-angstrom-linux/lib
-lIDL-2 -lglib-2.0
   
/home/nbt/OSSTBOX/trunk/oe/build-nbt-crownbeach/tmp/staging/i586-angstrom-linux/lib/libc.so.6:
undefined reference to `_dl_tls_get_addr_soft@GLIBC_PRIVATE'
collect2: ld returned 1 exit status
    make[7]: *** [host_xpidl] Error 1
    ...
    FATAL: oe_runmake failed
   
***debian lenny***
    the above "ccache gcc -o host_xpidl..." works well, even if there
are some warnings in compiling "ccache gcc -o host_xpidl_java.o ..."
that are not present in etch.

is this a bug? shouldn't the recipe invoke "ccache
i586-angstrom-linux-gcc" instead of "ccache gcc" (as is doing in other
parts of the recipe)???
Am I right saying that there it's using my gcc and not the cross-gcc? is
there an elegant way to check which other packages are using somewhere
my gcc and not the right one? (there was also another difference in
behaviours, before minimo, between the 2 images created)


thank you for all,
    hope to contribute more actively soon, now just need some newbie
confirmations!
phy






