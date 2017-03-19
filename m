Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id F1AAB71C84
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 14:39:40 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id CFBFC68A019; Sun, 19 Mar 2017 14:39:40 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 6A13968A019;
	Sun, 19 Mar 2017 14:39:39 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id D74DD674031D;
	Sun, 19 Mar 2017 15:39:38 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <20170319002834.17953566@danielf.thecshore.com>
	<1489915859.2234.8.camel@gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <1b018e93-114d-8d5c-2b94-efd692faa8a3@mlbassoc.com>
Date: Sun, 19 Mar 2017 15:39:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1489915859.2234.8.camel@gmail.com>
Subject: Re: OpenEmbedded Layer Index autobuild errors
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
X-List-Received-Date: Sun, 19 Mar 2017 14:39:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-19 10:30, Max Krummenacher wrote:
> Hi
>
> Am Sonntag, den 19.03.2017, 00:28 -0400 schrieb Daniel Dickinson:
>> Hi,
>>
>> Since it wasn't clear from my last posting about this issue, that the
>> issued described was that the recipe parsing for the three pre-alpha
>> layers I submitted recently triggered an error condition (missing
>> HOSTTOOLS) which isn't something that's an issue with the layer or
>> recipes (or so I'm given to understand), I'm reposing the error message
>> and this request for the hosts to get the necessary packages so the
>> layer index can be updated.
>>
>> Layers are:
>>
>> meta-cshored - small distro along the lines of poky-tiny but for
>> read-only-rootfs and taking advantage of the following layers:
>>
>> meta-earlyinit - instead of initramfs run 'earlyinit' to prepare things
>> for the main init and which runs from the kerne-mounted rootfs.
>>
>> meta-runit-init - use busybox 'runit' commands as the main init.
>>
>>
>> The error message is:
>>
>>
>> Traceback (most recent call last):
>>   File "update_layer.py", line 716, in <module>
>>     main()
>>   File "update_layer.py", line 216, in main
>>     (tinfoil, tempdir) = recipeparse.init_parser(settings, branch, bitbakepath,
>> nocheckout=options.nocheckout, logger=logger)
>>   File "/opt/layerindex/layerindex/recipeparse.py", line 75, in init_parser
>>     tinfoil = utils.setup_tinfoil(bitbakepath, enable_tracking)
>>   File "/opt/layerindex/layerindex/utils.py", line 144, in setup_tinfoil
>>     tinfoil.prepare(config_only = True)
>>   File "/opt/workdir/bitbake/lib/bb/tinfoil.py", line 210, in prepare
>>     extrafeatures)
>>   File "/opt/workdir/bitbake/lib/bb/main.py", line 517, in setup_bitbake
>>     server = start_server(servermodule, configParams, configuration, featureset)
>>   File "/opt/workdir/bitbake/lib/bb/main.py", line 357, in start_server
>>     cooker = bb.cooker.BBCooker(configuration, features)
>>   File "/opt/workdir/bitbake/lib/bb/cooker.py", line 195, in __init__
>>     self.initConfigurationData()
>>   File "/opt/workdir/bitbake/lib/bb/cooker.py", line 358, in initConfigurationData
>>     self.databuilder.parseBaseConfiguration()
>>   File "/opt/workdir/bitbake/lib/bb/cookerdata.py", line 299, in parseBaseConfiguration
>>     raise bb.BBHandledException
>> bb.BBHandledException
>> ERROR: The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH,
>> please install them in order to proceed:
>>   cpio chrpath gawk diffstat makeinfo
>
> This recent commit tries to hide host applications which should not be used by recipes as they
> should be provided from their -native packages (from DEPENDS) during the build.
> http://cgit.openembedded.org/openembedded-core/commit/?id=fa764a403da34bb0ca9fa3767a9e9dba8d685965
>
> With that change all tools which must be installed on the host need to be present, even if in your
> use case some of them might not be used.
> Did you install the prerequisites?
> http://www.yoctoproject.org/docs/2.2.1/ref-manual/ref-manual.html#required-packages-for-the-host-dev
> elopment-system

The real point is that it's not his host - it's the [remote]
autobuilder tool for OpenEmbedded (IIRC)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

