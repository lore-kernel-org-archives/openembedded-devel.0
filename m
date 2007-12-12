Received: from [64.233.184.228] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1J2NeZ-0003o6-Qk
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2007 10:13:19 +0100
Received: by wr-out-0506.google.com with SMTP id c30so92514wra.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2007 01:09:01 -0800 (PST)
Received: by 10.150.195.21 with SMTP id s21mr117050ybf.9.1197450541475;
	Wed, 12 Dec 2007 01:09:01 -0800 (PST)
Received: from ?192.168.1.204? ( [24.107.180.75])
	by mx.google.com with ESMTPS id i5sm5024024nzi.2007.12.12.01.08.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Dec 2007 01:08:58 -0800 (PST)
Message-ID: <475FA50C.1090502@gmail.com>
Date: Wed, 12 Dec 2007 03:08:28 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.14pre (X11/20071020)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1197404752.475ef250762ff@imp.free.fr> <475F8A75.9070902@gmail.com>
	<1197453642.475fb14ab7dc9@imp.free.fr>
In-Reply-To: <1197453642.475fb14ab7dc9@imp.free.fr>
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
X-List-Received-Date: Wed, 12 Dec 2007 09:13:20 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2007 04:00 AM, Alain2210 wrote:
> Now that 2.1.73 is the preferred version, how can I bitbake octave_2.9.19 ?

bitbake octave-2.9.19 or bitbake -b octave_2.9.19.bb

Could you let me know how you feel about RDEPENDS = fftw3. Octave could 
also provide it's own fft routine using lapack. It's a trade-off between 
less dependency and performance. I just don't know how many people are 
using fft with octave on embedded device. I will count the votes here.

Regards
Gordon



