Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 832 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 Sep 2016 08:46:40 UTC
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 5A99260621
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Sep 2016 08:46:40 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id u828Wj49016672
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Sep 2016 10:32:45 +0200
Received: from [139.16.78.136] (MD1FZU9C.ww002.siemens.net [139.16.78.136])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id u828WjCu006385
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Sep 2016 10:32:45 +0200
To: openembedded-devel@lists.openembedded.org
References: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
	<6dc69872-3f81-6078-48fb-b2a744133ca2@siemens.com>
	<CANx9H-AXcoS=z=rFcFJKKrfea-KUfSkFgPz_WGrEe88JagScKw@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <b278fd85-94db-b343-1a93-13d41cd5ad62@siemens.com>
Date: Fri, 2 Sep 2016 10:32:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-AXcoS=z=rFcFJKKrfea-KUfSkFgPz_WGrEe88JagScKw@mail.gmail.com>
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
X-List-Received-Date: Fri, 02 Sep 2016 08:46:41 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


>> While testing the proposal above i ran into an issue.
>> When I add PROVIDES = "virtual/jre" to the java recipes and i want to
>> install multiple java versions via update-alternative I can't do that
>> because bitbake tells me:
>>
>> "Multiple .bb files are due to be built which each provide virtual/jre:"
>>
>> Now the question for me is if this two mechanism are not intended to work
>> together or if I'm doing something wrong.
>>
>>
> This is a hint that you need to set PREFERRED_PROVIDER_foo in your
> local.conf (or machine.conf or distro.conf or...)
>
> http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html#var-PREFERRED_PROVIDER
>
> You might also need to set PREFERRED_VERSION, depending on the situation.
>
> My idea would be to allow the user to select a default provider for
I think setting PREFERRED_VERSION is not the issue in my case.

The reason I see the issue is that I also tried to set: RPROVIDES_${PN} += "virtual/jre" in order to allow users to select "virtual/jre"
 in an RDEPENDS which I believe is necessary in many cases.

However I don't know of a way to set a preferred RPROVIDER.

>> "virtual/jre" but still allow to install an additional specific java
>> provider if necessary.
>> Is this even possible?
Based on what I found out above, don't think this is possible. Please correct me if I'm wrong.

Pascal

