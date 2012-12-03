Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1TfZOs-0001Es-LD
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:01:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 0E509138070;
	Mon,  3 Dec 2012 09:39:44 -0700 (MST)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id M62M51V+kuSM; Mon,  3 Dec 2012 09:39:38 -0700 (MST)
Received: from [172.20.202.50] (beast.camp.se-eng.com [172.20.202.50])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id DB6CC13806E;
	Mon,  3 Dec 2012 09:39:37 -0700 (MST)
Message-ID: <50BCD5C9.9010903@se-eng.com>
Date: Mon, 03 Dec 2012 09:39:37 -0700
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4FE4DFCA.4090606@se-eng.com>
	<CAMKF1spLndPJgVWoHh9Tfs0SRpc=v8PaygUPsoh58ypygi8OvQ@mail.gmail.com>
	<4127137.5Bm5xUWJxt@helios>
In-Reply-To: <4127137.5Bm5xUWJxt@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: New meta-xen layer
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
X-List-Received-Date: Mon, 03 Dec 2012 17:01:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2012 04:33 AM, Paul Eggleton wrote:
> On Friday 22 June 2012 17:04:34 Khem Raj wrote:
>> On Fri, Jun 22, 2012 at 2:12 PM, Raymond Danks <ray.danks@se-eng.com> wrote:
>>> I have constructed a layer for the purpose of building Xen in
>>> OpenEmbedded.
>>>   Xen is a hypervisor and associated tools running on Linux available as a
>>> package in distributions such as Ubuntu and Fedora.  It is also modified
>>> and included in the rpm-based Xen Cloud Platform distribution and Citrix
>>> XenServer.
>>>
>>> This layer currently includes recipes and recipe modifications for
>>> building
>>> xen, libvirt, and a minimal xen image that may be used for launching
>>> virtual machines via the xl command line interface.  This currently
>>> targets the x86 Xen host (OE target) architecture; development has been
>>> done entirely on x86_64.
>>>
>>> I'm open to receiving feedback, patches and suggestions.  Also, I'm
>>> curious
>>> if this layer may be published to the OpenEmbedded layer index and by what
>>> process that should be achieved?
>> thanks for doing it and publishing it for community.
>> looks pretty good from very quick look at the content
>>
>>   recipes-core/initscripts/ has .swp file committed.
>> NATIVE_INSTALL_WORKS is probably not needed in recipes
>> use oe_runmake instead of ${MAKE}
>> in some recipes you cache ac_cv_* vars you could use
>> CACHED_CONFIGUREVARS variable to contain them all instead of putting
>> them into EXTRA_OECONF
>>
>> One think I am not sure is of is distro/minimal.conf in there. I dont
>> know if you want to have your own distro or not if you do it would be
>> nice to separate that out that way other distros can also use this
>> layer if they want to.
> FWIW, I'd agree with the suggested cleanups.
>
>> As long as you maintain the layer in good shape and in alignment with
>> other layers you depend on its should be fine and please add the entry
>> into LayerIndex on wiki
> I've just added the layer to the LayerIndex page. Thanks!
>
> Cheers,
> Paul
>
Hey Paul,

Would you mind to make another change to the LayerIndex page?  This 
layer has moved over to Yocto servers and has been renamed/merged to 
meta-virtualization:
http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/30003

meta-virtualization|Layer enabling hypervisor, virtualization tool 
stack, and cloud 
support.||git://git.yoctoproject.org/meta-virtualization|http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/

Thanks,
Ray



