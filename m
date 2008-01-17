Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JFU7G-0007Ih-GW
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2008 13:45:07 +0100
Received: by ug-out-1314.google.com with SMTP id i24so349734ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 04:45:06 -0800 (PST)
Received: by 10.66.252.18 with SMTP id z18mr3325323ugh.37.1200573905998;
	Thu, 17 Jan 2008 04:45:05 -0800 (PST)
Received: from ?89.252.38.142? ( [89.252.38.142])
	by mx.google.com with ESMTPS id q1sm7685775uge.7.2008.01.17.04.45.03
	(version=SSLv3 cipher=OTHER); Thu, 17 Jan 2008 04:45:04 -0800 (PST)
Date: Thu, 17 Jan 2008 14:52:50 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1012527691.20080117145250@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <478F4876.9030405@student.utwente.nl>
References: <E1JF7vM-0000k1-Mc@linuxtogo.org>
	<413710907.20080117131841@gmail.com>
	<478F4876.9030405@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev apm: turn off wifi cards before suspend so they are fully reloaded upon resume. closes 3664.
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
X-List-Received-Date: Thu, 17 Jan 2008 12:45:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Thursday, January 17, 2008, 2:22:14 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Paul Sokolovsky schreef:
> | How workarounds for specific buggy wifi cards relate to a generic APM
> | daemon? Or from other side, why everyone should endure more latency
> | during suspend/resume, with that latency already being >1s, because 5%
> | or less of those "everyone" use buggy cards?
> |
> | Please move this workaround to a packages of the buggy driver, or to a
> | separate package which is RDEPEND'ed by buggy driver. See
> | bluez-dtl1-workaround_1.0.bb for similar conversion performed.

> IIRC this is a workaround for cards that have their firmware in RAM
> (i.e. almost all hostap cards). They loose their firmware on suspend and
> our scripts don't reload it. This is actually a bug in our firmware
> loading scripts and I think this solution is acceptable medium-term, but
> ~ longterm we should fix our firmware loading scripts.

  Ok, no problem. There're lots of broken hardware and drivers around,
and of course they need to be supported still, and right now. The question
is how that is done - if it comes mixed into one big mess, we won't have
nice working system at all. And as someone who makes small steps towards
clearing this stuff (all the fixes I already did to udev and apmd to
get rid of device-specific hacks in them), I don't appreciate someone
moving in the opposite direction just to solve on-spot problem. OE is
powerful environment allowing to solve make focused, maintainable and
reusable changes - even if they're workarounds, and people should
learn to use them.


> regards,

> Koen

[]



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



