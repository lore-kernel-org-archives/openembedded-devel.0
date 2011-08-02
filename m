Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QoCnS-0003yf-9b
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 13:06:02 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2011 04:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,305,1309762800"; 
   d="scan'208";a="3347373"
Received: from unknown (HELO helios.localnet) ([10.255.18.59])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2011 04:01:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 2 Aug 2011 12:01:38 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7AA6B@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7AA6B@nzc-ap-xch-02.ap.trimblecorp.net>
MIME-Version: 1.0
Message-Id: <201108021201.38367.paul.eggleton@linux.intel.com>
Subject: Re: Bitbake syntax error
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
X-List-Received-Date: Tue, 02 Aug 2011 11:06:02 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 02 August 2011 02:43:05 Bernard Mentink wrote:
> I am getting the following error while trying to build the
> bootstrap-image, my bitbake is version 1.12.0.
> 
>...
> "/home/bmentink/devel/build/tmp/sysroots/i686-linux/usr/bin/opkg-make-in
> dex", line 128
> 
> |     print pkg_dir + "/" + old_filename
> |     
> |                 ^
> | 
> | SyntaxError: invalid syntax

Someone posted this problem on IRC and eventually discovered that it was that 
/usr/bin/python was pointing to python3 (which isn't supported by BitBake). Is 
that what's happening on your system?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


