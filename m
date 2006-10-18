Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1Ga4Zy-0003A4-Tb
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Oct 2006 08:07:03 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 7CA92CC936;
	Wed, 18 Oct 2006 16:00:06 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04989-02; Wed, 18 Oct 2006 16:00:03 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 695ADCC8FB;
	Wed, 18 Oct 2006 16:00:03 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 578C112CB76E; Wed, 18 Oct 2006 16:00:03 +1000 (EST)
Date: Wed, 18 Oct 2006 16:00:03 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: axel lin <axel.lin@gmail.com>
Message-ID: <20061018060003.GA26266@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	axel lin <axel.lin@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <427d64720610172256kbad5556n6ac7caf4bc9b965a@mail.gmail.com>
Mime-Version: 1.0
In-Reply-To: <427d64720610172256kbad5556n6ac7caf4bc9b965a@mail.gmail.com>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: why the files in rootfs /dev folder are regular files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 06:07:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 18, 2006 at 01:56:04PM +0800, "axel lin" wrote:
> hi list,
>     I'm using angstrom/mainstone config.
>     After build a bootstrap-image, I found that the files in
> rootfs/dev folder are all regular files. Is this OE bug?

That's  expected.
See the fakeroot in the reference section of the user manual:

  http://www.openembedded.org/user-manual&dpage=ch07s04

-- 
 Jamie Lenehan <lenehan@twibble.org>


