Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 4163F77722
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:57:18 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id B30DA68A01D; Sat, 18 Mar 2017 01:57:18 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 1348B68A019;
	Sat, 18 Mar 2017 01:57:18 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id A98D2674043E;
	Sat, 18 Mar 2017 02:57:17 +0100 (CET)
To: Daniel Dickinson <cshore@cshore.thecshore.com>
References: <20170317195837.0b473d7f@danielf.thecshore.com>
	<5dc25f13-e292-aa04-13d6-0e33351bf169@mlbassoc.com>
	<20170317213219.0b0ec5a5@danielf.thecshore.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <b4944c00-931c-e1bd-9986-e112f282f694@mlbassoc.com>
Date: Sat, 18 Mar 2017 02:57:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170317213219.0b0ec5a5@danielf.thecshore.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Submitted layers: build errors not seen on manual bitbake
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
X-List-Received-Date: Sat, 18 Mar 2017 01:57:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-18 02:32, Daniel Dickinson wrote:
> On Sat, 18 Mar 2017 02:20:36 +0100
> Gary Thomas <gary@mlbassoc.com> wrote:
>
>> On 2017-03-18 00:58, Daniel Dickinson wrote:
>>> Hi,
>>>
>>> I'm seeing build errors for layers I've submitted that I don't see
>>> with a manual bitbake.  What do I need to do solves the following:
>>>
>>> raceback (most recent call last):
>>>   File "/opt/workdir/bitbake/lib/bb/cookerdata.py", line 274, in
>>> parseBaseConfiguration bb.event.fire(bb.event.ConfigParsed(),
>>> self.data) File "/opt/workdir/bitbake/lib/bb/event.py", line 211,
>>> in fire fire_class_handlers(event, d)
>>>   File "/opt/workdir/bitbake/lib/bb/event.py", line 134, in
>>> fire_class_handlers execute_handler(name, handler, event, d)
>>>   File "/opt/workdir/bitbake/lib/bb/event.py", line 106, in
>>> execute_handler ret = handler(event)
>>>   File
>>> "/opt/workdir/git___git_openembedded_org_openembedded-core/meta/classes/base.bbclass",
>>> line 242, in base_eventhandler
>>> setup_hosttools_dir(d.expand('${TMPDIR}/hosttools'), 'HOSTTOOLS',
>>> d) File
>>> "/opt/workdir/git___git_openembedded_org_openembedded-core/meta/classes/base.bbclass",
>>> line 139, in setup_hosttools_dir bb.fatal("The following required
>>> tools (as specified by HOSTTOOLS) appear to be unavailable in PATH,
>>> please install them in order to proceed:\n  %s" % "
>>> ".join(notfound)) File "/opt/workdir/bitbake/lib/bb/__init__.py",
>>> line 104, in fatal raise BBHandledException() bb.BBHandledException
>>>
>>> During handling of the above exception, another exception occurred:
>>>
>>> Traceback (most recent call last):
>>>   File "update_layer.py", line 716, in <module>
>>>     main()
>>>   File "update_layer.py", line 216, in main
>>>     (tinfoil, tempdir) = recipeparse.init_parser(settings, branch,
>>> bitbakepath, nocheckout=options.nocheckout, logger=logger) File
>>> "/opt/layerindex/layerindex/recipeparse.py", line 75, in
>>> init_parser tinfoil = utils.setup_tinfoil(bitbakepath,
>>> enable_tracking) File "/opt/layerindex/layerindex/utils.py", line
>>> 144, in setup_tinfoil tinfoil.prepare(config_only = True) File
>>> "/opt/workdir/bitbake/lib/bb/tinfoil.py", line 210, in prepare
>>> extrafeatures) File "/opt/workdir/bitbake/lib/bb/main.py", line
>>> 517, in setup_bitbake server = start_server(servermodule,
>>> configParams, configuration, featureset) File
>>> "/opt/workdir/bitbake/lib/bb/main.py", line 357, in start_server
>>> cooker = bb.cooker.BBCooker(configuration, features) File
>>> "/opt/workdir/bitbake/lib/bb/cooker.py", line 195, in __init__
>>> self.initConfigurationData() File
>>> "/opt/workdir/bitbake/lib/bb/cooker.py", line 358, in
>>> initConfigurationData self.databuilder.parseBaseConfiguration()
>>> File "/opt/workdir/bitbake/lib/bb/cookerdata.py", line 299, in
>>> parseBaseConfiguration raise bb.BBHandledException
>>> bb.BBHandledException ERROR: The following required tools (as
>>> specified by HOSTTOOLS) appear to be unavailable in PATH, please
>>> install them in order to proceed: cpio chrpath gawk diffstat
>>> makeinfo
>>
>> This one is pretty obvious - the OE-core metadata now checks for
>> a set of required tools (beyond the initial sanity check).  Your
>> machine (or background user that you are using for building these
>> layers) doesn't have access to them.  You'll need to install that
>> set of tools, namely:
>>    cpio chrpath gawk diffstat makeinfo
>>
>
> This is on the autobuild hosted by at openembedded.org not something I
> have control over.  I was kind of hoping you would have a different
> answer (though didn't expect so), for some reason.
>

Understood (although it wasn't obvious that this was autobuild related)
I don't have any access/control over that either, but hopefully someone
who does will get this fixed for you.


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

