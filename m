Return-Path: <ml@embed.me.uk>
X-Greylist: delayed 318 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Aug 2016 12:51:02 UTC
Received: from bmx2.eumx.net (bmx2.eumx.net [37.48.73.248])
	by mail.openembedded.org (Postfix) with ESMTP id 59B6977235
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:51:02 +0000 (UTC)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by bmx2.eumx.net (Postfix) with ESMTPS id 733E8DC8DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:45:44 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
References: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
	<e653ed48-a9d7-9bd7-1d12-0cf5b85e82b3@eumx.net>
	<CAPybu_1GS7hooaLivwd8FZTUJQBv=q_gcWKEmehc8ooDJ=YFkA@mail.gmail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <cb0cb19c-f060-f731-3322-7d964711db72@embed.me.uk>
Date: Thu, 11 Aug 2016 13:45:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAPybu_1GS7hooaLivwd8FZTUJQBv=q_gcWKEmehc8ooDJ=YFkA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] gflags: New recipe
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
X-List-Received-Date: Thu, 11 Aug 2016 12:51:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/16 13:38, Ricardo Ribalda Delgado wrote:

> Hi
>
> On Thu, Aug 11, 2016 at 2:22 PM,  <ml@embed.me.uk> wrote:
>
>>> +RDEPENDS_${PN} += "bash"
>>
>> Where does this dependency come from, seems odd that a compiled library
>> should depend on bash?
>  From an openembedded warning :)
>
> package/usr/bin/gflags_completions.sh:#!/bin/bash

Bash completions should generally go in a separate package as not to 
pull the bash dependency in.

See meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb for an example.

Cheers,
Jack.

>
> Regards!


