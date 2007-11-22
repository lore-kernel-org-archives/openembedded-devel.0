Received: from [64.233.166.183] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1Iv3QC-0000DJ-85
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 05:12:12 +0100
Received: by py-out-1112.google.com with SMTP id a25so8700647pyi
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 20:09:53 -0800 (PST)
Received: by 10.35.78.9 with SMTP id f9mr9748807pyl.1195697578919;
	Wed, 21 Nov 2007 18:12:58 -0800 (PST)
Received: from ?192.168.1.204? ( [24.107.180.75])
	by mx.google.com with ESMTPS id p77sm559196pyb.2007.11.21.18.12.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Nov 2007 18:12:58 -0800 (PST)
Message-ID: <4744E5AB.4040400@gmail.com>
Date: Wed, 21 Nov 2007 20:12:59 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.14pre (X11/20071020)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4743FB40.1030307@gmail.com>
	<200711211347.58538.openembedded@haerwu.biz>
In-Reply-To: <200711211347.58538.openembedded@haerwu.biz>
Subject: Re: gfortran needed on host to compile gcc >= 4.1.2
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
X-List-Received-Date: Thu, 22 Nov 2007 04:12:13 -0000
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit

On 11/21/2007 06:47 AM, Marcin Juszkiewicz wrote:
> Dnia ¶roda, 21 listopada 2007, Junqian Gordon Xu napisa³:
>> I took the liberty to enable gfortran for gcc_4.1.2 (hence gcc >= 4.1.2
>> has fortran enabled). The side effect is that you need to install
>> gfortran or g77 on your host to compile it.
> 
> Can I still build gcc(-cross) without gfortran when gfortran is not 
> installed on host? If not they I would call it ugly regression...

I'm afraid you will get stuck in do_configure of gcc(-cross). I assume 
the burden of installing gfortran on the host is low. But people may 
disagree. Maybe we could introduce a fortran flag in a conf files, if 
there is too much opposition to the change.

Regards
Gordon


