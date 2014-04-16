Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 67F3360B9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 10:02:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Apr 2014 02:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,871,1389772800"; d="scan'208";a="514085333"
Received: from dmilliga-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.64])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2014 03:02:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>,
	Chris Larson <chris_larson@mentor.com>
Date: Wed, 16 Apr 2014 11:02:29 +0100
Message-ID: <2550139.OruyIUflk8@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <lilan2$1cs$1@ger.gmane.org>
References: <1397631065-13521-1-git-send-email-Chong.Lu@windriver.com>
	<lilan2$1cs$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] rrdtool: enable libwrap, perl and python bindings
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
X-List-Received-Date: Wed, 16 Apr 2014 10:02:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 16 April 2014 09:15:47 Koen Kooi wrote:
> Chong Lu schreef op 16-04-14 08:51:
> > 1. default enable libwrap, perl and python bindings
> 
> A number of big distros are moving away from tcpwrappers, Arch has removed
> it years ago and fedora looked into it a while ago. Since tcpwrappers hasn't
> seen a release (or development) in years I think we should default it to
> off.

Chris added a tcp-wrappers PACKAGECONFIG to a number of recipes about a year 
ago; I wonder if we ought to promote it to a DISTRO_FEATURES item and if 
appropriate just not enable that by default.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

