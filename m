Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QHwHX-0008LR-QH
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 12:59:44 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 887311660253; Thu,  5 May 2011 04:57:04 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 6FBDC166020A;
	Thu,  5 May 2011 04:57:02 -0600 (MDT)
Message-ID: <4DC2827E.9020801@mlbassoc.com>
Date: Thu, 05 May 2011 04:57:02 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201105051150.06842.sgh@sgh.dk>
In-Reply-To: <201105051150.06842.sgh@sgh.dk>
Subject: Re: perl-native fails on Ubuntu 11.04
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
X-List-Received-Date: Thu, 05 May 2011 10:59:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 05/05/2011 03:50 AM, S=F8ren Holm wrote:
> Please apply this patch to make perl-native build on Ubuntu 11.04
>
> https://gist.github.com/raw/925006/4217f358fb00b5b7f1dfbd1ce5f4afa4f64b=
0bb0/0001-perl-native-multilib-patch-for-ubuntu-11.04.patch

This patch only works for x86_64 systems.  A corrected version
replaces `uname -m` with * in
   ++test -f /usr/lib/*-linux-gnu/libc.so && glibpth=3D"/usr/lib/*-linux-=
gnu $glibpth"

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


