Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pwbao-0004jS-4A
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 15:39:58 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PwbX4-00062w-W5 from Tom_Rini@mentor.com ;
	Mon, 07 Mar 2011 06:35:35 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 7 Mar 2011 06:35:34 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 7 Mar 2011 06:35:34 -0800
Message-ID: <4D74ED30.5020607@mentor.com>
Date: Mon, 7 Mar 2011 07:35:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch.de>
References: <4D6D0340.9090109@dresearch.de> <4D749C9D.3020600@dresearch.de>
In-Reply-To: <4D749C9D.3020600@dresearch.de>
X-OriginalArrivalTime: 07 Mar 2011 14:35:34.0798 (UTC)
	FILETIME=[EB3C82E0:01CBDCD4]
Cc: Michael Lauer <mickey@vanille-media.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Release-2011.03 gupnp-0.13.4-r0: task do_compile: Failed
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
X-List-Received-Date: Mon, 07 Mar 2011 14:39:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2011 01:51 AM, Steffen Sledz wrote:
> On 03/01/2011 03:31 PM, Steffen Sledz wrote:
>> Clean build: bitbake gupnp
>>
>> | make[3]: Entering directory `/SCRATCH/SSZ/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gupnp-0.13.4-r0/gupnp-0.13.4/libgupnp'
>> |   CC     http-headers.lo
>> |   CC     gupnp-context-manager.lo
>> |   CC     gupnp-unix-context-manager.lo
>> |   CC     gupnp-context.lo
>> |   CC     gupnp-control-point.lo
>> |   CC     gupnp-device.lo
>> |   CC     gupnp-device-info.lo
>> |   CC     gupnp-device-proxy.lo
>> |   CC     gupnp-error.lo
>> |   CC     gupnp-resource-factory.lo
>> |   CC     gupnp-root-device.lo
>> |   CC     gupnp-service.lo
>> |   CC     gupnp-service-info.lo
>> |   CC     gupnp-service-proxy.lo
>> |   CC     gupnp-service-introspection.lo
>> |   CC     gupnp-xml-doc.lo
>> |   CC     gupnp-types.lo
>> |   CC     gvalue-util.lo
>> |   CC     xml-util.lo
>> |   CC     gupnp-marshal.lo
>> |   CCLD   libgupnp-1.0.la
>> |   GEN    GUPnP-1.0.gir
>> | Couldn't find include 'Soup-2.4.gir' (search path: ['/SCRATCH/SSZ/HydraIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/gir-1.0', '/SCRATCH/SSZ/HydraIP/OE/tmp.6/sysroots/x86_64-linux/usr/share/gir-1.0', '/usr/share/gir-1.0', '/SCRATCH/SSZ/HydraIP/OE/tmp.6/sysroots/x86_64-linux/usr/share/gir-1.0'])
>> | make[3]: *** [GUPnP-1.0.gir] Error 1
>>
>> Build Configuration:
>> BB_VERSION        = "1.10.2"
>> METADATA_BRANCH   = "testing-release-2011.03"
>> METADATA_REVISION = "62bf073"
>> TARGET_ARCH       = "arm"
>> TARGET_OS         = "linux-gnueabi"
>> MACHINE           = "hipox"
>> DISTRO            = "angstrom"
>> DISTRO_VERSION    = "2010.7-test-20110301"
>> TARGET_FPU        = "soft"
>
> It seems that the compile stage of gupnp uses gobject-introspection from the host system. :(
>
> The mentioned error occurs, if this is not installed there. If i install the package (called gir-repository at openSUSE 11.3), there error changes to
>
> |   GEN    GUPnP-1.0.gir
> | /usr/share/gir-1.0/Soup-2.4.gir: Incompatible version 1.0 (supported: 1.2)
>
> In general i think it's not a good idea to depend on a gir aka gobject-introspection installation at the build host but use a gir-native oe package. Is such a package available yet?

The general fix is to disable gobject-introspection as I don't think 
it's totally cross-happy yet?

-- 
Tom Rini
Mentor Graphics Corporation


