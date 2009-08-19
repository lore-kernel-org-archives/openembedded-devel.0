Received: from [131.111.8.137] (helo=ppsw-7.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1MdjGE-0002kQ-5J
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 13:23:27 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:33181)
	by ppsw-7.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1Mdizc-0003cW-Nh (Exim 4.70) for
	openembedded-devel@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Wed, 19 Aug 2009 12:06:12 +0100
Message-ID: <4A8BDCAA.7070205@cam.ac.uk>
Date: Wed, 19 Aug 2009 12:06:18 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.22 (X11/20090803)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8960BC.4000603@cam.ac.uk>	<200908171606.57153.holger+oe@freyther.de>	<1250521270.27980.6.camel@mill.internal.reciva.com>	<1250521375.27980.8.camel@mill.internal.reciva.com>
	<be7a9f3d0908180206g1fcf4d48w79b05a8f4dd78c04@mail.gmail.com>
In-Reply-To: <be7a9f3d0908180206g1fcf4d48w79b05a8f4dd78c04@mail.gmail.com>
X-Enigmail-Version: 0.95.7
Subject: Re: [PATCH] glibc 2.7 and 2.9 (arm): Remove unnecessary	asm/page.h include
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
X-List-Received-Date: Wed, 19 Aug 2009 11:23:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Otavio Salvador wrote:
> Hello Phil
> 
> On Mon, Aug 17, 2009 at 12:02 PM, Phil Blundell<pb@reciva.com> wrote:
>> Oh, and, as for bumping PR: in this case I would suggest not doing it.
>> The output binaries should be identical with and without that header,
>> and for folks doing online upgrades it is a bit of a pain to have glibc
>> rebuild unnecessarily.
> 
> I disagree and think it ought to be bumped so it gets deployed and
> tested as soon as possible.
> 
> People that cares about online updates are supposed to be using stable
> to reduce it.
> 
Happy to go with either option, but keen to get this merged soon.

Can we come to a consensus on whether to bump the PR?

If we do want to, can someone push this to the repository.

Thanks,

Jonathan


