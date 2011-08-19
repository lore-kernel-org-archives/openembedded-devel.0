Received: from ramkesd003-e.ra.rockwell.com ([205.175.240.251]
	helo=ramilwsmtp01.ra.rockwell.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mkes@ra.rockwell.com>) id 1QuJXU-0000Gg-PF
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 09:30:49 +0200
In-Reply-To: <4E4DFAFF.7090006@gmail.com>
MIME-Version: 1.0
Sensitivity: 
To: openembedded-devel@lists.openembedded.org
X-Mailer: Lotus Notes Release 6.5.5  CCH1 March 07, 2006
From: Miroslav Kes <mkes@ra.rockwell.com>
Message-ID: <OFD4E645F6.B3E29A41-ONC12578F1.0028A813-C12578F1.0028D691@ra.rockwell.com>
Date: Fri, 19 Aug 2011 09:26:00 +0200
X-MIMETrack: Serialize by Router on RAMilwSMTP01/Milwaukee/RA/Rockwell(Release
	8.5.2FP2|March 22, 2011) at 08/19/2011 02:26:10 AM,
	Serialize complete at 08/19/2011 02:26:10 AM
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: inetlib_1.1.1.bb (classpathx) doesn't install inetlib.jar to the sysroot
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
X-List-Received-Date: Fri, 19 Aug 2011 07:30:49 -0000
Content-Type: text/plain; charset="US-ASCII"

---- patch begin -----

Index: classpathx/inetlib_1.1.1.bb
===================================================================
--- classpathx.orig/inetlib_1.1.1.bb
+++ classpathx/inetlib_1.1.1.bb
@@ -29,6 +29,7 @@ do_compile() {
 
 do_install_append() {
   java_install
+  java_stage
 }
 
 SRC_URI[md5sum] = "aaa24be4bc8d172ac675be8bdfa636ee"

----- patch end ------



Please respond to openembedded-devel@lists.openembedded.org
Sent by:        openembedded-devel-bounces@lists.openembedded.org
To:     openembedded-devel@lists.openembedded.org
cc:      
Subject:        Re: [oe] inetlib_1.1.1.bb (classpathx) doesn't install 
inetlib.jar to the sysroot

On 8/18/2011 4:25 AM, Miroslav Kes wrote:
> I have experienced this error when building the gnumail:
>
> $ cat log.do_configure
> ...
> checking if
> 
/home/mkes/sources/linux/platform/oebase/builds/beagleboard_gnu/build/tmp/sysroots/i686-linux/usr/bin/javac
> works... yes
> checking for fastjar... fastjar
> checking for
> 
/home/mkes/sources/linux/platform/oebase/builds/beagleboard_gnu/build/tmp/sysroots/java/activation.jar...
> yes
> checking for
> 
/home/mkes/sources/linux/platform/oebase/builds/beagleboard_gnu/build/tmp/sysroots/java/inetlib.jar...
> configure: error: can't find inetlib.jar in specified path
>
> Really, the inetlib_1.1.1.bb doesn't install the jar to the
> ${TMPDIR/sysroots/java. The logs show that the oe_jarinstall() is never
> called with the -s option.
>
> I have created a local overlay and added a call to the the java_stage 
i.e.
>
> do_install_append() {
>    java_install
>    java_stage
> }
>
> This fixed the problem.

can you post a patch for this please ?

>
> Regards
>
> Mira Kes
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



