Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4i1N-00072C-K2
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 20:22:29 +0100
Received: by fg-out-1718.google.com with SMTP id 22so373548fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2007 11:17:33 -0800 (PST)
Received: by 10.86.54.3 with SMTP id c3mr8005679fga.64.1198005453682;
	Tue, 18 Dec 2007 11:17:33 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id g28sm19845317fkg.2007.12.18.11.17.32
	(version=SSLv3 cipher=OTHER); Tue, 18 Dec 2007 11:17:32 -0800 (PST)
Date: Tue, 18 Dec 2007 21:22:53 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <186064634.20071218212253@gmail.com>
To: "pHilipp Zabel" <philipp.zabel@gmail.com>
In-Reply-To: <74d0deb30712181013x79c2f42fr9d8f51d39377d6e3@mail.gmail.com>
References: <E1J4SUo-0006ZZ-Ov@linuxtogo.org>
	<74d0deb30712180217q5cb2c911l8a61567b5511b9d@mail.gmail.com>
	<978793792.20071218133500@gmail.com>
	<74d0deb30712180638y20795870o9e1d0b688298658f@mail.gmail.com>
	<1211397506.20071218170516@gmail.com>
	<74d0deb30712181013x79c2f42fr9d8f51d39377d6e3@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev PDA-like machines with card slots: Enable "vfat" feature.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2007 19:22:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello pHilipp,

Tuesday, December 18, 2007, 8:13:17 PM, you wrote:

[]

> My concern is not about image size, but about watering down the
> meaning of those variables.
> Already now fic-gta01.conf adds the vfat and ext2 kernel modules to
> MACHINE_EXTRA_RRECOMMENDS
> manually, maybe because it doesn't need hdparm. And I bet there is
> more duplication like that.

  No, they're there because it's typical vendor-maintained machine.
And vendors usually care to get there stuff done quickly, not
correctly or beautifully, and possibly have their weird ideas/requirements
how stuff should be done. (And we know how it ends - following this
special-attention phase, one sweet day vendor moves to another toy,
and dumps previous one completely, for user community to cleanup all
that "speciality").

  So well, given speciality of OpenMoko itself, I don't dare to commit
changes to their machine configs, but intend to prepare patches with
extra care and submit for Graeme's review.

> cheers
> Philipp


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



