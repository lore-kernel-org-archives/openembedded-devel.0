Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HJ6g4-0005vW-Ek
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Feb 2007 12:27:28 +0100
Received: by nf-out-0910.google.com with SMTP id l24so2313434nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2007 03:27:27 -0800 (PST)
Received: by 10.49.20.5 with SMTP id x5mr5627838nfi.1171884447843;
	Mon, 19 Feb 2007 03:27:27 -0800 (PST)
Received: from CUBE ( [82.193.98.2])
	by mx.google.com with ESMTP id a23sm26178800nfc.2007.02.19.03.27.26;
	Mon, 19 Feb 2007 03:27:26 -0800 (PST)
Date: Mon, 19 Feb 2007 13:27:28 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1338737578.20070219132728@gmail.com>
To: Jamie Lenehan <lenehan@twibble.org>
In-Reply-To: <20070214013442.GA1347@twibble.org>
References: <20070208113136.GA1408@fh-wedel.de>
	<20070214013442.GA1347@twibble.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Thread-support in perl-native often breaks libintl-perl
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
X-List-Received-Date: Mon, 19 Feb 2007 11:27:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Jamie,

Wednesday, February 14, 2007, 3:34:42 AM, you wrote:

[]

> For sh4 I turned on threading for perl which is probably why I didn't
> have this issue. I can't remember if I turned it on because of this
> issue or if I needed it for somethings else. It probably doesn't
> matter much anymore for my situation because I've since rewrote the
> perl management application I was working on in C, so I only use perl
> a lot of simpler things now.

> I agree that we probably need to make perl and perl-native agree on
> this. If everything appears to be ok with it turned off in
> perl-native then I'd be fine with that (and would turn it of for the
> sh4 perl as well.)

  Maybe make that some "global" config option, and have it on by
default after all (after bit of QA of course)? These days, lack of
multithreadedness is a defect, and even while it's Perl, maybe it
shouldn't be crippled such? ;-)  (No, I don't volunteer to do QA on it
;-) ).


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



