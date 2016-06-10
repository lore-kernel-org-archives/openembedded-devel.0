Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0470B6E668
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 13:51:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 10 Jun 2016 06:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,449,1459839600"; d="scan'208";a="972994952"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2016 06:51:07 -0700
To: openembedded-devel@lists.openembedded.org
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
	<9b8c1ff28b105001b94ea2b45063c40e3038938b.1464090710.git.alexander.kanavin@linux.intel.com>
	<20160610123329.GA2582@jama>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c34b9a92-71a6-fdf8-2a27-b92fc7c9cb86@linux.intel.com>
Date: Fri, 10 Jun 2016 16:50:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160610123329.GA2582@jama>
Subject: Re: [PATCH 6/8] python-pygobject: add a recipe
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
X-List-Received-Date: Fri, 10 Jun 2016 13:51:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2016 03:33 PM, Martin Jansa wrote:
> On Tue, May 24, 2016 at 02:56:59PM +0300, Alexander Kanavin wrote:
>> oe-core provides only python3-pygobject now, and a few recipes in meta-oe
>> still need the version built against Python 2.
>
> I've merged this but now it started to fail:
>
> | checking whether python2.7 version >= 2.7... yes
> | checking for python2.7 version... 2.7
> | checking for python2.7 platform... linux2
> | checking for python2.7 script directory... ${prefix}/lib64/python2.7/site-packages
> | checking for python2.7 extension module directory... ${exec_prefix}/lib64/python2.7/site-packages
> | checking for python version... (cached) 2.7
> | checking for python platform... (cached) linux2
> | checking for python script directory... (cached) ${prefix}/lib64/python2.7/site-packages
> | checking for python extension module directory... (cached) ${exec_prefix}/lib64/python2.7/site-packages
> | checking for headers required to compile python extensions... not found
> | configure: error: Python headers not found
> | WARNING: python-pygobject/3.18.2-r0/temp/run.do_configure.32140:1 exit 1 from 'exit 1'
> | ERROR: Function failed: do_configure (log file is located at python-pygobject/3.18.2-r0/temp/log.do_configure.32140)
> NOTE: recipe python-pygobject-3.18.2-r0: task do_configure: Failed

I think the recipe can be dropped with its dependencies:
- python-dbusmock is not used by anything
- python-cloudeebus is not used by anything
- bluez4 testtools have been superseded by test tools from bluez5 and 
can be disabled

Alex


