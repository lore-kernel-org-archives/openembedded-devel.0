Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 249087316B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Sep 2016 09:41:08 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u829f1sa014808
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Sep 2016 11:41:01 +0200
Received: from [139.16.78.136] (MD1FZU9C.ww002.siemens.net [139.16.78.136])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id u829f0lr024377
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Sep 2016 11:41:01 +0200
To: openembedded-devel@lists.openembedded.org
References: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
	<6dc69872-3f81-6078-48fb-b2a744133ca2@siemens.com>
	<CANx9H-AXcoS=z=rFcFJKKrfea-KUfSkFgPz_WGrEe88JagScKw@mail.gmail.com>
	<b278fd85-94db-b343-1a93-13d41cd5ad62@siemens.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <240fd13e-3c4b-1c59-e1b7-182f9c83ff81@siemens.com>
Date: Fri, 2 Sep 2016 11:41:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <b278fd85-94db-b343-1a93-13d41cd5ad62@siemens.com>
Subject: Re: [meta-java] Unify virtual java providers
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
X-List-Received-Date: Fri, 02 Sep 2016 09:41:09 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


>> This is a hint that you need to set PREFERRED_PROVIDER_foo in your
>> local.conf (or machine.conf or distro.conf or...)
>>
>> http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html#var-PREFERRED_PROVIDER
>>
>> You might also need to set PREFERRED_VERSION, depending on the situation.
>>
>> My idea would be to allow the user to select a default provider for
> I think setting PREFERRED_VERSION is not the issue in my case.
>
> The reason I see the issue is that I also tried to set: RPROVIDES_${PN} += "virtual/jre" in order to allow users to select "virtual/jre"
>  in an RDEPENDS which I believe is necessary in many cases.
>
> However I don't know of a way to set a preferred RPROVIDER.
Sorry I completely missed that one can set PREFERRED_RPROVIDER too (it's not in the documentation only PREFERRED_PROVIDER is).

However when I set PREFERRED_RPROVIDER_virtual/jre = "zulu-java" i'm still not able to install zulu-java, openjdk and oracle-java at the same time.
I modified them all to RPROVIDE_${PN} += "virtual/jre" and added ALTERNATIVES for java vie updata-alternatives.
But bitbake gives me the following error:

ERROR: Nothing RPROVIDES 'oracle-java' (but /home/projects/image.bb RDEPENDS on or otherwise requires it)
ERROR: oracle-java was skipped: PREFERRED_PROVIDER_virtual/jre set to zulu-java, not oracle-java

So based on that I assume it's really not possible to have a preverd java REPROVIDER and still install others to be used via the alternatives system?

>
>>> "virtual/jre" but still allow to install an additional specific java
>>> provider if necessary.
>>> Is this even possible?
> Based on what I found out above, don't think this is possible. Please correct me if I'm wrong.
>
> Pascal


