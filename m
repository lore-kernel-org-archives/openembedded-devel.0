Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 169426BCD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 11:49:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s06BnPfA017035 for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jan 2014 11:49:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RWKrhtKhRNtU
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 11:49:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s06BnL9e017018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jan 2014 11:49:23 GMT
Message-ID: <1389008958.22784.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 06 Jan 2014 11:49:18 +0000
In-Reply-To: <52C9DA4D.5010807@vollmann.ch>
References: <52C9DA4D.5010807@vollmann.ch>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: virtual/fakeroot-native misleading
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jan 2014 11:49:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-01-05 at 23:18 +0100, Detlef Vollmann wrote:
> Trying to bitbake essentially anything requires virtual/fakeroot-native.
> But saying 'ASSUME_PROVIDED += "virtual/fakeroot-native"' because we
> have fakeroot on our machine doesn't work, as bitbake.conf explicitely
> requires pseudo.  So it would be better to drop virtual/fakeroot-native
> and just require pseudo.

The virtual/ namespace exists from previous days and its true that
pseudo can do anything fakeroot could do so in that sense its valid. The
opposite is not true however as you've found out.

So technically, yes, we now require pseudo-native and we could go and
change those dependencies. Its not exactly a pressing issue but I'd take
patches.

Cheers,

Richard




