Received: from [64.233.182.188] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GlS9g-0006QY-1d
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Nov 2006 16:30:56 +0100
Received: by nf-out-0910.google.com with SMTP id l24so1765349nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Nov 2006 07:28:27 -0800 (PST)
Received: by 10.48.210.4 with SMTP id i4mr3312379nfg.1163863707485;
	Sat, 18 Nov 2006 07:28:27 -0800 (PST)
Received: from CUBE ( [82.193.96.239])
	by mx.google.com with ESMTP id a23sm14280143nfc.2006.11.18.07.28.25;
	Sat, 18 Nov 2006 07:28:26 -0800 (PST)
Date: Sat, 18 Nov 2006 17:28:25 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <4810341202.20061118172825@gmail.com>
To: Rob Neild <b@bigbob.org.uk>
In-Reply-To: <20061118070941.lg9b2be6g13484w4@bigbob.org.uk>
References: <20061118070941.lg9b2be6g13484w4@bigbob.org.uk>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Which head ?
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
X-List-Received-Date: Sat, 18 Nov 2006 15:30:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rob,

Saturday, November 18, 2006, 2:09:41 PM, you wrote:


> rob@rob-server:~/openembedded$ ../monotone-0.31/mtn --db=OE.mtn pull  
> monotone.openembedded.org org.openembedded.dev
> mtn: doing anonymous pull; use -kKEYNAME if you need authentication
> mtn: connecting to monotone.openembedded.org
> mtn: finding items to synchronize:
> mtn: certificates | keys | revisions
> mtn:       30,065 |   38 |     9,918
> mtn:  bytes in | bytes out | certs in | revs in
> mtn:     1.3 k |     1.4 k |      0/0 |     0/0
> mtn: successful exchange with monotone.openembedded.org


> rob@rob-server:~/openembedded$ ../monotone-0.31/mtn --db=OE.mtn  
> checkout --branch=org.openembedded.dev
> mtn: branch org.openembedded.dev has multiple heads:
> mtn:   0c958ec238b24c796d57fb29b8683551a9ed05a5 hrw@openembedded.org  
> 2006-11-18T09:48:40
> mtn:   dcbd942b827e66bb27a6282eae5ee1e2f4c927e3 koen@openembedded.org
> 2006-11-18T10:10:57
> mtn: choose one with 'mtn checkout -r<id>'
> mtn: error: branch org.openembedded.dev has multiple heads
> rob@rob-server:~/openembedded$

  This was fixed. Otherwise, it's just a normal working situation,
which is fixed at most in few hours after being introduced (as we have
a convention of merging before pushing, so even if some developer
missed that, it will be fixed by the next).

  So, next time feel free to just as mtn suggests - choose any of
the head (arbitrarily), and get going. It doesn't even worth a mail
report (but feel free to ping on IRC).

> Rob



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



