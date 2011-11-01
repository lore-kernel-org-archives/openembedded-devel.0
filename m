Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RL9BB-00060E-Gz for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 08:54:46 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RL95F-00057w-Ld for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 08:48:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 08:48:33 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 08:48:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 01 Nov 2011 08:48:20 +0100
Message-ID: <j8o884$2bp$1@dough.gmane.org>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<941836c79ce4b08c62672c36c77f47d3a8b89b83.1319884094.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <941836c79ce4b08c62672c36c77f47d3a8b89b83.1319884094.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-efl][meta-oe 09/12] task-x11-server: import from Angstrom
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
X-List-Received-Date: Tue, 01 Nov 2011 07:54:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-10-11 12:29, Martin Jansa schreef:
> * from meta-angstrom revision 8aa9581a920abae8878df2f3faf9857474edd1f8 *
> added RPROVIDES to be able to drop server part from task-x11 * updated
> DESCRIPTION to match * renamed to task-x11-server for upgradeable path
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> meta-oe/recipes-core/tasks/task-x11-server_1.0.bb |   24
> +++++++++++++++++++++ 1 files changed, 24 insertions(+), 0 deletions(-) 
> create mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
> 
> diff --git a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
> b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb new file mode 100644 
> index 0000000..86de1ec --- /dev/null +++
> b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb @@ -0,0 +1,24 @@ 
> +DESCRIPTION = "Task for a image with Xserver" +LICENSE = "MIT" 
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58" +PR =
> "r9" + +inherit task + +# for backwards compatibility +RPROVIDES_${PN} =
> "task-x11-server"

I think that shoud read:

RPROVIDES_${PN} += "task-xserver"

To provide a proper upgrade path.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOr6REMkyGM64RGpERAhQpAJ9MeX1xovKidPJUo15EjJsQ8hVyLgCbBb8S
6BncLYCLGZnhu4ktIpyDnWQ=
=9qNh
-----END PGP SIGNATURE-----



