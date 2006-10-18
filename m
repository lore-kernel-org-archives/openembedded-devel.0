Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1GaIEd-0003lB-MI
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Oct 2006 22:41:56 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id B5BE98150C;
	Thu, 19 Oct 2006 06:34:55 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29227-08; Thu, 19 Oct 2006 06:34:54 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 0486B8150B;
	Thu, 19 Oct 2006 06:34:54 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id EDEAB12CB988; Thu, 19 Oct 2006 06:34:53 +1000 (EST)
Date: Thu, 19 Oct 2006 06:34:53 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: axel lin <axel.lin@gmail.com>
Message-ID: <20061018203453.GA29721@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	axel lin <axel.lin@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <427d64720610172317t1e89518bx16ffbdae70fdbfb4@mail.gmail.com>
	<200610180827.46349.openembedded@hrw.one.pl>
	<427d64720610180022p431603abpd3c035f0c79b8f5c@mail.gmail.com>
Mime-Version: 1.0
In-Reply-To: <427d64720610180022p431603abpd3c035f0c79b8f5c@mail.gmail.com>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Fail to start dropbear
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
X-List-Received-Date: Wed, 18 Oct 2006 20:41:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 18, 2006 at 03:22:41PM +0800, "axel lin" wrote:
[...]
> Thanks, Marcin.
> I fixed it by manually create the device file.
> How to config OE to add a device file, then I don't have to manually add it.

If you are using udev then udev should be creating /dev/random and
/dev/urandom (along with lots of other stuff). I don't think anything
special is required to get udev to created this.

If you really do want to add device nodes manually (which is probably wrong)
then see the "Device (/dev) nodes" section of the "image_ipkg class"
in the user manual:

  http://www.openembedded.org/user-manual&dpage=ch07s05

-- 
 Jamie Lenehan <lenehan@twibble.org>


