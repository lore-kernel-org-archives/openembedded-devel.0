Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JluaH-0001K2-S3
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Apr 2008 01:29:05 +0200
Received: by py-out-1112.google.com with SMTP id y77so2133802pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2008 16:29:00 -0700 (PDT)
Received: by 10.35.92.18 with SMTP id u18mr14009218pyl.33.1208302140184;
	Tue, 15 Apr 2008 16:29:00 -0700 (PDT)
Received: from ?192.168.199.91? ( [128.252.220.109])
	by mx.google.com with ESMTPS id x56sm22694424pyg.36.2008.04.15.16.28.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 15 Apr 2008 16:28:59 -0700 (PDT)
Message-ID: <48053A37.6050605@gmail.com>
Date: Tue, 15 Apr 2008 18:28:55 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080415034950.982CC189218@amethyst.openembedded.net>
	<48048B4C.5090805@gmx.net>
In-Reply-To: <48048B4C.5090805@gmx.net>
Subject: Re: [oe-commits] org.oe.dev libtomcrypt: fix SRC_URI (close oebug 4159), bump to 1.17, fix staging
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
X-List-Received-Date: Tue, 15 Apr 2008 23:29:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/15/2008 06:02 AM, Robert Schuster wrote:
> Hi.
> 
> xjqian commit schrieb:
>> libtomcrypt: fix SRC_URI (close oebug 4159), bump to 1.17, fix staging
> 
>> * no idea why the previous maintainer leave do_install empty, but assuming there is a legit reason.
> I recently stumbled upon libtomcrypt in another project may provide an
> answer to this: libtomcrypt can be customized in many ways and chances
> are good that if you just compile and install the library with default
> settings those are wrong for the package that wants to use it.
> 
> The library's source is usually directly put into the package that uses
> it (see asterisk, OpenTNL) and I am wondering whether it really makes
> sense to have it in OE as a package.

Thanks. so the recipe is just a template for people who wants to use it. 
   I will just leave it there until somebody with strong opinion 
suggests otherwise.

Regards
Gordon


