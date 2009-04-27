Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LyQyr-0003OZ-Rt
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 15:34:45 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LyQtw-0006xA-NC
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 17:29:40 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2009 17:29:33 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <200904271340.28227.khimov@altell.ru>
	<be7a9f3d0904270546u33935630ua3f0b1fee1d3e430@mail.gmail.com>
In-Reply-To: <be7a9f3d0904270546u33935630ua3f0b1fee1d3e430@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200904271729.33673.khimov@altell.ru>
Subject: Re: [RFC] install-native
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
X-List-Received-Date: Mon, 27 Apr 2009 13:34:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 27 April 2009 16:46:50 Otavio Salvador wrote:
> Hello Roman,
>
> On Mon, Apr 27, 2009 at 6:40 AM, Roman I Khimov <khimov@altell.ru> wrote:
> [...]
>
> > But maybe we can just remove 'install-native' completely?
>
> I belive the right way to handle it to fix install-native to support
> what is required.

Well, current install-native is unmaintained shell thingie. Hacking that to 
mimic behavior of install from coreutils requires serious effort. Another 
approach could be bringing install from some kind of coreutils-native and 
depending every package on it. Certainly possible, but not sure it gives us 
any benefits as we're already using host's 'install' (starting right up from 
shasum-native) intensively and it works in general. Thus my proposal.


