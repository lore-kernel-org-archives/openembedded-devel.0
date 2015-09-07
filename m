Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DB06D60017
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:31:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 07 Sep 2015 05:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="764057109"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2015 05:31:23 -0700
Message-ID: <55ED8405.6050709@linux.intel.com>
Date: Mon, 07 Sep 2015 15:33:09 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <55ED5556.2020904@topic.nl>
In-Reply-To: <55ED5556.2020904@topic.nl>
Subject: Re: Where is libunique?
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
X-List-Received-Date: Mon, 07 Sep 2015 12:31:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2015 12:13 PM, Mike Looijmans wrote:
> Current meta-openembedded master fails to build with errors like this:
>
> ERROR: Nothing PROVIDES 'libunique' (but
> .../meta-oe/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
> DEPENDS on or otherwise requires it).
>
> Searching for 'unique' in meta-openembedded and openembedded-core
> reveiled nothing that would provide it, there's no recipe with 'unique'
> in its name, nor any recipe that mentions the word 'unique' provides it,
> even though I found various recipes that DEPEND on it.
>
> Where is libunique?

You should check not just the current state of master branches of 
various layers, but also their commit history.

libunique was just removed from oe-core and a patch was sent to add it 
to meta-oe. There is no way to keep the removal/addition perfectly in 
sync because the two layers are kept in separate repos and have 
different maintainers.

Regards,
Alex


