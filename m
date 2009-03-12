Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1Lhgdc-0005Et-6U
	for openembedded-devel@openembedded.org; Thu, 12 Mar 2009 09:51:36 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id DB4A21D36194; Thu, 12 Mar 2009 09:51:23 +0100 (CET)
Date: Thu, 12 Mar 2009 09:51:23 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Message-ID: <20090312085123.GD30336@ibawizard.net>
References: <49bdfd00903100733s3af6dc2o48f09b48593fe51f@mail.gmail.com>
	<19c1b8a90903101122r59d22d0fia19158c42583e784@mail.gmail.com>
	<49bdfd00903110149y39fb7aa4we99d373a4ff1790f@mail.gmail.com>
	<49B8C180.3010607@gmail.com>
MIME-Version: 1.0
In-Reply-To: <49B8C180.3010607@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Problem building kernel - too many files open
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
X-List-Received-Date: Thu, 12 Mar 2009 08:51:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Marco Cavallini <koansoftware@gmail.com> [2009-03-12 09:02:08]:

> Piero Pezzin ha scritto:

[...]

> >>> During kernel building, I got the following error:
> >>>
> >>> OTE: package linux-2.6.28: started
> >>> NOTE: package linux-2.6.28-r6: task do_package: started
> >>> ERROR: Error in executing:
> >>> /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> >>> linux_2.6.28.bb
> >>> ERROR: Exception:exceptions.IOError Message:[Errno 24] Too many open
> >> files:
> 
> this is a known error.
> Nobody solved it yet.

Maybe, that increasing the numbers of max. file handles and number of max.
inodes might help you:

/proc/sys/fs/file-max
/proc/sys/fs/inode-max

-- ynezz


