Return-Path: <list@xenhideout.nl>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 01 May 2017 15:56:48 UTC
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	by mail.openembedded.org (Postfix) with ESMTP id C074B6FF56
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 May 2017 15:56:48 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id 84424644F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 May 2017 17:49:41 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 01 May 2017 17:49:41 +0200
From: Xen <list@xenhideout.nl>
To: openembedded-devel@lists.openembedded.org
Message-ID: <8abc320ccb1265aac68072693427f8eb@xenhideout.nl>
X-Sender: list@xenhideout.nl
User-Agent: Roundcube Webmail/1.2.4
Subject: cacao-native 1.6.1 failing because compiler not produced?
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
X-List-Received-Date: Mon, 01 May 2017 15:56:49 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

I am trying to compile openjdk with cacao for Armv5.

I followed the (older) instructions on 
http://icedtea.classpath.org/wiki/CrossCompileOECoreTutorial and 
replaced the java-meta repository with the new location.

I've set the machine to qemuarm and tried to select cacao as the 
preferred jvm everywhere:

PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"

PREFERRED_PROVIDER_virtual/java-native = "cacao-native"
PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"

PREFERRED_RPROVIDER_java2-runtime = "cacao"

PREFERRED_VERSION_cacao-initial = "0.98"
PREFERRED_VERSION_classpath-initial = "0.93"

PREFERRED_VERSION_icedtea6-native = "1.8.11"
PREFERRED_VERSION_classpath-native = "0.99"

PREFERRED_VERSION_classpath = "0.99"

PREFERRED_PROVIDER_classpath = "classpath-minimal"

I don't know if there are any version issue, for initial cacao I had 
this 0.98 but for other aspects it chose 1.6.1 as the only available 
choice.

I removed the reference to 0.98 and I am now just retrying everything.

But in any case the error I got was that



build/tmp-glibc/work/x86_64-linux/cacao-native/1.6.1-r0/recipe-sysroot-native/usr/bin/ecj-initial

could not find java-initial which, when present, would not be able to 
find cacao-initial.

Because both didn't exist.

If I symlinked the missing versions to 0.98 version it would core dump.

Should I symlink this to something else?



My bblayers.conf is:

BBLAYERS = " \
   /prj/oe-core/meta \
   /prj/oe-core/meta-openembedded/meta-oe \
   /prj/oe-core/meta-java \
   /prj/oe-core/meta-kirkwood \
   "

apart from the usual, and kirkwood does give an error but not very 
important I think:

WARNING: No bb files matched BBFILE_PATTERN_meta-kirkwood 
'^/prj/oe-core/meta-kirkwood/'

I did not use Hob (it was not there ;-)).

Other things have not been changed in either local.conf or 
bblayers.conf.



What can I do here? Not use cacao for native and target?

I'm very new to this ;-).

Regards,

Xen.

