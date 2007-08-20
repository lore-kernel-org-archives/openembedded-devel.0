Received: from [64.233.184.237] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1INE31-0000fI-Av
	for Openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2007 22:40:27 +0200
Received: by wr-out-0506.google.com with SMTP id c46so1007814wra
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2007 13:39:31 -0700 (PDT)
Received: by 10.90.90.3 with SMTP id n3mr8952471agb.1187642370049;
	Mon, 20 Aug 2007 13:39:30 -0700 (PDT)
Received: by 10.90.31.16 with HTTP; Mon, 20 Aug 2007 13:39:29 -0700 (PDT)
Message-ID: <c384c5ea0708201339j44462d85o286bbb548b256aec@mail.gmail.com>
Date: Mon, 20 Aug 2007 22:39:29 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Add Intel Core 2 machine support (prescott and nocona)
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
X-List-Received-Date: Mon, 20 Aug 2007 20:40:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I would like to add support for Intel's Core 2 processors, in both 32
and 64 bit mode.

I am wondering what namespace to use for the PACKAGE ARCHs?

Given all the options[*], I think "x86-prescott" and "x86_64-nocona"
are suitable:

x86_64-prescott= x86_32-core = x86_32-core2
x86_64-nocona = x86_64-core2

The naming is a bit to long to suite my taste, maybe prescott and
nocona are enough?

I would like some input on this before I commit anything and pollute
the namespace.

Regards,
-- 
Leon

[*]
http://gentoo-wiki.com/Safe_Cflags#Intel_Core_2_Duo.2FQuad_.2F_Xeon_51xx.2F53xx


