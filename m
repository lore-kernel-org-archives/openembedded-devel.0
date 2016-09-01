Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id BD28C6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 12:03:08 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u81C37tm025032
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Sep 2016 14:03:08 +0200
Received: from [139.16.78.136] (MD1FZU9C.ww002.siemens.net [139.16.78.136])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id u81C3740002487
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Sep 2016 14:03:07 +0200
To: openembedded-devel@lists.openembedded.org
References: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <6dc69872-3f81-6078-48fb-b2a744133ca2@siemens.com>
Date: Thu, 1 Sep 2016 14:03:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
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
X-List-Received-Date: Thu, 01 Sep 2016 12:03:09 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi guys
> It should be properly documented in the readme and the virtual packages should be the preferred way for users to depend on java/jre resp javac/jdk
>
> An alternative to the above would be:
>
> - virtual/jre
> - virtual/jre-native
> - virtual/jdk
> - virtual/jdk-native
>
> But this would deviate more from the current naming.
>
While testing the proposal above i ran into an issue.
When I add PROVIDES = "virtual/jre" to the java recipes and i want to install multiple java versions via update-alternative I can't do that because bitbake tells me:

"Multiple .bb files are due to be built which each provide virtual/jre:"

Now the question for me is if this two mechanism are not intended to work together or if I'm doing something wrong.

My idea would be to allow the user to select a default provider for "virtual/jre" but still allow to install an additional specific java provider if necessary.
Is this even possible?

Pascal

