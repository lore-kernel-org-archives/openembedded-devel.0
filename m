Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SJowU-00014E-LU
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 18:38:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Apr 2012 09:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="133088464"
Received: from unknown (HELO [10.7.198.151]) ([10.7.198.151])
	by orsmga002.jf.intel.com with ESMTP; 16 Apr 2012 09:27:48 -0700
Message-ID: <4F8C4884.3040207@linux.intel.com>
Date: Mon, 16 Apr 2012 09:27:48 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOHjBZt=6w7D8jzj7bOe+kMAZ8oFEBThge3dopK10mFDenFbAQ@mail.gmail.com>
In-Reply-To: <CAOHjBZt=6w7D8jzj7bOe+kMAZ8oFEBThge3dopK10mFDenFbAQ@mail.gmail.com>
Subject: Re: [oe-core] requires on own .bb file
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
X-List-Received-Date: Mon, 16 Apr 2012 16:38:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/12 01:42, Giuseppe Condorelli wrote:
> Hi all,
>
> I wrote a personal .bb file and added it on the meta-<myproject>  tree.
> This .bb file requires a .inc file already available in the native oe-core
> meta directory.
> How can I include it into my .bb file? If I add "require<blablabla>.inc"
> it fails because it
> is not able to found the given .inc file. In other words I need to copy it
> into the meta-<myproject>  tree.

The require line should be a path relative to a BBPATH entry.

For e.g. if I wanted to use the dbus.inc I would:

require recipes-core/dbus/dbus.inc

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project
         Intel Open Source Technology Centre


