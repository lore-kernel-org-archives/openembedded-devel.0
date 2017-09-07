Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC9D77E4E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 13:52:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v87DqHkx025971
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 7 Sep 2017 06:52:17 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 7 Sep 2017 06:52:16 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-23-git-send-email-mark.hatle@windriver.com>
	<CALbNGRTYz=c+_jSJDrUkp5Sa4H76xH3N7G7+7qv3+vRnMNnsgA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <6ce8b8f5-d4bd-b22e-425a-169fa5fcd3f1@windriver.com>
Date: Thu, 7 Sep 2017 08:52:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRTYz=c+_jSJDrUkp5Sa4H76xH3N7G7+7qv3+vRnMNnsgA@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 22/31] vim: Remove xfce vim bbappend
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
X-List-Received-Date: Thu, 07 Sep 2017 13:52:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/7/17 3:57 AM, Andreas Müller wrote:
> On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> Changing the behavior of a recipe by including a layer is not allowed
>> by the yocto-compat-layer script.
> I have a question on this: What is the yocto target for this matter?
> Will there be times that a layer cannot change recipe's behavior
> anymore? Background: Personally I don't care much (yet) for
> yocto-compat-layer script - am busy enough to keep my images building
> and running with the functionality I am interested in. But if this
> will be forbidden by design in the future I have to expect further
> activities. Not to be misunderstood: I understand why this is part of
> requirements and only want to know what I need to put on my personal
> TODO.

My understanding of the YP requirement here is simple:

Inclusion of a layer should not change behavior of existing components from
other layers, without the user doing something to activate the change in
functionality.

Typically this would be done through a distribution configuration, i.e.
PACKAGECONFIG, DISTRO_FEATURES, MACHINE_FEATURES, etc.

So just setting a value, which ends up changing package behaviors as part of the
inclusion of a layer fails the test.


So in this specific case, if I include meta-xfce (even if I have no intention of
using xfce), the behavior of 'vim' will change without any way for me to control it.

Adding a PACKAGECONFIG, or some other 'switch' that only enables the change when
I've enabled it would resolve this.  But in the case of VIM, I really have no
idea what the expected behavior is here.  I do believe it should be improved in
'some way' rather then removal.   Either by changing the system default (i.e.
directly in meta-openembedded/meta-oe/recipes-support/vim) or by adding a
PACKAGECONFIG that changes behavior, etc.


This is similar to the meta-gnome issue.. Why did I create a config file, to
address exactly the same issue.  Is a random configuration file that nobody is
going to just 'find' a good idea?  No.. it's horrible.  but it was the only way
I could see to deal with this requirement.

--Mark

> Andreas
> 


