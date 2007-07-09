Received: from [64.233.184.227] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I82Bh-0004vj-8y
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2007 00:58:37 +0200
Received: by wr-out-0506.google.com with SMTP id 36so537583wra
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2007 15:53:00 -0700 (PDT)
Received: by 10.86.80.5 with SMTP id d5mr33450fgb.1184021579298;
	Mon, 09 Jul 2007 15:52:59 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id w5sm50557711mue.2007.07.09.15.52.58
	(version=SSLv3 cipher=OTHER); Mon, 09 Jul 2007 15:52:58 -0700 (PDT)
Date: Tue, 10 Jul 2007 01:52:47 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <96699408.20070710015247@gmail.com>
To: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <126613333.20070709215755@vanille-media.de>
References: <E1I7yE2-0000V0-1x@linuxtogo.org>
	<126613333.20070709215755@vanille-media.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: dbg packages (was: org.oe.dev wireshark: fix -dbg)
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
X-List-Received-Date: Mon, 09 Jul 2007 22:58:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Dr.,

Monday, July 9, 2007, 10:57:55 PM, you wrote:

> koen commit wrote:
>> wireshark: fix -dbg
> [...]
>> +
>> +FILES_${PN}-dbg += "${libdir}/wireshark/plugins/${PV}/.debug"
>> +
>> +

> We keep adding this stuff more and more -- since more and more
> packages go from a monolithic state to an extensible -- and
> I don't like having to specify this all over. Can't we get the dbg
> package to pick up all .debug directories automatically?

  That's what I was thinking for some time now too. It's good that
bitbake is expressive enought that we *can* so that with its generic means
like FILES, but doing that again and again instead once and for all is
really boring.

  And there's another issue here - empty .debug directories throught
the rootfs. This one is actually more complex, as empty directories
are there because of package-write task's workings, and sometimes we
want them, sometimes not, so it's unclear how to handle that issue. At
least we for sure don't want empty .debug/'s.

> Regards,

> :M:



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



