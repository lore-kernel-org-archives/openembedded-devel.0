Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1Sjwav-0007F8-Jw
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 20:04:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id E9A58138F37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2012 11:52:59 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id k+jORe0oVoqX
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2012 11:52:56 -0600 (MDT)
Received: from [172.20.202.96] (beast.camp.se-eng.com [172.20.202.96])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id D5BF0138F36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2012 11:52:55 -0600 (MDT)
Message-ID: <4FEB48CC.6050302@se-eng.com>
Date: Wed, 27 Jun 2012 11:54:20 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4FE4DFCA.4090606@se-eng.com>
	<CAMKF1spLndPJgVWoHh9Tfs0SRpc=v8PaygUPsoh58ypygi8OvQ@mail.gmail.com>
In-Reply-To: <CAMKF1spLndPJgVWoHh9Tfs0SRpc=v8PaygUPsoh58ypygi8OvQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 27 Jun 2012 18:04:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks very much for the feedback.

On 06/22/2012 06:04 PM, Khem Raj wrote:
> On Fri, Jun 22, 2012 at 2:12 PM, Raymond Danks<ray.danks@se-eng.com>  wrote:
>> I have constructed a layer for the purpose of building Xen in OpenEmbedded.
>>   Xen is a hypervisor and associated tools running on Linux available as a
>> package in distributions such as Ubuntu and Fedora.  It is also modified and
>> included in the rpm-based Xen Cloud Platform distribution and Citrix
>> XenServer.
>>
>> This layer currently includes recipes and recipe modifications for building
>> xen, libvirt, and a minimal xen image that may be used for launching virtual
>> machines via the xl command line interface.  This currently targets the x86
>> Xen host (OE target) architecture; development has been done entirely on
>> x86_64.
>>
>> I'm open to receiving feedback, patches and suggestions.  Also, I'm curious
>> if this layer may be published to the OpenEmbedded layer index and by what
>> process that should be achieved?
> thanks for doing it and publishing it for community.
> looks pretty good from very quick look at the content
>
>   recipes-core/initscripts/ has .swp file committed.
Got it.
> NATIVE_INSTALL_WORKS is probably not needed in recipes
OK.  I didn't realize that was depreciated.
> use oe_runmake instead of ${MAKE}
Right.  Got it.
> in some recipes you cache ac_cv_* vars you could use
> CACHED_CONFIGUREVARS variable to contain them all instead of putting
> them into EXTRA_OECONF
I didn't notice this method.  Thanks for the pointer.
>
> One think I am not sure is of is distro/minimal.conf in there. I dont
> know if you want to have your own distro or not if you do it would be
> nice to separate that out that way other distros can also use this
> layer if they want to.
I've removed it.  I'll take a look at the other distros and see if there 
is an appropriate place to store this configuration elsewhere.
>
> As long as you maintain the layer in good shape and in alignment with
> other layers you depend on its should be fine and please add the entry
> into LayerIndex on wiki
Yes.  And thanks Paul for adding it.  This looks good.
>
>> meta-xen|Xen related software||git://git.se-eng.com/meta-xen.git|
>> http://git.se-eng.com/gitweb/?p=meta-xen.git;a=summary|
>>
>> Thanks,
>> Ray
>>
>> Raymond Danks
>> Sage Electronic Engineering, LLC
>> http://www.se-eng.com
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



