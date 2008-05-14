Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1JwB34-0005vO-7u
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 May 2008 09:05:14 +0200
Received: from xora.org.uk ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Wed, 14 May 2008 08:03:43 +0100
	id 0006D035.482A8ECF.000043EF
Date: Wed, 14 May 2008 08:04:52 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080514070452.GA3730@cimmeria.hyboria>
References: <20080509153032.79D501892D4@amethyst.openembedded.net>
	<482A1FEC.5000804@gmx.net>
Mime-Version: 1.0
In-Reply-To: <482A1FEC.5000804@gmx.net>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [oe-commits] org.oe.dev classpath-native_0.97.1.bb : add	from OM mtn
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 14 May 2008 07:05:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, May 14, 2008 at 01:10:36AM +0200, Robert Schuster wrote:
> Hi,
> I would like this commit to be reverted. While it may look logical to go
> from one below 1.0 release to another something important changed in
> classpath in that release and makes bootstrapping far more complicated.
> 
> The problem is that from 0.97 onwards, a classpath build needs a working
> javah tool. this program is a header generator which creates C header
> files from compiled Java classes. Such a javah program is provided by
> the classpath tools but needs a working runtime and class library first.
> 
> Earlier classpath releases had pre-generated header files and needed no
> javah program.
> 
> There are multiple ways to fix this issue. One way would involve
> upstream allowing the just built javah application being run with a
> provided java executable. This would be less pain for us and would also
> benefit other cross compilation efforts.
> 
This is fine with me if you wish to dissaprove this one.

Graeme



