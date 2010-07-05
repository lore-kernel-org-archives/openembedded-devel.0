Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OViRc-0005kx-LA
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 11:58:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o659rh99007078;
	Mon, 5 Jul 2010 10:53:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05516-10; Mon,  5 Jul 2010 10:53:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o659rbmE007072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 5 Jul 2010 10:53:38 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Mon, 05 Jul 2010 10:53:32 +0100
Message-ID: <1278323612.30247.3579.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: RFC: How to improve packaged-staging and setscene
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
X-List-Received-Date: Mon, 05 Jul 2010 09:58:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are still some things bothering me about packaged-staging. As
anyone who's looked into what it does behind the scenes will agree, its
hard to follow what it does and the paths are insane.

Why? The simple reason is that its trying to capture the output from all
the tasks in one step. The tricks it plays with the stamp files are also
evil.

My proposal is to do something a bit more radical, to capture the output
on a per task basis. The structure would therefore be the following:

# Set the name of the setscene function for this task
do_foo[setscene] = "do_foo_setscene"
# The name of functions to call after do_doo completes successfully
do_foo[postfuncs] = "do_foo_packager"
do_foo_setscene () {
	# Call a shared function stating the task checksum and seeing 
	# whether a prebuilt binary is available
	# If yes, decompress to WORKDIR, install it using 
        # do_foo_installer() (optional step useful for say staging), exit 0
	# If no, exit 1
}
do_foo () {
	# Some task which generates output to ${FOO_OUT}

	# As the last step install it
	do_foo_installer()
}
do_foo_packager () {
	# Call a shared function to package up the tasks output
}


The workflow would then be that runqueue builds a list of tasks to
execute as normal. Before it does the usual processing, it inverts the
list starting at the targets and looks for tasks with setscene
functions. If it finds them, it runs them. If they succeed it marks that
part of the task list as complete (including all dependencies of that
task).

In real terms this means that for say an image target foo-image with a
fully populated cache, if would search until it found the setscene
functions for the do_package_write_rpm tasks. These would be found and
run, which would make the .rpm files available. Also, binaries needed
for image creation would be found, their do_populate_staging setscene
tasks would be run and the binaries would be come available. The image
would then build.

If you then enabled debian packaging with a cache that wasn't full and
ran the image again, the setscene tasks for each package's do_package
function would run. The resulting directory would be packaged by debain
packaging and then an image would be build from it.


This all sounds ideal but it may not be quite this simple. Its hard to
tell which recursive dependencies to follow and which are met by the
results of the setscene function. In the above example we need the
write_rpm function to run for all dependent packages. I suspect the
existing code dependency code will result in too many tasks being run
(all package_write_rpm functions even for build utilities which we
wouldn't need packaged for the image?). Regardless, I suspect the best
way forward is to experiment.

The good side of this is that the bitbake implementation is relatively
simple and backwards compatible.

Questions/further thoughts/objections?

Cheers,

Richard




