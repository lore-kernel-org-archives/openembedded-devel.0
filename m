Return-Path: <cshored@cshore.thecshore.com>
X-Greylist: delayed 2379 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 18 Mar 2017 00:38:19 UTC
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
	by mail.openembedded.org (Postfix) with ESMTP id B680777B25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Mar 2017 00:38:19 +0000 (UTC)
Date: Fri, 17 Mar 2017 19:58:37 -0400
From: Daniel Dickinson <cshored@cshore.thecshore.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170317195837.0b473d7f@danielf.thecshore.com>
MIME-Version: 1.0
Subject: Submitted layers: build errors not seen on manual bitbake
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
X-List-Received-Date: Sat, 18 Mar 2017 00:38:21 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I'm seeing build errors for layers I've submitted that I don't see with
a manual bitbake.  What do I need to do solves the following:

raceback (most recent call last):
  File "/opt/workdir/bitbake/lib/bb/cookerdata.py", line 274, in parseBaseConfiguration
    bb.event.fire(bb.event.ConfigParsed(), self.data)
  File "/opt/workdir/bitbake/lib/bb/event.py", line 211, in fire
    fire_class_handlers(event, d)
  File "/opt/workdir/bitbake/lib/bb/event.py", line 134, in fire_class_handlers
    execute_handler(name, handler, event, d)
  File "/opt/workdir/bitbake/lib/bb/event.py", line 106, in execute_handler
    ret = handler(event)
  File "/opt/workdir/git___git_openembedded_org_openembedded-core/meta/classes/base.bbclass", line 242, in base_eventhandler
    setup_hosttools_dir(d.expand('${TMPDIR}/hosttools'), 'HOSTTOOLS', d)
  File "/opt/workdir/git___git_openembedded_org_openembedded-core/meta/classes/base.bbclass", line 139, in setup_hosttools_dir
    bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
  File "/opt/workdir/bitbake/lib/bb/__init__.py", line 104, in fatal
    raise BBHandledException()
bb.BBHandledException

During handling of the above exception, another exception occurred:

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


