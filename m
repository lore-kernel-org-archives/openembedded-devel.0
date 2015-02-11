Return-Path: <dpquigl@tycho.nsa.gov>
X-Greylist: delayed 852 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Feb 2015 16:05:17 UTC
Received: from emvm-gh1-uea08.nsa.gov (emvm-gh1-uea08.nsa.gov [63.239.67.9])
	by mail.openembedded.org (Postfix) with ESMTP id 87D9572DAE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 16:05:17 +0000 (UTC)
X-TM-IMSS-Message-ID: <7fcdcc2400116d99@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([63.239.67.9]) with ESMTP (TREND IMSS SMTP Service 7.1;
	TLSv1/SSLv3 DHE-RSA-AES256-SHA (256/256)) id 7fcdcc2400116d99 ;
	Wed, 11 Feb 2015 10:50:57 -0500
Received: from moss-clam.infosec.tycho.ncsc.mil (moss-clam [192.168.25.42])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id t1BFokHL019365
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:50:56 -0500
Message-ID: <1423669983.23617.78.camel@tycho.nsa.gov>
From: dpquigl <dpquigl@tycho.nsa.gov>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Feb 2015 10:53:03 -0500
X-Mailer: Evolution 3.12.10 (3.12.10-1.fc21) 
Mime-Version: 1.0
Subject: meta-selinux
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
X-List-Received-Date: Wed, 11 Feb 2015 16:05:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

I'm working on OpenXT and it makes use of the meta-selinux repo hosted
by the yocto project. I'm trying to use it with a base openembedded core
and its not in sync with oe-core because its based on pokey. This made
me think of two questions. 1) Why is this not in OE core since so many
packages in core can potentially have SELinux support enabled and 2) if
its not supposed to be in core where should turning on SELinux support
in a recipe go? For example coreutils can have SELinux support enabled.
Currently this is in meta-selinux as a bbappend to the coreutils
package. This works out because its always going to be there. However
there is also a bbappend for an LXC recipe. LXC isn't in core which
means it has a dependency on a layer not in core.

Ideally I would put the recipes needed for SELinux support in core and
have a distro feature which is checked in the recipes in core for
whether or not to add --with-selinux to the build flags. Then LXC could
check a core distro feature and enable SELinux if it wants to. 

What is the right way to proceed with this?

Dave


