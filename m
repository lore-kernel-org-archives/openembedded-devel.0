Return-Path: <ajlennon@dynamicdevices.co.uk>
Received: from www.dynamicdevices.co.uk (www.dynamicdevices.co.uk
	[89.200.136.37])
	by mail.openembedded.org (Postfix) with ESMTP id 03C9B6F387
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 18:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by www.dynamicdevices.co.uk (Postfix) with ESMTP id 51C0F27E002;
	Wed,  5 Mar 2014 18:25:45 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at lennoab2.miniserver.com
Received: from www.dynamicdevices.co.uk ([127.0.0.1])
	by localhost (www.dynamicdevices.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BELn8_LNMx9t; Wed,  5 Mar 2014 18:25:44 +0000 (UTC)
Received: from [127.0.0.1] (cpc32-live22-2-0-cust59.17-2.cable.virginm.net
	[82.36.253.60])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by www.dynamicdevices.co.uk (Postfix) with ESMTPSA id ACB8F27E001;
	Wed,  5 Mar 2014 18:25:44 +0000 (UTC)
Message-ID: <53176C23.6020100@dynamicdevices.co.uk>
Date: Wed, 05 Mar 2014 18:25:39 +0000
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: martin.jansa@gmail.com
References: <cover.1394010806.git.ajlennon@dynamicdevices.co.uk>	<ce88733ef0143e96e323aff0ac34909d43eda4bf.1394010806.git.ajlennon@dynamicdevices.co.uk>	<20140305172026.GX26981@jama>
	<53176169.9060501@dynamicdevices.co.uk>
In-Reply-To: <53176169.9060501@dynamicdevices.co.uk>
X-Enigmail-Version: 1.6
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH 1/1] daq: Update from 2.0.1 to 2.0.2
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
X-List-Received-Date: Wed, 05 Mar 2014 18:25:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


On 05/03/2014 17:39, Alex J Lennon wrote:
> On 05/03/2014 17:20, Martin Jansa wrote:
>> On Wed, Mar 05, 2014 at 03:49:13PM +0000, Alex J Lennon wrote:
>>> daq-2.0.1.tar.gz is missing from SRC_URI location. Presumably replaced with 2.02.
>> Sorry I haven't noticed it when replying on oe-core version, but can you
>> please remove 2.0.1 version in the same patch and sent with -M?
>>
>> Do you know if it fixes do_install issue when building on host with
>> dash? It's reported regularly in:
>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>
>> Thanks!

I had a look at building daq with dash enabled, I believe, and strangely
enough daq_2.0.1 builds fine here for me  (?)
 
BB_VERSION        = "1.21.1"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "i586-poky-linux"
MACHINE           = "qemux86"
DISTRO            = "poky"
DISTRO_VERSION    = "1.5+snapshot-20140305"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta
meta-yocto        = "master:d6596f5e0446b6aa3ae845389965bb2852f17b65"
meta-oe
meta-networking   = "master:279ebafb9dfcc3bd5095f4880e16a2e9401e38f7"
meta-fsl-arm      = "master:855918bbf2cad9d0f46304bbdaea7da71e9b2222"
meta-fsl-arm-extra = "master:91b4ec6044e37246eeaf0dfb410bc8a542a949c7"
meta-fsl-demos    = "master:e15e440305ba048cb2887ef89641534dedcf40f5"
meta-mono         = "master:c1b1c95943b77003d0198d421e4dda970fa29069"
meta-condeco      = "master:af571d367810f80e53f2aa1d74ad6e6a1d5ea6d1"
meta-erlang       = "master:986fda4a4cd3ac521897206ba39fe4d9f42e50b9"

BR, Alex


