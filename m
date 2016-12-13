Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA9A6011B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 02:33:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBD2XxSd028733
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 12 Dec 2016 18:33:59 -0800
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Dec 2016 18:33:58 -0800
To: <openembedded-devel@lists.openembedded.org>, <rcagle@omnitron-systems.com>
References: <44E60BE3F360494194A33E0B8411CB9A62ADD8@oscar.ostdom.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <eb581f04-c965-f26c-97c2-3b04fd639515@windriver.com>
Date: Tue, 13 Dec 2016 10:33:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <44E60BE3F360494194A33E0B8411CB9A62ADD8@oscar.ostdom.com>
Subject: Re: bitbake dependency question
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
X-List-Received-Date: Tue, 13 Dec 2016 02:34:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Robert

On 12/13/2016 10:10 AM, Robert Cagle wrote:
> I'm trying to figure out a reasonable way to specify dependencies on an unknown/virtual set of other recipes.
> For example,
>
> Recipe A: Plugin #1 (installs a plugin spec somewhere in /usr/share)
> Recipe B: Plugin #2 (same)
> Recipe C: Plugin #3 (same).
> Recipe D: Host Application (C based), which needs to be compiled last since it generates C code based on the spec files.
>
> I'd rather not hard-code dependencies in Recipe D since the specific set of plugins may be different depending on the specified distribution layer or machine type. I can define a variable in local.conf and use it to define D's dependencies, but that means I'll have to define the set twice: in the distribution layer and in local.conf. Based on what I've read and experimented with, this seems be my only choice (other than restructuring the application).
>

Try something like:
In recipeD.bb:
PLUGIN_RECIPES ??= "A" (or b, c)
DEPENDS = "${PLUGIN_RECIPES} other..."

In local.conf:
PLUGIN_RECIPES = "A" (or b, c).

// Robert

> I really just wanted to expand a variable in each of A,B,C
>    PLUGIN_RECIPES += "${PN}"
>
> And have D declare
>   DEPENDS = "${PLUGIN_RECIPES} other..."
>
> But that doesn't seem possible. Am I missing another way? (Python datastore maybe?)
>
> Thanks,
> Bob
>

