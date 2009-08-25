Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MfyRV-00081y-PG
	for openembedded-devel@openembedded.org; Tue, 25 Aug 2009 18:00:20 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n7PFejK2009094 for <openembedded-devel@openembedded.org>;
	Tue, 25 Aug 2009 16:40:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GwFsExDu8X2S for <openembedded-devel@openembedded.org>;
	Tue, 25 Aug 2009 16:40:45 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n7PFegWh009088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Tue, 25 Aug 2009 16:40:44 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200908240549.09079.holger+oe@freyther.de>
References: <1251081101-18925-1-git-send-email-raj.khem@gmail.com>
	<200908240549.09079.holger+oe@freyther.de>
Date: Tue, 25 Aug 2009 16:42:14 +0100
Message-Id: <1251214934.14367.39.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] base.bbclass: Replace os.system with subprocess	call.
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
X-List-Received-Date: Tue, 25 Aug 2009 16:00:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-08-24 at 05:49 +0200, Holger Hans Peter Freyther wrote:
> On Monday 24 August 2009 04:31:41 Khem Raj wrote:
> > Often gzip is reporting broken pipe errors with do_unpack of
> > tar.gz files.
> >
> > If you use the commands described above to extract a tar.gz file, gzip
> > sometimes emits a Broken pipe error message. This can safely be ignored
> > if tar extracted all files without any other error message.
> >
> > We do not let python install its SIGPIPE handler and use subprocess call
> > to invoke the command.
> >
> > This is based on the following python bug report.
> > http://bugs.python.org/issue1652
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> Acked-by: Holger Freyther <zecke@selfish.org>

Thanks, I've been seeing reports of this and have just merged into
Poky! :)

Cheers,

Richard



