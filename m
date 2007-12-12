Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1J2Lsc-0001bX-Ni
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2007 08:19:42 +0100
Received: by an-out-0708.google.com with SMTP id b33so28670ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2007 23:15:24 -0800 (PST)
Received: by 10.100.57.6 with SMTP id f6mr769512ana.78.1197443723979;
	Tue, 11 Dec 2007 23:15:23 -0800 (PST)
Received: from ?192.168.1.204? ( [24.107.180.75])
	by mx.google.com with ESMTPS id 5sm258495nzk.2007.12.11.23.15.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Dec 2007 23:15:22 -0800 (PST)
Message-ID: <475F8A75.9070902@gmail.com>
Date: Wed, 12 Dec 2007 01:15:01 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.14pre (X11/20071020)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1197404752.475ef250762ff@imp.free.fr>
In-Reply-To: <1197404752.475ef250762ff@imp.free.fr>
Subject: Re: version of octave
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
X-List-Received-Date: Wed, 12 Dec 2007 07:19:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2007 02:25 PM, Alain2210 wrote:
> Hello,
> 
> with openembedded/angstrom, the version of octave that is tried to build (fetch
> failed)
> is 2.9.17. Two months ago, I have built 2.9.14 and 2.1.73. Only 2.1.73 was
> working on my ipaq (the 2.9.14 was using all the cpu but doing nothing).
> 
> Is is possible to put 2.1.73 as preferred version in openembedded/angstrom ?

Committed 2.1.73 as preferred version for Angstrom. I'm glad 2.1.73 
worked for you. 2.9.14 never worked, so it's good to fix that anyway.

I've updated the 2.9.x recipie to 2.9.19, which should work fine now. 
Note, the octave package is more modularized in 2.9.x, so please check 
the library dependencies and let me know if anything is missing.

Regards
Gordon


