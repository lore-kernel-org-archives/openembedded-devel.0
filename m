Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QgZme-0005ES-Kq
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2011 12:01:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 02:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,520,1304319600"; d="scan'208";a="26665826"
Received: from unknown (HELO helios.localnet) ([10.255.17.183])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 02:42:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2011 10:42:53 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <0564089300001e7d@nedap.com>
In-Reply-To: <0564089300001e7d@nedap.com>
MIME-Version: 1.0
Message-Id: <201107121042.53976.paul.eggleton@linux.intel.com>
Subject: Re: bbappend
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
X-List-Received-Date: Tue, 12 Jul 2011 10:01:41 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 12 July 2011 09:58:01 Jaap de Jong wrote:
> I need some help concerning bbappend.
> I've created a bbappend file:
> 
>     FILESEXTRAPATHS := "${THISDIR}/files"
>     SRC_URI += "file://xyzzy.patch"
> 
> If I run a bitbake it complains about missing ..../xyzzy.patch
> When I change the bbappend file to this:
> 
>     SRC_URI += "file:///absolute-path-to-the-file/files/xyzzy.patch"

FILESEXTRAPATHS is only available in oe-core. For classic OE you need to use 
something like:

THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
FILESPATHBASE_prepend := "${THISDIR}/files:"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


