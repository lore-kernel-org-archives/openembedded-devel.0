Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Lhq6y-0005Dl-Pi
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 19:58:32 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGE00CPCPZVN6Z5@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	12 Mar 2009 13:57:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7898A6B83B5; Thu,
	12 Mar 2009 14:57:31 -0400 (EDT)
Date: Thu, 12 Mar 2009 14:57:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090312185731.GB1109@denix.org>
References: <000801c99992$45c23440$d1469cc0$@com>
	<87myc57vz3.fsf@neumann.lab.ossystems.com.br>
	<000401c99f26$ddb43c00$991cb400$@com>
	<be7a9f3d0903090954m72f9cafbw8f03af0906bf74ca@mail.gmail.com>
	<001401c9a335$eec4f850$cc4ee8f0$@com>
MIME-version: 1.0
In-reply-to: <001401c9a335$eec4f850$cc4ee8f0$@com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] Added new recipe for a newer version of the	Asterisk Soft-PBX
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
X-List-Received-Date: Thu, 12 Mar 2009 18:58:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 12, 2009 at 06:13:46PM +0100, Christian P?ssinger wrote:
> Here is the patch again with the checksums.ini entry.

[skip]

> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index bcfe02c..865e23c 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -1,3 +1,7 @@
> +[http://downloads.digium.com/pub/asterisk/releases/asterisk-1.4.23.1.tar.gz
> ]
> +md5=4788954a93f5fbf78e55e2aa6e03329f
> +sha256=03e2cf43ffe9935d56fa0ea3663fc9bd23ce9720682c79d6269e78a9a1629d63
> +
>  [http://www.directfb.org/downloads/Extras/++DFB-0.9.25.tar.gz]
>  md5=c6a2705f6210d8ede50a947b375f1c0b
>  sha256=b3dbf01563dd60d63cff543ea8cd0c885381e78ecbbab8ff176e46df3f198a88
> diff --git a/packages/asterisk/asterisk-1.4.23.1/Makefile.patch
> b/packages/asterisk/asterisk-1.4.23.1/Makefile.patch

[skip]

The checksums.ini patch is not correct:
1. the closing square bracket is misplaced
2. the entry is not sorted (use contrib/source-checker/oe-checksums-sorter.py)

-- 
Denys


