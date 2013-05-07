Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UZfjm-0002hf-Rt
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 May 2013 13:07:16 +0200
Received: from [10.1.14.186] (83-64-248-68.inzersdorf.xdsl-line.inode.at
	[83.64.248.68]) by ptmx.org (Postfix) with ESMTPSA id 2F9AA26016;
	Tue,  7 May 2013 12:49:16 +0200 (CEST)
Message-ID: <5188DC2B.9080909@pseudoterminal.org>
Date: Tue, 07 May 2013 12:49:15 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <2924564.6VWmlqGvL5@helios> <5182701F.5030605@pseudoterminal.org>
	<1714072.P9NRZQZN5F@helios>
	<969F26A8BAB325438E7EB80D3C3134FB1622BB2A@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1622BB2A@IRSMSX102.ger.corp.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Please submit your unindexed layers
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
X-List-Received-Date: Tue, 07 May 2013 11:07:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2013 09:24 AM, Iorga, Cristian wrote:
> Hello all,
>
> My opinion is that we can directly integrate gstreamer-1.0 into oe-core, as it does not replace gstreamer-0.10.
> I did not test this scenario, so I don't know if it's working, but I will do that and see how it is working.
>
> Regards,
> Cristian
>
> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Thursday, May 02, 2013 5:11 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Carlos Rafael Giani; Burton, Ross; Iorga, Cristian
> Subject: Re: [oe] Please submit your unindexed layers
>
> On Thursday 02 May 2013 15:54:39 Carlos Rafael Giani wrote:
>> While I do have a layer for GStreamer 1.0 , I did not want to add it
>> to the index. My guess was that OE core developers might have been
>> preparing recipes for GStreamer 1.0 for later OE core versions
>> already, so the layer would then eventually be in conflict with OE core.
>>
>> So, should I add it now?
> I guess it depends on how long it will take to integrate these recipes in OE- Core. If it's going to take more than a couple of weeks it's probably fine to add it to the index with a note saying the layer is temporary until the recipes are integrated.
>
> Cristian, Ross - opinions?
>
> Cheers,
> Paul
>

I added support for dylan to meta-gstreamer1.0 . There are a few points 
I'd like to take care of before or during an integration into OE-Core:

* it uses _prepend in various places; I was able to replace all but one 
of them with prefuncs. The remaining one is populate_packages_prepend , 
and I just do not see how this could be turned into a prefunc. (And it 
is necessary to use it, because do_packages_split apparently cannot be 
used anywhere else.)
   I think prefuncs are cleaner, because they do not modify an existing 
function. Also, if the indentation style changes again someday, prefuncs 
cause less problems than _prepend does.

* Empty -glib and -apps packages are generated, which are necessary, 
since the -meta packages depend on them. I think this can be done a bit 
smarter, that is, make the -meta package depend on these only if they 
are not empty.

* gstreamer1.0-omx contains a raspberrypi specific part, which is 
enabled explicitely. If enabled, it makes the package machine specific. 
It can be seen here: 
https://github.com/dv1/meta-gstreamer1.0/blob/master/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc#L28 
what is your opinion about this? (Also, it is currently missing a 
GSTREAMER_1_0_OMX_CORE_NAME setting , which is different for the 
raspberry pi than for bellagio.)

* The recipes make use of PACKAGECONFIG to enable/disable plugins with 
dependencies and some features (like Orc, or LGPL mode in 
gstreamer1.0-libav). I also explicitely disable any packages that were 
either not ported to 1.0 , or have dependencies without any known OE 
recipes in OE-Core or meta-oe . This is best shown in -bad : 
https://github.com/dv1/meta-gstreamer1.0/blob/master/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc#L21
I explicitely disable to make sure plugins do not appear all of a sudden 
if someday recipes for a previously unsupported dependency are added and 
the dependency is built with OE. Unfortuantely, upstream did not add a 
configuration option to disable all plugins with dependencies by 
default. (--with-plugins works only for dependencyless plugins.) I 
thought about patching configure.ac , but that would have to be done for 
all plugin packages (-base/-good/-bad/-ugly) , and seemed like something 
that involves more than a few lines, so I hesitated to do it. I'd like 
to hear your opinion about the way it is done now in the recipe.

* Is it okay to add _git versions of the recipes to oe-core?

