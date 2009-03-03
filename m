Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LeMb8-0004YF-1H
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 05:51:18 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFW001TCYMHBLIO@vms173009.mailsrvcs.net> for
	openembedded-devel@openembedded.org;
	Mon, 02 Mar 2009 22:47:11 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 53FF86B83B5; Mon,
	02 Mar 2009 23:47:05 -0500 (EST)
Date: Mon, 02 Mar 2009 23:47:05 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090303044705.GB26643@denix.org>
References: <1236023043.6800.1174.camel@alap>
MIME-version: 1.0
In-reply-to: <1236023043.6800.1174.camel@alap>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Lista Openembedded <openembedded-devel@openembedded.org>
Subject: Re: New recipe for openmoko QA test scripts
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
X-List-Received-Date: Tue, 03 Mar 2009 04:51:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 02, 2009 at 12:44:03PM -0700, Angus Ainslie wrote:
> Please review for any policy violations.
> 
> Thanks
> Angus
> 
> --- openembedded/packages/openmoko-projects/openmoko-qa-scripts.bb.oring        1969-12-31 17:00:00.000000000 -0700
> +++ openembedded/packages/openmoko-projects/openmoko-qa-scripts.bb      2009-03-02 12:38:55.000000000 -0700
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Openmoko QA test scripts"
> +SECTION = "utils"
> +LICENSE = "GPL"
> +PV = "gitr${SRCREV}"

I don't believe this is correct. If you don't have a version number besides 
git revision, use:

PV = "0.0+gitr${SRCREV}"

There are many such recipes in OE.

> +SRC_URI = "git://git.openmoko.org/git/testing_scripts;protocol=git"
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS = "\
> +  bluez4 \
> +  opkg \
> +  xrandr \
> +  task-boot \

Looks like a strange set of dependencies, but to be honest, I haven't looked 
into the actual testing_scripts...

> +"
> +
> +do_install() {
> +          install -d ${D}/usr/bin
> +          install ${S}/bin/* ${D}/usr/bin/
> +}

-- 
Denys


