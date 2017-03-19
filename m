Return-Path: <cshored@cshore.thecshore.com>
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
	by mail.openembedded.org (Postfix) with ESMTP id F1D9071CBF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 04:28:41 +0000 (UTC)
Date: Sun, 19 Mar 2017 00:28:34 -0400
From: Daniel Dickinson <cshored@cshore.thecshore.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170319002834.17953566@danielf.thecshore.com>
MIME-Version: 1.0
Subject: OpenEmbedded Layer Index autobuild errors
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
X-List-Received-Date: Sun, 19 Mar 2017 04:28:42 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Since it wasn't clear from my last posting about this issue, that the
issued described was that the recipe parsing for the three pre-alpha
layers I submitted recently triggered an error condition (missing
HOSTTOOLS) which isn't something that's an issue with the layer or
recipes (or so I'm given to understand), I'm reposing the error message
and this request for the hosts to get the necessary packages so the
layer index can be updated.

Layers are:

meta-cshored - small distro along the lines of poky-tiny but for
read-only-rootfs and taking advantage of the following layers:

meta-earlyinit - instead of initramfs run 'earlyinit' to prepare things
for the main init and which runs from the kerne-mounted rootfs.

meta-runit-init - use busybox 'runit' commands as the main init.


The error message is:


Traceback (most recent call last):
  File "update_layer.py", line 716, in <module>
    main()
  File "update_layer.py", line 216, in main
    (tinfoil, tempdir) = recipeparse.init_parser(settings, branch, bitbakepath, nocheckout=options.nocheckout, logger=logger)
  File "/opt/layerindex/layerindex/recipeparse.py", line 75, in init_parser
    tinfoil = utils.setup_tinfoil(bitbakepath, enable_tracking)
  File "/opt/layerindex/layerindex/utils.py", line 144, in setup_tinfoil
    tinfoil.prepare(config_only = True)
  File "/opt/workdir/bitbake/lib/bb/tinfoil.py", line 210, in prepare
    extrafeatures)
  File "/opt/workdir/bitbake/lib/bb/main.py", line 517, in setup_bitbake
    server = start_server(servermodule, configParams, configuration, featureset)
  File "/opt/workdir/bitbake/lib/bb/main.py", line 357, in start_server
    cooker = bb.cooker.BBCooker(configuration, features)
  File "/opt/workdir/bitbake/lib/bb/cooker.py", line 195, in __init__
    self.initConfigurationData()
  File "/opt/workdir/bitbake/lib/bb/cooker.py", line 358, in initConfigurationData
    self.databuilder.parseBaseConfiguration()
  File "/opt/workdir/bitbake/lib/bb/cookerdata.py", line 299, in parseBaseConfiguration
    raise bb.BBHandledException
bb.BBHandledException
ERROR: The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:
  cpio chrpath gawk diffstat makeinfo

Regards,

Daniel

